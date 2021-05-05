Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69496373567
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 09:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhEEHOk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 May 2021 03:14:40 -0400
Received: from www.zeus03.de ([194.117.254.33]:50328 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEEHOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 May 2021 03:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=f3wan+zOInpA28TlO+8dypBIUlTc
        HL+ieZrKQ3C/IZM=; b=BRkP9XzAh2+POGz37KEN4geBPui2O0e96L+r2SzlvyqQ
        Dxpf8Jvdk4+xwhtmHWcyviJnBOxQCZXmm3q4pVVDoyCjB5Spy8I4oU1rA5anb5xw
        QtrpsunXEfL6kLCn4/FztotJiVT/XpgtD/FXkH7LOyT4bntchr1LKmkTqX4ZNLE=
Received: (qmail 1676920 invoked from network); 5 May 2021 09:13:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2021 09:13:42 +0200
X-UD-Smtp-Session: l3s3148p1@qIlB74/B4KIgAwDPXwRNAK21Lx9NnZcs
Date:   Wed, 5 May 2021 09:13:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/2] ARM: dts: r8a7779: Correct internal delay for
 i2c[123]
Message-ID: <20210505071342.GB1009@ninjato>
References: <cover.1620138979.git.geert+renesas@glider.be>
 <73c96fd455df82ef04fd1db6d7dd79b4679f6c56.1620138979.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <73c96fd455df82ef04fd1db6d7dd79b4679f6c56.1620138979.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:41:25PM +0200, Geert Uytterhoeven wrote:
> According to the R-Car H1 Hardware User's Manual Rev. 1.00, the LSI
> internal delay for I2C instances 1 to 3 is 5 ns (typ.), which differs
> from the default 50 ns as specified for instance 0.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

With the same comment as for patch 1:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCSRaUACgkQFA3kzBSg
KbbszA//f2xHkSfNs3/UdGfH/l4tm3cc2VFsylKcEfs//5+LfD4KuA3H0In1szOD
i/s1/qpdG8Q3yJs3gg2Y11Roxva/t+FsLxGjCsi+JNRl+YsDySa5WWF9hFcYaasu
Zt0piQGsTE0MmvhC+4+8Dahfz+A0hWnuqLYb5WVBbPtAsAq81L0GVe/zMJxvO08Q
J9s8UovPDSwUIG8rwDk3ehop9gyTQ4rIYQRK+ihjTxXqWGS9BQZZACC6VZAemkKC
QJu6SzelKQHTMecWLvty22H7VHXL/PLGX77716NXJ7Hee/g9SiOR2Rpe4areXPbH
NnJ+VBM+DnwOhphjM9uR6Na4El8D1vNq6LyM/yXrpsiatuYxnP2JuaC7H7izv9ZP
amYNnOki6xolEcaazmKal7QzM90lsOQJCstc00zwP3F2X1Ztr7pyBln/rl8AC05Q
aGLh0iT7xiUceSiNM+eT5HQB6q5BkJvmg/WprAdmBrtjL1wILWUz0KyhoTFxBEE+
JVohmYoAQbm/zzobl0RZLQ2crSPaLeFI3UnlUX/epLcAeO9pTAmNGT1FtHiE2bd0
4v5eXXTow450Q7UycXc+pw1VRClt8t4BkptRkmwjs2XMWub3XtG+o6B+IXltRHAi
dtGB6XIxNMHSKLY3IiiDblGqpriKdZ1Abw6+RprGKZywy5EJSNo=
=L8qm
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
