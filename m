Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3628E455C47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 14:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhKRNKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 08:10:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:60718 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhKRNJy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 08:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0AjK/6ELzqnn+1TTNieJMElcmvHw
        6i5ur293uoT8SsU=; b=aB9fQfPxxhkyrzvUBay6VU0dVMDDVLDW14Z18RB+upKJ
        VyljtO5us7l9Q4emh1yMW9epIzE64+QWjDWLEo3MbdPkq2rZJ20lR79gDK/1gq4B
        dpaqz15dWq9Shh/enkW6ROcDUNKx0x9mm1ySelWOaT74dx37FsC43nZp+jdsrYg=
Received: (qmail 3515465 invoked from network); 18 Nov 2021 14:06:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2021 14:06:52 +0100
X-UD-Smtp-Session: l3s3148p1@SqvL1A/RlMggAwDPXw9mAHdR4GY8xQjZ
Date:   Thu, 18 Nov 2021 14:06:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: avoid use of undocumented bits
Message-ID: <YZZP6Ml6KGVsdr/9@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211117093710.14430-1-wsa+renesas@sang-engineering.com>
 <OSZPR01MB7019741B3AC0B31EEBF8058CAA9B9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KMcyXOPMhmQ2b/B5"
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7019741B3AC0B31EEBF8058CAA9B9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--KMcyXOPMhmQ2b/B5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Dumped the registers before and after patch, register values do match. Al=
so tested read/write operation on RZ/G2L.
>=20
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Awesome, thanks for the lightning fast testing and review!


--KMcyXOPMhmQ2b/B5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGWT+MACgkQFA3kzBSg
KbYa0A/9GzsqNFt/797QECR8SY54GA7m+DvKMA9uK27KVSf5RpoUJeayCZZHr3d1
vZRqlveaOOtj6wm2g9Cxq1jObG3usT+azHpkpCSKU2gWaMS5r01C2lcs2VS8M4lN
AMhAERUixKe6kygs+XL+UBLaqu5dDX/6OTkJCjrF06yMNflyEbn5hxGBMbYEwUFJ
J4/nVM5mC6edAZGc18l0cPafJE8zh4kbxOpwRgktPLs29+2IMi2yP10/VgEhdfa4
GspHKngoGeZ62lTAGh1Ny8ph25K/DwepvZJpoUqtJ9/Ft6QBCLeBUy6lb/XoWL1P
IEmeUyeUPyKe1PBv5N2H61xwjdCsc7Yj60Nw5/dz6++fUs6E/MviI3o0EZvdlini
ARaFc7B7q7pgf+CD0erw0YbCBn9u5K/1bdncEQVvBpEZR8vsqKlCneYb0kA4CQ3V
Nb2nXt9ALjSqFPva0mQL3Dl2e2PoyZv0veDhr6SwdKwbZY97dHEDQDHNbi9fJJti
WdHNqho7saVFo5GbCS2Qw1YUxA0oyNPTFfZZWo2UiwW+PmycHy8HqUg9dYsMgaJp
uPdifAPgLkm0vbPC8Q291Tt2F4lUmgutmiKpglfjVhqB2yT9D68B325lcrZtpAFz
b0QR5ZQlSkmH0qu/cTLulucKoQCOU2w4KjEs5aMDa/FQTpqin6U=
=KhNt
-----END PGP SIGNATURE-----

--KMcyXOPMhmQ2b/B5--
