Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC12228F28C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 14:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgJOMoD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 08:44:03 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43800 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgJOMoD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 08:44:03 -0400
Received: by mail-oi1-f193.google.com with SMTP id l85so2914879oih.10;
        Thu, 15 Oct 2020 05:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QjCSWT7tA5YUwjA+pLeB3xL2aqhlDUV3/tNCLk2jMMw=;
        b=f6fUe1cTcUWlRDk41Shwmm+cktj9ti64QiYFRPD1sePYgdxI1U9K5wq7wqW/wybd53
         cfkBDb4ilGvSv5X4WGntd4W85haCVjDS0oN248rA+Z5A9QAzMorIyKhGd/aiF361YjWg
         QcScNlATxiCLLhyC0fPQSqN8SlNcYnHZ2oADwTWwryMhH6rFE9q/bfQzcoEU71va5Isa
         LuPyWSlxjzlVHEqg5CAKhFeqSSuscShiitHFhsXw0bGxBXijJR+yO1/dHUj2XENFiMIC
         YrJN1LEbDx/7IzWTJirdmpDJC+1aXnvNb7jdCOOi5ZAsVuKxiIT4XOAqWETUBRwI/JER
         VJjA==
X-Gm-Message-State: AOAM533BIKn7nsMrTTEdijNlYh8AWiBcuuvYQ34cKAyaDOE5WMf2tAJv
        j1hZ0ltbUFluxQ7Wz9o8MOPxkkfLmAmBC1nlKfs=
X-Google-Smtp-Source: ABdhPJwnaCRQYCyL0eGrxY3aSifBwtEw2nvQzJKW2jaO2huhkge+b1CFNE7DXELCbeaYcpjBxCTaAssQ6T3RUcGuJ2E=
X-Received: by 2002:aca:c490:: with SMTP id u138mr2020084oif.54.1602765842489;
 Thu, 15 Oct 2020 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org> <20201014094443.11070-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20201014094443.11070-4-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 14:43:51 +0200
Message-ID: <CAMuHMdW_z3Rppv4LcMabbfZ9SLY+TxDjw7=13F2sWStMdEdaag@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a779a0: Add CSI-2 nodes
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Oct 14, 2020 at 11:40 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add CSI-2 nodes to R8A779A0 R-Car V3U SoC.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> The chip manual reports that the CSI-2 units are fed with S1D1 and S1D2
> clocks. The same applies to other SoCs, but none lists the two
> additional clocks in the DTS node. So I left them out here as well.

As these clocks are always-on, and as long as the driver does't
care about the actual clock rates, that is fine.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -105,6 +105,47 @@ scif0: serial@e6e60000 {
>                         status = "disabled";
>                 };
>
> +               csi40: csi2@feaa0000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfeaa0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 331>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 331>;
> +                       status = "disabled";

Missing "ports" subnode?

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
