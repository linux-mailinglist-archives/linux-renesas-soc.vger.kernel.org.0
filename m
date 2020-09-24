Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7FD276B54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 10:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgIXICJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 04:02:09 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41964 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgIXICJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:02:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id q21so2322703ota.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2020 01:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0RcX5PLWK711W6MTtswEKMQBkQH2xlNGT3bNlImIvu8=;
        b=Mi/i+qjQ2VwS7/28mGPycGCSUq4VlcQJo4B3iGFpiE5ob/0wsV2mpQjrTi/H4p5ycf
         bzX/VJiodfNn8SeFE8Yq+zlldGsyRevXRePu/MXch13I1NftMGjaS5qoClhLPam8ExKf
         pCXWmOLziaAI/zeqqj+QM1ZOezkxtFEu5ZgY3vg3Twnkl9x91cpOEfEY6Eh280aH0vUB
         4bpFMoDeYZnZdyZOelFp97B390u8k/fVy8lY0O8ZCn/jHmMoq5vhpQV9U+cYklQoUVrv
         2UM0NZP94PKsHNCMEkFzJQ3cj6CVHkdK/3UTQYOZ5nf2qwz/49n9fP+fLuXWyhSJ3zFw
         gzCQ==
X-Gm-Message-State: AOAM532b3aiSzArYnHdkv+wc1JXBBhEo1p7uVOM88CymwaeguW/AKYLc
        CsKaJNsD8lae+SJnElK0fNjUnMOMI2AwBQiGAJCtj2n4kpw=
X-Google-Smtp-Source: ABdhPJwigt/hr6CwtXhm1giKhpSqiW1rD4fagNjqlWexI6yYLs1nMhN8IWWlyaNQwTanfvrp+ijVsPMOV3yfURie+ng=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr2354612otb.250.1600934528175;
 Thu, 24 Sep 2020 01:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <202009231915.Vn6RelQX%lkp@intel.com>
In-Reply-To: <202009231915.Vn6RelQX%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Sep 2020 10:01:57 +0200
Message-ID: <CAMuHMdV=aWj9ePL9gAa-vsmLLUZkY4ip2337am8A7ktxg7Yniw@mail.gmail.com>
Subject: Re: [renesas-drivers:sh-pfc-for-v5.10 5/8] drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:183:52:
 sparse: sparse: dubious: x | !y
To:     kernel test robot <lkp@intel.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel test robot,

CC Gareth, Luc,

On Wed, Sep 23, 2020 at 1:48 PM kernel test robot <lkp@intel.com> wrote:
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v5.10
> head:   46d5baf0885ac8e1a799bdc4dc396dab403ccdf9
> commit: 8449bfa9e6a9f7ec9b9037a2e61784140b673823 [5/8] pinctrl: sh-pfc: Collect Renesas related CONFIGs in one place
> config: c6x-randconfig-s031-20200923 (attached as .config)
> compiler: c6x-elf-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-201-g24bdaac6-dirty
>         git checkout 8449bfa9e6a9f7ec9b9037a2e61784140b673823
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=c6x
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
> >> drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:183:52: sparse: sparse: dubious: x | !y
>    drivers/pinctrl/sh-pfc/pinctrl-rzn1.c:189:52: sparse: sparse: dubious: x | !y

I believe the code is correct (see below).

> # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=8449bfa9e6a9f7ec9b9037a2e61784140b673823
> git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> git fetch --no-tags renesas-drivers sh-pfc-for-v5.10
> git checkout 8449bfa9e6a9f7ec9b9037a2e61784140b673823
> vim +183 drivers/pinctrl/sh-pfc/pinctrl-rzn1.c
>
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  174
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  175  static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  176  {
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  177     /*
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  178      * The pinmux configuration is locked by writing the physical address of

The comments seem to be wrong, though: "unlocked"

> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  179      * the status_protect register to itself. It is unlocked by writing the

"locked".
Also, the function seems to be used in the opposite way than the
variables are named, which confuses the reader:

                rzn1_hw_set_lock(ipctl, LOCK_LEVEL1, LOCK_LEVEL1); /*
unlock level 1 before use */
                writel(l1, &ipctl->lev1->conf[pin]);
                rzn1_hw_set_lock(ipctl, LOCK_LEVEL1, 0); /* lock level
1 again */

But the actual operation is correct, and matches the hardware manual ;-)

> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  180      * address | 1.
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  181      */
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  182     if (lock & LOCK_LEVEL1) {
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26 @183             u32 val = ipctl->lev1_protect_phys | !(value & LOCK_LEVEL1);

IMHO this is correct: ipctl->lev1_protect_phys is to be ORed with 0 or 1,
depending on whether LOCK_LEVEL1 is set or nor.

Is there a way to inform sparse this code is correct?

> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  184
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  185             writel(val, &ipctl->lev1->status_protect);
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  186     }
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  187
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  188     if (lock & LOCK_LEVEL2) {
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  189             u32 val = ipctl->lev2_protect_phys | !(value & LOCK_LEVEL2);

Likewise.

> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  190
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  191             writel(val, &ipctl->lev2->status_protect);
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  192     }
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  193  }
> 4e53b5004745ef drivers/pinctrl/pinctrl-rzn1.c Phil Edworthy 2018-09-26  194
>
> :::::: The code at line 183 was first introduced by commit
> :::::: 4e53b5004745ef26a37bca4933b2d3ea71313f2a pinctrl: renesas: Renesas RZ/N1 pinctrl driver
>
> :::::: TO: Phil Edworthy <phil.edworthy@renesas.com>
> :::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
