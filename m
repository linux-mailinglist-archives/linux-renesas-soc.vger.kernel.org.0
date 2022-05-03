Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E443518532
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 15:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235942AbiECNPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 09:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235350AbiECNPi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 09:15:38 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B81642E69F;
        Tue,  3 May 2022 06:12:03 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CDDC1042;
        Tue,  3 May 2022 06:12:03 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ED253F774;
        Tue,  3 May 2022 06:12:01 -0700 (PDT)
Date:   Tue, 3 May 2022 14:11:59 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer:  Add
 optional clock and reset
Message-ID: <YnEqH+gzlfv96opc@lakrids>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503115557.53370-5-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

This is the only patch from this series that I've received, and judging
by the CC list this hasn't gone to either LKML or LAKML, so I'm missing
the surrounding context for this.

Looking on lore, this is part of:

  https://lore.kernel.org/linux-devicetree/20220503115557.53370-1-phil.edworthy@renesas.com/T/#t

... which is adding support for an arm64 SoC.

On Tue, May 03, 2022 at 12:55:49PM +0100, Phil Edworthy wrote:
> Some SoCs use a gated clock for the timer and the means to reset the timer.
> Hence add these as optional.

The clock feeding the architected timer is supposed to be in an
always-on clock domain, and is supopsed to be enabled before running any
Normal World software.

The arm64 kernel *requires* that this is enabled prior to entry. If the
kernel ever has to touch either the clock or reset, then there are
phases where the counter will not function correctly, which is simply
broken.

Given that, I do not think this should be in the DT, and instead the
clock should be marked as critical in the provider node (and the reset
should never be touched).

Thanks,
Mark.

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  .../devicetree/bindings/timer/arm,arch_timer.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> index df8ce87fd54b..20cd90fc7015 100644
> --- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> @@ -64,6 +64,13 @@ properties:
>        CNTFRQ on all CPUs to a uniform correct value. Use of this property is
>        strongly discouraged; fix your firmware unless absolutely impossible.
>  
> +  clocks:
> +    description: Optional clock for the timer.
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>    always-on:
>      type: boolean
>      description: If present, the timer is powered through an always-on power
> -- 
> 2.32.0
> 
