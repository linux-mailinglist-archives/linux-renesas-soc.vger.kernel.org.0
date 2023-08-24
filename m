Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9707786C27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 11:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240709AbjHXJig convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 05:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240698AbjHXJi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:38:27 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EB3137;
        Thu, 24 Aug 2023 02:38:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59231a1ca9eso37285617b3.1;
        Thu, 24 Aug 2023 02:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692869905; x=1693474705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czd9LPmy9l7wodF5tZGmVKRwfzgYx/8IGBu/nzRM3uE=;
        b=iU1bCi64+5P1Hfm1f1bxVoUb7iHJHB6bFB6oZ9C2QF8i++6WRfBeyqHiGy0ONJAYGD
         PawR77lyZV34FENelqBxtUaHJazHcTMBF1vHzyzUH1mdH3WBtjgydNqIil7jHslOufKj
         X6zWFF+zkotopYzerz+JiOCMH6Ks7Y2VxChQulRU7+iiMBnLEfoc8+mFeZDxrcNZN9WR
         SahsmWsOvD1Bs6GWyGkbGXlNQADOSMuF2YMhCLBH/2L6iDOt220OW8ffK9RVPhZHRLKr
         Adkqor04Z10rhdEf1z9LDMO+PKSzKUghhx4O1ceZcJmqvABonV47y9x8wILEzatDvPq2
         026Q==
X-Gm-Message-State: AOJu0YzzpdkdEZKss+1ZRawDnjUI/PsJkY3QEWpCdwL0w6t+ugGZTTmw
        +pfI2SjpzFLedc8X8NQ6N5I+KggPB8JWFA==
X-Google-Smtp-Source: AGHT+IEIwFAFRcXOagm8KvsIWwMk9YQF3HrNmzoLgHfnco8PhOvsI1+IWgqgFz2ElzjjUpAwDW2i0A==
X-Received: by 2002:a81:8a46:0:b0:583:af0a:267 with SMTP id a67-20020a818a46000000b00583af0a0267mr14520553ywg.5.1692869905236;
        Thu, 24 Aug 2023 02:38:25 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id w12-20020a0dd40c000000b005463e45458bsm3852589ywd.123.2023.08.24.02.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 02:38:25 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7484cfdc11so4561291276.1;
        Thu, 24 Aug 2023 02:38:25 -0700 (PDT)
X-Received: by 2002:a25:8707:0:b0:d3c:58ef:ef7b with SMTP id
 a7-20020a258707000000b00d3c58efef7bmr13585914ybl.6.1692869904843; Thu, 24 Aug
 2023 02:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-4-biju.das.jz@bp.renesas.com> <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
 <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Aug 2023 11:38:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com>
Message-ID: <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

On Thu, Aug 24, 2023 at 11:20 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
> > On Thu, Aug 24, 2023 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > According to Table 3. ("Output Source") in the 5P35023 datasheet, the
> > > output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3, 4=DIFF1,
> > > 5=DIFF2. But the code uses inverse. Fix this mapping issue.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This order should be documented in the DT bindings, too.
>
> Ok, will update the mapping in bindings like below.
>
> +  assigned-clocks:
> +    items:
> +      - description: Link clock generator.
> +      - description: Output clock index. The index is mapped to the clock
> +          output in the hardware manual as follows
> +          0 - REF, 1 - SE1, 2 - SE2, 3 - SE3, 4 - DIFF1, 5 - DIFF2.
> +

There is no need to document assigned-clocks.
The clock indices documentation belongs to the #clock-cells property.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
