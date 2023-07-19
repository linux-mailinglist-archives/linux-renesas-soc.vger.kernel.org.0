Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0330275929F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 12:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjGSKTv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 06:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjGSKTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 06:19:36 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF1826AA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 03:19:23 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0C3521C0A97; Wed, 19 Jul 2023 12:19:22 +0200 (CEST)
Date:   Wed, 19 Jul 2023 12:19:21 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: rz-mtu3: Improve critical sections
Message-ID: <ZLe4qdQaRwwhnPKG@duo.ucw.cz>
References: <20230717120333.165219-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hJqW8y/RxCbcqxww"
Content-Disposition: inline
In-Reply-To: <20230717120333.165219-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hJqW8y/RxCbcqxww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Improve critical sections on rz_mtu3_start_stop_ch() and
> rz_mtu3_is_enabled() by moving offset and bitpos computation
> outside the critical section and drop the 'ret' variable on
> rz_mtu3_is_enabled() and return 'tstr & BIT(bitpos)' directly.

Thanks for the patch.

Reviewed-by: Pavel Machek <pavel@denx.de>

This is an improvement, but we'll need to move away from raw_spin_lock
code. I asked tglx, raw_spin_lock is not okay to use without very
clear reason.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--hJqW8y/RxCbcqxww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZLe4qQAKCRAw5/Bqldv6
8m0tAJ4o0WGi9ptR9VyV9h8GVa1e09FsNwCdFPaapnuIY7rGLqsKs8aI0HVoMNI=
=QUL0
-----END PGP SIGNATURE-----

--hJqW8y/RxCbcqxww--
