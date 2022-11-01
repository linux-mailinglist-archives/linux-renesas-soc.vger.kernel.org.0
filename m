Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAD5B61461E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 10:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiKAJBa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 05:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiKAJB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 05:01:29 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5870060D8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 02:01:28 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id v8so2643643qkg.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s482LsQY+Gn+Y9KAbhZLUP8g0j734KkAzf28xOFQ7eo=;
        b=0CkUwYReq1uvFDjTrpAjTkxS94kblCG98ny21+w0VyRA0GZKR3963I40UkaTgILU7M
         sIZbWMETzdUaYEtVstS+UgLsWRJo16wQdTwLc0CYyMwpvD0zQbJAKBAj9I0gdm6gw23g
         mtx/fNZ916lGO/waRgTszu/0pdFfmABUXsZ34Askk3/jIHIUmOjY6F/+vvZHIpAF/B5V
         APdPUAyV7y6VbZDBjzN3GKuV4V/toctC50BXHm5txZdn+0moETzIeaAQtTu/9pWBOcKt
         TYKwzjcWBMU3JK9fL95A4hWJ59zVf3oPxOl1AdpB7prGcaPVr2wzWJllfepGwBJot1EP
         dAnw==
X-Gm-Message-State: ACrzQf3SAHAsE14toQfQ6dl6ewPqK2CheG8THyd312MPcBCn/XBZsMr+
        xHD5OrrtYKc8/udoD6MCzrcPt5kfrWn6tg==
X-Google-Smtp-Source: AMsMyM6itvw0PbLJZTQoq4LxSif7q0w+b13FBNBXjmPYiU7Pt/fYGdVpg9jFKH7AETiecyr/D1uLCQ==
X-Received: by 2002:a05:620a:2a02:b0:6ee:7de4:9690 with SMTP id o2-20020a05620a2a0200b006ee7de49690mr12204017qkp.172.1667293287340;
        Tue, 01 Nov 2022 02:01:27 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a280b00b006f8665f483fsm6214131qkp.85.2022.11.01.02.01.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 02:01:27 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id g127so8033322ybg.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 02:01:26 -0700 (PDT)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr348405ybs.380.1667293286625; Tue, 01 Nov
 2022 02:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <166696261979.30092.16225355597116936447.git-patchwork-summary@kernel.org>
In-Reply-To: <166696261979.30092.16225355597116936447.git-patchwork-summary@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Nov 2022 10:01:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+wSEGhf7PXQS2v-_hRFQP_53xH06jqtK84BU9m-+ykA@mail.gmail.com>
Message-ID: <CAMuHMdV+wSEGhf7PXQS2v-_hRFQP_53xH06jqtK84BU9m-+ykA@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To:     patchwork-bot+linux-renesas-soc@kernel.org,
        helpdesk <helpdesk@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi pwbot,

A few more false-positives...

On Fri, Oct 28, 2022 at 3:23 PM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "mainlined", because they were applied to
> geert/renesas-devel.git (master):

[...]

> Series: Rename DTB overlay source files
>   Submitter: Andrew Davis <afd@ti.com>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688359
>   Lore link: https://lore.kernel.org/r/20221024173434.32518-1-afd@ti.com
>     Patches: [v2,1/7] kbuild: Allow DTB overlays to built from .dtso named source files

This patch was not applied to geert/renesas-devel.git.
It is still marked "New" in patchwork.
It was applied by Rob Herring as commit 363547d2191cbc32 ("kbuild: Allow
DTB overlays to built from .dtso named source files") in robh/for-next,
and next-20221027 and later.

>              [v2,4/7] arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso
>              [v2,5/7] arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso
>              [v2,6/7] arm64: dts: xilinx: Rename DTB overlay source files from .dts to .dtso

These three patches were not applied to geert/renesas-devel.git.
They are marked "Mainlined" in patchwork.
They are not applied by anyone else (AFAIK), and are not part of linux-next.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
