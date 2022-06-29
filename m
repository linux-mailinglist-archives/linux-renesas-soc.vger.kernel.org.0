Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4505609C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbiF2Swp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbiF2Swb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:52:31 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1C51C939
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:52:30 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id f14so12841416qkm.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5UKm3+Et8OqHZy7MpIkkYAEAWMnJqoLySy1bjVmmsc=;
        b=AXvIZg/QkSVX2wayg1on2xPvJFZp/0IljSRAhlWJnaw2TXCN/bLUfMmRqck4eDB1WZ
         coazCIgKBcCMmcgsMGaSLeeXDQpJOXjSK8vk+zXJq+iCxvxjYuitdbQ/8obzF55ZYU+F
         SFAX10TZ3JDBduYNCvGMSdknUT0oyNaArcaj+z7QwmFL8bmqbJtEQkF6CEwM6O/E+YKQ
         57D4xgk25Y/pWmekdzL8iinygoU3RKEYGj9dp1GODH4JZQwT371RRKT6yJ90MprWGI9F
         OEKHb3wdC/Y08a//2+s2wVxWUsr5yZn7ykrXS+9P3SMrumh127IwjUQzymmn2WiBHcr2
         VjbA==
X-Gm-Message-State: AJIora+OgPd2wAM00dTUGc8AY/9iBu+e786F5vP2QaXYEfua2ETigkdi
        D9k6LAf6KuO4PjiZoLiMshx5hPblbQEfXQ==
X-Google-Smtp-Source: AGRyM1u6k46tUVNV9I1bjiuBHVlUVmHQpaBEBX3RspaEz7sqsuASHcEg1oDgYtuyGAQZwJer197eOg==
X-Received: by 2002:a37:a782:0:b0:6ae:e87b:5a23 with SMTP id q124-20020a37a782000000b006aee87b5a23mr3326417qke.0.1656528749180;
        Wed, 29 Jun 2022 11:52:29 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id l6-20020a37bb06000000b006a981a2c483sm13255440qkf.39.2022.06.29.11.52.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:52:28 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id p7so28161503ybm.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:52:28 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr4996065ybq.543.1656528748030; Wed, 29
 Jun 2022 11:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <202206300252.mQeUSfuW-lkp@intel.com>
In-Reply-To: <202206300252.mQeUSfuW-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 20:52:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ08qp9c5uG=A_G1kZo_ocw9zYR+8F7sOvJeQzmKyFLg@mail.gmail.com>
Message-ID: <CAMuHMdVJ08qp9c5uG=A_G1kZo_ocw9zYR+8F7sOvJeQzmKyFLg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-pinctrl-for-v5.20 5/5]
 drivers/pinctrl/renesas/pinctrl-rzv2m.c:37:33: error: implicit declaration of
 function 'FIELD_GET'
To:     kernel test robot <lkp@intel.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>, kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kernel Test Robot,

On Wed, Jun 29, 2022 at 8:38 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.20
> head:   1e18476c392f4491a93c29937c4d6a49c27661c8
> commit: 1e18476c392f4491a93c29937c4d6a49c27661c8 [5/5] pinctrl: renesas: Add RZ/V2M pin and gpio controller driver
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220630/202206300252.mQeUSfuW-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=1e18476c392f4491a93c29937c4d6a49c27661c8
>         git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>         git fetch --no-tags geert-renesas-drivers renesas-pinctrl-for-v5.20
>         git checkout 1e18476c392f4491a93c29937c4d6a49c27661c8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

Thanks for your report!

> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/renesas/pinctrl-rzv2m.c: In function 'rzv2m_dt_subnode_to_map':
> >> drivers/pinctrl/renesas/pinctrl-rzv2m.c:37:33: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]

Missing #include <linux/bitfield.h>.

Will amend to fix.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
