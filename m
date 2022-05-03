Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F447518768
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbiECO7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 10:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbiECO7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 10:59:18 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F017338BD;
        Tue,  3 May 2022 07:55:45 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5361F12FC;
        Tue,  3 May 2022 07:55:45 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F33AD3F5A1;
        Tue,  3 May 2022 07:55:43 -0700 (PDT)
Date:   Tue, 3 May 2022 15:55:41 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer: Add
 optional clock and reset
Message-ID: <YnFCbe4ULoRRft4u@lakrids>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com>
 <6fb57bcc87e091d6e88217d2b82af9da@kernel.org>
 <CAMuHMdU4j=Uaz5fAODFrPud0i40TdHUo6bYq0YpdnUzWaM3-Og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4j=Uaz5fAODFrPud0i40TdHUo6bYq0YpdnUzWaM3-Og@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, May 03, 2022 at 04:22:35PM +0200, Geert Uytterhoeven wrote:
> On Tue, May 3, 2022 at 3:12 PM Marc Zyngier <maz@kernel.org> wrote:
> > On 2022-05-03 12:55, Phil Edworthy wrote:
> > > Some SoCs use a gated clock for the timer and the means to reset the
> > > timer.
> > > Hence add these as optional.
> >
> > The architecture is crystal clear on the subject: the counter
> > is in an always-on domain. Why should this be visible to SW?
> > Also, reseting the counter breaks the guaranteed monotonicity
> > we rely on.
> 
> The DT bindings do state:
> 
>   always-on:
>     type: boolean
>     description: If present, the timer is powered through an always-on power
>       domain, therefore it never loses context.
> 
> and (surprisingly?) the absence of this property seems to be the
> norm...

That's the *timer* (i.e. the comparator logic within each CPU which
fires an interrupt), not the *counter* (i.e. the incrementing value fed
by a clock). What this is trying to say is whether that can be relied
upon to cause a wakeup while the CPU is in a low-power state, or whether
it cannot (and hence SW needs to use another timer for the wakeup).

It's legitimate for each timer to not be in an always-on power domain
because it is part of each CPU, whereas the counter is global to the
system.

We can clear up the wording here since it's apparently confusing.

> And:
> 
>   arm,no-tick-in-suspend:
>     type: boolean
>     description: The main counter does not tick when the system is in
>       low-power system suspend on some SoCs. This behavior does not match the
>       Architecture Reference Manual's specification that the system
> counter "must
>       be implemented in an always-on power domain."

This is admittedly a workaround for an integration bug, but it's quite
different and only affects the time jump that can be observed when going
into suspend an exiting from it. Whenever software is running the
counter is incrementing.

> So there's already precedent for clocks that can be disabled.

There's precedent for the clock being disabled in a specific deep sleep
state, not when SW is actively running.

> > Worse case, this belongs to the boot firmware, not the kernel,
> > and I don't think this should be described in the DT.
> 
> "DT describes hardware, not software policy"?

It's still describing the HW. There's plenty of other always-on stuff
that we don't describe because for all intents and purposes it is always
on.

Note that this being always-on isn't just a Linux thing; that affects
plenty of other SW which may run and it's an *architectural property*
that's apparently being violated.

Thanks,
Mark.
