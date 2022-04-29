Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D77E51457A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356648AbiD2JhR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 05:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbiD2JhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 05:37:17 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB8EC614D;
        Fri, 29 Apr 2022 02:34:00 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id k12so4968976qvc.4;
        Fri, 29 Apr 2022 02:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vYycVsMAe0/HR0CEP7IprUoCw5GMN7bRQ0xQrk6Dj8=;
        b=uBaYC6i5ADFmJ4jdZbJpMvcYIJ1azLcpGtjKo6ZFWfb7gqwA9pfEp5EM1PleB+yuHp
         pxT3SknbswAyOormYIprwXkQ6cTmMJTr2VgE8E4BFF+RHQhR2PY/mSBfssLfAPtmpXIV
         zjmQE/u1nhUxG/L6GQhol4GrzpgSPlkWSwzuUHc0Ci/rT1oyBcT07ciJ9F0jwYi2/pen
         S/fziyQn0NftY+YHyZQGZFocztGwsG2znmF0cGAYFA1LbzopISSrQIl7zzBBGcaSaZfz
         IAO68A4sX1NJwT1t5axee7mdvslOqTxVC14DLUZOk9YO/ZuJhVjOm12ayBkeewkGghVy
         185g==
X-Gm-Message-State: AOAM533SSYie8cgKwOmuDUZ1iR87wP7tBotsx3QGQp+h1kyXTzwCu7Pn
        2vN3Cd2loedm4bP8DziaXNwnWi8nmTEkhEzl
X-Google-Smtp-Source: ABdhPJxllNtYW4BayefniBr8Nmm0Oq+dqQnraZfSajVFCJYa3UjDxB4WapKTE2QuyETI7slyogJoiQ==
X-Received: by 2002:a05:6214:2aaf:b0:446:70be:8377 with SMTP id js15-20020a0562142aaf00b0044670be8377mr27559922qvb.105.1651224838827;
        Fri, 29 Apr 2022 02:33:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id s18-20020a05622a1a9200b002f36470c4f1sm1404438qtc.56.2022.04.29.02.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 02:33:58 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2ef5380669cso79188657b3.9;
        Fri, 29 Apr 2022 02:33:58 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr37141026ywb.438.1651224838018; Fri, 29
 Apr 2022 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com> <20220427094823.3319-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220427094823.3319-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 11:33:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2iU06+3O6TZWZrC6-4v2TkfyYo6bXP8D5=Z9FK0F4Aw@mail.gmail.com>
Message-ID: <CAMuHMdW2iU06+3O6TZWZrC6-4v2TkfyYo6bXP8D5=Z9FK0F4Aw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Biju,

On Wed, Apr 27, 2022 at 11:48 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> PLL5 generates FOUTPOSTDIV clk and is sourced by LCDC/DSI modules.
> The FOUTPOSTDIV is connected to PLL5_4 MUX. Video clock is sourced
> from DSI divider which is connected to PLL5_4 MUX.
>
> This patch adds support for generating FOUTPOSTDIV clk.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1->V2:
>  * Added Rb tag from Geert
>  * Added Code comments related to clk handling
>  * Split struct rzg2l_pll5_param and added struct
>    rzg2l_pll5_mux_dsi_div_param for priv.
>  * Added {get_foutpostdiv_rate, get_vclk_rate} helper function
>  * used div_u64 to avoid overflow on 32 bit systems
>  * Added CPG_SIPLL5_STBY_DOWNSPREAD_WEN macro
>  * Added pl5_spread and updated CPG_SIPLL5_CLK5 setting.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h

> @@ -49,6 +65,8 @@
>  #define SEL_SDHI0      DDIV_PACK(CPG_PL2SDHI_DSEL, 0, 2)
>  #define SEL_SDHI1      DDIV_PACK(CPG_PL2SDHI_DSEL, 4, 2)
>
> +#define EXTAL_FREQ_IN_MEGA_HZ  (24)

Ideally, we'd obtain this from DT.  But given all RZ/G2L-alike SoCs
support only 24 MHz clock inputs, I guess this is OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
