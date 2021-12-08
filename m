Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C60F46CFB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 10:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhLHJMh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 04:12:37 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:44875 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhLHJMh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 04:12:37 -0500
Received: by mail-ua1-f54.google.com with SMTP id p2so3427534uad.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 01:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJ1mhirfYAO+3CwIc8GlggxLDirvHXshFClZNphPW7Q=;
        b=2C/Sya2TiDF4bwpjEOoHnJUNk4wTduIlUu4f5LiBSeD41p/rJufWY15yi452DkDjxW
         qnRw3d5U41TSmS7WIMQuFRZ1gEL6KPExNn8XRyeOUBfVPPoSgsZahNQVJlMZ9NzmJ3MV
         +rX2TpVVPlM4H4h8GlPon5NhP1lmz0mSe+GdUYoJ43pQy4LeOHcc3IPcXDr1YRFrkMwb
         BmD7DOMmNjCiSx9tE2LBbS+7uAnwilt+dYOCAGjhkMB/lXGEVUpc+pHRNJEQk+5T+X9D
         CHyGAFcEMXsYbZi3YkZyGE9mXR5YGDmgXpfzu52ZAijTLgb9rhaOVc5+HYy6n35wINkN
         +HDg==
X-Gm-Message-State: AOAM5331Uy1S1yoTBdZ8Gjp56JjZc18kTrO5vSmM3TQzR9L0uFSsBD43
        H2v5JfbhAbE4MKpjsRe7vPOi21bt/77p9w==
X-Google-Smtp-Source: ABdhPJzCmGRa9dsV768Qq1OogxNMGGEPFzj+xKWZlGmLUg7ZdQs6HYL8wzZBBM6ywbrBjcIFwutGng==
X-Received: by 2002:a05:6102:105b:: with SMTP id h27mr51748187vsq.60.1638954545093;
        Wed, 08 Dec 2021 01:09:05 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id g187sm1359213vsc.10.2021.12.08.01.09.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 01:09:04 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 188so1114877vku.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Dec 2021 01:09:04 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id z15mr61764911vkn.39.1638954544599;
 Wed, 08 Dec 2021 01:09:04 -0800 (PST)
MIME-Version: 1.0
References: <202112081010.7vN3rLa4-lkp@intel.com>
In-Reply-To: <202112081010.7vN3rLa4-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 10:08:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwKAp3pcC1oMz_X91YDt_gzT6tFqfWsEBcmCpTMCTwfA@mail.gmail.com>
Message-ID: <CAMuHMdVwKAp3pcC1oMz_X91YDt_gzT6tFqfWsEBcmCpTMCTwfA@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v5.17 25/30]
 aarch64-linux-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:undefined reference
 to `rcar_gen4_cpg_clk_register'
To:     kernel test robot <lkp@intel.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel Test Robot,

On Wed, Dec 8, 2021 at 3:24 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.17
> head:   6496166cb5d7dd163ceea55390060d77f008bc8b
> commit: 3e7c1099d948a41fbb99b7f6bc49189b66f81279 [25/30] clk: renesas: rcar-gen4: Introduce R-Car Gen4 CPG driver
> config: arm64-randconfig-p002-20211207 (https://download.01.org/0day-ci/archive/20211208/202112081010.7vN3rLa4-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=3e7c1099d948a41fbb99b7f6bc49189b66f81279
>         git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>         git fetch --no-tags geert-renesas-drivers renesas-clk-for-v5.17
>         git checkout 3e7c1099d948a41fbb99b7f6bc49189b66f81279
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>    aarch64-linux-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o: in function `r8a779a0_cpg_mssr_init':
>    r8a779a0-cpg-mssr.c:(.init.text+0x90): undefined reference to `rcar_gen4_cpg_init'
> >> aarch64-linux-ld: drivers/clk/renesas/r8a779a0-cpg-mssr.o:(.init.rodata+0x70): undefined reference to `rcar_gen4_cpg_clk_register'

Thanks for your report!

--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -149,8 +149,7 @@ config CLK_R8A77995

 config CLK_R8A779A0
  bool "R-Car V3U clock support" if COMPILE_TEST
- select CLK_RCAR_CPG_LIB
- select CLK_RENESAS_CPG_MSSR
+ select CLK_RCAR_GEN4_CPG

 config CLK_R9A06G032
  bool "RZ/N1D clock support" if COMPILE_TEST
@@ -178,6 +177,11 @@ config CLK_RCAR_GEN3_CPG
  select CLK_RCAR_CPG_LIB
  select CLK_RENESAS_CPG_MSSR

+config CLK_RCAR_GEN4_CPG
+ bool "R-Car Gen4 clock support" if COMPILE_TEST
+ select CLK_RCAR_CPG_LIB
+ select CLK_RENESAS_CPG_MSSR
+
 config CLK_RCAR_USB2_CLOCK_SEL
  bool "Renesas R-Car USB2 clock selector support"
  depends on ARCH_RENESAS || COMPILE_TEST

The first hunk was missing completely.
The second hunk was present, but only in a later patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
