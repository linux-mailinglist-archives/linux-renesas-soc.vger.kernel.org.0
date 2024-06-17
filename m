Return-Path: <linux-renesas-soc+bounces-6330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8B90A86B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 10:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9831C232A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 08:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8418190473;
	Mon, 17 Jun 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZC1lh2pf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFFB157A42
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613069; cv=none; b=Q1PV55j1ucfUPTXozggxvRpCErdlugOq2GMUbQF3c1w44kNlmGQTDyWUgze09xwY3WYjTM8CgG0doPAKYRQmhcfXVYJtOsuw0LWZ5NkKA/oWvjBzLN20rE4F7NTG21aK3TptIazhZRw6tUoIJsw+VHVw2t8lkufk4A4IaAoDQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613069; c=relaxed/simple;
	bh=ZbDI9c0HmPjexoKRl1GQN/dSXPz2UkxaGRrj1fQpjmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcw9P0QWs8pvPwkCm9HEga8mA/7edZQKlLP9d2veCvZAzmyHeU0CiETxfeO8s09Vi24q91R8RsMyuTwg8g1mAST8+x/0DrdP/ylxVnK8tTu5AVs3oDGLjnKeDbegNRgytlsDMe7Ae4J16ptDvPsh5k1FksrQYWR5PSJCYj4+bu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZC1lh2pf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sJgM
	bxWu9V+TwYJoRKfSyRjs1pVcjqeuejguaECABE8=; b=ZC1lh2pfEulFpMwsIFWX
	45+u8TZdz4dTG5H7V2BK77Aro1V0Lpuv2Q0qJH2TFKZ510s24oNWfVnOrzqTSEg2
	XBac43WDfHZF7MjbAVnhOaHWG5zTwVw5X+7veDo/vBmw9TsoJ51aYH7MqLnAknKH
	BbYsjtFswv2ky1bYws0OyerF+rzu4YKqi06QvpqTAN/vuu7DbjgfH4HTEzlS2Mtk
	q1mPhzgAO9HVnyHCPJ/+AtWswBH1+kHK6ty6OmBDyqGZ8PKe3n+HxbLOpYV4I06V
	0n1jGw2ADAkaddXlgic/ykP6pa5+fHHEaRDSFmubkka/fzKYkMg/jfjgBQH+zHiM
	8Q==
Received: (qmail 2258176 invoked from network); 17 Jun 2024 10:31:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2024 10:31:02 +0200
X-UD-Smtp-Session: l3s3148p1@b8YRyREbzJggAwDPXzjQABqqX1QYyOSW
Date: Mon, 17 Jun 2024 10:31:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ue4f7wdlmrpwmuit"
Content-Disposition: inline
In-Reply-To: <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--ue4f7wdlmrpwmuit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

> - Ive modelled the regulator now to control the PWEN aswell.

Yay, this looks much better. Good work!

> - I have still kept regulator bits in quirks I was wondering if I should
>   move this to renesas_sdhi_of_data instead?

I think so. An internal regulator is not a quirk.

> - I still need to add checks if the internal regulator used and
>   only then call regulator_enable/regulator_set_voltage. ATM I am still
>   unclear on differentiating if internal/external regulator is used.

When it comes to re-enabling the regulator in sdhi_reset, I think this
can be a sdhi_flag like SDHI_FLAG_ENABLE_REGULATOR_IN_RESET or alike.

When it comes to the regulator, I wonder if it wouldn't be clearer to
replace renesas_sdhi_internal_dmac_register_regulator() with a proper
probe function and a dedicated compatible value for it. We could use
platform_driver_probe() to instantiate the new driver within the SDHI
probe function. This will ensure that the regulator driver will only be
started once the main driver got all needed resources (mapped
registers).

My gut feeling is that it will pay off if the internal regulator will be
described in DT as any other regulator. Like, we could name the
regulator in DT as always etc...

More opinions on this idea are welcome, though...

> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,9 @@
> =20
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>

Regmap can luckily go now.

> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
>  #include "tmio_mmc.h"
> =20
>  struct renesas_sdhi_scc {
> @@ -49,6 +52,9 @@ struct renesas_sdhi_quirks {
>  	bool manual_tap_correction;
>  	bool old_info1_layout;
>  	u32 hs400_bad_taps;
> +	bool internal_regulator;
> +	struct regulator_desc *rdesc;
> +	struct regulator_init_data *reg_init_data;
>  	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
>  };
> =20
> @@ -93,6 +99,8 @@ struct renesas_sdhi {
>  	unsigned int tap_set;
> =20
>  	struct reset_control *rstc;
> +
> +	struct regulator_dev *sd_status;

This is a strange name for the regulater. Especially given that you have
as well the more fitting 'u32 sd_status' in the code later.

=2E..

> +static struct regulator_init_data r9a09g057_regulator_init_data =3D {
> +	.constraints =3D {
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,

Don't we need REGULATOR_CHANGE_VOLTAGE here as well? Or is this implicit
because of REGULATOR_VOLTAGE? Can't find this, though.

So much for now. Thanks!

   Wolfram


--ue4f7wdlmrpwmuit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZv9EIACgkQFA3kzBSg
KbYmhRAArX6HJmfEhElIby3cdkoYJ9a6reWiPnb/H+5jI2ai9dNl2W2oVhfvtI2M
DAsSAmWM2NzRIy6K/dt8XhLqfBdfcG5qmKQyp3GJxK5iD4naYsQOxGs8IBBvvPgT
ASWBe6S0bSBUte1dR80iMoVkFXV97BBq2JatTu73hBkZvIaBpcU1Ekr1vAHHvAu8
ZKf72yONTm7jdPRiEl3P9dSAT957uqh1pQ1Y5SC8rMDiXZ+MGOaBZxXK61lpNoao
NDXfcDHBEanl0skuiQuWVbLEVw47KJZlEzyEFXzeWaI5/zzE8qxFTFUHcMaNeAHe
ppnuEqGkgzntT+6je+xuRItcsJbmSlhTGf5LMoU29m99VB7jYN+AGHqfkTpma9Yz
JIzQ4AdnUm+hi/UzNtxqZXthBcw0KnDThfvWuLFuCojOCaoFFbK/D/fRApdClOG0
dqRU+e0runDmUPcRSdALGbcfFZCql1phHBaYS185ORd1DReRPagOQxNRn2UDMll6
6SDUq9A5iEjiRL81MN04Fugi3QXpDSeowa/9QTjEqlOXOCaXghVXqFH0y9KKfL4S
eN3KNa027p48WYLcSzjfzOceMCL0Ixzkj6oUNur1NmXaVs6TEZSpoc2oDHA5/xAV
ip8W+RQhRHuui/apICpDV5Pjk0GtQTNuAcbGGxE1lm1VDMfiLrM=
=00e5
-----END PGP SIGNATURE-----

--ue4f7wdlmrpwmuit--

