Return-Path: <linux-renesas-soc+bounces-17120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2857AB7D55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 07:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30608C162F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 05:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2BA295520;
	Thu, 15 May 2025 05:53:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B62951D8;
	Thu, 15 May 2025 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747288423; cv=none; b=pbBLdlbeOKPzwkpi5jpuXf4CTBXERhn9tPdEdpuhuC4elYIREbP8VuKE5FRytK6P5Pl7i8+EFPsAwTmxZazq9gDMVMdIKajrZqqcy3A2eMxyHMZ6ffaJeq0Khm+Rjw5d3sFLGlEXQnhebBigeJ09j0oUM9GBb3KeV9ipRob+GZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747288423; c=relaxed/simple;
	bh=QRe32xatwTRsoz+wj88ZVHN17zQOUDN3VJmsCT3pC6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UY8ZBM1w+CachY6zPsfDh17KdQ/wPU8JpYWboyX3seKEYchCtJcuAM3RmFQ4Onjj0JuK0MSikLxKYMubKrxDjbnM6TuADVISeJrmiv8fuew0ldnVKahq6dZ44ES9FjWuDxQ8cshYsnvpYa0bUHpk1LW7HipehEL/hthVeKUF2go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52c4e568d07so160845e0c.0;
        Wed, 14 May 2025 22:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747288418; x=1747893218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPyG0mlit4Fqvc3ieiHFbClT0DklwqbFDL/14cm9a+o=;
        b=amlKL0Uk/VIT/dtdClsoekBi3OJVT42/7xr69zKlvBWoCtwt+5WItgHhAY5meWYRBB
         Y0pSwfouy9O8sllyiuFdvlu+N2BAuz8AFmK0jyoVJyv/8v66ZDUU/LAtZEmPUXdIWPae
         Z/F88+uummUw+kg1pDNvN6F6ybpPsHZ4auHCfUyQHbH02FAgR5MWjo3Q76bbKhIx1YWH
         5w3YXaKvvnOkbi86p8b36RkBD51TAiDhehTGmXSplxckff+qKV8vwi4Hmls8NoTL/VxB
         FENT625ZlXZlMRiSZJ2ZPgS7u+PFvrPsxElaiBTFwt3WjcxX3MsNerk7zc689WPF1HTg
         8l+A==
X-Forwarded-Encrypted: i=1; AJvYcCVokdYoLJ1SlA0Kaw8TmlMhlT1GrxF6itGdcFQaqnYzYWiWkvySBtb94pqBvCaNgStNuNa/Rlpe69K6oTfH@vger.kernel.org, AJvYcCVronU9kRrQug4gmnDzijoDS+P8HKFWjTJTyu4wmFHRXvXPFHfkS8w7lf8+W5iE7BtozNhdE6kuU4WoLAZQLQkYbQc=@vger.kernel.org, AJvYcCWdsZXtCwh9jC0SRUsjlOluqmvHKBYWJKMrr9dtJ44FcK2ki8ddxf0i+vr3+AJlEz6L7Ptzhq0Taelm@vger.kernel.org
X-Gm-Message-State: AOJu0YwZL5TH+9RBxbNmNen+BvkW38rAgJovjh/3r63TFkAa71DNTzB4
	scE4pMy1vSJpooUetOQCJd8Ayx+oMD4HaztWxQK0NmxlKU9RaaUnDpiKU2f2
X-Gm-Gg: ASbGncsd1Y/iV5YmrN4ruK8laWbb07/5vznLvZioI0n49jXAR2V/Z94xnnp8OYt0pSZ
	G07lNDdHVuMRHDkom4VbPQJ18FJHpVHnJ1C51EA35C1GQSjJZDbE3FC2Byu+rAPLfbCC3R1FVwn
	bZIcWejMH4MaLERAnJdZN2KNSot4EjCdkNbvzwC3+9EPK2m63MUAFqLRVUHZPjCqrJIpdiRH4sa
	DLBFhLT/b/i5v9ivj36lXHQCkVv80YpfqrJ4lNd61JMca/Yce0D688jBlZb8s3tpCOKmX+wtEEO
	KXpSUJ+Db4T8ApijQr1H1gz1oZcFbtF8BHq80GKvUmI06WMLS2taQXXaKYSzT8Ej0k7Em2dVj/S
	QWsBqul0HUuOh0A==
X-Google-Smtp-Source: AGHT+IETenXI+9SbdsyOZmsQyg6s+CzGbt8Dfb6vrDK9/pp4703P/ZUG3ct9ypSGPjBDrwA4c/GukA==
X-Received: by 2002:a05:6122:3283:b0:50d:a31c:678c with SMTP id 71dfb90a1353d-52d9c5698b1mr5746589e0c.2.1747288418648;
        Wed, 14 May 2025 22:53:38 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c8bd074c6sm4258220e0c.8.2025.05.14.22.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 22:53:37 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8783bce9f84so130191241.2;
        Wed, 14 May 2025 22:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAtrIHAPva0qjbCHUtyPQI0zXPozlOS9/VVMfIp/uspfWE50Io8SsmdCD7EqfY8zg7cW4VXHTNx0I9m1V0XyEh+b8=@vger.kernel.org, AJvYcCWTgNQDZ//ywwoLu6ob19sQ4R8+lombPU+Yl4k40hQF2hrMy/MpoiUCmLglfn2nOLwBrgDtV9ChqXHT@vger.kernel.org, AJvYcCXuQ9aMHOJM+G3WFabQHLS2zwK5mx6143Alaq3QfQ64UXFWBtU8Cc2xJ/3PayXVYijcbKbp8kwnjpA8jnCE@vger.kernel.org
X-Received: by 2002:a05:6102:3e0b:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4df7dcb5c78mr6484774137.9.1747288417074; Wed, 14 May 2025
 22:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <202505151255.rCHp8Bvu-lkp@intel.com>
In-Reply-To: <202505151255.rCHp8Bvu-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 May 2025 07:53:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
X-Gm-Features: AX0GCFvo3GnsTZII4bhG8cXLylyB93OgSRrkVG13kj0dt4dQMBXBbYjIu4GDk6M
Message-ID: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: kernel test robot <lkp@intel.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
> [cannot apply to daniel-lezcano/clockevents/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
> config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
>      235 | static const struct of_device_id ostm_of_table[] = {
>          |                                  ^~~~~~~~~~~~~
>    1 warning generated.
>
>
> vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
>
> 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
> 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible = "renesas,ostm", },
> 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> 3a3e9f23c2cae9 Biju Das 2021-11-12  239

The table is unused if CONFIG_OF=n due to

                .of_match_table = of_match_ptr(ostm_of_table),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

