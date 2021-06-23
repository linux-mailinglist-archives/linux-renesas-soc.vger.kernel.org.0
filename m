Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DDE3B1AA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFWNDQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:03:16 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:36584 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhFWNDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:03:14 -0400
Received: by mail-vs1-f53.google.com with SMTP id z7so1379704vso.3;
        Wed, 23 Jun 2021 06:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xaXLQDrbGWUnh9xp3TUFpWQ0H0nFeLXUr5XokkbfgPI=;
        b=CaxiW1bFLIzJ4Wbnzc4zMqPAOR+jAWxYEAXTdJDSBh0oRK0QNDnMXIXoHgALSZzZ9O
         TMCO5mTkthuc1i5mHoV6JyuHai/ApJfrwSWRDBTrUZmAQZF9ANCZcMsamWftFNbgdl1a
         RZFdIiJqNi1Iu87dneMirs5swnoHeAxmWf9h5+4kjMuTYqAwPD8u2ljRjGJe1y/4XmeQ
         huDi6aWUVnKo+5RU6oVXaNzAdrcUOkCkWmZyVIFtuo0/S7EtxVsBvrZxczko9RUcrluC
         TPfqsBcCYNvcyHYJFuZaTI4qPhP9V1sf495uFYnAgWJRQjqGrCIOe7I8whVaF3oUaKKV
         JW7Q==
X-Gm-Message-State: AOAM532kgbesdYnuUogbr/1p0BflJ8n16HyP4DwoDOsq0zwCDElUhZoN
        m0PVGzasXHdtJh4fR7TG2Z/4SOGjKXE718BosqE=
X-Google-Smtp-Source: ABdhPJxnV9hQz/Siv4piSeWZ99D+KjrN7luG/cn+F33NA4nyK6kywwKCgWiWggLOwM7W8LVr9HOBIcKmthPtQOl7h4s=
X-Received: by 2002:a67:7787:: with SMTP id s129mr23548043vsc.40.1624453255715;
 Wed, 23 Jun 2021 06:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210622234257.3228634-1-kieran.bingham@ideasonboard.com> <20210622234257.3228634-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210622234257.3228634-2-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 15:00:44 +0200
Message-ID: <CAMuHMdXMB-qSCWbGnSG+ZZSQc9SVaD31R6mRYoqX8D9TD8ARNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a779a0: Add DU support
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:ARM/RENESAS ARM64 ARCHITECTURE" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 23, 2021 at 1:43 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Provide the device nodes for the DU on the V3U platforms.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1142,6 +1142,37 @@ vspd1: vsp@fea28000 {
>                         renesas,fcp = <&fcpvd1>;
>                 };
>
> +               du: display@feb00000 {
> +                       compatible = "renesas,du-r8a779a0";
> +                       reg = <0 0xfeb00000 0 0x40000>;
> +                       interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 411>,
> +                                <&cpg CPG_MOD 411>;
> +                       clock-names = "du.0", "du.1";
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 411>;
> +                       vsps = <&vspd0 0>, <&vspd1 0>;
> +                       status = "disabled";

Modulo my comments on the clock part of the bindings:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
