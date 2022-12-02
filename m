Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0C46403FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 11:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiLBKDb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 05:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbiLBKDI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 05:03:08 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3050E12AA1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 02:03:08 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id y15so4412432qtv.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2022 02:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmvG4ci+YmGJgWu9knNC0FP74yWJtjeGJbUzQcUGFO4=;
        b=xIZMFQ0MleH1pk9c69s2d0eQB8OsZQA6r52+z48A/GBDDcjizuMbkWc++tsjR1hBIC
         8q94nGERVIcthacF4Q/zTJKspkRLnT72ksPBIzsQMyhMUkOwaXm5yFv1FrCPgfUiqUxj
         J9+kjf1dwf6ehQctX4fiaMiE5b4g3jsXrscJwPy6EOJHVLdF95RGUCzwxMlqdZV9yXhd
         1e9wUyQh2cKC9dXWAvLinlCbYLpT9O8A/VTn5O7Ia/WCLYIrTl4MDaFK4NDu645bfJPY
         4iL+0kM5/mRS6CTJrjlz1vznPZMU0G8/XF55A2CpA+JCH96wPivEOeXPEOdvd3jZwldE
         VNng==
X-Gm-Message-State: ANoB5plsJ5EZjpS0gpy4BDOz0fZRsVcX14me3oqQubhxQFReqFsnqr2Q
        3vPQ7yDEmvPBRuZrcfW9/Vpz3w3eiYYIxA==
X-Google-Smtp-Source: AA0mqf5J8d1SYBD+Pzz3oqHLeVRBSoGP6pYrP21n4Nc2bINFSPTOAehxQYDuz1WGQvCGfQK7KB63RQ==
X-Received: by 2002:ae9:ebc8:0:b0:6fc:a8af:9241 with SMTP id b191-20020ae9ebc8000000b006fca8af9241mr5018805qkg.723.1669975387026;
        Fri, 02 Dec 2022 02:03:07 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id y26-20020a37f61a000000b006fc62eabcc9sm4851676qkj.134.2022.12.02.02.03.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:03:06 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3b10392c064so44058597b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2022 02:03:05 -0800 (PST)
X-Received: by 2002:a0d:dd4b:0:b0:370:61f5:b19e with SMTP id
 g72-20020a0ddd4b000000b0037061f5b19emr1188032ywe.316.1669975385365; Fri, 02
 Dec 2022 02:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20221122184854.1820126-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122184854.1820126-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 11:02:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSM7kjXHvPyTFtjyo0oUm-Kr30_i891kaNMgG3KEcokA@mail.gmail.com>
Message-ID: <CAMuHMdVSM7kjXHvPyTFtjyo0oUm-Kr30_i891kaNMgG3KEcokA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 7:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable MIPI DSI driver support for Renesas RZ/G2L based platforms.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  binding and driver patch is already in linux-next[1] and [2]
>  [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221122&id=b1a90f510230afa9483e38fccbf9e4274c92aa8c
>  [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221122&id=7a043f978ed1433bddb088a732e9bb91501ebd76

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
