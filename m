Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2297694C4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjBMQTW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjBMQTF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:19:05 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914F51E2A2;
        Mon, 13 Feb 2023 08:19:00 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id h24so14367987qtr.0;
        Mon, 13 Feb 2023 08:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWx8ZwfXpULN6D+/6e9VXzLYc5EL57Ok1IH7lc8/M6Q=;
        b=LpgDd7yLgxxzttTl6HmB3anNl3CIvepC9Naq0lL4Utg/FtOspBToU5XW7Mh+gGNL7R
         +BBGimaFyBgaUDGJ6ALsrfJb17zR+nobxSSBKun9MEsCN0QdxxD0X4/jQy+yjWe8Lem+
         6uYkCL4XwEdSLtogIZjJyaP5YCRFvGCE0OJ6uhG9eis88i7UJIyoy6gMUhG6/KVjzfqy
         NgML1Pccb/fJpjhUvaAu736Z6nEdpgKbYiYx8rFlUTVb8gTTjIdjJyz4xDs1Rl1FxK2c
         Pyia5Cw9j1kXq3OhlGWOeAdMiuKKeT/v/GH2mCDq8gcY8HLRSCs2Q8lB4AtCQWsrcjou
         qQeg==
X-Gm-Message-State: AO0yUKV798lKKGYGEua+QENXbc7ZuG9VHiPsfeF9sUkMf4bn6X+qe/g8
        a6TMAS0f9RzqrdjFZAI1f2AtVG5RJezUfQ==
X-Google-Smtp-Source: AK7set9D1mdUEBoWInIMKd25+ooxPr9z3PpK3JwaMa0T1IKwPwkX38NXjcnNfHCACLnJ3R9dglUxdQ==
X-Received: by 2002:ac8:5aca:0:b0:3b8:2ea9:a08d with SMTP id d10-20020ac85aca000000b003b82ea9a08dmr47518108qtd.52.1676305139473;
        Mon, 13 Feb 2023 08:18:59 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id x21-20020ac87a95000000b003b869f71eedsm9382138qtr.66.2023.02.13.08.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:18:59 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id x4so15041265ybp.1;
        Mon, 13 Feb 2023 08:18:59 -0800 (PST)
X-Received: by 2002:a25:9348:0:b0:8ba:81cd:a7b7 with SMTP id
 g8-20020a259348000000b008ba81cda7b7mr1482738ybo.270.1676305139081; Mon, 13
 Feb 2023 08:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se> <20230211143655.3809756-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211143655.3809756-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 17:18:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU71MMWt5nvS+h8n_6TYs-EBDMQYn=oqj428F+VMkEOQQ@mail.gmail.com>
Message-ID: <CAMuHMdU71MMWt5nvS+h8n_6TYs-EBDMQYn=oqj428F+VMkEOQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779g0: Add CSI-2 clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 3:37 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the CSI core clock and the CSI40 and CSI41 module clocks, which are
> used by the CSI-2 Interfaces on the Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -146,6 +146,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
>         DEF_FIXED("vcbus",      R8A779G0_CLK_VCBUS,     CLK_VC,         1, 1),
>         DEF_FIXED("vcbusd2",    R8A779G0_CLK_VCBUSD2,   CLK_VC,         2, 1),
>         DEF_DIV6P1("canfd",     R8A779G0_CLK_CANFD,     CLK_PLL5_DIV4,  0x878),
> +       DEF_DIV6P1("csi",       R8A779G0_CLK_CSI,       CLK_PLL5_DIV4,  0x880),
>         DEF_FIXED("dsiref",     R8A779G0_CLK_DSIREF,    CLK_PLL5_DIV4,  48, 1),
>         DEF_DIV6P1("dsiext",    R8A779G0_CLK_DSIEXT,    CLK_PLL5_DIV4,  0x884),
>
> @@ -164,7 +165,9 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>         DEF_MOD("avb0",         211,    R8A779G0_CLK_S0D4_HSC),
>         DEF_MOD("avb1",         212,    R8A779G0_CLK_S0D4_HSC),
>         DEF_MOD("avb2",         213,    R8A779G0_CLK_S0D4_HSC),
> +       DEF_MOD("csi40",        331,    R8A779G0_CLK_CSI),

I will move this one one line down while applying, to preserve sort order.

>         DEF_MOD("canfd0",       328,    R8A779G0_CLK_SASYNCPERD2),
> +       DEF_MOD("csi41",        400,    R8A779G0_CLK_CSI),
>         DEF_MOD("dis0",         411,    R8A779G0_CLK_VIOBUSD2),
>         DEF_MOD("dsitxlink0",   415,    R8A779G0_CLK_VIOBUSD2),
>         DEF_MOD("dsitxlink1",   416,    R8A779G0_CLK_VIOBUSD2),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
