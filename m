Return-Path: <linux-renesas-soc+bounces-7033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF712925724
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77506288E7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540E1747F;
	Wed,  3 Jul 2024 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BQwRYxZ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BA13E02A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999832; cv=none; b=jJZUIabiUrvp+IRn+OHy+duKj6XXph02vnx2J5rLwbhRC3vPn6cJGi9Pbf36M+/8J9ofGgltyT0eBYvSYZRyeK5SUkJAZxlOFrRUsCqIYKN36bFWsIKuze57/f9XgmuUAYtpmV/I0/i3legEEDkuj4o7/1W9CEFY76UUbUyAb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999832; c=relaxed/simple;
	bh=Zki+hpjUZsWZjna36rff0M5qh30FEImaAGONn3NaeWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjCtzujjw5V+vx0JW7AQP+69gt7Z8qegPX9VaaMnQewtbTA4Y5ZtbzBlb1gIISba378KU0pJ0o9+12dR8+qSP3lc3ogdm6HDCwGut1ERe1c43xEC1at5z12fd8++6f/4qt138H2a1ORtg2BfVwnEPoZTpUrVOVmbOWfpc9Zarrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BQwRYxZ1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Kmmn
	bAYL/eV1eyI324YSJygW4NEGkw6vs1mqy0L27a0=; b=BQwRYxZ1FquDTzIXmqEu
	Pvk6NvxxP6/BZHXQAnkFmuE7ZDFizTLia/stfwIvf3oVju13PL20WAIMzQ8hHZZ5
	xzcwkzdmoOXeSNy8PSnv5JEfGDHQKT4eeS+rdPmHFJWvDQhp9yXdY5U02AtUz5Ef
	VwFbdJrVO4u1OS5QC/wg1h/2KlVZ+Om32LzIs3jdeYFjbDoecPlVAJUxKQf/cd8j
	y3vjEfp2q8EuFsGw1gdoq8KV6JZjH3rsJMDcPEImlyaeIL51z6GgN8SMVYQJzZBV
	mpPY1vtYUo7R+9XWLH2s+msI3dNsPcobhXp3k2uhwRdYUU5piPNihsi2pMBDtx9s
	iw==
Received: (qmail 2759060 invoked from network); 3 Jul 2024 11:43:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jul 2024 11:43:47 +0200
X-UD-Smtp-Session: l3s3148p1@lAG5qlQc+KFehhrb
Date: Wed, 3 Jul 2024 11:43:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Message-ID: <ZoUdUyrld2kZorvU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6vYa3c1o+yL1L4tm"
Content-Disposition: inline
In-Reply-To: <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--6vYa3c1o+yL1L4tm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Jun 26, 2024 at 02:23:41PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> similar to those found in R-Car Gen3. However, they are not identical,
> necessitating an SoC-specific compatible string for fine-tuning driver
> support.
>=20
> Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> - Voltage level control via the IOVS bit.
> - PWEN pin support via SD_STATUS register.
> - Lack of HS400 support.
> - Fixed address mode operation.
>=20
> internal regulator support is added to control the voltage levels of SD
> pins via sd_iovs/sd_pwen bits in SD_STATUS register.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
> ---
> v3->v4
> - Dropped using 'renesas,sdhi-use-internal-regulator' property
> - Now using of_device_is_available() to check if regulator is available a=
nd enabled
> - Dropped extra spaces during operations=20
> - Included tested by tag from Claudiu
> - Rebased patch on top of https://patchwork.kernel.org/project/linux-rene=
sas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/
>=20
> v2->v3
> - Moved regulator info to renesas_sdhi_of_data instead of quirks
> - Added support to configure the init state of regulator
> - Added function pointers to configure regulator
> - Added REGULATOR_CHANGE_VOLTAGE mask
>=20
> v1->v2
> - Now controlling PWEN bit get/set_voltage
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  13 ++
>  drivers/mmc/host/renesas_sdhi_core.c          |  98 ++++++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 147 ++++++++++++++++++
>  drivers/mmc/host/tmio_mmc.h                   |   5 +
>  4 files changed, 263 insertions(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index f12a87442338..cd509e7142ba 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,8 @@
> =20
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
>  #include <linux/workqueue.h>
>  #include "tmio_mmc.h"
> =20
> @@ -36,6 +38,12 @@ struct renesas_sdhi_of_data {
>  	unsigned int max_blk_count;
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
> +	struct regulator_desc *rdesc;
> +	struct regulator_init_data *reg_init_data;
> +	bool regulator_init_state;
> +	unsigned int regulator_init_voltage;
> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int=
 voltage);

I am open for discussing this but maybe here only

+	struct renesas_sdhi_regulator *internal_regulator

or something and create the new struct with the additions above?

> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int=
 voltage);

Do we need these functions because the regulator framework cannot force
these actions because it caches the old state? I wonder if we can avoid
these functions...

And the questions from the other threads need further discussions as
well.

But in general, I still like this approach.

Thank you,

   Wolfram


--6vYa3c1o+yL1L4tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaFHVMACgkQFA3kzBSg
KbZKeg//RuvAaOY52J9b2ypJshdLJ8hsiM7BAg2MgeoSEzJo1LzLopyAvUmSNglR
+whLrRNfg9/52+7CXEyvmCCpbBWLgPL5lAEECIsaDqnVsYCcMWX+XWhMG37YFTOE
EUJy9XPg/6aBfXzYIHkDRAfskjorGX5hdU7sLStI3qazGKBIu16fkDxCN84oPuqe
twnAKh+BaH5Dd1Dzwj7M1hSN//t/rCTuyLhfhfAiGJr+6UG5uTbOq5VKTbe8bEy8
RqkjdixdrcuX4G8uapT02RTQKkV6+BlDT9Ei/+jK6Y3ue0FqkqmhyGP5YcFkMZOB
AluYNbeVMOko+6/Tj71NMBAIpJ/oTDWK3zS9eg3HdZfD7z1WgKEH2tof3TSgGUjw
9dx+2bAoL28dFW8vrtkE3IyaV9B+bppf+WU+1kdYBmRjeEh91pOT+0HYZiSk0s+F
qv2yIOXbH4Bo7Z9q33LTTwq76AezNCiHNaHXHI7PhxWY44w3ZZnY11BUbTJmfZBT
6onjaKJhQtbnwlyFFc+XIvHKlXyUR2Q0YxHNbSvi/nJNoku/L0+vSvX6bJmO4HnS
DXgv9TSvxrTAfGmTx9yCmqLjYuBnZ099PsicibmIYIWF1Ff7vvw4jePxg48/EDPs
F8+82SHYmQ/np1Yz8g/ltt01/FeeTmXORMIQKZbCqIYSFV0FbHU=
=Z1FG
-----END PGP SIGNATURE-----

--6vYa3c1o+yL1L4tm--

