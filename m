Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237B3519A4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343856AbiEDIso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235435AbiEDIsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:43 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF0C24BC8;
        Wed,  4 May 2022 01:45:08 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id z126so491511qkb.2;
        Wed, 04 May 2022 01:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDlaK/9dQIE6XlOv9lehKN4d8WP1wuQ+mUnBUFUoFlQ=;
        b=BcYUO7GIM379gK/m/LKn+XqeOcGlFRy8NcVkose+gQDz7StfgCaRoJI3K5XGvaAGrD
         LSm4xgnGfDyze72e7t3Vy5FL0WzxfWETCym8AiWRGagQqM768Jrb1CI2/6/Rm+EiGzhe
         gHXadQE6yRxvs5BI1JM9HlAI8zE6BdJdMDaKHBCVakvzuUBKcExvPcHpgeoz8km6BW3y
         VoETHdtpfwNhxE+/C7t5jDHHklkv/J+vXECrmldAlb7Bjn87YzEXzu0opzlof8e7gYxT
         kMTzpnBLuY18mrDJkbV1R+I0RyodY5VhijzPYMbMSZMLFP9uiqIq8fd68v6Ibf76EGn0
         kL1A==
X-Gm-Message-State: AOAM532RlLSfKsh2Ws9HbaYzAx33SQWJJ8DJnpg7giCpIvtDOIFK6Was
        30n4ChR+P1OsJsUDJhoWSagYMeex0w8uYA==
X-Google-Smtp-Source: ABdhPJw3oRIgKxdDVt35xIUhs/weNRkRnbu7GWvsCS8HtBRnYnqp4KiEEdKQ4MoNYSUrQXJke0/lMA==
X-Received: by 2002:a05:620a:240c:b0:6a0:e65:952e with SMTP id d12-20020a05620a240c00b006a00e65952emr3070512qkn.412.1651653906986;
        Wed, 04 May 2022 01:45:06 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m190-20020a3758c7000000b0069fe7f77e4bsm4490843qkb.33.2022.05.04.01.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:45:06 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7c57ee6feso8002657b3.2;
        Wed, 04 May 2022 01:45:06 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr18450011ywg.316.1651653905847; Wed, 04
 May 2022 01:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-11-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-11-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO7+7Kt72_0ZzNPKXijok0L87=5OZ7HiTf1Ea7Jtu77A@mail.gmail.com>
Message-ID: <CAMuHMdXO7+7Kt72_0ZzNPKXijok0L87=5OZ7HiTf1Ea7Jtu77A@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] clk: renesas: Add RZ/V2M support using the rzg2l driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/V2M SoC is very similar to RZ/G2L, though it doesn't have
> any CLK_MON registers.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Replace DEF_MUX2 with DEF_MUX
>  - Add URT_PCLK, it depends on CLK_SEL_E

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
