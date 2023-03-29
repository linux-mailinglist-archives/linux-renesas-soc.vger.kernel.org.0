Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F12C6CF4DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Mar 2023 22:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjC2UyZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Mar 2023 16:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjC2UyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2023 16:54:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B09161AB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Mar 2023 13:54:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1phco5-0002GE-03; Wed, 29 Mar 2023 22:54:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1phco4-007cBA-4f; Wed, 29 Mar 2023 22:54:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1phco3-0091Ew-4K; Wed, 29 Mar 2023 22:54:07 +0200
Date:   Wed, 29 Mar 2023 22:54:06 +0200
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
Message-ID: <20230329205406.bfjftoto5jikalfh@pengutronix.de>
References: <20230310170654.268047-1-biju.das.jz@bp.renesas.com>
 <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
 <20230316155806.GN9667@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="simjhb6hp3okkwaj"
Content-Disposition: inline
In-Reply-To: <20230316155806.GN9667@google.com>
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


--simjhb6hp3okkwaj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Thu, Mar 16, 2023 at 03:58:06PM +0000, Lee Jones wrote:
> On Fri, 10 Mar 2023, Biju Das wrote:
> > [...]
> I plan to take this set via MFD once you have  PWM Ack.
>=20
> For my own reference (apply this as-is to your sign-off block):
>=20
> Acked-for-MFD-by: Lee Jones <lee@kernel.org>

Given that the pwm patch needs a rework, I wonder how to proceed here.
Do you want to take patches 1 - 5 now? Or do you prefer to wait until
the pwm patch is fine, too?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--simjhb6hp3okkwaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQkpW0ACgkQj4D7WH0S
/k4sYgf9HM7yNzcRwijIbMd/xiFoGc2F5zjkYaXHaCC5fBkKV+viHYGaOjd11WBj
5BopSlJlz87nePqd2ac9vSGLbzFMgPhq0to4tRvQPKqEMDH5znUo35/mx9jDJkqO
opq7BN78zxUQhCtEjp0+1WNDYC5VdAMWoOZv7HsuUoLwadg3iF2Vr7ZBZRpSmZiJ
fMNBeLEUA6JTDhNQwX8snriorR2Dug3+/XQSKCxfCB4Ax7HryCXtwMG/4DxGKD8I
XUvfyLzymJvFY5w+YV9f/LPM3UMkSy7R/oVCwQCfyAXz4FYWCcCAWAkWZoEol7YC
4foztwBD5i/mrvEzQrCrop3hoshj2g==
=3bt1
-----END PGP SIGNATURE-----

--simjhb6hp3okkwaj--
