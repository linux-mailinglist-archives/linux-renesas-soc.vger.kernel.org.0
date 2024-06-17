Return-Path: <linux-renesas-soc+bounces-6321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5190A721
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9629F1C21877
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA8F4D11B;
	Mon, 17 Jun 2024 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JzvJQLlc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF018FC8D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609425; cv=none; b=K94Eo49pV3GrsMCNOB2eCUV4M0ZBEEa+fuDzvlypQ+TU9XbDI5VZZ5+CyI7pybc2zljGow9CTERcsnJCD+z5pQneM6H4FIECfhVnkQhHXdplL7dHY+Npj0gSGJanBgDVQ5KPc8RujJbuDaey4Hl3NQ8/SkiT1t5LqBPJ8vaqQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609425; c=relaxed/simple;
	bh=gEldI8SY6eGQdXXA08PGCTyjYAYBvdvuimrdpkVw3aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJbcGu2un2avUdQRrZaGL2Mzk1NP+0+c2x0Cv5VEEH2oQBAtgwmZC6Nqf6fRbvicXsnPsPC/vgYz2v0aiZQ1dwZVRqBs7T8ch2G6h+w7HOJJ/SzSf7XCXTvRBkL6nTr1D0DmrnSPlgrxahBMMrVBO1UxWGik0Vp3c/KZFxGvQ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzvJQLlc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718609422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nH7NF47wiN5yYt3CYf79aIVqL/Dl6DPgZQONYE92Y0w=;
	b=JzvJQLlcprNm25RLQncmQDGyIUtw1QrWdt1oZ2Dt7AKHlJFX5VZCQsyOgFA6Y0G6feSHNO
	LtkEgg5VRhIbXNgVsp1ffFs8e0m33zacuDI0a/bBi9XG+icgWBEVJCp7YinLphvbl3h8Tf
	FbH4qj7gZW28+LblzRcgjLJRMXmobMw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-bgob3BEtPyOqlbGP_7L6mw-1; Mon, 17 Jun 2024 03:29:40 -0400
X-MC-Unique: bgob3BEtPyOqlbGP_7L6mw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4219cb14a23so35321235e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 00:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609380; x=1719214180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nH7NF47wiN5yYt3CYf79aIVqL/Dl6DPgZQONYE92Y0w=;
        b=PEUqXjn6szrFAKDHy7LFBE265p7y+kQbNFVNTWezdqZROSCpsv0vcjiYtkP0IgkgIx
         gb+PumzhP4ileFlrRPo55ptfFdfttjGhG14mhxMXJ5ewelzlaYzDCt+AW2kqX15I9KKO
         jrPD7uinjyA5WzsgBRmVuF7G1dQ8HFj3fhOT93qQB5dOWkAbBYbPXRHYNsHZmaiRd4IC
         bm5FVcmsDARLP5FiPe+xodkzmqj4heOVbUQNRTXuGA0XrGtK8favH3zVMtxJfwqGDnQf
         uVdxHC8XiroGTd59Lj0VxZF5VOiTmrniMPpyf08qibSG+N03jGzo1gOrBKd58lFTYf9f
         XBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQFO5LQEWl2L+jIZ5nJsOtAOHe7D/VHfBse+yUJN0Fu5OFXyxMv4GhqjaiSFVGs7Hry/N4XFtgip1fqYEtDMD5Zg/Awpbg8+h7bVy4YZBsKy0=
X-Gm-Message-State: AOJu0Yx4D6gZ2a+dG6UbmkbRX6wkcAlXyR7juX4r/zDEKRhMqy1bOHfC
	psoQMCJXNIXxTjJ+uB5nET7PpBF0fkVbag4P0w15tDIYAlJ25pEj6nchphzdj43Phdpj0Dhpff0
	4uA+fXRpmRWoFwXF/B/8Wk8SihYA7Jmpdc5TybwHhOuSrNS0SuWjJwtLG7NvddUeOMWf5
X-Received: by 2002:a05:600c:3514:b0:421:7bb1:eb9b with SMTP id 5b1f17b1804b1-42304844abfmr95161325e9.28.1718609379788;
        Mon, 17 Jun 2024 00:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNol8wq1CXKJ8SwcNyP7NAVPlUEp/Y2i/P5kX0p598nmFsmM+2aodmq6E1g2pO2gIIdkl2YQ==
X-Received: by 2002:a05:600c:3514:b0:421:7bb1:eb9b with SMTP id 5b1f17b1804b1-42304844abfmr95161155e9.28.1718609379373;
        Mon, 17 Jun 2024 00:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320bd8sm150669275e9.32.2024.06.17.00.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:29:38 -0700 (PDT)
Message-ID: <cb70ad62-e927-4020-b2d9-84b7c7a607bf@redhat.com>
Date: Mon, 17 Jun 2024 09:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
 <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
 <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/06/2024 11:12, Geert Uytterhoeven wrote:
> On Sun, Jun 16, 2024 at 11:08 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Sat, Jun 15, 2024 at 12:55 PM kernel test robot <lkp@intel.com> wrote:
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>> [cannot apply to linus/master v6.10-rc3 next-20240613]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-032053
>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>> patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
>>> patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
>>> config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
>>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>>>     depmod: ERROR: Found 2 modules in dependency cycles!
>>
>> Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
>> selecting DRM_KMS_HELPER was wrong in the first place?
> 
> Q: So how does this work with DRM_PANIC calling
>     drm_fb_helper_emergency_disable()?
> A: drm_fb_helper_emergency_disable() is a dummy if
>     !CONFIG_DRM_FBDEV_EMULATION, so I guess no one tried to build
>     a failing randconfig with CONFIG_DRM_FBDEV_EMULATION=y yet.

drm_fb_helper_emergency_disable() is part of the series
https://patchwork.freedesktop.org/series/132720/
which, after discussing it on IRC with sima and Javier, is not a good 
solution, and is abandoned.

I think the "select DRM_KMS_HELPER" is a leftover from earlier version 
of drm_panic, that used the color conversion function from 
drm_kms_helper, but that has changed in v10 and later.

drm_panic is called from the drm_core code, so in fact it can't depends 
on the kms helper.

I don't see a good solution to workaround this circular dependency, 
maybe depends on DRM_KMS_HELPER being built-in ? (so that means drm_core 
will also be built-in). But that means platform that build drm core as 
module, won't be able to use drm_panic.

There are a few of them in the kernel tree:
rg -l CONFIG_DRM=m
arch/powerpc/configs/85xx/stx_gp3_defconfig
arch/powerpc/configs/ppc6xx_defconfig
arch/powerpc/configs/skiroot_defconfig
arch/powerpc/configs/pmac32_defconfig
arch/mips/configs/ci20_defconfig
arch/arc/configs/axs101_defconfig
arch/arc/configs/axs103_smp_defconfig
arch/riscv/configs/defconfig
arch/parisc/configs/generic-32bit_defconfig
arch/arm/configs/davinci_all_defconfig
arch/arm/configs/omap2plus_defconfig
arch/arm/configs/pxa_defconfig
arch/arm64/configs/defconfig

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

-- 

Jocelyn


