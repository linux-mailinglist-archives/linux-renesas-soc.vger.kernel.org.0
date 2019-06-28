Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090D25A595
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 22:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfF1UGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 16:06:17 -0400
Received: from sauhun.de ([88.99.104.3]:53834 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbfF1UGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 16:06:17 -0400
Received: from localhost (p54B332FA.dip0.t-ipconnect.de [84.179.50.250])
        by pokefinder.org (Postfix) with ESMTPSA id EFC882C35BF;
        Fri, 28 Jun 2019 22:06:14 +0200 (CEST)
Date:   Fri, 28 Jun 2019 22:06:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH RFT 4/4] mmc: renesas_sdhi: support manual calibration
Message-ID: <20190628200614.GA5956@kunai>
References: <20190628153448.4167-1-wsa+renesas@sang-engineering.com>
 <20190628153448.4167-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20190628153448.4167-5-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -403,13 +492,20 @@ static void renesas_sdhi_reset_hs400_mode(struct tm=
io_mmc_host *host,
>  			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
>  			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
> =20
> +	if (priv->quirks->manual_calibration)
> +		renesas_sdhi_adjust_hs400_mode_disable(host);
> +
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
>  			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>  }
> =20
>  static void renesas_sdhi_prepare_hs400_tuning(struct tmio_mmc_host *host)
>  {
> -	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +
> +	renesas_sdhi_reset_hs400_mode(host, priv);
> +	if (priv->quirks->manual_calibration)
> +		priv->needs_adjust_hs400 =3D true;

I need to check for a valid 'quirks' here first!


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0WczIACgkQFA3kzBSg
KbYQ0BAAm7aYjlyeIXnfw2jYjYemNKeeMGoY2BugM6oq6g5nrzH2PiKcLIjCZ38S
QRv6B9CIWKQ9fpOUM55eBVX3BXYPkY63qd/uRZzBAHq5jt75dPXqvnCN7/HD8rf/
UzpD8mhYmbnc1bgR5KcH4mw3wu+BqfiFxAcuXU8yAPCwjnZY2LvDCK1D0FaguW8t
Qtlt6tnqjMgu0YzUS3/GG+eZUkXvvXn8jVf1adDH6autqtQs3Jmyvp+V6sEHpN+u
Ib42MxvRjItMJYqgRMf1UnFK/buU0Tpdhq86T0aQ2iBgUIvg+h++vldKwDSAdltN
KUbSkgSBCyDjdtO5u+pwI+GyGvhuYAMG4g6VpgraJ3KI4A8YP3XSyp9tv0OZzdaR
oB0na5f43gXPSc+G8KxjGiPfodpzpVd2cWi1ZWZDNBSXMvISX4FUxIHW0A8Sm7wp
pwVP1/5Z1tkwrofY1HhvgKZgSFuCYRe3WhqrpvxMhYJixJuNttF6ZUktWJ/K41wH
qYSKglvMoPM9Mkfy6a0+elCjsC90HCeKB2mjrVzE3v51NhWV6aUpyJp8P9pqS20v
jT2hMgXmkCfhCW+ap/8gqJoNpZUdT5KkMmRg5VIqwbdLfkkfLQaDfKUGGGOSV/7b
mc873WNG3ZDRVjV2KHYE1QHmA/vXKhvZxDS106beWMQ1vEMXS5Y=
=o/J5
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
