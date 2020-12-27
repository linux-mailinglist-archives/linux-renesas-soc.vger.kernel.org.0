Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF61E2E32B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 21:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgL0U2M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 15:28:12 -0500
Received: from sauhun.de ([88.99.104.3]:32886 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgL0U2M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 15:28:12 -0500
Received: from localhost (p5486cb89.dip0.t-ipconnect.de [84.134.203.137])
        by pokefinder.org (Postfix) with ESMTPSA id 876472C04B3;
        Sun, 27 Dec 2020 21:27:30 +0100 (CET)
Date:   Sun, 27 Dec 2020 21:27:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: Initial R8A779A0 (V3U) PFC
 support
Message-ID: <20201227202730.GB48782@ninjato>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
 <20201221165448.27312-5-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20201221165448.27312-5-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I got a correct report from a build bot:

> +	{ PINMUX_BIAS_REG("PUEN9", 0xe60698c0, "PUD9", 0xe60698e0) {
> +		[ 0] = RCAR_GP_PIN(9,  0),	/* AVB5_RX_CTL */
> +		[ 1] = RCAR_GP_PIN(9,  1),	/* AVB5_RXC */
> +		[ 2] = RCAR_GP_PIN(9,  2),	/* AVB5_RD0 */
> +		[ 3] = RCAR_GP_PIN(9,  3),	/* AVB5_RD1 */
> +		[ 4] = RCAR_GP_PIN(9,  4),	/* AVB5_RD2 */
> +		[ 5] = RCAR_GP_PIN(9,  5),	/* AVB5_RD3 */
> +		[ 6] = RCAR_GP_PIN(9,  6),	/* AVB5_TX_CTL */
> +		[ 7] = RCAR_GP_PIN(9,  7),	/* AVB5_TXC */
> +		[ 8] = RCAR_GP_PIN(9,  8),	/* AVB5_TD0 */
> +		[ 9] = RCAR_GP_PIN(9,  9),	/* AVB5_TD1 */
> +		[10] = RCAR_GP_PIN(9, 10),	/* AVB5_TD2 */
> +		[11] = RCAR_GP_PIN(9, 11),	/* AVB5_TD3 */
> +		[12] = RCAR_GP_PIN(9, 12),	/* AVB5_TXCREFCLK */
> +		[13] = RCAR_GP_PIN(9, 13),	/* AVB5_MDIO */
> +		[14] = RCAR_GP_PIN(9, 14),	/* AVB5_MDC */
> +		[15] = RCAR_GP_PIN(9, 15),	/* AVB5_MAGIC */
> +		[16] = RCAR_GP_PIN(9, 16),	/* AVB5_PHY_INT */
> +		[17] = RCAR_GP_PIN(9, 17),	/* AVB5_LINK */
> +		[18] = RCAR_GP_PIN(9, 18),	/* AVB5_AVTP_MATCH */
> +		[19] = RCAR_GP_PIN(9, 19),	/* AVB5_AVTP_CAPTURE */
> +		[20] = RCAR_GP_PIN(9, 20),	/* AVB5_AVTP_PPS */
> +		[21] = SH_PFC_PIN_NONE,
> +		[22] = SH_PFC_PIN_NONE,
> +		[23] = SH_PFC_PIN_NONE,
> +		[24] = SH_PFC_PIN_NONE,
> +		[25] = SH_PFC_PIN_NONE,
> +		[26] = SH_PFC_PIN_NONE,
> +		[27] = SH_PFC_PIN_NONE,
> +		[28] = SH_PFC_PIN_NONE,
> +		[29] = SH_PFC_PIN_NONE,
> +		[30] = SH_PFC_PIN_NONE,
> +		[31] = SH_PFC_PIN_NONE,
> +		[21] = SH_PFC_PIN_NONE,
> +		[22] = SH_PFC_PIN_NONE,
> +		[23] = SH_PFC_PIN_NONE,
> +		[24] = SH_PFC_PIN_NONE,
> +		[25] = SH_PFC_PIN_NONE,
> +		[26] = SH_PFC_PIN_NONE,
> +		[27] = SH_PFC_PIN_NONE,
> +		[28] = SH_PFC_PIN_NONE,
> +		[29] = SH_PFC_PIN_NONE,
> +		[30] = SH_PFC_PIN_NONE,
> +		[31] = SH_PFC_PIN_NONE,
> +	} },

Pins 21-31 are set to none twice.


--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/o7isACgkQFA3kzBSg
Kbbzww/+Pjm+iyYmp3ijVoIXiGNyQ4QUvBcXYGi3G9chDucRuQ6o/ricrX5CVgZI
+uMxP19YeCdLcpsd4/T2AhE4hL6iWzj0rnH3Lzjy1Kewg9Ex5jzaz6AyBUIYWoXd
4MRdCQ8AOkZMPQYInTw+fOjT63r4y4sNfxVhsjre9Cm+5Jc1ci0rYxAlvjLslBYL
YUIKDxLRftKQkecTJagH00Fl4n9O+V7X1WPH3E9Yk04JhHbMk01fp42uHLbE2RVf
k6jLNSuUdyKzzrHvTbI+hD3UuhDV1LlwUU7IZn8ZaRn5ketBv47LF4NugxBhXXHa
6yjpqdZixNWCu5BKQwv3PiExg5ZPJ3EkBHjixrgdL5RPojGMJKfwHZHxlQEW+u1X
0XzVfslakQjjYILKb16kyvzwS2yvqHyy4vTPB4GqlrqiCVw/acVp1DhAaSl/r1nn
Ft2VjPgUX3jyHeTo9pAS4pPQajwd7+QKk1DyDDXSHPMMqYLDGtG9SgfVfMyE90rx
dVOEuOA2/pFXz4XIg0K8xfa/yH/trulICQNfmlekbsylC1mr7NX9EjxqI8VwAF2K
VkdZmzP53HuuL07IWpwWiQYOLnuJ0J5ta2tK+hL8Nj83WXqjmeTHoYr0i/IkLZiO
AIx1vozrEVAGW3UgcaHBZtVQnwJjJvqR+xHeh4CBeia63jDYDVQ=
=pvjK
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
