Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76FF6EE76F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 20:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjDYSPK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 14:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbjDYSPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 14:15:06 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB03A3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 11:15:04 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-54fb9384c2dso72227267b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 11:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682446503; x=1685038503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89TnOb+8J19nGch/gfQeLXk1qLE4HzVciatlcIx2XME=;
        b=LZuHX3jjTC5w/vxq2KznqPphx+baTNhZTLaS2d7JAte7zj9S+9wVPxzNkst/BykyGm
         vKkiW7aM32o3U/DTjqQ5zqxqSuGgwbaaakYWVCemUZkl+tk/5CEhM7eYGwanlrKr9syy
         rVz04FZK8UvWCr9Jr5FMjHbm7LbIDYbFxkWhO+pswmkPhMAs0LR3BFJ7NxiN1upA1OQi
         B+yFSTWoMHnODkmhFqIWaQPBgRktsvhp+tQxBC4raFUK5OvRJwMTmeOEyvXApuQS7VJI
         g8az/21UprLyyosG0p1Xce1vVoHc7PqLOnvN7qAZFQVz+ZWU3vnsWf6T+MxU/SqaHY1G
         o/PA==
X-Gm-Message-State: AAQBX9fIL4MOdyT2/mZkmnJ+JF71tGfOM9gy+bouSKbAIConYS1FBzcR
        ISARIEKsuAaq8hGdAQ0W3cfqYF5Itf8v5w==
X-Google-Smtp-Source: AKy350bZbX316KtVhMOM7WTqF8007jzdmNIbFiFwUOd/0aMaAVxN8Pup05YikVoZN2xb7oMo9lysug==
X-Received: by 2002:a81:49ce:0:b0:54c:14d3:dcfa with SMTP id w197-20020a8149ce000000b0054c14d3dcfamr11164953ywa.41.1682446503444;
        Tue, 25 Apr 2023 11:15:03 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id n207-20020a0dcbd8000000b00555df877a4csm3672162ywd.102.2023.04.25.11.15.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 11:15:03 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54f99770f86so72177877b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 11:15:02 -0700 (PDT)
X-Received: by 2002:a0d:dc46:0:b0:54f:ddb9:95e7 with SMTP id
 f67-20020a0ddc46000000b0054fddb995e7mr10480804ywe.34.1682446502684; Tue, 25
 Apr 2023 11:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <202304260234.QTHOuoZG-lkp@intel.com>
In-Reply-To: <202304260234.QTHOuoZG-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Apr 2023 20:14:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJqFxtxYvGN9oDXm3H6s6qeVFVAiCm8-my=w0QLB_KLg@mail.gmail.com>
Message-ID: <CAMuHMdWJqFxtxYvGN9oDXm3H6s6qeVFVAiCm8-my=w0QLB_KLg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:master 32/48] drivers/dma/dw-edma/dw-edma-core.c:231:13:
 error: redefinition of 'dw_edma_device_caps'
To:     kernel test robot <lkp@intel.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 25, 2023 at 8:10 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
> head:   109f3e0b7f96d5fdf923b8002a68961774c25a6e
> commit: 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c [32/48] Merge remote-tracking branch 'pci/next' into renesas-drivers
> config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230426/202304260234.QTHOuoZG-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
>         git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>         git fetch --no-tags geert-renesas-drivers master
>         git checkout 96f65c7bbf0f2e3f2913180b739a926d3b3ddc9c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/dma/dw-edma/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304260234.QTHOuoZG-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/dma/dw-edma/dw-edma-core.c:231:13: error: redefinition of 'dw_edma_device_caps'
>      231 | static void dw_edma_device_caps(struct dma_chan *dchan,
>          |             ^~~~~~~~~~~~~~~~~~~
>    drivers/dma/dw-edma/dw-edma-core.c:213:13: note: previous definition of 'dw_edma_device_caps' with type 'void(struct dma_chan *, struct dma_slave_caps *)'
>      213 | static void dw_edma_device_caps(struct dma_chan *dchan,
>          |             ^~~~~~~~~~~~~~~~~~~
>    drivers/dma/dw-edma/dw-edma-core.c:213:13: warning: 'dw_edma_device_caps' defined but not used [-Wunused-function]

Thanks, looks like a borked merge conflict on my side.

> vim +/dw_edma_device_caps +231 drivers/dma/dw-edma/dw-edma-core.c
>
> 3883d64449ffe8 Serge Semin 2023-01-13  230
> 6f94141d8662ff Serge Semin 2023-01-13 @231  static void dw_edma_device_caps(struct dma_chan *dchan,
> 6f94141d8662ff Serge Semin 2023-01-13  232                              struct dma_slave_caps *caps)
> 6f94141d8662ff Serge Semin 2023-01-13  233  {
> 6f94141d8662ff Serge Semin 2023-01-13  234      struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> 6f94141d8662ff Serge Semin 2023-01-13  235
> 6f94141d8662ff Serge Semin 2023-01-13  236      if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
> 6f94141d8662ff Serge Semin 2023-01-13  237              if (chan->dir == EDMA_DIR_READ)
> 6f94141d8662ff Serge Semin 2023-01-13  238                      caps->directions = BIT(DMA_DEV_TO_MEM);
> 6f94141d8662ff Serge Semin 2023-01-13  239              else
> 6f94141d8662ff Serge Semin 2023-01-13  240                      caps->directions = BIT(DMA_MEM_TO_DEV);
> 6f94141d8662ff Serge Semin 2023-01-13  241      } else {
> 6f94141d8662ff Serge Semin 2023-01-13  242              if (chan->dir == EDMA_DIR_WRITE)
> 6f94141d8662ff Serge Semin 2023-01-13  243                      caps->directions = BIT(DMA_DEV_TO_MEM);
> 6f94141d8662ff Serge Semin 2023-01-13  244              else
> 6f94141d8662ff Serge Semin 2023-01-13  245                      caps->directions = BIT(DMA_MEM_TO_DEV);
> 6f94141d8662ff Serge Semin 2023-01-13  246      }
> 6f94141d8662ff Serge Semin 2023-01-13  247  }
> 6f94141d8662ff Serge Semin 2023-01-13  248

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
