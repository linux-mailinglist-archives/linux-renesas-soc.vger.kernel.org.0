Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613D92E07E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 10:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgLVJQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 04:16:53 -0500
Received: from www.zeus03.de ([194.117.254.33]:60420 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgLVJQw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UEjaNIvvbz+BJVAbjjlLbu7rTcsX
        kdVQzCWAflM/IdQ=; b=uRg0ZHXzezYP8u8W7fwCheKfD06PkGtYVXht8NWZaX3L
        omCa05GYi46l2wawGAGYtCA/0FkR8edwFcz2Wb62C35yICYEzw4slfi2OueEpnqL
        5mNUEGViVbmBU/k55DuAS1DVBnopnKPVyzyURVGoiGe1xX1QhIZQk162XB3LQ6o=
Received: (qmail 113645 invoked from network); 22 Dec 2020 10:16:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2020 10:16:10 +0100
X-UD-Smtp-Session: l3s3148p1@KaxOBgq3xt1Uhst9
Date:   Tue, 22 Dec 2020 10:16:06 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779a0: Add RWDT node
Message-ID: <20201222091606.GA974@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
 <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdV2hnNoZdLme=BRKz9vfGe22ZUCw6HiJM5ZUvhU2=P0rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2hnNoZdLme=BRKz9vfGe22ZUCw6HiJM5ZUvhU2=P0rA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No interrupts property? ;-)
> As we don't have it described yet for the other R-Car Gen3 SoCs, I
> suggest we do that in one batch...

Yes, I'll try to find some time for this as a seperate series.


--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/huVIACgkQFA3kzBSg
KbZqEA//cas8Z9D8RJEa/MTJ5zmEjBVPTAUSnAXjlZE7Na1XGl5xtIq6F1loD4pX
Ro9JL1iKaWUhk+EOF/pr+rH0FIJp/8JSP/x7QrYIS7hv1fzTJwB6bEJKCNATqRzG
+bexWLtAbUSI5dERF74idqdJMJtciTV4WqVj7bej9n0ErK26UdUcrgja89bK3nAK
h5s6EO+AKuDO8NonJDC+Lp3qbWqgznJtIOrcWVN1hal7Hu+4zt3LjAtXxbOvqYf5
bPFy8f+9SnE7Hmq6Zd8HhIl28OVyBgsj5C8JzPD7xvv7bp3MEDQecvG25PFWtiDp
M6nMS3dSO307Njbc81oA/cTXE247i6lE5SaerDYRN0BHySJiMna+r2valyEFrYqV
bU0STWwUYYjFC5C1f6i5uy+2wDX5Uzwn44CIEm1WsUQYVIUVYKWRH0fJDpIEapa7
RUKaxHa9nrSIveWWby870CqlngmAhF4Wb6fbRtU5vHc7uVoOQrsLZA6hX/lEnIgN
W3EvNldbfhQWL/mjmVFygH0NP4yWBMbE3iLG/Otwmq6/Aoqa7+cFOef/ygFPx4Eb
0+SOm+vLxNzCNERiO7SPosgb3FNcGRFyYpsU2HXXfLiAOjEfP+hWjdsikZ551nQ/
Eg5wo4STA/YCOjJnixkt1LcaZPlHbecqz7bHZHxR95KA5xefiNA=
=AtCZ
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
