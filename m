Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA235E947B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Sep 2022 18:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbiIYQvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Sep 2022 12:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbiIYQvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Sep 2022 12:51:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD32F2AE27
        for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Sep 2022 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0/SayAR2Qaa2UiizKpwpYD1tX6Va
        vvab8ubmFHADsII=; b=I4sO9xmw7bExNaAo8WDstODHd+KGuzTHFdMpM0vJuTwI
        HC/qiX0uz0KIvr7gy2iP0LEGgcE4Ex4/Vwsq/GpziVLJvkIEa/sp+RbSLDxu3llk
        G5Pb24nxhlqoP6X9V35t5Ho92f4+nKo2zFy1KZMeBTnrxnN2Kd77jY/H/ON/PD4=
Received: (qmail 2799727 invoked from network); 25 Sep 2022 18:51:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2022 18:51:37 +0200
X-UD-Smtp-Session: l3s3148p1@Zuw8OYPpTakucp+f
Date:   Sun, 25 Sep 2022 18:51:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Message-ID: <YzCHFZnhrMWPkyIQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9skzrXcAghHfXw+m"
Content-Disposition: inline
In-Reply-To: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9skzrXcAghHfXw+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2022 at 09:55:11AM +0100, Biju Das wrote:
> Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> with a lower clock rate compared to a higher one.
> For eg:- (533333333 Hz / 4 * 4 =3D 533333332 Hz < 533333333 Hz).
>=20
> This patch fixes this issue by adding a margin of (1/1024) higher to
> the clock rate.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Despite the discussion about the comments, the patch does not change any
clock selection on my R-Car M3-N based Salvator-XS, both for eMMC and
some SD cards. So:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9skzrXcAghHfXw+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMwhxEACgkQFA3kzBSg
KbavWQ//X9r1neCIY56WputHXI7KqkHvMYXYBjBSHNr6wBxEL1iluer9Ov5EuBlD
izIu0YU2Rj/blFD7a696kksBfNAb3Q1JkwKGNINfGhLHRtNimolJzAlRDqbqfBFn
gTRFzvKbIVFG6zhmULr8TJ37OcwtSrYzoMv5I6hBLIYQKadK3SeX1j2alhl3KT0t
6XMAfnkXX0hOe4znEbEH8niCPqw92k2nW9VJ1VZrvvPvLUyiURNb+Idh9N/8HywE
6bQKYbfKnrmEJfVyAoGsaaYJ5173Jw63Dfz18+zzIpokBMWr9PyoANTqM9AdpAhI
iTBKRjw1vKrMAQ88WdJtdDApMOlW8VuH0opKDvuK5fSFzva721tlY0QMY7sQvCbs
X/7Gc5SBg7vVBtdXgsHyzLUc48kXEZCDMlKk1VeOiagMcBYMq6z41SPss5Lfhjc4
tzUT331l8/tk2cUT5GPShnoS8s9grq39vIhG/gaFULu56/RZVMkLerJ9xy3kjQD8
bserhjvIbHFNq261k03zBVR5RYJTKC+lnehw/YNjPKcZV5/0pD85jiYxuWH1QCOI
wRg1Q6txf0gSc0ApvlLteovzTYpqUBHlB/QT+1eT/gy/IkJb8tlNQYe5Bj7ATW2u
wG4Cg0HRaFcrNXdHs5W2wIzLmMjBkOfw9hKaCseY+ZQo953b/P4=
=p4ot
-----END PGP SIGNATURE-----

--9skzrXcAghHfXw+m--
