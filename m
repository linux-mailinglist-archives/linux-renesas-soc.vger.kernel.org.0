Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26EC210E711
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfLBIu5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:50:57 -0500
Received: from sauhun.de ([88.99.104.3]:41972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfLBIu5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:50:57 -0500
Received: from localhost (p54B3363C.dip0.t-ipconnect.de [84.179.54.60])
        by pokefinder.org (Postfix) with ESMTPSA id 64ADC2C04A3;
        Mon,  2 Dec 2019 09:50:55 +0100 (CET)
Date:   Mon, 2 Dec 2019 09:50:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191202085055.GC1266@kunai>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai>
 <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato>
 <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
 <20191121111025.GB1184@ninjato>
 <20191202082041.GA1266@kunai>
 <CAMuHMdXLr627Tn88+Cu8tUVMviBdypR_rpO6dk-3UBwTWzYvAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLr627Tn88+Cu8tUVMviBdypR_rpO6dk-3UBwTWzYvAQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> How do you reboot in between tests?
> I usually use /sbin/reboot if the target booted fine, and the (remote
> controlled)
> reset button if the target locked up.

I use mostly the reset button. As I recall, last week the issue happened
even after a cold boot... but I can retry using 'reboot'.


--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3k0GoACgkQFA3kzBSg
Kbbeaw//dgw3xvErcMS2vegYr6NF9JyBJoEugx3q+6ujEKosngb1PEi/IdltuY8S
RD9Yo7KQdnhQBmwBiqOsa9f0Gdcu5ZmHyYQ/E9qGjlsR42zXg5N12ZYGoe65NJhG
BRgZD7TmXUk/tEd3HjbrQmXfsDbAxnKkbjrLMSRQ4/TeUCuzNuVl7xy9dHS5YCVv
B7cJJ4L7S6itunFgzJoeHLCdbG65rhHHrybPRHYBWDMosG80mRRtMjQanCBZlwVk
lPU/rPPzyI95kGkZZoYmK76yCMUtVLgUx9xi/mlfRp5xyUow2zGehc/VhxHjNYeW
3fVM0MWtIfPH4oGFmVKYxK+22GHbc9pN9iYEVVWATyu5zMgA4TEMH2qrHpkQ7Nz6
zwP4Hpui0KLe4uhrK3LXf7DBxo5TYUDboB21ePGUd5xMUy8j4hbbElt68zv0rMcd
bA906EpouXJ73lyovln3y9vbckYkg56/Gg6AWWK3napyE9Q6JxlF6XHjHy40dElM
gNJZFfTjVlvYsFZChLsj4FatAld6BNjcUT119d1YkhSqSpcAfn5WsUfmmURkRQsO
dUoE2+zL3SgcWzzeMAArerAkLmJ6lNKmTOzL0+/XyWfZ/nO0OjNg+FZlH+bB2WXg
1pgc+JsuL+SeCsrbOcLcCXjIrJPfkSe9DYYC/ytTNfET2EMiEws=
=30SF
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
