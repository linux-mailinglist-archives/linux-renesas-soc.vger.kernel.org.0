Return-Path: <linux-renesas-soc+bounces-16765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E661FAAE5E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 18:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6431C1888D21
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 16:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B92528BABB;
	Wed,  7 May 2025 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlX9QuCd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98128A702;
	Wed,  7 May 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633597; cv=none; b=GKMy0RQmbighVhDteWr6skUSne2DtHxyY6u8aLlGA7ForCMbx1WWz1gUzDBDLxXJdnqfgiSfeljqdhrccNmfM2qX6QGibFlLtv9L0CWx5TrDby1gAuluYZ7yMc9loDCjCPd3hYwelzQhXKJepIaIxX+vpqjEWaOVdOYrvzT2i/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633597; c=relaxed/simple;
	bh=gXjnM1roDlotjdg3Ay139IaGXTuQnvJ4UcXAoJarlLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XzC0+EwS6SV8nVL8NKNKOZiDGTHAMARPqBz7EcKbLf+FqFr9bcXRYvPCNx2AxwgFvISK6mhcNhMR5qcZxG6FaNar2pfxCyHNoqRyWosn2eG3VgDjJMMOYcov86f6jbXQHuEsEhA6kZLZCo4Z9qh+v2MvEPGkGA1HJt2G7S3txQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlX9QuCd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso270235e9.2;
        Wed, 07 May 2025 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633594; x=1747238394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GNlloVBSBdqHS/4e7VZJEvQDPC8zlmapQT1HEDKsd/U=;
        b=OlX9QuCdjQpIr0gxIleCixTKvoAzlhvCZTxyxchyNnSNURqFBEswT58XvrHTfglwt0
         ozONWwSBWbFivKN6Hf/C4Wu0cxpYNVNSbro3TtPYPyllMLnrG7h0zN8FO+uac4iKDhdw
         JLoFVqIg9ifTGKFaRjvoGw0G08Y4TkV1DWgnHZXFa4FEPQF+iGlc2zHwi4XRLNA6ZWD/
         vE+bHfGgXhFu3dFvIDPk28XwYWGUW1y9vqB/Tag1DbaEX6eSbkQw7UQywI3+NkqSvrBT
         79YMluNKwNQSIj0lmXBXTIkpSD06D0CceC6nOTVi7mJez5Ma3UF5S0fdRf0TnEFm3lrD
         S3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633594; x=1747238394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNlloVBSBdqHS/4e7VZJEvQDPC8zlmapQT1HEDKsd/U=;
        b=f1S4GVzXIV91/qaCj1hdjVjNRjNyiTFqjyMK6K2aS5zYldnaytL7u1nLuMUJioU0Cf
         ni2/Y2IatArAZoRL29qyagq/VjXoPgrS1PejBXs4KPzIOREfGhFZxIske5VWDWRPWCYQ
         31IW4rDpcd1bSQ+8oVJ4TbgHSExZGmmchDtuM3jWUXmyC6TFiVycrqS7EpnGR1xsLxx7
         fiMNMljw7nm1YtmEBQjfTeyzdBRh0BhhrYHmnDyFHbNSR25w1pqwFhmiHb6MlDRUEFSi
         k+vNA+lbrXfuhyyUCY9kppDBJJA3c3jNTf/JmKAat6Cz6CsdwFrxP678Nt2tDv+5C1kU
         i5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Sy/Dk13Bo+PX9Vrs/ModjlmiB/bRzxf+P8Yzv25IpgnsBEbKADh+ufEtAxJcBKEBINVNq5APaym8X+o=@vger.kernel.org, AJvYcCVji98HPEqtsJSmA+1Z8x17wJT2y7pTc/3b67FUdh3Mfqumoc2SU+biFStFWjeoSMnuTO5tTZbIYAuY7pynsu6mNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBaTIxyLFRhrmgyZmV2Qp22BHJUmrB8mgGdCsVeyGOBbv4pXPT
	PRVrxMIOFKCp+ba7TyFZ1RvtesZ7HLvdQMP4xHgv4OIcwyXYPG6B
