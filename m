Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB5E518685
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 16:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbiECO0W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 10:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbiECO0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 10:26:22 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1282CE0F;
        Tue,  3 May 2022 07:22:49 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id t11so13476807qto.11;
        Tue, 03 May 2022 07:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3t6SRW/DjuDAlbfHDheZgdCnYyoKNEk8ORQglJBIxaM=;
        b=61iJRRCwP2Zxr1bmTANdq0PWM7wirPKq3Q0VKIvLBce/HdspMlzso9Q5J84kkWVrhO
         FDW2Ltwp1NcJIuyO9fvK844EPqcKKie3hr3w4ed2905RjFqI5TD3l786vkZaYguf2OWG
         G6tVEWAUU3VpUtwgFf+Bkbgcf6W8nYVHa1f0n1ai3Bio1U984Z/QmlaoxWagYOIZ2Mln
         COOaN1UlJMv0D8+omUmErlPZUT6Rk4H8FXRbF53G8HVnMHS2zxshONKy3Eq1r5uUgvM2
         SreJcQbnumM1oUxwAeYSFVJmsgrS+5EFuy4rQDnTwG09NJYU/7g2ylWOrTrlv2vm9/ce
         aqsg==
X-Gm-Message-State: AOAM531bPSzteXZtZk0xMJwlgHScvfI/AgYpRuPYP39uYVZekfhlwBBT
        nLqMJL4nPhLik3MkzK+LpDqrEIz/WDiYAA==
X-Google-Smtp-Source: ABdhPJzr8STgTUcOAvo0wR7Yr1A8UCuRUgJOCFym0UGApXLBtqMaaLNhgQmuh/T7u32cZTCGDgvV+w==
X-Received: by 2002:ac8:5a4a:0:b0:2f3:9ddf:2cdd with SMTP id o10-20020ac85a4a000000b002f39ddf2cddmr12749377qta.112.1651587768291;
        Tue, 03 May 2022 07:22:48 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 184-20020a3704c1000000b0069fc13ce1f5sm6022653qke.38.2022.05.03.07.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 07:22:47 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id m128so31341315ybm.5;
        Tue, 03 May 2022 07:22:47 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr14945254ybb.36.1651587767157; Tue, 03
 May 2022 07:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com> <6fb57bcc87e091d6e88217d2b82af9da@kernel.org>
In-Reply-To: <6fb57bcc87e091d6e88217d2b82af9da@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 16:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4j=Uaz5fAODFrPud0i40TdHUo6bYq0YpdnUzWaM3-Og@mail.gmail.com>
Message-ID: <CAMuHMdU4j=Uaz5fAODFrPud0i40TdHUo6bYq0YpdnUzWaM3-Og@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer: Add optional
 clock and reset
To:     Marc Zyngier <maz@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Tue, May 3, 2022 at 3:12 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2022-05-03 12:55, Phil Edworthy wrote:
> > Some SoCs use a gated clock for the timer and the means to reset the
> > timer.
> > Hence add these as optional.
>
> The architecture is crystal clear on the subject: the counter
> is in an always-on domain. Why should this be visible to SW?
> Also, reseting the counter breaks the guaranteed monotonicity
> we rely on.

The DT bindings do state:

  always-on:
    type: boolean
    description: If present, the timer is powered through an always-on power
      domain, therefore it never loses context.

and (surprisingly?) the absence of this property seems to be the
norm...

And:

  arm,no-tick-in-suspend:
    type: boolean
    description: The main counter does not tick when the system is in
      low-power system suspend on some SoCs. This behavior does not match the
      Architecture Reference Manual's specification that the system
counter "must
      be implemented in an always-on power domain."

So there's already precedent for clocks that can be disabled.

> Worse case, this belongs to the boot firmware, not the kernel,
> and I don't think this should be described in the DT.

"DT describes hardware, not software policy"?

> > --- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> > +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> > @@ -64,6 +64,13 @@ properties:
> >        CNTFRQ on all CPUs to a uniform correct value. Use of this
> > property is
> >        strongly discouraged; fix your firmware unless absolutely
> > impossible.
> >
> > +  clocks:
> > +    description: Optional clock for the timer.
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> >    always-on:
> >      type: boolean
> >      description: If present, the timer is powered through an always-on
> > power

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
