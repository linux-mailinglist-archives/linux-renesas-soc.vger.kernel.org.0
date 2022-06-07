Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5967A53FCA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 13:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242222AbiFGLB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 07:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242522AbiFGLAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 07:00:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C712A2;
        Tue,  7 Jun 2022 03:57:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 417B8B81EF1;
        Tue,  7 Jun 2022 10:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07BCC385A5;
        Tue,  7 Jun 2022 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654599430;
        bh=MdS+txKXv+9X5ryEdcg9mNAEZ7btmpcAumgQQKGGxks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G0Mj0kX82xuV6/ArZJYjYJCZ7GC7zEiBlGrcwPGdtQvilE9MxqU03+Rw02AIEkMTo
         f96eOIOyu24h2JHFgJ6379aZuOqzsdrlxNIEFo6QRYbV2z3io0u/awWR9WABEfuGii
         NCsoqQrYAmA3RUaTg0/tTLaEJltQP1q2RYvpjkXeFezeN1AMkaZMS53ADEibrJuER2
         KK8D1PMfwG+WOhhEzXIpvldpPimnG7FrVtU0cECgg1JMVT2PJ08RgqzmJCIFknyLwf
         Lp+yJg5dOMzFAKqxLw9CJTSdGzdHGBjLOhaL+XC8iksXH5LYjONcypcq6h1kJ0HhQF
         JAWr5DxBmbx2A==
Date:   Tue, 7 Jun 2022 11:57:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Message-ID: <Yp8vAJHkJAQuDqMx@sirena.org.uk>
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GXbXScl54FIbGRKd"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Cookie: Where's SANDY DUNCAN?
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GXbXScl54FIbGRKd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2022 at 10:49:22AM +0000, Biju Das wrote:
> Hi All,
>=20
> Gentle ping.
>=20
> Are we happy with this patch? Please let me know.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--GXbXScl54FIbGRKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKfLv8ACgkQJNaLcl1U
h9Aq/ggAhE7veJ8rah/J3hheu5lkagPNihFTKaV61Udo7zG07xni5ABebgYDFZL2
a591f4BomXe9yjdF867WxvRDf5Sm171Gb0O0zvbDM7dTIemv24MKOEZ2m9sBOhvQ
2eO+GnryNx6gyZe++VhJ359WnIB1ueIL0Q/nQthaKycbQn1w6xCyuUBD+8raCe05
je+YFe2TccOYCEd7c1HuXJJjTKNXk6j6YgshgZjZVkfeSYKY7NmwA/bLp2c6QLvA
0eDm/lnm+esgjv223RCVel1rBy+TtfRLVYQHrO9O/dajsa7Luxaydz6/8LueIcNH
RRL1enLtDeRFmTW6ovOfcBlktnusEw==
=+1se
-----END PGP SIGNATURE-----

--GXbXScl54FIbGRKd--
