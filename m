Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E030F1D9794
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 15:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgESNYE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 09:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgESNYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:24:04 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894D5C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:24:03 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z22so11247983lfd.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=J1EagSeqT/3hRw9PlSOk/6Jo3bCIp/4AjuBFz8qTGQo=;
        b=P5GGg8FTAebv5YHBzDwy/NA+Pb0/hhk5tGhHN/6Zp35VJvAyb2VNannMq+B9Gky3rB
         TGTu+1BOjz8xRPMmJ3vlPBcFvlV192DO/UxajGeDKfgTD6bfKqBmegQbXLHAa6rINe05
         YbRFZ/AH4i+2GZ4rAOCYBsMpAFM0I5P4av+SdCVYUrhLolCa+j6qEAgbWHYLy9l0RW8O
         atIn2xCgeQS8U+6VO18HirD8WfWsMWgTaKABHicANTgapLgQDFzslokXMZ9qUBz7Gpvo
         e7c8FzuIQT1uiJkX24OxVb6YXu4ZP07P2CCI9GtIawRld5ALutKcxm8lVJrK6ZYUs085
         07IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J1EagSeqT/3hRw9PlSOk/6Jo3bCIp/4AjuBFz8qTGQo=;
        b=PJnlIGwi4WN2++OCebETiyZIobO0nIWsWgSly2k7Fm+xitVSH24CuST1uh6aqXjXrO
         z0Qklvmmx+7EO5WfX5adHoYXF6iuCsCY2H4XWRMC6e0Um7C2xqQ/PxMCMiYhMuVGAReD
         MZBA0tyhGgoGWwnWJ48uQ8YCnRFQJTHS0KF2g73Jhuu01jMa7DBQl8Lt7ZGDcIVdkJ1F
         3GqmyOA+uG9Z54Y/DwHZUgYEKEb55aKRGAwdKaNfxOgWI7C42mThYCA4L5uhCtd4KW1w
         SEc65FdRMgx4R5Wtm8r7Itr5A0R9ZKinyiFPi+lTCu51BOHVHjeuu1yO4XgLf0WFoOHU
         /w+Q==
X-Gm-Message-State: AOAM533FYksk795YoIp/Hwoe765htE+rUT7zNrMdR64vJL3D1wzyd9gQ
        ilb3UXZl2Tgyms8cCf7zRtaG4g==
X-Google-Smtp-Source: ABdhPJwHiLIqIrqU451dZhunm6Wgq2SvF8KYkSJemlDv966oh3Pe4JnO+at5+ht1brskAcIWPtJMLw==
X-Received: by 2002:a19:c751:: with SMTP id x78mr10756302lff.82.1589894641624;
        Tue, 19 May 2020 06:24:01 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y8sm7435855ljh.83.2020.05.19.06.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 06:24:00 -0700 (PDT)
Date:   Tue, 19 May 2020 15:24:00 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: Add renesas,em-uart bindings
Message-ID: <20200519132400.GC470768@oden.dyn.berto.se>
References: <20200519080945.28798-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200519080945.28798-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-05-19 10:09:45 +0200, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile UART
> Interface.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/serial/renesas,em-uart.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> new file mode 100644
> index 0000000000000000..82aefdb0d45e5f1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/serial/renesas,em-uart.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas EMMA Mobile UART Interface
> +
> +maintainers:
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +allOf:
> +  - $ref: serial.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,em-uart
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: sclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    uart0: serial@e1020000 {
> +            compatible = "renesas,em-uart";
> +            reg = <0xe1020000 0x38>;
> +            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&usia_u0_sclk>;
> +            clock-names = "sclk";
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
