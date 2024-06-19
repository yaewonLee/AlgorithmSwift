//
//  해시_베스트앨범_42579.swift
//  AlgorithmSwift
//
//  Created by 이예원 on 6/19/24.
//
/*
 문제 설명
 스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.

 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.
 노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.

 제한사항
 genres[i]는 고유번호가 i인 노래의 장르입니다.
 plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
 genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
 장르 종류는 100개 미만입니다.
 장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
 모든 장르는 재생된 횟수가 다릅니다.
 
 입출력 예
 genres
 ["classic", "pop", "classic", "classic", "pop"]
 plays
 [500, 600, 150, 800, 2500]
 return
 [4, 1, 3, 0]
 */

import Foundation

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    // 1. 장르별로 총 재생 횟수를 계산
    var genrePlayCount: [String: Int] = [:]
    for (index, genre) in genres.enumerated() {
        genrePlayCount[genre, default: 0] += plays[index]
    }
    
    // 2. 장르별로 노래들을 그룹화하고, 재생 횟수와 고유 번호를 함께 저장
    var songsByGenre: [String: [(index: Int, playCount: Int)]] = [:]
    for (index, genre) in genres.enumerated() {
        songsByGenre[genre, default: []].append((index, plays[index]))
    }
    print("songsByGenre: \(songsByGenre)")
    
    // 3. 장르별로 노래를 재생 횟수 내림차순, 고유 번호 오름차순으로 정렬
    for (genre, songs) in songsByGenre {
        songsByGenre[genre] = songs.sorted {
            if $0.playCount == $1.playCount {
                return $0.index < $1.index
            }
            return $0.playCount > $1.playCount
        }
    }
    print("songsByGenre: \(songsByGenre)")
    // 4. 장르를 총 재생 횟수 내림차순으로 정렬
    let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }.map { $0.key }
    print("sortedGenres: \(sortedGenres)")
    // 5. 결과를 담을 배열을 생성하고, 장르별로 최대 두 곡씩 앨범에 추가
    var result: [Int] = []
    for genre in sortedGenres {
        if let songs = songsByGenre[genre] {
            // 최대 두 곡만 추가
            let topSongs = songs.prefix(2)
            result.append(contentsOf: topSongs.map { $0.index })
        }
    }
    return result
}
