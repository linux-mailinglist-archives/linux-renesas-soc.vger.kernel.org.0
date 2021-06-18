Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33593AC81F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 11:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbhFRJ7T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 05:59:19 -0400
Received: from www.zeus03.de ([194.117.254.33]:44288 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232152AbhFRJ7T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 05:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8zgPSZ5YMw3lnJvZuy4tsiVWlUfB
        uSfAH9sIAUjgIUA=; b=OiANFDd5QaMvejDRH7nL8hH4hf+S+dlxyu76+whriFfl
        cE7g0vbDCVTmM0hCQos/leFu1vY2lXqjAKbULY/HcZu/AEXKIrJUk9rj1SEQnN+d
        qggW3uUJRdA5SGs/prHA6HWX1WFbinqJZpzK+Ghp2gG4ITfCbIISXhKcaM1UqdU=
Received: (qmail 677037 invoked from network); 18 Jun 2021 11:57:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jun 2021 11:57:09 +0200
X-UD-Smtp-Session: l3s3148p1@DR7NWAfFerQgAwDPXwaEABQIKHLDvKpZ
Date:   Fri, 18 Jun 2021 11:57:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <YMxt9JA0q1HGwS34@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com>
 <20210317091622.31890-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
 <YMxpMKH39aYs4Zaz@ninjato>
 <CAMuHMdW1wr3j8DgL34V3RiHX9qmqo3tfSWxo3VBwHCO1XFMGGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UVCCB1nYIIL6zq27"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1wr3j8DgL34V3RiHX9qmqo3tfSWxo3VBwHCO1XFMGGg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UVCCB1nYIIL6zq27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> BTW, does it work (really) fine on R-Car Gen3? Mine does.

Yes, mine does, too. So, I first wondered if the difference is an older
SCC variant. But when I let the timeouts run for a while, I get a DMA
problem. Which could also be the difference between Gen2 and Gen3 here:

[   53.328284] WARNING: CPU: 0 PID: 743 at kernel/dma/debug.c:498 add_dma_e=
ntry+0x158/0x180
[   53.336397] DMA-API: exceeded 7 overlapping mappings of cacheline 0x0118=
07bc
[   53.343451] Modules linked in:
[   53.346512] CPU: 0 PID: 743 Comm: kworker/0:7 Tainted: G        W       =
  5.13.0-rc6-00061-g639f0f876ccf-dirty #1152
[   53.357046] Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
[   53.363493] Workqueue: events_freezable mmc_rescan
[   53.368299] Backtrace:=20
[   53.370749] [<c0523e08>] (dump_backtrace) from [<c05241d0>] (show_stack+=
0x20/0x24)
[   53.378337]  r7:c1da1aec r6:00000000 r5:00000009 r4:c0707df7
[   53.383998] [<c05241b0>] (show_stack) from [<c05262b4>] (dump_stack+0x28=
/0x30)
[   53.391232] [<c052628c>] (dump_stack) from [<c011754c>] (__warn+0xcc/0xf=
8)
[   53.398119]  r5:00000009 r4:c06fb973
[   53.401695] [<c0117480>] (__warn) from [<c05248c4>] (warn_slowpath_fmt+0=
x88/0xcc)
[   53.409191]  r9:ffffffff r8:c06fbc8b r7:00000009 r6:c0163e20 r5:000001f2=
 r4:c06fb973
[   53.416938] [<c0524840>] (warn_slowpath_fmt) from [<c0163e20>] (add_dma_=
entry+0x158/0x180)
[   53.425218]  r8:00000001 r7:4601ef3f r6:20000013 r5:011807bc r4:ffffffef
[   53.431921] [<c0163cc8>] (add_dma_entry) from [<c016541c>] (debug_dma_ma=
p_sg+0x214/0x330)
[   53.440115]  r6:c1135370 r5:c1b44410 r4:c1da1cd8
[   53.444732] [<c0165208>] (debug_dma_map_sg) from [<c015fe7c>] (dma_map_s=
g_attrs+0xb4/0xec)
[   53.453013]  r10:00000001 r9:00000000 r8:00000001 r7:c1da1cd8 r6:0000000=
2 r5:c1b44410
[   53.460847]  r4:00000001
[   53.463380] [<c015fdc8>] (dma_map_sg_attrs) from [<c0490a60>] (renesas_s=
dhi_sys_dmac_start_dma+0xe0/0x3ec)
[   53.473055]  r8:c5e58d48 r7:c5dbf0ec r6:c1da1cd8 r5:00000001 r4:c1f73340
[   53.479758] [<c0490980>] (renesas_sdhi_sys_dmac_start_dma) from [<c048d7=
b4>] (tmio_process_mrq+0x134/0x274)
[   53.489519]  r10:c1da1d5c r9:00000001 r8:f082f014 r7:c1da1d20 r6:c1da1d5=
c r5:c1da1ce8
[   53.497353]  r4:c1f73340
[   53.499886] [<c048d680>] (tmio_process_mrq) from [<c048d9ac>] (tmio_mmc_=
request+0xb8/0xc4)
[   53.508168]  r9:c1da1ce8 r8:c06818f0 r7:60000013 r6:c1f73340 r5:c1da1d20=
 r4:c1f73000
[   53.515915] [<c048d8f4>] (tmio_mmc_request) from [<c0473c94>] (__mmc_sta=
rt_request+0xb8/0x11c)
[   53.524544]  r7:00000040 r6:00000000 r5:c1da1d20 r4:c1f73000
[   53.530204] [<c0473bdc>] (__mmc_start_request) from [<c0473d8c>] (mmc_st=
art_request+0x94/0xa8)
[   53.538831]  r7:00000040 r6:00000000 r5:c1da1d20 r4:c1f73000
[   53.544491] [<c0473cf8>] (mmc_start_request) from [<c0473eb4>] (mmc_wait=
_for_req+0x74/0xbc)
[   53.552858]  r7:00000040 r6:c1da1d30 r5:c1f73000 r4:c1da1d20
[   53.558518] [<c0473e40>] (mmc_wait_for_req) from [<c047a128>] (mmc_send_=
tuning+0x108/0x180)
[   53.566887]  r7:00000040 r6:c1da1dd8 r5:c601ef00 r4:c1f73000
[   53.572547] [<c047a020>] (mmc_send_tuning) from [<c0490448>] (renesas_sd=
hi_execute_tuning+0x2b4/0x440)
[   53.581874]  r10:c0738b11 r9:c5e58dd4 r8:00000013 r7:0000000b r6:c5e58d4=
8 r5:c1f73340
[   53.589708]  r4:c1f73000
[   53.592241] [<c0490194>] (renesas_sdhi_execute_tuning) from [<c0474580>]=
 (mmc_execute_tuning+0x70/0xa8)
[   53.601653]  r10:c0aaf1d4 r9:00000000 r8:00200000 r7:00000006 r6:c601b80=
0 r5:c0490194
[   53.609487]  r4:c1f73000
[   53.612020] [<c0474510>] (mmc_execute_tuning) from [<c047c058>] (mmc_sd_=
init_uhs_card+0x310/0x3f4)
[   53.620995]  r7:00000006 r6:c601ec80 r5:00000000 r4:c601b800
[   53.626655] [<c047bd48>] (mmc_sd_init_uhs_card) from [<c047d0b8>] (mmc_s=
d_init_card+0x2a4/0x7e0)
[   53.635454]  r7:00000000 r6:c1f73000 r5:00000000 r4:c601b800

I haven't really an idea why SYS-DMAC here is different that internal
DMAC. This needs investigation.


--UVCCB1nYIIL6zq27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDMbfAACgkQFA3kzBSg
KbbKXA//euWsk9dsG7SnXjQEdENrBVaHauRuTMuOkz/Jh4ADSRFX/InqNH/UBmYK
HhBljcg6QAy59dbwOv3qdXAOxXVvO9F6c8L7oR2DwXdxjLZI5WwqqSP8FUzodEmy
lmxq/ldbYbZV7A1LCuzIP3QiAPGqHykkWsylaXVa05h2XCg5lyughsYOmeAZ+/FQ
SBoPBNOGvZPJm2WTmTwr3hhtEjxynZsufK3JutQHnQ2Ylgqxh5ilYb6mIbb/kPFO
t7+cOXrBkyginyq6QCERPm93yG01uVm/AB/qgFLhj4avxs06qpt4GCqqaZesC3br
hFjH3wxXCBwNyMxEfKc3CGJEmtd2W2VT6iXIGLrlCUN63dTSJt0ttJ4ATIgpTwx+
U9N2pFawQQJp4CJkmoIAtDTvHc27Z4ymUzX4hlQFpAo0xhz+0YnuMFLdzTt6KG3L
SxVhWPlcvJMLLj/z9Kf0ggVkKcItiH5uJ78ETasGoWMCgu9iaIWpVGcgVPaEOKey
cwfUdKzI7xBirBgb6fQeBnsZjA3XLXOoSTObFIGEk7Kl2jzDEpL6e9tEfCiztn0m
9iguUsSnqUpIsGkiJSBROsLaKy9SRYi2I3r2PvaqIHfSIAvZBXqyITOYySAD8meH
4Akl3EHhj8MnkJmpgMEkHkTbwXInNnm4T4mpyWXO3k40RHOpFIk=
=sSLx
-----END PGP SIGNATURE-----

--UVCCB1nYIIL6zq27--
