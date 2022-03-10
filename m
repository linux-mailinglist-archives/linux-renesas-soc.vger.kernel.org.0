Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB7A4D4275
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 09:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240315AbiCJI1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 03:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234487AbiCJI1M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 03:27:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F35134DF7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 00:26:12 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1nSE7M-0000Dj-QE; Thu, 10 Mar 2022 09:25:52 +0100
Received: from pengutronix.de (unknown [IPv6:2a02:908:393:af61:c649:5786:706c:cc3e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 5221B4775A;
        Thu, 10 Mar 2022 08:25:46 +0000 (UTC)
Date:   Thu, 10 Mar 2022 09:25:45 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, linux-can@vger.kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, wsa@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, wg@grandegger.com,
        kuba@kernel.org, mailhol.vincent@wanadoo.fr,
        socketcan@hartkopp.net, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, horms@verge.net.au
Subject: Re: [PATCH v4 0/4] can: rcar_canfd: Add support for V3U flavor
Message-ID: <20220310082545.rt6yp3wqsig52qoi@pengutronix.de>
References: <20220309162609.3726306-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lkjhngyver533lz4"
Content-Disposition: inline
In-Reply-To: <20220309162609.3726306-1-uli+renesas@fpond.eu>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lkjhngyver533lz4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09.03.2022 17:26:05, Ulrich Hecht wrote:
> This adds CANFD support for V3U (R8A779A0) SoCs. The V3U's IP supports up
> to eight channels and has some other minor differences to the Gen3 variet=
y:
>=20
> - changes to some register offsets and layouts
> - absence of "classic CAN" registers, both modes are handled through the
>   CANFD register set
>=20
> This patch set tries to accommodate these changes in a minimally intrusive
> way.
>=20
> This revision tries to address the remaining style issues raised by
> reviewers. Thanks to Vincent, Marc and Simon for their reviews and
> suggestions.
>=20
> It has been successfully tested remotely on a V3U Falcon board, but only
> with channels 0 and 1. We were not able to get higher channels to work in
> both directions yet. It is not currently clear if this is an issue with t=
he
> driver, the board or the silicon, but the BSP vendor driver only works wi=
th
> channels 0 and 1 as well, so my bet is on one of the latter. For this
> reason, this series only enables known-working channels 0 and 1 on Falcon.

Should I take the whole series via linux-can/next?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--lkjhngyver533lz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmIptgYACgkQrX5LkNig
011w7gf/WYOk1Kn+inkho4uTYuyl642GojY8I0I1wCI2doTgJ/FuW0UbpsmG/s9V
tO8p90i1p/gWhgAAJC/dm85hWjE44n/Mdur3x5FyysNstdV4ovMDALVCuyagsQG7
lP/8qClzN8N3mUpr5InUFo4o/TzcoIbjfmKV014JW4Sx4gu57/dj0jtrjoIbXCZR
/EzZOhtMbqpFzry1U1Zinzssoa5b3XC25EE8sl/3rFWVZIwX+xBdzYpAUu6T29P9
eida1NyGE96kRw++lCDPrx+vG704/aV7WY9hlHrHqxsRr7XCnbNCQtuaGMWqoK2w
W3RlLMcU6a8u1g46TVkioubikroWTA==
=pDud
-----END PGP SIGNATURE-----

--lkjhngyver533lz4--
