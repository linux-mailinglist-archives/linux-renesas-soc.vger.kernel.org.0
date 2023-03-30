Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE3F6D04BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 14:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjC3Maf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 08:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC3Mae (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 08:30:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061904C35
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 05:30:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1phrQ3-0000SX-S4; Thu, 30 Mar 2023 14:30:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1phrQ1-007lPQ-OI; Thu, 30 Mar 2023 14:30:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1phrQ0-009BAr-Ve; Thu, 30 Mar 2023 14:30:16 +0200
Date:   Thu, 30 Mar 2023 14:30:16 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v14 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Message-ID: <20230330123016.bstolfrxbz6ysrm4@pengutronix.de>
References: <20230310170654.268047-1-biju.das.jz@bp.renesas.com>
 <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
 <20230316155806.GN9667@google.com>
 <20230329205406.bfjftoto5jikalfh@pengutronix.de>
 <20230330105648.GX2673958@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ivmkjnx4zlgwdlxa"
Content-Disposition: inline
In-Reply-To: <20230330105648.GX2673958@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ivmkjnx4zlgwdlxa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 30, 2023 at 11:56:48AM +0100, Lee Jones wrote:
> On Wed, 29 Mar 2023, Uwe Kleine-K=F6nig wrote:
> > On Thu, Mar 16, 2023 at 03:58:06PM +0000, Lee Jones wrote:
> > > On Fri, 10 Mar 2023, Biju Das wrote:
> > > > [...]
> > > I plan to take this set via MFD once you have  PWM Ack.
> > >
> > > For my own reference (apply this as-is to your sign-off block):
> > >
> > > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
> >
> > Given that the pwm patch needs a rework, I wonder how to proceed here.
> > Do you want to take patches 1 - 5 now? Or do you prefer to wait until
> > the pwm patch is fine, too?
>=20
> If I take them now, you won't be able to apply the PWM driver until next
> cycle.

*I* have no problem with that, I'd be surprised if Thierry had one.
Depending on how fast Biju sends a fixed patch and I can review it, we
won't be much faster.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ivmkjnx4zlgwdlxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQlgNcACgkQj4D7WH0S
/k7ubgf/ZCM+FRFxIiMlNLTw3t3GugSN6UWA5j3xv/RgbyKqt9DfThq5UuoTjRU5
gG8sbCXIAhvOHIwF8d37nUrRM5G6dzAQtzTANtkTGKsdnzv1SfpFWgvn0FNrmu4k
aRQdbux69cD7Rs0KFZgS1GtFUFYAWr3KfA1NpXwMBL3FTUzZhmmxPagpCm6fAND7
NYsyGendtX5L4MnFHJmG37QCQ9dvafC5VeyJd3NtFUQbyRD6mv/UTwqAMetAgZo5
NMuKiZyQp7ciEqOoyF3UHc43WpcR4JtOnAkQ4X/3LNTp6EMiZJCywLvReLAw5/xn
tFYkHqFeHtbga6ozaOR5s9ejgOyCRA==
=Xn0l
-----END PGP SIGNATURE-----

--ivmkjnx4zlgwdlxa--
