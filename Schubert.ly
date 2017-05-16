\version "2.18.2"

#(set-global-staff-size 18)

\paper{


   ragged-last-bottom = ##f
}

hfmCopyright = \markup{ \with-url #"www.creativecommons.org/licenses/by-sa/4.0/"
    \general-align #Y #CENTER {
            \column {
                "Hochschule für Musik Karlsruhe 2018"
                "Creative Commons Attribution–ShareAlike 4.0 International License"
                "Informationen zur Lizenz unter http://creativecommons.org/licenses/by-sa/4.0/"
            }
        }
    }


\header {
    title = "18. Der stürmische Morgen danach davor? dahiner?"
    opus = "Die Winterreise op. 89 D 911"
    composer = "Franz Schubert"
    copyright = ##f   % \hfmCopyright
    tagline = ##f
}

global = {
    \key d \minor
    \time 4/4
    \override Script #'padding = #0.7
    \override TupletBracket.bracket-visibility = #'if-no-beam
}

stimme = \relative c' {
    \global
    \autoBeamOff
    r2 c d e
    R1 R1
    r2 r4 r8 d
    d8. e16 d[ e] f[ g] a4 d,8 a'
    a8. d16 cis8 d e4. a,8
    bes8. g16 e[ cis] e[ g] bes4 cis,8 a'
    d, a' e a fis es' d bes
    gis4 a d, r
    r2 r4 r8 bes'
    \bar ";"
}

text = \lyricmode { \small
    Wer das liest ist doof!
    What do you want from me?
    Yeah!
    des Him -- mels grau -- es Kleid,
    die Wol -- ken fet -- zen__ flat -- tern
    um -- her in mat -- tem Streit,
    um -- her in mat -- tem Streit.
    Und
}

right = \relative c' {
    \global
    d16(_\markup { \dynamic f > } e cis d) e8-. a-. fis16(_> g e fis) g8-. d'-.

    b8 \tuplet 3/2 { f'16_( d bes } a8)^! <e'' a cis>^! <f a d>4 r8 d,8-.
    d8.( e16 d e f g) a4( d,8) \noBeam a'-.
    a8.[-. d16-. cis8-. d]-. e4.^> a,8-.
    bes8.([ g16] e[ cis e g]) bes4( c,8) \noBeam a'(_>
    d,)[ a'_>( e) a]_>( fis)[ es'-. d-. bes-.]
    gis4_> a_> d,8 \tuplet 3/2 8 { f'16[( d b] d[ b gis] b gis f
    gis[ f d] f d b) } a8^! <e'' a cis>^! <f a d>4 r8 \change Staff = "down" \voiceOne <f,, bes d>^\ff
}

left = \relative c {
    \global
    d16( e cis d) e8-. a-. fis16->( g e fis) g8-. d'-.
    gis,16^>( d' a^> d bes^> d b^> d) <b d f gis>4 r8 \tuplet 3/2 { d,16( cis c } \break
    b8) \tuplet 3/2 { f'16_( d bes } a8)^! <a a'>^! <d, d'>4 r8 d'-.
    d8.( e16 d e f g) a4( d,8) \noBeam a'-.
    a8.[-. d16-. cis8-. d]-. e4.^> a,8-.
    bes8.([ g16] e[ cis e g]) bes4( c,8) \noBeam a'(_>
    d,)[ a'_>( e) a]_>( fis)[ <es es'>-. <d d'>-. <bes bes'>-.]
    <gis gis'>4_> <a a'>_> <d, d'>8 gis8-.[ b-. d-.]
    f-.[ gis-.] a,^! <a a'>^!<d, d'>4 r8 \voiceTwo <bes bes'>
}

troll = \relative c {
    \global
    e8 d fis4-. gis-.
    cis8 b d4-. e-.
    b8 a cis4-. e-. a2.

\score {
    <<
        \new Staff { \stimme \addlyrics { \text } }
        \new PianoStaff <<
            \new Staff = "up" { \right }
            \new Staff = "down" { \clef bass \left }
            \new Staff = "troll" { \troll }
        >>
    >>
    \layout { }
}
