// model/Artist.ets
export interface Artist {
  id: number
  name: string
  avatar: Resource
  intro: string
  works: string[]
}

export const artistList: Artist[] = [
  {
    id: 1,
    name: 'BTS',
    avatar: $r('app.media.bts'),
    intro: '韩国男子演唱组合，以音乐风格多元和舞台表现著称，是全球极具影响力的K-POP团体。',
    works: ['Dynamite', 'Spring Day']
  },
  {
    id: 2,
    name: 'TXT',
    avatar: $r('app.media.txt'),
    intro: 'Big Hit旗下男子组合，音乐风格清新多变，凭借出色的舞台和歌曲受到全球粉丝喜爱。',
    works: ['Sugar Rush Ride', '0X1=LOVESONG']
  },
  {
    id: 3,
    name: 'BLACKPINK',
    avatar: $r('app.media.blackpink'),
    intro: 'YG娱乐旗下女子组合，以强劲的节奏和极具辨识度的音乐风格闻名，全球影响力巨大。',
    works: ['How You Like That', 'Pink Venom']
  },
  {
    id: 4,
    name: 'Cortis',
    avatar: $r('app.media.cortis'),
    intro: '新兴K-POP艺人，以独特的音乐风格和舞台表现受到关注，潜力十足。',
    works: ['GO', 'REDRED']
  },
  {
    id: 5,
    name: 'NewJeans',
    avatar: $r('app.media.newjeans'),
    intro: 'HYBE旗下女子组合，以复古R&B和90年代风格的音乐走红，歌曲极具感染力。',
    works: ['Super Shy', 'Ditto']
  }
]