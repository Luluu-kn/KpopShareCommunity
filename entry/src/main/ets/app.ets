export interface UserInfo {
  username: string
  password: string
  nickname: string
  sign: string
  avatar: Resource
}

export class Song {
  id: number
  name: string
  artist: string
  img: Resource

  constructor(id: number, name: string, artist: string, img: Resource) {
    this.id = id
    this.name = name
    this.artist = artist
    this.img = img
  }
}

// 全局推荐歌曲（5个艺人）
export const recommendSongs: Song[] = [
  new Song(1, "Dynamite", "BTS", $r('app.media.bts')),
  new Song(2, "Spring Day", "BTS", $r('app.media.bts')),
  new Song(3, "Sugar Rush Ride", "TXT", $r('app.media.txt')),
  new Song(4, "0X1=LOVESONG", "TXT", $r('app.media.txt')),
  new Song(5, "How You Like That", "BLACKPINK", $r('app.media.blackpink')),
  new Song(6, "Pink Venom", "BLACKPINK", $r('app.media.blackpink')),
  new Song(7, "GO", "Cortis", $r('app.media.cortis')),
  new Song(8, "REDRED", "Cortis", $r('app.media.cortis')),
  new Song(9, "Super Shy", "NewJeans", $r('app.media.newjeans')),
  new Song(10, "Ditto", "NewJeans", $r('app.media.newjeans')),
]

// 收藏列表
export let favoriteList: Song[] = []

// 默认用户信息（使用定义好的UserInfo接口）
export const defaultUser: UserInfo = {
  username: "Luu",
  password: "123456",
  nickname: "Luu",
  sign: "K-POP Forever",
  avatar: $r('app.media.my_avatar')
}