Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41151258F4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 15:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgIANlo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 09:41:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:49406 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgIANjs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 09:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Y3bI+HYV0RBW8aLI/QVROONznP6D
        l3p1+Ux0fknZzbc=; b=HjBPnfeQum0y1M4rQF/II77wbLQI+TRxG+5YAfKE9s7b
        YfzAl6MHegxnX6Oa5OtVyJShmaT/ctBzcI252Q844AmumqnTrxbZYUw1rcr1Hehf
        yOs2VDjXKVQ5kiByrSTZp7rc3C3YW1Pj7T7a1/XgpioGCb/BySr+gjUm0gosMGw=
Received: (qmail 2532402 invoked from network); 1 Sep 2020 15:39:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2020 15:39:40 +0200
X-UD-Smtp-Session: l3s3148p1@OwmnpkCuiosgAwDPXxBIAL7SzoTwUEK2
Date:   Tue, 1 Sep 2020 15:39:37 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Message-ID: <20200901133937.GA11393@ninjato>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36923A1D7091431CE3F73195D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200608212702.GD917@ninjato>
 <TY2PR01MB3692310754A6B4D6A05DADF0D8820@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200814071500.GA9410@ninjato>
 <TY2PR01MB3692C46B1A21109E7CC03478D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200901102416.GA2971@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <20200901102416.GA2971@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> not stalling the SCC. Anyhow, after this failute, the MMC core switches
> back to 300kHz and the SCC clock is off but for some reason SCC is still
> accessed. I will investigate why. The good news is that my new patch set
> fixes the hang as expected. The board will continue to boot so we
> probably want to have this series. However, I have the feeling that this
> SCC access which hangs the board might be a bug because of an unintended
> code path. I mean, this is also one reason why the bug triggers so
> rarely these days. We have been fixing a lot of things and the SCC is
> only accessed when it should be accessed. We will see. I also need to
> test other boards, too.

Some more good news: I can reproduce the issue now not only with
H3-ES2.0 but also with my M3-N.

Interesting news: The hang comes from a code path I would have not
expected. It is not because of accessing an SCC register, it is this
line from renesas_sdhi_set_clock() which causes the issue:

186         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);

I mean I can guess that the clock setting has something to do with the
SCC, but I can't see the direct connection with the documentation I
have.

I will stop that research here and will prepare now my series to leave
the SCC clock enabled as long as some tuning is in progress.


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9OTxUACgkQFA3kzBSg
KbZhfg/+J2QdQIwWH489JOBPydEdjAitZ1bM5q4q5ovvPJwFWsQjmB/L05w3w4tG
jI9lo+cL/x9O7tzc/kPsCoT17zWtio94ukhMpMwggAoZBC9Dc0XV7BvwS7hHZ3XR
qiQMs0p7uxFK8ojBAtmXkIpNufU30mulMcX/nkKQEjGzpN/KF190hC4nkrcgz/SH
mHP88depiiFigYdStpfbjYPkIzumJeoDaQUaXisKnMxnG9ZBJtbZtEd+MkkEHhPB
Vqq37DWDh0FC0KBMWMaOUZmxfQHioCtjyspnnTOvqGIYsZo0drdXV07DQQ5CdJEm
MasOvO51gMHvti6/y/5N44R9NFPV/OMnY3l6mjvsObvkI62nXIPYp5Ye/DF30UnO
+/b9gy7MPqdblc45I/et101rklI/iwz3eTnRh0IM3YyXkO6t9yXMATaULXBCVidJ
21xgc8EaIqRYdAZeOictSpSoWYDgKTW6kfeurWgGsGh85mewvyqFL20rWfBcpVLu
ZDROGohpg6vk2L8186SIOFGJYzZkLYYXh0T4JftTESuKXtPBivP4gQAZmALgQx6M
brPm4jeFtKL9EXGRqVToQfXShdD/2tdMJg5s2FT6FtYBc3oLVjRe0zI0anQD+smO
mhQFkXPvC/O0N/1daRAP3d6f5WD+o6/YJJpOt6NF2t14+I875w8=
=9+d2
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
