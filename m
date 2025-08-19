Return-Path: <linux-renesas-soc+bounces-20714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B0B2C6F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 16:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84C9E4E4695
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 14:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDC5261573;
	Tue, 19 Aug 2025 14:26:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781D2110
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755613617; cv=none; b=D8qCJirI19cD64DYPrmSRYazmtWo5zFIMbWBSdLD/EojwB/nMVTdzaUlNGzDVC1u8jeMxQGwV6zTKOOTWwHnDq70zGWsaN8aUEQCSsuyaEKFbb4UeNd4jlC3ZHjq4d7qXqSCpRfgpZNQj/tpGJR0BsbxNVsmJn4LdmN7MslH6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755613617; c=relaxed/simple;
	bh=vtBXPEwcqA40EUYYhlaLIYVuMj+y2nBWUemyMy1a9Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhumTX5syx9iTaqXLAptmO6gDZB5Maxjtuhr5CXgIfqdV4bO3HkhU3QLQCIuM+lFvmOo5fWMa3raRMfwuIpOKiCK5uxE4gAQgLAUExV90AA3m1Eaug16M9TIXP9sdoenROENuJQU1WBEx/X3I7to0gPA4MHxXJGhPWG3z6JTLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso3133045241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 07:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755613614; x=1756218414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSDkMZAc+CmpIlhVdM0QhFKI57038VAyxYM/0TvLlJE=;
        b=G3ZaOANdH5uOeb2dXVfyc34MUJ7uLlHzM7mtov+CbJZ4AhlMmfjpxRYHlFGeEwkb91
         yDmosxGGc+G+y5tnmgrifOwDwRhMC3Nyd3FhOVD+bnERHa2FCKi15Ni//Ut8B22rNPWR
         mrsUATPEje2+QRGUrsQBUfucOh6QG11Gvts9RZJD5kh3qLegXWIAKz1SOfzHackRrM3P
         IqgQTutpoEP46+95sRA/Ha16xbjsfnHkmphRz5XNoAmyaj/xSRx3L36LA0HXxMkl4ELT
         qHS9Kn6W+jVQQ6mNzHJV4Nzbo0kOxSYmYso9+Qi19CylhkBdQ9YhX3R5auC/B/G4r/ot
         CXCw==
X-Forwarded-Encrypted: i=1; AJvYcCXSoYNF+Se7OEBOkFshJ8t5JRKTKJlvD/6Ijyzfh0WqtNYByXoJLUzV8J0aqr/bSVJrX+/HA1c9TWcDyeLciB2KsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/jdjsGcNIyoVlPoInHa75ui/SOfqHBN+1IFsk/m0zsgKq6YNg
	Ir5TAkKZlugMXNqwBjqrm4dnBg+yG19JrUkhClzzLe3VWS4Q0LJUsdCo2dfuptpO
X-Gm-Gg: ASbGnctxTobiTXuTwO+fAej02UURCYB0E0yiOplzUBSlTusx5ttDah+L+xVY7uf8Jul
	gAAy1jf5pl42Aa2n0lbU8GQAC7DTudHBUnT1hQPlY3LZtdbf8c9U+XCRm7zr46jTqMOqTwVLKwq
	OIm/TamJMrPK0TilSsAImfiAxyWBQ+HffAxjtXtcKk9nD+R4cCo3DqGfg+LhVqjazSajrJ13hak
	Pp3f7SszkEOytYzWbkeNGnt3xOJtiC0AtmoilRygGynQNXuXcVn+K+IF2++5INC/+2M/4eJ+RXf
	UwIPiHOejtR88ayU+p2sLe+ZHqzRE7eYIlppH6WtiWvDvLG0Qo4hF38GzciGxEC06WCwGgEoC0b
	YXvpFjgzVelGZM1be9OLRW2hkgn3roKFGkRZ4frWkolj9cRe5PN96+GjEGRjQ139o94Y/MY8=
X-Google-Smtp-Source: AGHT+IH3tHPwRf9GkDp1Je3B26olrsNmgsJJc1ryPA4fa5XU9l0GuNDa/ABrRsIFGui5CtJpBWLKcg==
X-Received: by 2002:a05:6102:26d5:b0:4e7:7146:a9e with SMTP id ada2fe7eead31-51921bf9b0cmr870699137.6.1755613613192;
        Tue, 19 Aug 2025 07:26:53 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890278d5840sm2352035241.15.2025.08.19.07.26.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 07:26:52 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso3133020241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 07:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu1yqHeqpvILNZqYdQTcPdmoYsuvEcRmHckyJj5qykjL6EcW+qqE6nMFJp4HWOM7GnvU93YZtUymlOuj1iuAJwmA==@vger.kernel.org
X-Received: by 2002:a05:6102:3048:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-51921bfbd45mr842694137.5.1755613612545; Tue, 19 Aug 2025
 07:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202508192154.jtZINmab-lkp@intel.com>
In-Reply-To: <202508192154.jtZINmab-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 16:26:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQqsgfG-1ued7guLxdzDdKodZuxkuZh=JCnsgt6d0Mjg@mail.gmail.com>
X-Gm-Features: Ac12FXykjQ-V5GKAtiYNRC9m5aHHyZFU9Eh9BL1ezS5rUvusNbqwVEOq0wVVQzk
Message-ID: <CAMuHMdUQqsgfG-1ued7guLxdzDdKodZuxkuZh=JCnsgt6d0Mjg@mail.gmail.com>
Subject: Re: [geert-renesas-devel:renesas-drivers-for-v6.18 1/1]
 drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
To: kernel test robot <lkp@intel.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Robot,

On Tue, 19 Aug 2025 at 15:54, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.18
> head:   75601ffaea537c3180f23912ce1d0ed5f716469d
> commit: 75601ffaea537c3180f23912ce1d0ed5f716469d [1/1] soc: renesas: rz-sysc: Add syscon/regmap support
> config: arm-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508192154.jtZINmab-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508192154.jtZINmab-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/soc/renesas/rz-sysc.c: In function 'rz_sysc_probe':
> >> drivers/soc/renesas/rz-sysc.c:113:16: error: cleanup argument not a function
>      113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
>          |                ^~~~~~~~~~~~~
> >> drivers/soc/renesas/rz-sysc.c:113:58: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
>      113 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc(sizeof(*regmap_cfg), GFP_KERNEL);
>          |                                                          ^~~~~~~
> >> drivers/soc/renesas/rz-sysc.c:113:58: warning: initialization of 'struct regmap_config *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    cc1: some warnings being treated as errors

Thank you, adding

    #include <linux/slab.h>

fixes that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

