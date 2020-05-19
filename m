Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C588C1D97EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgESNiS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgESNiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:38:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A8CC08C5C0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:38:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so13769809ljj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uAKZAwd0Bsu5eMrKgCGYzypp282aFndHsMyiyLkrN6U=;
        b=i1O08/bxxOIrq419RAam2H5dwyFSgdcXiVSWk/U9KA3KeR3RWo8ArMEwsE8E3RWSYe
         Nd9/wMHI6sKfImJVRIxqWMaH/J27XjwU6drh068zhHNWyw2vm2xpQ6PTymfvKYwLWGv2
         chtMjuj/0I0ek1LnDJpo4paJ4t4JrcMBhtFd1HDgVouQ7J1j+NK72ChYsO+ai/fNmQhi
         T1hMIS1C/Ad0kLQzK6GW57GzRmpc8W80CHkP5DrAHBW7wRe51TvZQw6OzOBTMCxWC5Ik
         8q5GVlxdufQ2S4U8p9aO5ZKPbfNi8aQiiGXVEYhVClV1yHipzINJiyMsCgK2j/2BGCb8
         QFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uAKZAwd0Bsu5eMrKgCGYzypp282aFndHsMyiyLkrN6U=;
        b=iwHRz4hRD/lHKWX/hSKMRrw8D8Pxb8LVenAB6x/zVpnVzwt2qhDWz4251xVVZ0T3Lj
         BX8kMVTd4j5EsOH6IkUENdy/gN9gAuwABnMQ7LaF3CeMcN2d4E6Co+YPz0yUXYWuj5P5
         bu3Rqk6xPWhBktPxep1ebPmRF0a9FzSkRstbsSQjBBicDKOAIrZeAb6nGFlHORoKMv2B
         Ej+Q5pGWJOv5ld78kLBEMUt1vP8IpiVcKSOuZve+1gmlFKdaosBqQAFgd/sF8VGpHefo
         aBDhlsZFfLQlssuWuE1THJj+CKgUxu6DuvpHPAnAFuMrudnTdIRIXPA6uCG8Umq+KReL
         cphw==
X-Gm-Message-State: AOAM531eDT8Ozbvnu8cPtTvZiV/Hh3NREknr/YHS2aiBecrZAQMVjHHT
        vVZyo7jLos3F4rgJf676ZCQjtQ==
X-Google-Smtp-Source: ABdhPJz1M+HZa6KTbp/Wm84AK/1i26pnGh8Q1KoAtFwzKht/E1RMhyzFVXiOnhMnaUCobafo0iBHiQ==
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr13906902ljm.129.1589895495703;
        Tue, 19 May 2020 06:38:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w14sm4834468lfe.65.2020.05.19.06.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:38:15 -0700 (PDT)
Date:   Tue, 19 May 2020 15:38:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Add renesas,em-gio bindings
Message-ID: <20200519133814.GE470768@oden.dyn.berto.se>
References: <20200519081157.29095-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200519081157.29095-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2020-05-19 10:11:57 +0200, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile General
> Purpose I/O Interface.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/gpio/renesas,em-gio.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> new file mode 100644
> index 0000000000000000..8bdef812c87c3771
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/renesas,em-gio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas EMMA Mobile General Purpose I/O Interface
> +
> +maintainers:
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: renesas,em-gio
> +
> +  reg:
> +    items:
> +      - description: First set of contiguous registers
> +      - description: Second set of contiguous registers
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt for the first set of 16 GPIO ports
> +      - description: Interrupt for the second set of 16 GPIO ports
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +  - ngpios
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio0: gpio@e0050000 {
> +            compatible = "renesas,em-gio";
> +            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
> +            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&pfc 0 0 32>;
> +            ngpios = <32>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
