Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82225A2703
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 13:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiHZLqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 07:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiHZLqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 07:46:09 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75349B275F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:46:07 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id n21so883644qkk.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/vTdNR1ckxaDy/SgrjjRgSVbJqPa155ZjPayGyKNAYM=;
        b=8AZknLjkJt7Ktobi1ETI6Uy74uOKoPRfzrp568HDmErNaf/vzlQ1psF9rad7WxBDxI
         ALJhIl8nTnebFGvt7+tohwXn9xnTBQqyEV/m+NGfrii6Kqw9fhIxVTTEumyHC+nrgG4c
         MtvVgKHWP34No7mGh/I5I5RDpZ1O2HBZDAPffUSHotVCa9Z/8TQIdVnHq2fzHMq/mwrU
         K4MHBx7at6OJPqbqjCiK4WbOrCjfLO8i72kygFDjTIxA3PuOv66LW32pEMY6nFt1v6Wb
         nQ1gHrq8dgv5ioANncv3rcL3sv1G880mJREi0F+ZqRVAfqytem5eDu/Xcibm3T/7QC6B
         v1aQ==
X-Gm-Message-State: ACgBeo3VUNxcHBktLaGVOpYOpsoMpiTCG7RuALVDxqt/1K5MDmpY83fa
        H2I2AgqGuBF/bVsmGO6hsVyZksZTFT2l1g==
X-Google-Smtp-Source: AA6agR5cwm6V6zQNzG4kdPnWsDPy5ObuWZxXN5hWXo8nQkG3QWwjz9xcSS/Hr4lVgYzfzyxxoXJ4Lw==
X-Received: by 2002:a05:620a:4094:b0:6bb:8514:9c84 with SMTP id f20-20020a05620a409400b006bb85149c84mr6065791qko.134.1661514366465;
        Fri, 26 Aug 2022 04:46:06 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id t20-20020a37ea14000000b006b872b606b1sm1535538qkj.128.2022.08.26.04.46.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:46:06 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-33dc345ad78so29509997b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 04:46:05 -0700 (PDT)
X-Received: by 2002:a25:778d:0:b0:696:4bb6:9aaa with SMTP id
 s135-20020a25778d000000b006964bb69aaamr4884214ybc.380.1661514365745; Fri, 26
 Aug 2022 04:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com> <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 13:45:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
Message-ID: <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: add r8a77980a.dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
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

Hi Morimoto-san,

On Tue, Aug 23, 2022 at 3:26 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds r8a77980A V3H2 (= r8a77980 ES2) basic SoC
> support. It is using r8a77980 (= V3H) setting as-is for now.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the R-Car V3H2 (R8A77980A) SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +#include "r8a77980.dtsi"

Please override the root compatible value to
"renesas,r8a77980a", "renesas,r8a77980", to match the bindings.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
