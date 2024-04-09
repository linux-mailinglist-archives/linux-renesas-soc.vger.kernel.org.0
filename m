Return-Path: <linux-renesas-soc+bounces-4402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2A89D58D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 11:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55DDF1C21463
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 09:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2582F80BFC;
	Tue,  9 Apr 2024 09:26:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3A80604
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712654793; cv=none; b=D8JI2G7Ie2oFT8CJxcs7S5dlUGZ/w18Av9GhtPEu5vBH0eLm8rkridkRg07+VXPrkhq5YYDNV0MtvKeC2rxHStMSm2rXXfnQPacz7kzgwdhCpRmzBiMh+T5BBq+6i8LHXShH2fXy7lINaadF++rJdsA9XADNlfHvy6AW+oJkiwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712654793; c=relaxed/simple;
	bh=/uYxK0e7VudcpNeNCpW5q7lngbJoiZZ+vRLwaom3jbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FDtZcViI2xEE10AD7vduoPn829qEGCCqq2UyU6EpGPUlxLojrvdA8qtPWk/sf15dp5kQGqxYYCbg3jQ1/u1//j/2RMAsyUxJBFe/+viBT/zyocmT1Vz+RmvY7YefoFBaWnAUYX3dHMEYHy/o+r7yvVgdm8Iuu1exEINzHGUXfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 8xSR2C00c0SSLxL01xSRx9; Tue, 09 Apr 2024 11:26:28 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ru7kH-00D2QY-KH;
	Tue, 09 Apr 2024 11:26:25 +0200
Date: Tue, 9 Apr 2024 11:26:25 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@kernel.org>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
    dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
    Lucas De Marchi <lucas.demarchi@intel.com>, 
    kernel test robot <lkp@intel.com>, linux-renesas-soc@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
Message-ID: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Maxime,

On Wed, 27 Mar 2024, Maxime Ripard wrote:
> Jani recently pointed out that the Kconfig symbols are a bit difficult
> to work with at the moment when they depend on each other, and that
> using depends on would be a better idea, but no one really did the work
> so far.
>
> So here it goes :)
>
> It's been tested by comparing the riscv defconfig, arm
> multi_v7_defconfig, arm64 defconfig, drm-misc-arm, drm-misc-arm64 and
> drm-misc-x86 before and after this series and making sure they are
> identical.

That is not true: comparing drm-misc/for-linux-next to v6.9-rc2,
arm/multi_v7_defconfig, arm64/defconfig, and riscv/defconfig lost
several of:
   - CONFIG_DRM_DW_HDMI,
   - CONFIG_DRM_DW_HDMI_AHB_AUDIO,
   - CONFIG_DRM_DW_HDMI_CEC,
   - CONFIG_DRM_DW_HDMI_I2S_AUDIO,
   - CONFIG_DRM_IMX_HDMI.
   - CONFIG_DRM_MESON_DW_HDMI,
   - CONFIG_DRM_RCAR_DW_HDMI,
   - CONFIG_DRM_SUN8I_DW_HDMI,
   - CONFIG_ROCKCHIP_DW_HDMI,
   - CONFIG_SND_MESON_G12A_TOHDMITX,

> Let me know what you think,

IMHO this series looks like a big usuability issue for anyone
configuring the kernel, and you try to work around this by sprinkling
"default y" around.

The user should not need to know which helpers are needed for the driver
he is interested in.  When a symbol selects another symbol, it should
just make sure the dependencies of the target symbol are met.

Thanks for reverting ;-)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

