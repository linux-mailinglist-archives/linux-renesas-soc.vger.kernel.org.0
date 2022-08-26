Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0145A23A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Aug 2022 11:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244907AbiHZJBB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 05:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiHZJBA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 05:01:00 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D0FC9E80
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:00:59 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id i7so630266qka.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vStLU6ylcO0CUlL7w3tNToPYk3L5BJozPUaRjUBdO+8=;
        b=QFY4YmzsVW7cEIoWEhzoPhjVQgVjcsDWAvTFit/PEZLO4o8rvR0flt+fvW9mIMTego
         xQXbY9y8iwjvOBHHxx6XIgCTcPyhUTaEkFAjE/PIyH4NZjz/rryVPYyFJa3TI6pUigzU
         saNHKFtZgT2gb7bB+NWjP/zasxCIFltrJsUwp3jsFGxchMoWasXOmNA7VstRaXKkXQin
         8F3c39CYEhtsCDmlXNF/IydQW5rQP1FH/ftYAd2o57g4rC35GBmj3jMj1RmwjCsnP2Ow
         mS81cCWwy7WjsFSB8vSbO1WbVisgBoy9a/RICRsXtbzoZn1cF2VLOboSxcjNXAr+KEaI
         EIsw==
X-Gm-Message-State: ACgBeo0N0wC06CM0MmMDCevnrZ9TOCorrK/q1pgbMgl+lkJRaqql/66I
        15zIByvY1pH6c9u9NpYSQiXLLSERgVvmxg==
X-Google-Smtp-Source: AA6agR6UszLEODPWVbo84ed+PMngf69CiJkuUR4qmb5G2USxyr/nSffyvR7BIXwdsKNcleoXivziow==
X-Received: by 2002:a05:620a:488a:b0:6be:58b2:d30a with SMTP id ea10-20020a05620a488a00b006be58b2d30amr704480qkb.732.1661504458045;
        Fri, 26 Aug 2022 02:00:58 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id c6-20020a05622a058600b00343681ee2e2sm940581qtb.35.2022.08.26.02.00.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:00:57 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-33dce2d4bc8so20359857b3.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:00:57 -0700 (PDT)
X-Received: by 2002:a05:690c:830:b0:33d:794b:e66c with SMTP id
 by16-20020a05690c083000b0033d794be66cmr7559068ywb.502.1661504457481; Fri, 26
 Aug 2022 02:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com> <20220824103515.54931-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220824103515.54931-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 11:00:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnV3JTtGSTRObSn7qNkyZVUS9743swg3wk+DdPvwk9vg@mail.gmail.com>
Message-ID: <CAMuHMdXnV3JTtGSTRObSn7qNkyZVUS9743swg3wk+DdPvwk9vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r8a779f0: Add MSIOF clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Wolfram,

On Wed, Aug 24, 2022 at 12:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> ---
> For V3U, we also used "msiX" as clock names, so I followed that. I
> wonder, though, if we shouldn't keep using "msiofX" and rename V3U as
> well?

I think we should use "msiofX" for R-Car S4, as that's what's used
in the documentation.  I can fix that while applying.
On R-Car V3U we used "msiX", to follow the documentation.

> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -131,6 +131,10 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
>         DEF_MOD("i2c3",         521,    R8A779F0_CLK_S0D6_PER),
>         DEF_MOD("i2c4",         522,    R8A779F0_CLK_S0D6_PER),
>         DEF_MOD("i2c5",         523,    R8A779F0_CLK_S0D6_PER),
> +       DEF_MOD("msi0",         618,    R8A779F0_CLK_MSO),
> +       DEF_MOD("msi1",         619,    R8A779F0_CLK_MSO),
> +       DEF_MOD("msi2",         620,    R8A779F0_CLK_MSO),
> +       DEF_MOD("msi3",         621,    R8A779F0_CLK_MSO),
>         DEF_MOD("pcie0",        624,    R8A779F0_CLK_S0D2),
>         DEF_MOD("pcie1",        625,    R8A779F0_CLK_S0D2),
>         DEF_MOD("scif0",        702,    R8A779F0_CLK_S0D12_PER),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.1, with the clock names fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