X-Gm-Gg: ASbGncv0tXwzZhdeQ8rVRQv+NdcBSQVMtW5Cx9d4di0Uv+zVuBCV2NQWlA/3wDnSX94
	5eO3eB0vZkgr63OoxPgM7H5a1KzZVtkkdnsHTo+5mrHAQH0NgNHl14AyA/cI24WcxrFK3pdmhOG
	BVnH9m4DQmTFa9ljWIcdhb1qRD7ttYmo+X2RWsEdPyMF+LZvKmHfCognvNDUyQlc9OSDNv7e2SA
	cXXJl5yJzr24VYIy1rTacC1z1tJICXP92YoKCikkgo3gHw1DDEb0M+X4RjRB/ld+aD4bQMtNgLi
	iAMWxuPteqjU7Rho5os8MqUWRiYrZx14AO+qgTo2cGs8cqJvmCZ160m496nSjRLJQ6bdE5rkltV
	nl4CRuDXBWIKCCLLS5TCzcUK5GDE=
X-Google-Smtp-Source: AGHT+IGNbYw1CXoeJchTCMQofd/K3j2UuhbSMT//yzQ6IX4KKfobA3915QTDOmMMTF4GAA0z6nGCZQ==
X-Received: by 2002:a05:600c:3d0b:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-441d44e554dmr38391495e9.27.1746633593865;
        Wed, 07 May 2025 08:59:53 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33103dsm5282705e9.10.2025.05.07.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:59:52 -0700 (PDT)
Date: Wed, 7 May 2025 17:59:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Terje Bergstrom <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Message-ID: <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b7mf2ylrupklls2f"
Content-Disposition: inline
In-Reply-To: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>


--b7mf2ylrupklls2f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,
> but the driver does not decrement the refcount during unbind. Fix the
> unbound reference count using devm_add_action_or_reset() helper.
>=20
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 1e8ec50b759e..2065157daab3 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs tegra_r=
gb_encoder_helper_funcs =3D {
>  	.atomic_check =3D tegra_rgb_encoder_atomic_check,
>  };
> =20
> +static void tegra_dc_of_node_put(void *data)
> +{
> +	of_node_put(data);
> +}
> +
>  int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  {
>  	struct device_node *np;
> @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  	int err;
> =20
>  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> +	if (!np)
> +		return -ENODEV;
> +
> +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, dc->dev=
);

Actually, I think this needs to be:

  err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);

otherwise tegra_dc_of_node_put() would attempt to call of_node_put() on
dc->dev, which won't work, or rather cause corruption of some sort.

Shout if you disagree.

Thierry

--b7mf2ylrupklls2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbg3YACgkQ3SOs138+
s6EljhAAoHtzDpVDWTR79gSRirTUrVeV9+PHHeBUtEsD2h/VKtAZWrLLTk7Z7tY7
zMC5NFztTtHDfHiqlUuT9dG5YX0hdoKwb04Bl65ZLaLe4t8FoxBHDpObZb4tGTsx
ZpnmBpNY9ikXaNqRhskuquzRwcm95DINhrVuqUMgk/eSHQqOh3E5uLhKtP2Nj0be
Xv58dNTlnVCJRsM8A+Pwlsfj8xnkD36hhfWxQdVjLKfcC8MIAGqx9JBbyC+n0V2L
64bRO3zrervznyWK6JzkVb8KUEi3YR1tLlwP4FLEGo9J2m+N3KAu0qUlgj12I5iM
BPiabcYV1rO+YIIKxdFtXhBP4hbq/jqyClA55+f7jgwnlnGURS+AnaKD8nfl5Ite
vyv25UP4kxC7dN0O2uyxKeJJkM17qwH4cKHtHahU2LrgRJBz5wLE/uxiYWGy8C0+
Vchpax/NljQpBaQek/oqU1cF6K+Bf0cy6+lifsUWQ9x0B151n2ut2Xnb2qJb6cru
J112ofa5UblA1BNaCrkrYkYhkj9PAiHPhT8lbHGxxs+xHh9UxW5XGGkp4lDganlx
O98SkqHIdzNXZuVWKaqWj7dcpZdE70DCp/HLdf32wzXbwDrxr2O6RREmTfUP7Y+e
YsSeoMBmJvaV/9nH+U9fHiuNRGpBmzldnQTM3NuNT3mbspibaww=
=cuA6
-----END PGP SIGNATURE-----

--b7mf2ylrupklls2f--

