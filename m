Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E8F3321F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 10:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhCIJ2m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 04:28:42 -0500
Received: from www.zeus03.de ([194.117.254.33]:42798 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhCIJ20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 04:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=4vtblMC+QH9ScS5QM7dKY1E7qN67
        lcadFcQbhhEQgiM=; b=JdrNBH6PH9zc3j4vFBpYaasbtDXp4BVmXDs9sOxfqiJ4
        aoF47+OY7gOcDbtbC/gHRFFqoVPDlBUwbE1fHbjBjYA2ihgSzYY6wv5RG+3O1beg
        HuVSOBIDJc3eyqIiiWCpDKhZSusEXqSBmODf66CIyCyM/R+opPBnLPqBTZeDsWI=
Received: (qmail 3420989 invoked from network); 9 Mar 2021 10:28:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2021 10:28:24 +0100
X-UD-Smtp-Session: l3s3148p1@szYQLBe92IogAwDPXw8WAIb6kxwVO+fo
Date:   Tue, 9 Mar 2021 10:28:24 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] mmc: renesas_sdhi: reset via reset controller
Message-ID: <20210309092824.GA2538@ninjato>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 10:23:30AM +0100, Wolfram Sang wrote:
> This series enables SDHI to be reset via a reset controller.
>=20
> Please let me know about your (and BSP team's) thoughts.
>=20
> Changes since RFC v2 (thanks Geert for the review!):
>=20
> * use devm_reset_control_get_optional_exclusive()
> * select RESET_CONTROLLER
> * given reason in commit message of patch 2
>=20
> Tested on a Salvator-XS with a Renesas R-Car M3-N.

Patches are on top of mmc/next.


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBHP7QACgkQFA3kzBSg
KbZ9Ww/+J3SGInGxihu1/a94aK9k3NkPcbHQAY6dz5aG0IAh6EE9Lu6Tbd6mT4TJ
5hNFWvbYyUrCbb49pG6pUSrkri0+oILrfc7JxuFrTcIp6rkGWk8Q7rATM8gAeo3u
xayc+t18qMqtJxPBxUzYTSWxDwlBPBkt0zzm1oEeOvZYiKPtIJelf15Ez3qyy7QL
vpIQftrbuTyBOIQtaHl6aGA9VJEab+D62gikO0xOxHS9bG8hbGEQnFcpB2wuA+Yp
jOCMrdJnyhvO5ip0+EDIulUL8l9dRNuf706FJTEsz72YqVUdZa1U28qpV2ZlanlQ
+ZLZKdG7plJN7FWm95kN4ZHxSbhVJd3f3/L3wSqKf3SoEarvq0VJCqpkqELariPy
7KN1OzE4+tDuSyIuRuoHUNsbNXVMD/a3XD2POnRZ2Hu3m3lPXrLuSQHvpRYMwew+
Qg5AWFeIWcrJEVtaPVs6evJB9VGUe3p473CYk+8L7XqIFfgJKuaNLcINprsEYplx
7AbMl8joFj9RLBZtG+YhzgzROM8vfkIZMhQyb12Aggh6uQ3WE1xZc5FchJIGzRfo
a1lS0O7Y6UF/CV77y7JWRrGK0uI19PUJ95aGJ5KPxOzxVBWrPzvf7Nx5+6bzVSPO
jzbXBlJpaSh4hvxQJ4jlIcnLu+nBToqME1VdnChcOjfPruUfOSY=
=vYSN
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
