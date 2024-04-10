Return-Path: <linux-renesas-soc+bounces-4499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 329098A00CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 21:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483C61C2099B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 19:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917AC180A8A;
	Wed, 10 Apr 2024 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Qmkk2P6A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359C28FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 19:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712778433; cv=none; b=oDQxY/es5jwA7JfEna2upXLH12L069u78Sy8baZrmFEK8G4Toy7keDe0f0sHh+XYu1ONYRtoRk6uyPHAlfTQxaBtrRF4+bfE0TODIA/JVttArZbyhBMp9aNir47mPyqqfcqK1Q4QOxjJwkKcRY3paRENR9wV5l+ARuEDZeekEMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712778433; c=relaxed/simple;
	bh=D5eT38i2bhMSPKQfY7joymnfa6SW7AQi+vRsyHWpi64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paMSYP35bLxO2UlE5bZnfagYrpiIqMUrXqI0Ou19yZSt8KE1rMQrm1rpN1FWHOqx01KfhQgCT/E/gdsImjRt1aoffmu0QTOo/CGpPQgXfTvS4hjMIhekGuiO2Apt22ZFBcqSkOCctLv4JvTaP2/5m+Dug/nDhm2qjw0Sw9Dbc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Qmkk2P6A; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1712778428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HTMX4XGvOpzyNxVflhRx4NfOt2Vj+LsvHzJX5SgXyZM=;
	b=Qmkk2P6AwiAybwySdf8VZSr825+Rp1DtfZTwfMdIY7HDpyPGzB1Fu1cUnd+K/tOefK7anM
	rd/0AwqoFin4BslePzPNJvi7nLXkLR4KNP17ZcWJE+Qi1rNPk3b4HyX46CT1ksWsciYOaV
	KjAEl2Pn40GxA660alIIZTttJNPI5OSA63FdWxaV2nCmXjOcogKVERJ4N3609vZ6c/6DNF
	KJHOdbMhHmMnRlir+Yhn20q/fv04gptq/vJSv+x52r0DQYJq61jDwVAlXuE874XzLeur77
	nWGyRBLQvH9s5D/RDAyzkZANOJg1AjftwmXoDOrqmy+jauAOl8KDfOpMrYxVkQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel test robot <lkp@intel.com>, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to depends
 on
Date: Wed, 10 Apr 2024 21:46:54 +0200
Message-ID: <3688196.Heb4DZiL54@bagend>
Organization: Connecting Knowledge
In-Reply-To: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
References:
 <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3085996.ce5DWXnqYG";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart3085996.ce5DWXnqYG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Wed, 10 Apr 2024 21:46:54 +0200
Message-ID: <3688196.Heb4DZiL54@bagend>
Organization: Connecting Knowledge
In-Reply-To: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
MIME-Version: 1.0

On Tuesday, 9 April 2024 11:26:25 CEST Geert Uytterhoeven wrote:
>  	Hi Maxime,
> 
> On Wed, 27 Mar 2024, Maxime Ripard wrote:
> > Jani recently pointed out that the Kconfig symbols are a bit difficult
> > to work with at the moment when they depend on each other, and that
> > using depends on would be a better idea, but no one really did the work
> > so far.
> > 
> > So here it goes :)
> > 
> > It's been tested by comparing the riscv defconfig, arm
> > multi_v7_defconfig, arm64 defconfig, drm-misc-arm, drm-misc-arm64 and
> > drm-misc-x86 before and after this series and making sure they are
> > identical.
> 
> That is not true: comparing drm-misc/for-linux-next to v6.9-rc2,
> arm/multi_v7_defconfig, arm64/defconfig, and riscv/defconfig lost
> several of:
>    - CONFIG_DRM_DW_HDMI,
>    - CONFIG_DRM_DW_HDMI_AHB_AUDIO,
>    - CONFIG_DRM_DW_HDMI_CEC,
>    - CONFIG_DRM_DW_HDMI_I2S_AUDIO,
>    - CONFIG_DRM_IMX_HDMI.
>    - CONFIG_DRM_MESON_DW_HDMI,
>    - CONFIG_DRM_RCAR_DW_HDMI,
>    - CONFIG_DRM_SUN8I_DW_HDMI,
>    - CONFIG_ROCKCHIP_DW_HDMI,
>    - CONFIG_SND_MESON_G12A_TOHDMITX,
> 
> > Let me know what you think,
> 
> IMHO this series looks like a big usuability issue for anyone
> configuring the kernel, and you try to work around this by sprinkling
> "default y" around.
> 
> The user should not need to know which helpers are needed for the driver
> he is interested in.  When a symbol selects another symbol, it should
> just make sure the dependencies of the target symbol are met.
> 
> Thanks for reverting ;-)

I *think* that I ran into this issue (but it may also be KEBKAC).
I tried to build a Debian arm64 kernel from 6.9-rc3 with a number of drm-misc-
next patches, including this patch set.

debian/config/arm64/config: CONFIG_DRM_SUN8I_DW_HDMI=m

In my 6.7.9 kernel the sun8i-drm-hdmi module got build.
(as well as meson_dw_hdmi, although it does not have an explicit configuration 
for it, but there appears a similarity with it in the `drm: Make drivers 
depends on DRM_DW_HDMI` commit)

But in my newly build kernel both are NOT build.
While I can't complain about meson_dw_hdmi, I would have expected the sun8i-
drm-hdmi module to be build.

Cheers,
  Diederik

PS: The Kconfig says that the module will be called `sun8i_dw_hdmi`, but that 
seems to be incorrect
--nextPart3085996.ce5DWXnqYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZhbsrgAKCRDXblvOeH7b
bvq1AQCWuETmAhmjxyvowpjrLc/u+IYBh0PwB08fkWCmCv+HXgEAt9qM3PNgc04c
9HHAXN5cSjjo3bslRseoFhXzizCtMgA=
=XwbC
-----END PGP SIGNATURE-----

--nextPart3085996.ce5DWXnqYG--




