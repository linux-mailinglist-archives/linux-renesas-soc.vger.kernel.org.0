Return-Path: <linux-renesas-soc+bounces-14128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E8A55692
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 20:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE0B1898B65
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 19:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C204326E96F;
	Thu,  6 Mar 2025 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1JK4ZGc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAD19E99E;
	Thu,  6 Mar 2025 19:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741289201; cv=none; b=mB8+nb0ScNtwIwiloXnr/q2zjieXMWv02+9vNLwEhkcU2XmuCev32hnRWpRA02NGOMJvV95pKBrSU0QsU3VmtmKuYN6n+V/ywzBpvkWApkJAcwEbOzcu7Ov3h9Ai7H07XA4qK7DshgHbsiD30x02kh0A1yRO6e7hHytMeE+df+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741289201; c=relaxed/simple;
	bh=TYNF5uSYA4qLy4+0N6piNIXODyphiWdbD9W6y3Or87U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVrgnweYfy5WDzrVT/GpRZfh8KaaIk6XsMHnHQhwC/4qixo1kWurzftzWlVmp3xt6vpv1JcMKSofJKHCs7xDIkY1rYgF3yuZIzUOZ1mUPS1AdB97rlSqiOIE7HpIzt7IRJSXi9AFF4iZtyIjYyQbilCSrSKqZjUXB9Jxr3JO6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1JK4ZGc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390eebcc371so745665f8f.0;
        Thu, 06 Mar 2025 11:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741289198; x=1741893998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=I1JK4ZGcAtVb29v5t0FDfTebEUcYbgrsY5gfo8ahBj4fnlgRs//Ju85g6KpHETmbTh
         /xBbaKWxHKJRGJC5xifE/PT5ARyIdp92VBM1Sz9WCfsYeB1yl015skta/qlm5o/jNx/t
         HsM93nh+A47Ra+yNfuyexV5TiMaIXuJEgnrlid+bMopSgZLW+pW5/3HD/I/355ZOmg20
         hhzK38EGIfPhbc9k5fVw8uJpYsE+Z4iF+KZ4+r+mD6Y0Xr+I4B8OaHly1AJz2+vLCisG
         tKZWLfXD/UD0o/cM72zAxFwFF5IVn+cuCN+lNhAqxmrmWex48vOClSOlxxw2QyojS4wD
         KE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741289198; x=1741893998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=Ffe29ERr2AsalFS9M1SXo7Pm0B0CO7OEGIel9ggZAnf1/FwZS4/6HGKLsDghIQ3z2O
         B2Ex6lHTwP4OyfOU1VU/vNO2ZDb8UnkeJny7/aFKEGSzhKZyd9YxJHWWZIAu23G6o8BK
         MOJcnDLh747p5OmK7SKHknojGRlQHShO9YllgOTD2Ovk0Y95JLNjIdeYe2oxrAzdD48A
         zt0xdfu1IkP1XzsQZ3BflqG/bUcxPNPmkBjA2QLRmm/1K/ObrkwFN0Ux12WU+JXkAjt0
         WiskPswa0JU6Sh7PxteZC828Na4M8Y7bWTD/fVh3VtDsrLpJLT/sBWIUkA4HYW9gLG4Z
         xeAA==
X-Forwarded-Encrypted: i=1; AJvYcCUCaERr5ZORQKY9xr+sAs9i6I2lF6w7kjIKEbGSXb40JWwHrg6+1QVeuj84lYsE18Lemr0Y747+W8PtjFC3@vger.kernel.org, AJvYcCWReqQ4KnmTdn22h7L1c7WXRL+8hSrYee1GhJuDtVwswvfbIYmmMhDZ/uSo7Z0l5gq/0jL1KVSkowQnsGGWUs1LDhk=@vger.kernel.org, AJvYcCWXXnNIOUJ+cyKiJvubaxNUkYqNXAsmPSWrq4Smg21twb0f4qghKiz6Lq/+mf8wDaEpulVMOL+9dlm0B1Ji+RdYId0=@vger.kernel.org, AJvYcCX9LPtmEF6m0Qd/u3+PYB75+hxfVr7n56BE3xq2ICkZTcr0QTzcJTDCyuej62PcKjEU71j1VgxfQNSO6bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxahazkZ0zdM6IWaR2KoQOK6irfTYMtBPKyfRCOPjHDcPMUuZ6G
	u3xfgvd2Jb4L0UM7o7HuFn8EAY/4eRe87yYagJ6x87z/hETAHloj
