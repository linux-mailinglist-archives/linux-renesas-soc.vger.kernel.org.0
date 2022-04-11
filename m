Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A094FBCE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Apr 2022 15:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242303AbiDKNUT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 09:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbiDKNUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 09:20:19 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F89663DB;
        Mon, 11 Apr 2022 06:18:05 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id z16so108693qtq.6;
        Mon, 11 Apr 2022 06:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N85Ltb4dSElob5Ezod8QzoL213chnUy+d96qLkKSdI0=;
        b=Ortahv86nUYvoNGmE5qdxNYU3qkMa/jJpyn3UOzQDEWInWfJ1aF9Xjzr/Kx3i/tofj
         f7H83F8VOzlO22oUFRu5fqK6ebThI+ibx7ScdzRQ5npG1tQwuF5HhNvEoV6TNxrVF01g
         EN51ZJs+GFzrTac/d/nnO1VU4nAPUn2eedcizz4a9XEPf9gH1H0QM8pqJuZn4vAqa1Fz
         opU6z8QXWRh2QrYtk22LPsVMAafihhsU58SgSbrIrg2UK1IJjpBwx1g+cc/1t+UYjgHc
         FBXGGPH3lEb1TCiYi5qlB1UlX1yLJYX0h+IMwSkgdDm/TIoBBBJ2T6m96BXbWYHA/rri
         S+Wg==
X-Gm-Message-State: AOAM533Td3/iRR6ri5aC912IY/On4946SodleljSIm/PRxIhWnCb3Ylx
        GfE1lGtjXDcX9pvqYo+5LgLr0UPGCsv4tg==
X-Google-Smtp-Source: ABdhPJwOTwI88zY83lbMnE0OIuQVjy5aA1VZ8zrw1VSC61pxFJrBChwR60FtfxLAc6mtez/OU1Ip2Q==
X-Received: by 2002:a05:622a:1703:b0:2e1:c663:27aa with SMTP id h3-20020a05622a170300b002e1c66327aamr25513003qtk.112.1649683083958;
        Mon, 11 Apr 2022 06:18:03 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id m14-20020a05622a054e00b002e2072cffe6sm25264121qtx.5.2022.04.11.06.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:18:03 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id v77so9309500ybi.12;
        Mon, 11 Apr 2022 06:18:03 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr21366725ybp.613.1649683083175; Mon, 11
 Apr 2022 06:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <a938b938f00939b9206d7fbaba78e2ef09915f5f.1649681891.git.geert+renesas@glider.be>
In-Reply-To: <a938b938f00939b9206d7fbaba78e2ef09915f5f.1649681891.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 15:17:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBA8BieQv-bWUZ4_Wnqdi-71KwbiBy472gbz=YC_R5bA@mail.gmail.com>
Message-ID: <CAMuHMdWBA8BieQv-bWUZ4_Wnqdi-71KwbiBy472gbz=YC_R5bA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Move RPC core clocks
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Mon, Apr 11, 2022 at 2:59 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The RPC and RPCD2 core clocks were added to the sections for internal
> core clocks, while they are core clock outputs, visible from DT.
>
> Move them to the correct sections.
> Rename the ".rpc" clock on R-Car S4 to "rpc".
> Fixup nearby whitespace to increase uniformity.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, to be queued in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
