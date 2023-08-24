Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE6A786C54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 11:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240743AbjHXJwn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 05:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240730AbjHXJwM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:52:12 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91B810FE;
        Thu, 24 Aug 2023 02:52:10 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5925e580f12so16029307b3.3;
        Thu, 24 Aug 2023 02:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692870730; x=1693475530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDuexcPZUqv8UAEKhi2IQMob9YTR6PYlVc2uGP+fxmc=;
        b=Tzn6J5NAjjb30WyvCQLaH9v2CeIQTBFNmlJUnfsUzp+dF+hE9hmHA4stMIWrtFTZgq
         tX8RLiATW8jNwkOmfYsqTm7krbNKoX9bYWpuA1vl0KQCCwWJv8sZBGzGGLtiwrgGexIV
         16jphXJOEayNIrSv5O1MKY2fe9irz0denhLrVH9eEhq1NTlNogAw594BTOBeWPZU4THO
         YHg10qsHk5vMjr33Hvq4g5bNGObtwMegImQtnVll/EApxiC0z4F/D0i/pF5xPQE1mcWX
         Z8c9ERSeBFbIxOTSJwlg5oTr35DcR9aTRvrEZ3SVf90/Gre2v5UFD7mRrwlcykRJzPIO
         EOMw==
X-Gm-Message-State: AOJu0YwYWV/ONy4Mvsgv9Bw21iPZazinxUz8uyu2KLnmfbJu3eKJyyqD
        PHkbFYGbetTe0gkEEgRX4Y5kcRtD32wdBA==
X-Google-Smtp-Source: AGHT+IEqjaSN6Lf3+dPIsbwlJTBpzpTb5GqAMnaVnVhv+EIG5+nq39Axtd2mts2CeKnD+RtA3u9bVA==
X-Received: by 2002:a81:7709:0:b0:580:bd0d:809f with SMTP id s9-20020a817709000000b00580bd0d809fmr15500404ywc.18.1692870729911;
        Thu, 24 Aug 2023 02:52:09 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id l123-20020a815781000000b005928fe005e3sm15705ywb.25.2023.08.24.02.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 02:52:09 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so2055539276.2;
        Thu, 24 Aug 2023 02:52:09 -0700 (PDT)
X-Received: by 2002:a5b:749:0:b0:d1a:c21:3bcf with SMTP id s9-20020a5b0749000000b00d1a0c213bcfmr15966178ybq.55.1692870729354;
 Thu, 24 Aug 2023 02:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-4-biju.das.jz@bp.renesas.com> <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
 <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com> <OS0PR01MB5922F2A5E303B9E194B829F0861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F2A5E303B9E194B829F0861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Aug 2023 11:51:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU52bhZf3AcpYZ-yRRaKCftpUaE8BeZYPXJO30+nLfc7Q@mail.gmail.com>
Message-ID: <CAMuHMdU52bhZf3AcpYZ-yRRaKCftpUaE8BeZYPXJO30+nLfc7Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
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

On Thu, Aug 24, 2023 at 11:48 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
> > On Thu, Aug 24, 2023 at 11:20 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v4 3/4] clk: vc3: Fix output clock mapping On
> > > > Thu, Aug 24, 2023 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > According to Table 3. ("Output Source") in the 5P35023 datasheet,
> > > > > the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
> > > > > 4=DIFF1, 5=DIFF2. But the code uses inverse. Fix this mapping issue.
> > > > >
> > > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > This order should be documented in the DT bindings, too.
> > >
> > > Ok, will update the mapping in bindings like below.
> > >
> > > +  assigned-clocks:
> > > +    items:
> > > +      - description: Link clock generator.
> > > +      - description: Output clock index. The index is mapped to the
> > clock
> > > +          output in the hardware manual as follows
> > > +          0 - REF, 1 - SE1, 2 - SE2, 3 - SE3, 4 - DIFF1, 5 - DIFF2.
> > > +
> >
> > There is no need to document assigned-clocks.
> > The clock indices documentation belongs to the #clock-cells property.
>
> OK, I will update the main description as below
>
> --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> @@ -25,6 +25,9 @@ description: |
>    boots. Any configuration not supported by the common clock framework
>    must be done via the full register map, including optimized settings.
>
> +  The index in the assigned-clocks is mapped to the output clock as below
> +  0 - REF, 1 - SE1, 2 - SE2, 3 - SE3, 4 - DIFF1, 5 - DIFF2.
> +
>    Link to datasheet:

Please add this to the #clocks-cells property instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
