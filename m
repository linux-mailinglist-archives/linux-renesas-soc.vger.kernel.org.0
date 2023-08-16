Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299EC77DC61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Aug 2023 10:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243074AbjHPIek (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Aug 2023 04:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243090AbjHPIdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2023 04:33:50 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C472D6D
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2023 01:33:35 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7514F1C0006; Wed, 16 Aug 2023 10:33:33 +0200 (CEST)
Date:   Wed, 16 Aug 2023 10:33:32 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: rz-mtu3: Replace raw_spin_lock->spin_lock()
Message-ID: <ZNyJ3HWg2CpXb5lX@duo.ucw.cz>
References: <20230815073445.9579-1-biju.das.jz@bp.renesas.com>
 <20230815073445.9579-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n6olR/FXzJ84l0/Q"
Content-Disposition: inline
In-Reply-To: <20230815073445.9579-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_NEUTRAL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--n6olR/FXzJ84l0/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> As per kernel documentation, use raw_spinlock_t only in real critical core
> code, low-level interrupt handling, and places where disabling preemption
> or interrupts is required. Here the lock is for concurrent register access
> from different drivers, hence spin_lock() is sufficient.


Reviewed-by: Pavel Machek <pavel@denx.de>

Thanks for doing this!

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--n6olR/FXzJ84l0/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZNyJ3AAKCRAw5/Bqldv6
8h7sAJ9cNZsRqvNTHy/kGBD6S373NBcP8ACfVkk8FR5thBGq3iE/yNPGa3PuaW0=
=59fC
-----END PGP SIGNATURE-----

--n6olR/FXzJ84l0/Q--
