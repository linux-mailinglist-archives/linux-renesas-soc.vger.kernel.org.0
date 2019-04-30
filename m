Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA051FC17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 17:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfD3PDI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 11:03:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:33086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbfD3PDI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 11:03:08 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E46072173E;
        Tue, 30 Apr 2019 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556636587;
        bh=8MpnfmbxbWON+YaQJhPpIxR+u+gi4GYsXY//k2+p4jk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j5aHZ1SGuXp2YjXyEJ74IOk5NLAO2taCwCmaV3hmKnRHPi3ch84NkoCHNZgA8anZY
         Tx84mxFlpdbdOHeHRIY0A6pIy8jeGPo889AVNL0126rEoLQMIyNecOsgiytnvEHIBR
         Bg2vJyJ8JdsyDbYcNSwfbF42g9/i2tN7Yfx4pc6Y=
Received: by mail-qt1-f171.google.com with SMTP id e2so15750156qtb.4;
        Tue, 30 Apr 2019 08:03:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXyhhFg8sttnalh1ibSTR+VcDII/1/IH7l/qXAghmOSM5mRfns8
        /Tdz2VQ4qgcC4TVwp9bt3u+a2d2uvGaxxtnVfQ==
X-Google-Smtp-Source: APXvYqylk98wBAwLu1LD8MCtWw20sYmJ/f29BlQrMHENBok32t1FLmdUTxXI1XStyAjsNRySLw4QDnVWsWVC1SCXmfM=
X-Received: by 2002:ac8:641:: with SMTP id e1mr17661759qth.76.1556636586095;
 Tue, 30 Apr 2019 08:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190430121254.3737-1-geert+renesas@glider.be> <20190430121254.3737-2-geert+renesas@glider.be>
In-Reply-To: <20190430121254.3737-2-geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 30 Apr 2019 10:02:54 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
Message-ID: <CAL_Jsq+KwOLqd=ZqT-bdM5mp8jfPHu=XingBb6kBsUqHvO=m+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 30, 2019 at 7:13 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add "renesas,gic-spi-base",
>   - Document RZ/A2M.
> ---
>  .../renesas,rza1-irqc.txt                     | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> new file mode 100644
> index 0000000000000000..ea8ddb6955338ccd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
> @@ -0,0 +1,30 @@
> +DT bindings for the Renesas RZ/A1 Interrupt Controller
> +
> +The RZ/A1 Interrupt Controller is a front-end for the GIC found on Renesas
> +RZ/A1 and RZ/A2 SoCs:
> +  - IRQ sense select for 8 external interrupts, 1:1-mapped to 8 GIC SPI
> +    interrupts,
> +  - NMI edge select.
> +
> +Required properties:
> +  - compatible: Must be "renesas,<soctype>-irqc", and "renesas,rza1-irqc" as
> +               fallback.
> +               Examples with soctypes are:
> +                 - "renesas,r7s72100-irqc" (RZ/A1H)
> +                 - "renesas,r7s9210-irqc" (RZ/A2M)
> +  - #interrupt-cells: Must be 2 (an interrupt index and flags, as defined
> +                                in interrupts.txt in this directory)
> +  - interrupt-controller: Marks the device as an interrupt controller
> +  - reg: Base address and length of the memory resource used by the interrupt
> +         controller
> +  - renesas,gic-spi-base: Lowest GIC SPI interrupt number this block maps to.

Why isn't this just an 'interrupts' property? Plus, without
'interrupts' walking the hierarchy is broken.

Rob
