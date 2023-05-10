Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD856FDEBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 15:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjEJNkC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 09:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236450AbjEJNkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 09:40:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E55A1718
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2023 06:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=O7LXmYPBtxp5BzJaTHggGremtMLA
        R92mCzjm2h9pUHE=; b=xzdZul8bygOouA3ykaCHLxx+c1toQN2rrrhrr2RnrsD+
        uXlDzsc4gO2G5ZRrHXv2QY1wbvw0RlxaCiENNnQRLT/h9ZZTxpf+sYZxowYDwbXC
        5zHmGISeHTztA+VgzWJMiyuHmlmkat38McNa4rkFG2RKI/Ixhz4HYB7dPjOFGno=
Received: (qmail 2448991 invoked from network); 10 May 2023 15:39:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 May 2023 15:39:56 +0200
X-UD-Smtp-Session: l3s3148p1@s6PgAVf70OEujnsI
Date:   Wed, 10 May 2023 15:39:55 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U
Message-ID: <ZFueq63/vf/0tfOU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
References: <20230419201511.31648-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX4vqSR8vBA5BiRBYL0PccZxDayes9yXNu5C-wyMKxXZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mGa100CaMqBWnijH"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX4vqSR8vBA5BiRBYL0PccZxDayes9yXNu5C-wyMKxXZQ@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mGa100CaMqBWnijH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > V3U firmware misses to enable WDT resets. Because there won't be any
> > updates to the firmware anymore, enable that in Linux.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.5.

\o/ Thank you, Geert!


--mGa100CaMqBWnijH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRbnqcACgkQFA3kzBSg
Kbb8ZQ/+L/N4+kB5ayF04Ep/2tvqWD5kxgq0hH3ZOv7wiIMtfSq39JSepOpnREQq
v9cGueRUBoQyOnniofvyghFpUw4aon4WJCw44NK9Xgyze1yZpJcoxU2x1NBht+GZ
UzTA348rrRn6d6XJSaYU4smOfMPX3+k4Hcu6hznpoPcPdnR0EQPfgTSpCZTDY979
zH0fkPmxcQUqOYrh93vudaJENbhJuavhPqoq0nTi9pMnxn1/b53qAPTw+SSlndwl
u9ZbWqqwCkyaMZeTuLw0GYxonFNeuj/S/FDkksRdOTXqgson2dW/Zeqr6Z8Rbc5O
YdZkXNoQNb0S2nvYAgZQJJ5eg5wMnyp79NS6yIQQZzY+ePo9skYnO0b/5zDEB/nC
p4x48gmceJ1jX9SYgcvmBQUxEg2qdeM1Gb51XqdT4r2PiVgh+aUMOuICvcPGt1S4
SpeQUzzmhvOZiSWnzZnqMsgzPs5ItZCtG6e3VU0Pr5TngPUZ5pmwm+KCC3h7P6xk
UrHiU7XNcLI9/yyQyWTHWJu3XEcfMc0eDZQT17iHl/k5mw0idhnTWlobcPup+9NH
X9xlwKCHrQp2q77uSXqZvd9nFXTS8bBgL0zCNiWX45Ma9CxlUD38FLMlKTw5JLeh
C1UXsUGs0MyRY+qw41OiteNXZO3tkbhGwg9QNpYX5tzGDVCySBY=
=v4Qh
-----END PGP SIGNATURE-----

--mGa100CaMqBWnijH--
