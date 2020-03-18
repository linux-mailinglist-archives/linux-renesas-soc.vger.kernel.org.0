Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B9618A331
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 20:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCRTdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 15:33:08 -0400
Received: from sauhun.de ([88.99.104.3]:50466 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRTdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 15:33:08 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id B636F2C097D;
        Wed, 18 Mar 2020 20:33:05 +0100 (CET)
Date:   Wed, 18 Mar 2020 20:33:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com
Subject: Re: [PATCH v2 0/3] clk: renesas: cpg-mssr: add ignore-unused option
Message-ID: <20200318193302.GA13309@ninjato>
References: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <1584376479-25258-1-git-send-email-uli+renesas@fpond.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The point of this is to allow a WDT that has been enabled by the bootload=
er
> to survive these events:
>=20
> - deferred probing of the WDT device, which can lead the clock driver
>   to disable the WDT clock until the WDT is re-probed, giving it a
>   blind spot
> - probe failure in the WDT driver

So, I was trying to test this with the watchdog driver and my patch[1].
To make the watchdog_register_device() call fail, I cleared the ident
struct:

	priv->wdev.info =3D NULL; //&rwdt_ident;

Sadly, the watchdog does not fire after the driver bailed out of probe.
clk_summary rightfully says that the clock is neither prepared nor
enabled.

Did I miss something? I will try some more tomorrow.

Uli, how did you test the ignore_unused feature?

[1] https://patchwork.kernel.org/patch/11101573/
   "[PATCH v2] watchdog: renesas_wdt: support handover from bootloader"

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5yd2oACgkQFA3kzBSg
KbZo/g/9GGbgRGL2gf47GQdmiSGb6bI5SU0EQoSNv7asIxRiEx/VKlpts1v1Fk2E
dTE9q/uMUpayvIe2NAgcgFrhkVFfCpnExIM47WsgznMyMLqAtq6xFKIhUmOnTpyr
xPJze7aVBUm3ykf+MCmfSodyq7Pisc6uGYdDJGwvcO6+AcvuzP90WyJxdpvHF5GM
7gi4v4kakydGvJ1vvry8au7+Q6lumd2vfILw3A8hKHNNfOcUpewpxytChn8qinpj
T/N+SQk1TpFMTAx6k6YTOXyBz3sb9ZHAfH13dEHdsPG2ZX1f24CFE9TMmAJMSOBZ
mQyFrIHZi1HPQgXTww+1UblAo4sS8tVqfxXQ9gvr/FS06oCE6tu3M+q3+Mjf7JIS
i/mbqacX5IQm+GlVJVotJrcXA0DzHyLrnELup3MZ52mGysVnY4EIv4L+A8jrTwx1
50jf/p6e/zRpJAALgHfI4aafGVHbIypbmCJkiWHGfWySwq3okJrBpK/VI2fxCv3S
vP059hi6bRPN0AjwYS/TRkVcjZZyPKNO1c3GhSRjJTR/7WePkeVwAAlivZyYmoiA
Ux/cL5yQPMkdnLOMb84KGsFxbBbjeA6H73Z1FZqNc3puwlSR+jIh2jPnvoGuM0rX
fPG2NA9b8v4M7BPrEfpKiRgTcwu/ECMZf3NmOTom0cgJlD1+I5s=
=LWN9
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
