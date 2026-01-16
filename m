Return-Path: <linux-renesas-soc+bounces-26906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F71D2E8F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7B9F3052F4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BEA31CA46;
	Fri, 16 Jan 2026 09:12:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E23233EA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554742; cv=none; b=paqHyHO/IWiIDMdI8BXXAY22jf/xyipbi3rsykzb4RFomljubxjk7ZsunL+MROGO5D+CuXfxMB5tuaTh91m23goh7E7cRR5DnXuzOeyhKclb1gaw0ZL1njCoNQaI8WNUGV60A3cc1Ne04lSI67GsAiPkbFimIQOvaG0MljXKqyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554742; c=relaxed/simple;
	bh=uVOVIUqiZuoTk+0maIOAiHxCplZx7jUlt7+31JiN0uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2/af5IKA3Dtum7+VcnF0Ef8HMzTBTWwD1iEE0dB1bW9BTfIFbQEudn11dIJ6FA95NvLKXa+vSyL890zni0RESyQ2O2dmVJauj608MNZEi5J5QbiTenh+dAs+82KbIi76mYxMdSMDGxjBQGxpafyk8hrcBpRjI96Cv70VttI6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5634feea416so1348678e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554738; x=1769159538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2UZe5YgfXhcRIgTVpIXZmgIkVRExJjOG0e61TJdE4U=;
        b=Fzy1hOlBQPclzuhyty+fx9IWTGaZgbEtrG0PY+0yrvH4TOeQkpBUAtkhurcr1F8Hts
         G2wByS4qf+pgyN5i5qOuTxo/bX3LgMBHsJjlWbT9QDNqD5TLrR+4nyYhk5sXx3wuR+qH
         142uHAyvQhSimgiTGpYmbx89E4ULaF+7NLkLUEbelHrrK5W2Asa2EKpvHf0kBt3BC2+c
         zVkXTsDOF+n1Mg0vUmx5RS7OCPZKRXZyohiEaa5pI6n1vJJUaPzfDHbGIExyQ+evuFWO
         qoJZj3DXa4czyPrU9HbBEgGX+WC8sUs8wZrSdXXhiSF16vJC7DuKRfMCJbPhJQCYmaD4
         yInA==
X-Forwarded-Encrypted: i=1; AJvYcCVeij/ALL+9Iy1HwmiaLve3I6KsektRA7ztwWsFDg4+wzd7FEV3DC6MXGLE8pa3yMCk41X/o0mojnSHDB2lf+obAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZ3aJUPjrjo52cx/w6NbU0btcMdM6Oe3tCZ3NdW1iGMsq+VIS
	E/Lx7KqKq7+WeQg6K9BqROwHA2+h5fdhJIQBBTQVlZ8pSa/L8rwAOCNq/lNS9EhLZuE=
X-Gm-Gg: AY/fxX4UD39IwuJYNgOwJw13J0quhHg4WYdAFv3+KgYhlmT3zrcyYqcSqpwQz0YxTks
	r6nBv44fAmpfXbbF5iXobK4kcR0sUI7V4Yd0gaqXa/yIqY8O96ST30PCpPFxKdGwOeXZw3dgLKf
	kKq7b1zoEXMxt7zffqIIYvDXTyMxOqWxErsbpFdx4u5xtmnzd2d2YyaPgA+M57tRTrN/G4AdNRJ
	7q+KjtbHkqeOg3HaUS9DEu3HBOsWrdCdPtnwmcVF3jGsGj+8z3CrXuQzRgZAdsD0JHtOFL100g/
	vWgCVSrm5QNcdOtbnvVY+wbml4D61NFjo8rFy/VBRh1IlK4GSOkq/+J6O3IZmQEprQvgEPpm3VM
	pR1f0rn34uJH1BVeXc2UwgCDPSXnmtU0atYwmPq/6S3bTIya5yt534/XQXvW6tGdNh4KY0bk1aO
	AvQ1m86rFaN6dpcfNn53OIpJT18g+2EIyro75ASf6WCsTtFvUS
X-Received: by 2002:a05:6122:2105:b0:55b:305b:4e34 with SMTP id 71dfb90a1353d-563b5ced6e6mr938113e0c.20.1768554737800;
        Fri, 16 Jan 2026 01:12:17 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d0446f94sm551969241.12.2026.01.16.01.12.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:12:17 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso1318700137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:12:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnoX7HF4mrSZd8MLfhynsCmq6JVoFBSksCGEsVc32KVx/dMZhLNg5nE/RmWYtzWasJ9UB5Dbxt8Eub8cinijU7Hg==@vger.kernel.org
X-Received: by 2002:a05:6102:5129:b0:5ee:d0ff:7254 with SMTP id
 ada2fe7eead31-5f1a55702dfmr888364137.34.1768554736636; Fri, 16 Jan 2026
 01:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202601161408.8oFa2eE5-lkp@intel.com>
In-Reply-To: <202601161408.8oFa2eE5-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 10:12:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUv0J_XGOzpirOtqPTVNTJBFWJnYPeoycNPKDPJB_mMbg@mail.gmail.com>
X-Gm-Features: AZwV_Qi75Ru-kG2msi4BX1GsJrsqa-bjWJ2OW9Z6QSQk0M6iAIM2cFl68rwdKz0
Message-ID: <CAMuHMdUv0J_XGOzpirOtqPTVNTJBFWJnYPeoycNPKDPJB_mMbg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v6.20 21/21]
 rzg2l-cpg.c:undefined reference to `__udivdi3'
To: kernel test robot <lkp@intel.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jan 2026 at 07:29, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
> head:   5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc
> commit: 5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc [21/21] clk: renesas: rzg2l: Remove DSI clock rate restrictions
> config: xtensa-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601161408.8oFa2eE5-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_mod_clock_enable':
> >> rzg2l-cpg.c:(.text+0x19cc): undefined reference to `__udivdi3'
>    xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_cpg_get_foutpostdiv_rate':
>    rzg2l-cpg.c:(.text+0x1c1d): undefined reference to `__udivdi3'

Thank you, I'll squash in a fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

