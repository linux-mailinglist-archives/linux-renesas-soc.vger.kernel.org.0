Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEBE2D5B5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 14:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbgLJNLJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 08:11:09 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43191 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389179AbgLJNLG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 08:11:06 -0500
Received: by mail-oi1-f196.google.com with SMTP id q25so5622185oij.10;
        Thu, 10 Dec 2020 05:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AfjfEOiPwgm0cBi/nPKDivwriG4JoNrRdEPSRrhwuxM=;
        b=ABmtcUTW2WZqZ58lM/El7YRJK3KHnGu8iCOQf2yFx66N0C8Lp0eVKOLSchp017R4Le
         oDGPelgZxqeW/98WoqREjzJOmqGwswYQ5p9IVGspeG0hprwJsLuFTezi55rHeNDIkOr6
         b5YzeuSXP/1kl36pc06eKN96vNgjQmhNlmc2BZ6BX9dtptL+TqyhYwpD60ZJ6+oopOhX
         Xpe7YYq2vLq/eg8b/RI2qU3aibpnHp/KbOIC7oilnZpcLuSvQtXwyYU6wWwT/RyX0nWd
         q1qaqnCpDyyDSfghcfJF9voBs1rqCZdboaBsp3MQol4Beb8MFCcZF6/osbw8fJzHtG3d
         GTOA==
X-Gm-Message-State: AOAM530HIz22DhY+MY2+P+wDI2cJFPtIztpgpG3L805lGDOS6ahmXk/x
        TJrAd+DKHZCtpteeuTmRxJ2yIzJfEhxoxM/ceQ0=
X-Google-Smtp-Source: ABdhPJzG5fM7j0DQ7gKLs8uvyKscZ7/6LsSwAsCrjkF+XbSlB2LeBBB/tJ3CPcKTV6vm+0nItqMbJ7SvnhzRA8+Hrvs=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr5379645oib.54.1607605825185;
 Thu, 10 Dec 2020 05:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20201209201950.817566-1-niklas.soderlund+renesas@ragnatech.se> <20201209201950.817566-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201209201950.817566-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 14:10:14 +0100
Message-ID: <CAMuHMdVHUqSjnVp8fTve1BB=ui5ay=nqNRtnmNKPPbmnN6VBdw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a77951: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Dec 9, 2020 at 9:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car H3
> (r8a77951) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi

> +               tmu4: timer@ffc00000 {
> +                       compatible = "renesas,tmu-r8a7795", "renesas,tmu";
> +                       reg = <0 0xffc00000 0 0x30>;
> +                       interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;

These interrupt numbers are wrong: they should be 406, 407, and 408.
The rest looks good to me.
Same comment for the other 5 patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
