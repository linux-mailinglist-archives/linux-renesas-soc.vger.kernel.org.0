Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906D94158B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 09:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239380AbhIWHBx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 03:01:53 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:42878 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239370AbhIWHBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 03:01:53 -0400
Received: by mail-vk1-f176.google.com with SMTP id o204so2176939vko.9;
        Thu, 23 Sep 2021 00:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmpAdGBuoZ2H4vsYmz/gaaH8SFsdh1aIHAgypR+PGH4=;
        b=RA1yWcbGx086ibONZtnUw1iC/br73vqaUuB61rx0a2folwICoct+brQSpQO3O81ZvS
         cZhj/V757OumRLCgJhW3VNijE6nS/sewD5wvSe4azkwTLZVAQ5YIT/rrHIv/gE3sl1/f
         qUaO/QEoiPa4p388R5LcjviHmN2oI51c6z2NBUmyRDmz6WnvpErpWED9gpTOcj8oyTAS
         S3DL264gjq/HPso5Sc91aErI11i7uogV+MneAfxErre6Z6x6mojDEQiJUj06MvT/V/Wr
         XbXjXNIC6sfCQnZ+VVaF2ydnqcrKvFhmqUQL3NnrERb3hXWR1p+P37XeJl/nvn/HuVZp
         okqA==
X-Gm-Message-State: AOAM530TNHnYHaVkn/jK1Sfxe1Gyr0u1ZZC81vPwusYRKfBdL1+YQ6Mh
        974SuDMwaFIa3MokuGAlzSTYUoiDQWnZd3nLiOhyjm4eaR4=
X-Google-Smtp-Source: ABdhPJxrSnRuqRIPIA1q7UmwoFsiu8wwdht1494jD4SuBcubaowOHjiICmyOgzRobpfLJFy7CS+6PGcR734kT66e/3Y=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr2062529vka.19.1632380421342;
 Thu, 23 Sep 2021 00:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com> <20210923010402.3418555-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210923010402.3418555-2-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 09:00:09 +0200
Message-ID: <CAMuHMdUTYYoZawgMhpTr56v88-mrKWPpgMwC-9KPeYhS6R2AzQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: renesas: r8a779a0: Add DU support
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Sep 23, 2021 at 3:04 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Provide the device nodes for the DU on the V3U platforms.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2
>  - Use a single clock specification for the whole DU.
>
> v3:
>  - Use 'du.0' clock name instead of 'du'

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1251,6 +1251,36 @@ vspd1: vsp@fea28000 {
>                         renesas,fcp = <&fcpvd1>;
>                 };
>
> +               du: display@feb00000 {
> +                       compatible = "renesas,du-r8a779a0";
> +                       reg = <0 0xfeb00000 0 0x40000>;
> +                       interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 411>;
> +                       clock-names = "du.0";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 411>;

You missed reset-names.

> +                       vsps = <&vspd0 0>, <&vspd1 0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       du_out_dsi0: endpoint {
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       du_out_dsi1: endpoint {
> +                                       };
> +                               };
> +                       };
> +               };
> +
>                 prr: chipid@fff00044 {
>                         compatible = "renesas,prr";
>                         reg = <0 0xfff00044 0 4>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