X-Gm-Gg: ASbGnct84UT2Ge6lBC6At6b522N0DWQR0BocaDabdHJzUvXZ9BKJU9ui62zEJ2+PqjN
	E95nNx2I0aTPX28Hl+wzSi44aqY4Buhvndlh16zexTbWYobjqXiAjmG3ZJ3sHzYKOul+N/v3kxe
	j/tBZa7mJPD5kWtBd3isjFnfKkfDc2HziQ8tNRM+Wkvl0aYwFdpjagFjQBh+uHoiyn8fTARPKmb
	Y3Muyq87S+hfEvAWCjn6bX2iC3mhSHSEq601AGWlmARveHpn0og6cuxO2f8Cwtrc+sFW48nvQqD
	UmzdqjnoWOxPi5Fz4zu0o5mfYXVG3zG+p/r369v0prJrcNzVHyjryN1P/ItaxD9NqZdTtmqBf+S
	aB2M+l5apnuI477vdiKGWFL1lMy0kAYU=
X-Google-Smtp-Source: AGHT+IGse2HrwvQit3ez+Tb+IZmcWPgul6Oz1Of3MncB8IKv5GiNEYehZwUGHa/gmdRGfttFwUyGrw==
X-Received: by 2002:a5d:5f45:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39132da8fecmr291664f8f.48.1741289198054;
        Thu, 06 Mar 2025 11:26:38 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e1d67sm2905872f8f.74.2025.03.06.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 11:26:36 -0800 (PST)
Date: Thu, 6 Mar 2025 20:26:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <mtsi7lohn4nq75y3mdzk7eomloxvswjn4blsmruutpejhppd5i@wexuiu7yfea3>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-21-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y6cp6aqkj6w24xiu"
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-21-tzimmermann@suse.de>


--y6cp6aqkj6w24xiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 03:23:43PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y6cp6aqkj6w24xiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9ukACgkQ3SOs138+
s6GThw/9F553EWmmWz8ONopI5pY7Fy+Pu8kzqsU5bhKSKO2aqJ8y4PFOQAzaacO8
2HuvhLXsP6l91B+R49oebJTWnbgcl9ThzcA4njgdKRFc7yZU/EZUEUGdwDkU6qsh
/rkDnM+a+MzIAd3Z31B0Kvb0tUsl4e0UBueDHmjfP554dbtnMr94eIHuqLVRb1/D
LB6ddm8DbZVoDKT9Ji2gLQpW84oFuIzRZPOV8JmPe+wE8Xf6A9sLloqJndErnvHg
B8X2K8PzxkNNJGaZtQMUpiJ+S1oDNZnnKtzt0Wb+b9itJqUgykve29vGBDBImsb5
8JLFlkdPFdKpFsbAvGyHv8b+F2rDVu4Oelg88WWDUSMc9Ut274u5/a2DTUOwF806
DtCADAFUOOcIyDZKfPpeQuWDPeScN3/ANW8iQMlyPaNO5fBKlisFjiF1Bh0gS+vQ
shkKb74wChg/4jgq1+M+I4DPdCQRe0kGIqbNZ4yK71owOjoSE6WIxxEt0UUKxPwh
XZyf8ZF2O9TCPMigN6Qw2AGUhaC3HsAG9KbhOTSeUAsOwohFtYY+3B6Hkb8SQHEM
i05OutqXEhtdSZgBK+HuweZtYWCBfy/BcMeD99Rkg01C+aMZcNPGVLpvGqpryNaB
Ga0hQwFdIjbnMbXxjzyfJfs7GqNyTAJtpiqBO3uDhWH2LxJHZ7M=
=2m1E
-----END PGP SIGNATURE-----

--y6cp6aqkj6w24xiu--

