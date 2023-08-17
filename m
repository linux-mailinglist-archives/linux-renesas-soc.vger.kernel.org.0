Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF5C77F3E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 11:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349820AbjHQJwR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 05:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349824AbjHQJvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 05:51:54 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EAFE2;
        Thu, 17 Aug 2023 02:51:53 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d62ae3fc7f1so5891103276.2;
        Thu, 17 Aug 2023 02:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692265912; x=1692870712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WumbdbZdI/i/U69afb4TgCATtlfqt+YnPkHuYRFRk8I=;
        b=J0DB70CKgVvPZ/XCgUJYfDfwBgCMWrIh76/j5n7wyE41qDXwcUXwtSpZ6W7b1jComr
         CdWLzVzVGiwZC/2JgO13e5xybyz0KN8irpnoTaHJ08J/ue4/yxuLYFfN7oWeKbPF3rSF
         ngHH0adNg1A2cS6iGkv/aGoNIF6vU7hVjdG7A0TVxd6Xqp9tOv1lQ6q+9PeLzMDqrpp/
         wJaS6Uc5Lu403bEUSXSBN/wHiHAEf/GZ44KZUIPdRFrQMYcx6Ui1uGW7ZweNvZjtjgZD
         TqiqavvdgcidTfV2zXlfgUcCfFNoD0loJFeSKqZVhzbO11GfrqbRqRvNdWgJ485q+lqg
         ahMw==
X-Gm-Message-State: AOJu0Yzxo4GnBueIS+xsRJlGawRmkERZFY5TVSaI8gL/FqDUjNrd2nSy
        ckNFS6kAbbVpFknG+9vCw3gs9islB60l4A==
X-Google-Smtp-Source: AGHT+IFCpQd+LUhgqG8J00IJs9hVCttbnkBQsGyEivEhATHFvI9jOevje2ZYq3uldpF4wBPhF0r4AA==
X-Received: by 2002:a25:9286:0:b0:d1c:7549:4e8b with SMTP id y6-20020a259286000000b00d1c75494e8bmr3618095ybl.29.1692265912259;
        Thu, 17 Aug 2023 02:51:52 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id k188-20020a2524c5000000b00d59ac349fe0sm3898752ybk.25.2023.08.17.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 02:51:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso5899534276.1;
        Thu, 17 Aug 2023 02:51:51 -0700 (PDT)
X-Received: by 2002:a5b:90e:0:b0:d06:d1ae:dcf2 with SMTP id
 a14-20020a5b090e000000b00d06d1aedcf2mr3924693ybq.13.1692265911433; Thu, 17
 Aug 2023 02:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com> <20230817090810.203900-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230817090810.203900-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 11:51:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUv5Wfgj5CNit4WMK+hRZc2QPkPzSSnL2306Us_SoZmRg@mail.gmail.com>
Message-ID: <CAMuHMdUv5Wfgj5CNit4WMK+hRZc2QPkPzSSnL2306Us_SoZmRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: vc3: Fix output clock mapping
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Aug 17, 2023 at 11:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> According to Table 3. ("Output Source") in the 5P35023 datasheet,
> the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
> 4=DIFF1, 5=DIFF2. But the code uses inverse. Fix this mapping issue.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One suggestion for future improvement (which can be a separate patch)
below...

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -119,20 +119,20 @@ enum vc3_div {
>  };
>
>  enum vc3_clk_mux {
> -       VC3_DIFF2_MUX,
> -       VC3_DIFF1_MUX,
> -       VC3_SE3_MUX,
> -       VC3_SE2_MUX,
>         VC3_SE1_MUX,
> +       VC3_SE2_MUX,
> +       VC3_SE3_MUX,
> +       VC3_DIFF1_MUX,
> +       VC3_DIFF2_MUX,
>  };
>
>  enum vc3_clk {
> -       VC3_DIFF2,
> -       VC3_DIFF1,
> -       VC3_SE3,
> -       VC3_SE2,
> -       VC3_SE1,
>         VC3_REF,
> +       VC3_SE1,
> +       VC3_SE2,
> +       VC3_SE3,
> +       VC3_DIFF1,
> +       VC3_DIFF2,
>  };
>
>  struct vc3_clk_data {

> @@ -1110,7 +1110,7 @@ static int vc3_probe(struct i2c_client *client)
>                                 name, 0, CLK_SET_RATE_PARENT, 1, 1);
>                 else
>                         clk_out[i] = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> -                               name, &clk_mux[i].hw, CLK_SET_RATE_PARENT, 1, 1);
> +                               name, &clk_mux[i - 1].hw, CLK_SET_RATE_PARENT, 1, 1);

This is (and was before) fragile, as it implies a strict relation between
the vc3_clk_mux and vc3_clk enum values.  To avoid accidental
breakage, I think it would be wise to make this explicit, e.g.

    enum vc3_clk_mux {
            VC3_SE1_MUX = VC3_SE1 - 1,
            VC3_SE2_MUX = VC3_SE2 - 1,
            [...]
    };

>
>                 if (IS_ERR(clk_out[i]))
>                         return PTR_ERR(clk_out[i]);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
