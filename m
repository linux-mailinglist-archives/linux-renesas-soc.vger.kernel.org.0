Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A9236EB63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 15:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhD2Ndv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 09:33:51 -0400
Received: from www.zeus03.de ([194.117.254.33]:47018 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232867AbhD2Ndu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 09:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=CP0MsfiW4TwTPXP2snL9wYMUZgEn
        Ou3gTlVsX0cV9xc=; b=x13UhEd7gl6CVxzqpOTitQ+nqLRumy6IbGPbhldUj4L2
        mWdt2LAGg8BBQLnlnoBgOL+kETNBQIUhyg66iBJcoF21yt9W+dbA64qK4XviaDyW
        sSLzPSGOBrCeMiTvP0us7idMd1BdtaLF9wwUTblyZMY9tGXVMh3OwCygzZDGUkE=
Received: (qmail 3376977 invoked from network); 29 Apr 2021 15:33:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2021 15:33:02 +0200
X-UD-Smtp-Session: l3s3148p1@kqGniBzBxMEgAwDPXwxpAF/ybNvA09JQ
Date:   Thu, 29 Apr 2021 15:32:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH renesas-drivers] dt-bindings: misc: Fix logic analyzer
 bindings
Message-ID: <20210429133258.GA6746@ninjato>
References: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Fix this by correcting the indentation of the "required" block, and
> adding the missing include.

Thank you! But this file is going to be removed in v2. I agree with
LinusW and the GPIO crowd that bindings for debugging do not need to be
"official".


--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCKtYUACgkQFA3kzBSg
KbajTw//RF4bkYYK5cM/xzsMMMwPbOmY/4GwQlqEpLb1B36zBq25YRZb6sitbOBd
rBeEnXQCJQIdivP8Ru8LmbdzVBSeOQP9NMY/rNC5S7I4InPERKjLh+/qKTiNEX35
EFg/0DxYyfgnL4bVh6VfSdUoFkhmJxK6NIUQ2wBPe3E+sgCaLsY+ZtojBoVmZyM0
VABle/yiDTcIakKCf/SVeDlDqRuqsm9jyztPb+6q8O/vRe+MkUx85xCS7eS3HFJG
O9xl9sM7Xu7aVwjrZrUuQNX2VPi2VpYo6D/pn6i6Sy8VV9yzYC6jEIzG4WyKUxuc
0qau+iKTekK3eOxnD0Q9pSMUve0hm0xLBndQWZ8S9axdrlEfBDYtc+t36RsCNyVP
qI9iBNvTOWWD7CMOn6jhlnFXxNiuBljA6xetpolh+wX3zwzBZrCZv0m1dRsSnWZf
dQ4gU4IkVcM2KkYm9zxV/7vHhO9NesbRkf9j3/cS/kRSqi3Py7QIEL36XIqHpjLK
oIg1MJONpT/zQq5WT5XZC2DINalFmBkJbs0g3u6KgCBbuM0a/gjGEsBm5T9EnhJ+
K1yTQtTpHt4km5cBX4OlBrcxJVhxmIQ2jwQMmYiPu/P/2r7AWQ5kGK/ufwGqCPQR
U8SzuDC+5hiVWCx7Eu9r6zv14PUNLWI8P9XE8ViR+VPR4vVAce0=
=SHJO
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
