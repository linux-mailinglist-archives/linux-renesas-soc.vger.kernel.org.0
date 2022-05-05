Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D487751B825
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 08:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245089AbiEEGqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 02:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245025AbiEEGqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 02:46:17 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6845947078;
        Wed,  4 May 2022 23:42:38 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id kd11so2411853qvb.2;
        Wed, 04 May 2022 23:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0IAbCehNYbIHhmQ4kdeHcWQuYR867QDRJfFQzpk1J/E=;
        b=4CgFc0XDVIY/0maaPm2IMBKzoRx5LbFA75GQ9tvn5E9RHbKXyDqTdrqTYRmVNQen4L
         6W1hlJRMiXoYOMaSOUGbx58JWHhbeKj2If1zDSjmvm8XVmSTcQfivgWP13GVg4N9xq0/
         34C2LxjJlW+E2AZsKvPzk2dP5nLljtnsHcuonwrdftYQ/4V3DG8sKgM6+W2ZhPYfnsjr
         bLzCyLw5bouUW/bm0XzVZKgIHNWxPMtbbDPIKA9eCGra0u4fd4f1wbGc7OQxQyszsvsg
         ms5gPBB+EGrcZZSMJ8thIBqaAT7FdYOPg2dzEWw/0dRG/w6k5Ap/7sMC8X6MUkzpERCn
         8Jkg==
X-Gm-Message-State: AOAM530k5dO9IgiZ7g4N5VGkiKreTIX69Cmj6nYZIFsJPZA+vA8SD7w7
        T83r/D0KbbUK9ZUsFeeKD5nznPRjPvLgAw==
X-Google-Smtp-Source: ABdhPJxx1ngvDF+fNxMgKjJclcSTqBg6aEV6zxwvIjzPb06D2yx1IglrkRLDjfRpNQ0vH2CnEj4Vyw==
X-Received: by 2002:ad4:5be1:0:b0:440:a2ec:ea99 with SMTP id k1-20020ad45be1000000b00440a2ecea99mr20279454qvc.20.1651732957454;
        Wed, 04 May 2022 23:42:37 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id q21-20020a05620a0c9500b006a0098f029fsm399847qki.13.2022.05.04.23.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 23:42:36 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso38437857b3.5;
        Wed, 04 May 2022 23:42:36 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr23276012ywb.358.1651732956506; Wed, 04
 May 2022 23:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com> <YnEqH+gzlfv96opc@lakrids> <YnL/IbciNHLhoNOZ@robh.at.kernel.org>
In-Reply-To: <YnL/IbciNHLhoNOZ@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 08:42:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9ngzgkOUT-Y-CEkpMaJr1RSDqPhjYy7Czh6TRWQZu3Q@mail.gmail.com>
Message-ID: <CAMuHMdX9ngzgkOUT-Y-CEkpMaJr1RSDqPhjYy7Czh6TRWQZu3Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer: Add optional
 clock and reset
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Rob,

On Thu, May 5, 2022 at 12:33 AM Rob Herring <robh@kernel.org> wrote:
> On Tue, May 03, 2022 at 02:11:59PM +0100, Mark Rutland wrote:
> > This is the only patch from this series that I've received, and judging
> > by the CC list this hasn't gone to either LKML or LAKML, so I'm missing
> > the surrounding context for this.
> >
> > Looking on lore, this is part of:
> >
> >   https://lore.kernel.org/linux-devicetree/20220503115557.53370-1-phil.edworthy@renesas.com/T/#t
> >
> > ... which is adding support for an arm64 SoC.
> >
> > On Tue, May 03, 2022 at 12:55:49PM +0100, Phil Edworthy wrote:
> > > Some SoCs use a gated clock for the timer and the means to reset the timer.
> > > Hence add these as optional.
> >
> > The clock feeding the architected timer is supposed to be in an
> > always-on clock domain, and is supopsed to be enabled before running any
> > Normal World software.
> >
> > The arm64 kernel *requires* that this is enabled prior to entry. If the
> > kernel ever has to touch either the clock or reset, then there are
> > phases where the counter will not function correctly, which is simply
> > broken.
> >
> > Given that, I do not think this should be in the DT, and instead the
> > clock should be marked as critical in the provider node (and the reset
> > should never be touched).
>
> That is not yet an accepted DT property, but is currently on the list
> for review[1]. If that's something people need, chime in. More than 1
> person needing something is always better.

I am aware of[1]. AFAIU, that is meant for clocks that need to stay
enabled for external reasons (external hardware driven by on-SoC
clock).
For internal reasons (e.g. arch-timer), CLK_IS_CRITICAL is fine.

> [1] https://lore.kernel.org/all/20220428110107.149524-1-marex@denx.de/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
