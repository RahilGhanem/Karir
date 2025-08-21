import 'package:flutter/material.dart';

class ClubProfilePage extends StatefulWidget {
  const ClubProfilePage({Key? key}) : super(key: key);

  @override
  State<ClubProfilePage> createState() => _ClubProfilePageState();
}

class _ClubProfilePageState extends State<ClubProfilePage> {
  int selectedTab = 0; 
  bool isFollowing = false;

  // THEME
  static const Color kPrimary = Color(0xFF8B79F6); 
  static const Color kBg = Color(0xFFF8F7FC);
  static const Color kCardBorder = Color(0xFFEAE8F7);
  static const Color kText = Color(0xFF1B1B1F);
  static const double kRadius = 16;

  final ClubData clubData = ClubData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: _topBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            _cover(),
            const SizedBox(height: 12),
            _profileHeader(),
            const SizedBox(height: 12),
            _statsRow(),
            const SizedBox(height: 12),
            _segmentedTabs(),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _tabBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  AppBar _topBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: kText,
      centerTitle: false,
      titleSpacing: 0,
      title: const Text(
        'Club Profile',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.maybePop(context),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      ],
    );
  }

 
  Widget _cover() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 7.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kRadius),
              child: Image.asset(
                'assets/images/club_cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kCardBorder),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.photo_camera_outlined, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: _cardDecoration(),
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 64,
                        height: 64,
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/gdg_logo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.photo,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 43,
                      bottom: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: kPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, size: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        ' Club Name ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kText,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'SLOGAN GOES HERE',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      SizedBox(height: 6),
                      _LocationRatingRow(),
                    ],
                  ),
                ),
                
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () => setState(() => isFollowing = !isFollowing),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isFollowing ? const Color(0xFFF0EEFF) : kPrimary,
                        foregroundColor: isFollowing ? kText : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      child: Text(isFollowing ? 'Following' : 'Follow'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _squareIconBtn(Icons.chat_bubble_outline),
                const SizedBox(width: 8),
                _squareIconBtn(Icons.notifications_none),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _squareIconBtn(IconData icon) {
    return SizedBox(
      height: 44,
      width: 44,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kCardBorder),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      ),
    );
  }


  Widget _statsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _statCard(Icons.groups_outlined, '2 847', 'Members'),
          const SizedBox(width: 10),
          _statCard(Icons.event_note_outlined, '47', 'Events'),
          const SizedBox(width: 10),
          _statCard(Icons.emoji_events_outlined, '4', 'Awards'),
        ],
      ),
    );
  }

  Widget _statCard(IconData i, String number, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: kPrimary.withOpacity(.12),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(i, size: 18, color: kPrimary),
            ),
            const SizedBox(height: 10),
            Text(
              number,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: kText),
            ),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

 
  Widget _segmentedTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _segChip(0, Icons.book, 'About'),
          const SizedBox(width: 8),
          _segChip(1, Icons.event_outlined, 'Events'),
          const SizedBox(width: 8),
          _segChip(2, Icons.groups_2_outlined, 'Team'),
        ],
      ),
    );
  }

  Widget _segChip(int idx, IconData icon, String label) {
    final sel = selectedTab == idx;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedTab = idx),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            color: sel ? kPrimary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: sel ? kPrimary : kCardBorder),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: sel ? Colors.white : Colors.black54),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                  color: sel ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _tabBody() {
    switch (selectedTab) {
      case 0:
        return _aboutTab();
      case 1:
        return _eventsTab();
      case 2:
        return _teamTab();
      default:
        return const SizedBox.shrink();
    }
  }


  Widget _aboutTab() {
    return Column(
      key: const ValueKey('about'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionCard(
          icon: Icons.info_outline,
          title: 'About Us',
          child: const Text(
            'About US',
            style: TextStyle(height: 1.45, color: Colors.black87),
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          icon: Icons.favorite_border,
          title: 'Mission & Vision',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Mission', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text(
                ' Mission text .',
                style: TextStyle(height: 1.45),
              ),
              SizedBox(height: 12),
              Text('Vision', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text(
                'vision text ',
                style: TextStyle(height: 1.45),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          icon: Icons.category_outlined,
          title: 'Focus Areas',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: clubData.focusAreas
                .map(
                  (t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: kPrimary.withOpacity(.10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      t,
                      style: const TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          icon: Icons.contact_page_outlined,
          title: 'Contact Information',
          child: Column(
            children: const [
              _ContactRow(icon: Icons.language, text: 'https://'),
              SizedBox(height: 8),
              _ContactRow(icon: Icons.alternate_email, text: 'hello@'),
              SizedBox(height: 8),
              _ContactRow(icon: Icons.phone_outlined, text: 'phone number'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _sectionCard(
          icon: Icons.follow_the_signs_sharp,
          title: 'Follow Us',
          child: GridView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 44,
            ),
            children: const [
              _SocialBtn(text: '@GDG', icon: Icons.alternate_email),
              _SocialBtn(text: 'GDG-community', icon: Icons.group_outlined),
              _SocialBtn(text: 'GDG-community', icon: Icons.facebook_outlined),
              _SocialBtn(text: 'gdg-community', icon: Icons.link_outlined),
            ],
          ),
        ),
      ],
    );
  }


  Widget _eventsTab() {
    return Column(
      key: const ValueKey('events'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text('Upcoming Events',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        ...clubData.events.map((e) => _eventCard(e)).toList(),
      ],
    );
  }

  Widget _eventCard(ClubEvent e) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(e.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 15, color: kText)),
          const SizedBox(height: 6),
          Text(e.date, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.groups_outlined, size: 16, color: Colors.black54),
              const SizedBox(width: 4),
              Text('${e.attendees} attending',
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 34,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: kPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                child: const Text('See more'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TEAM
  Widget _teamTab() {
    return Column(
      key: const ValueKey('team'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text('Leadership Team',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        ...clubData.teamMembers.map((m) => _teamCard(m)).toList(),
      ],
    );
  }

  Widget _teamCard(TeamMember m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFE6E2F7),
            child: Icon(Icons.person_outline, color: Colors.grey.shade600),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(m.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15, color: kText)),
                const SizedBox(height: 2),
                Text(m.position, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black38),
        ],
      ),
    );
  }

  // shared section card
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: kPrimary.withOpacity(.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: 16, color: kPrimary),
              ),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 15, color: kText)),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(kRadius),
      border: Border.all(color: kCardBorder),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF6B5EF6).withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

class _LocationRatingRow extends StatelessWidget {
  const _LocationRatingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.place_outlined, size: 14, color: Colors.black54),
        SizedBox(width: 4),
        Text('Alger, Algeria', style: TextStyle(fontSize: 12, color: Colors.black54)),
        SizedBox(width: 10),
        Icon(Icons.star_rounded, size: 14, color: Colors.amber),
        SizedBox(width: 4),
        Text('5.0', style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactRow({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String text;
  final IconData icon;
  const _SocialBtn({required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F1FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _ClubProfilePageState.kCardBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black87),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}


class ClubData {
  final List<String> focusAreas = const [
    'web development',
    'mobile apps',
    'AI/ML',
    'DevOps',
    'Cloud Computing',
    'Cybersecurity',
  ];

  final List<ClubEvent> events = const [
    ClubEvent('React Native Workshop', 45, 'July 15, 2025'),
    ClubEvent('AI Ethics Panel', 45, 'July 22, 2025'),
    ClubEvent('Summer Hackathon', 45, 'August 5–7, 2025'),
  ];

  final List<TeamMember> teamMembers = const [
    TeamMember('Name name', 'President'),
    TeamMember('Name name', 'Vice President'),
    TeamMember('Name name', 'Event Coordinator'),
  ];
}

class ClubEvent {
  final String title;
  final int attendees;
  final String date;
  const ClubEvent(this.title, this.attendees, this.date);
}

class TeamMember {
  final String name;
  final String position;
  const TeamMember(this.name, this.position);
}
