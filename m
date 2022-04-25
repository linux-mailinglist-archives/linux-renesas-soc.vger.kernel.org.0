Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF0F50E39E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 16:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242312AbiDYOv2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 10:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242577AbiDYOv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 10:51:28 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F62632A;
        Mon, 25 Apr 2022 07:48:23 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id a5so11941847qvx.1;
        Mon, 25 Apr 2022 07:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cL0OzkNmMd5lpyFR5webtZzlGdlaWuUfSR3/9hEqF7I=;
        b=8IM9zz9VXxwC36KrWQEJVO1mmMFGFWXJatARaiol2UK6SgwvbfjN6KjlMzWUbULY2Q
         HMHkNETPPCJLWoeVxGSEgotuDwtGOFtaU5BQhK2XLEDMPi1dNrOBnHJnBPqNCPLOQ923
         8u0zZN9I0aTxsm8ecjdEaZosQvK+hcpQaJbXL6mSi+3wAS+YJq7CfzxHLYLbokvrzv0c
         D47DILsp35FXGipaQY080gDIl9DUns3KxbwEyfABEa2F5qPiQYK2NwtxymyTljq2q6b5
         2+P1lJo6dLSWgnnnAnpU64s0Xu51dqyzzrd5vgWwwaCtJfcU3EG59OOw18xDKD8ABycX
         tRWw==
X-Gm-Message-State: AOAM532/tHyqySBPJCyaSHHX7ZcRaNT44iGkAq0bQZukk7aa1gr3bVAW
        nfBfrIq1LlM76F8EPLnvdnAj06hcTwBPtA==
X-Google-Smtp-Source: ABdhPJyInjIprmN64xQeb1ZT/+ed3Tf6MxM52HFKMG1nZPLQfZwLheBMhcPZJkjBeuI2wQPNbnm6Ig==
X-Received: by 2002:a05:6214:3006:b0:443:cf1e:58d7 with SMTP id ke6-20020a056214300600b00443cf1e58d7mr13157159qvb.53.1650898102894;
        Mon, 25 Apr 2022 07:48:22 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b4-20020a05622a020400b002f36ff97ae5sm615927qtx.70.2022.04.25.07.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 07:48:22 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f7d19cac0bso44036167b3.13;
        Mon, 25 Apr 2022 07:48:22 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr17463670ywc.512.1650898102106; Mon, 25
 Apr 2022 07:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 16:48:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbr9vzSHxxT1CU_Oi0pTQyAuR3Qk5Cfwg0f4Hm8LcW8Q@mail.gmail.com>
Message-ID: <CAMuHMdUbr9vzSHxxT1CU_Oi0pTQyAuR3Qk5Cfwg0f4Hm8LcW8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Apr 25, 2022 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car V4H (r8a779g0) has PLL4 so that add CLK_TYPE_GEN4_PLL4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -253,11 +253,11 @@ static const unsigned int r8a779a0_crit_mod_clks[] __initconst = {
>  #define CPG_PLL_CONFIG_INDEX(md)       ((((md) & BIT(14)) >> 13) | \
>                                          (((md) & BIT(13)) >> 13))
>  static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] = {
> -       /* EXTAL div    PLL1 mult/div   PLL2 mult/div   PLL3 mult/div   PLL5 mult/div   PLL6 mult/div   OSC prediv */
> -       { 1,            128,    1,      0,      0,      0,      0,      192,    1,      0,      0,      16,     },
> -       { 1,            106,    1,      0,      0,      0,      0,      160,    1,      0,      0,      19,     },
> -       { 0,            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      },
> -       { 2,            128,    1,      0,      0,      0,      0,      192,    1,      0,      0,      32,     },
> +       /* EXTAL div    PLL1 mult/div   PLL2 mult/div   PLL3 mult/div   PLL4 mult/div   PLL5 mult/div   PLL6 mult/div   OSC prediv */
> +       { 1,            128,    1,      0,      0,      0,      0,      144,    1,      192,    1,      0,      0,      16,     },
> +       { 1,            106,    1,      0,      0,      0,      0,      120,    1,      160,    1,      0,      0,      19,     },
> +       { 0,            0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      0,      },
> +       { 2,            128,    1,      0,      0,      0,      0,      128,    1,      192,    1,      0,      0,      32,     },

                                                                          144?

With that fixed (I can fix that while applying)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
