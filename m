Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328BE518538
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 15:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbiECNQE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 09:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235987AbiECNQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 09:16:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFC52E9E6;
        Tue,  3 May 2022 06:12:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12F55B81E9B;
        Tue,  3 May 2022 13:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12E1C385A4;
        Tue,  3 May 2022 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651583546;
        bh=txmKXAmvozjdaJyk40hAjzdwtqix3Zj1Pyotez8qHRg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jRCTyPvR0ox4bwhsRXbRroMuAGtHGCFuMCPhcvkaFGtZ7ZX1kDEMtupZolav65iNz
         N7oEzzTx04WYMJOMeFZhXil/pcYB/qfNwepv61qk6+UclnU9hFxk/uYrDkftBp/iow
         aOd6faEIpRSuoZLO8Lq3FwBe+7jYihEmQqfTXhS8A5Ftr1dJLzG9WHkSlb/m1d1LyP
         M/HSZYGikblkseknT9rkt0aB/C9DAhlDmNRi+azxMiJIwIgRgMeTyYFN4dPvGVomyh
         o4ETt93p0zoGXycqcbyvqz6ZiO1YXP5JOD8MlD/N9IC/qBIHBB4tZ2sPqSeG/SSxtZ
         bhaYWrEORkQ9g==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nlsKF-008eMJ-MM; Tue, 03 May 2022 14:12:23 +0100
MIME-Version: 1.0
Date:   Tue, 03 May 2022 14:12:23 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/12] dt-bindings: timer: arm,arch_timer:  Add
 optional clock and reset
In-Reply-To: <20220503115557.53370-5-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
 <20220503115557.53370-5-phil.edworthy@renesas.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6fb57bcc87e091d6e88217d2b82af9da@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: phil.edworthy@renesas.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, geert+renesas@glider.be, biju.das.jz@bp.renesas.com, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2022-05-03 12:55, Phil Edworthy wrote:
> Some SoCs use a gated clock for the timer and the means to reset the 
> timer.
> Hence add these as optional.

The architecture is crystal clear on the subject: the counter
is in an always-on domain. Why should this be visible to SW?
Also, reseting the counter breaks the guaranteed monotonicity
we rely on.

Worse case, this belongs to the boot firmware, not the kernel,
and I don't think this should be described in the DT.

         M.

> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  .../devicetree/bindings/timer/arm,arch_timer.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> index df8ce87fd54b..20cd90fc7015 100644
> --- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> @@ -64,6 +64,13 @@ properties:
>        CNTFRQ on all CPUs to a uniform correct value. Use of this 
> property is
>        strongly discouraged; fix your firmware unless absolutely 
> impossible.
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
>      description: If present, the timer is powered through an always-on 
> power

-- 
Jazz is not dead. It just smells funny...
