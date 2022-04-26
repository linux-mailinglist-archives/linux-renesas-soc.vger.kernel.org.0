Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E4751020C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 17:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345462AbiDZPku (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 11:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbiDZPkt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 11:40:49 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5908139B8D;
        Tue, 26 Apr 2022 08:37:41 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id f22so12895079qtp.13;
        Tue, 26 Apr 2022 08:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEt8P7eOKBR9M1XuSzWJ53KBmD5NL2u25LqPO0CMA6g=;
        b=mPt+M7xLb26EONf9WOqIwhLoDDaBOIMrgV80m4zfCOOvSls9QhOIdGL1g0bcrVv9G6
         cMyuQkMsDt8mBhxH1swKXZqP1AiIFIvA8J/lT1VbAbB57rbvoL9WyA3eNbgbu6dm+Xwk
         IJwFgoeHVntKEgO9YvkIsw+SElUlAruz7OON7i9r9kSwvt2y1mifEk4EUaJ5W5NdvEB8
         8zGxpT4hg9UnsnqVwu/XJXg6KNCR44ww3Y7fJHVlichfZe8Kh6X3dD1jtvhjBIfY2h8H
         Dtjsdc5w5bfJIHFU6N444QHWifGQ3H/oYC01G/OM+ei2ZCT+U67AK/01FioGXuuLvqrt
         0UWg==
X-Gm-Message-State: AOAM530JDk/sjBjSCGfA74DDGBwyZZrrRMMUkOK5N25BzUq9gjdPdI7p
        TGd7UU8OYxrdDzkMr7cF1rsW+whdcJBGjw==
X-Google-Smtp-Source: ABdhPJyHeBIBl0W7ju6lMuGrk+rVSQbacs6rlXaWTWlydy+Muj9ldWY0RuRRJ16ko7ZrLSbYJQaq3w==
X-Received: by 2002:ac8:5913:0:b0:2f1:f114:6b44 with SMTP id 19-20020ac85913000000b002f1f1146b44mr15871190qty.403.1650987460279;
        Tue, 26 Apr 2022 08:37:40 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id d77-20020a379b50000000b0069f6b324e8asm2269635qke.80.2022.04.26.08.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:37:40 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ebf4b91212so186681797b3.8;
        Tue, 26 Apr 2022 08:37:39 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr10223492ywf.256.1650987459637; Tue, 26
 Apr 2022 08:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-10-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-10-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 17:37:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSRx5XxS0a0OkJd+tiyXmXGxprQkwgWDT9FODLz5=msw@mail.gmail.com>
Message-ID: <CAMuHMdXSRx5XxS0a0OkJd+tiyXmXGxprQkwgWDT9FODLz5=msw@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] clk: renesas: rzg2l: Add support for RZ/V2M
 reset monitor reg
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The RZ/V2M doesn't have a matching set of reset monitor regs for each reset
> reg like the RZ/G2L. Instead, it has a single CPG_RST_MON reg which has a
> single bit per module.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -748,8 +748,12 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
>         const struct rzg2l_cpg_info *info = priv->info;
>         unsigned int reg = info->resets[id].off;
>         u32 bitmask = BIT(info->resets[id].bit);
> +       u32 monbitmask = BIT(info->resets[id].monbit);

BIT(-1) is not defined...

>
> -       return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
> +       if (info->has_clk_mon_regs)
> +               return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
> +       else
> +               return !!(readl(priv->base + CPG_RST_MON) & monbitmask);

... hence the above may behave badly when the reset has no bit in
CPG_RST_MON (69 resets do not have a bit in CPG_RST_MON).

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -18,6 +18,7 @@
>  #define CPG_PL3_SSEL           (0x408)
>  #define CPG_PL6_SSEL           (0x414)
>  #define CPG_PL6_ETH_SSEL       (0x418)
> +#define CPG_RST_MON            (0x680)
>
>  #define CPG_CLKSTATUS_SELSDHI0_STS     BIT(28)
>  #define CPG_CLKSTATUS_SELSDHI1_STS     BIT(29)
> @@ -151,17 +152,22 @@ struct rzg2l_mod_clk {
>   *
>   * @off: register offset
>   * @bit: reset bit
> + * @monbit: monitor bit in CPG_RST_MON register, -1 if none
>   */
>  struct rzg2l_reset {
>         u16 off;
>         u8 bit;
> +       s8 monbit;
>  };
>
> -#define DEF_RST(_id, _off, _bit)       \
> +#define DEF_RST_MON(_id, _off, _bit, _monbit)  \
>         [_id] = { \
>                 .off = (_off), \
> -               .bit = (_bit) \
> +               .bit = (_bit), \
> +               .monbit = (_monbit) \
>         }
> +#define DEF_RST(_id, _off, _bit)       \
> +       DEF_RST_MON(_id, _off, _bit, -1)
>
>  /**
>   * struct rzg2l_cpg_info - SoC-specific CPG Description

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
