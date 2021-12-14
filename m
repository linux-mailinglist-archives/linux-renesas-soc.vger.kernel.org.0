Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2E7474132
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 12:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhLNLMA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 06:12:00 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:39551 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbhLNLL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 06:11:59 -0500
Received: by mail-ua1-f53.google.com with SMTP id i6so34170346uae.6;
        Tue, 14 Dec 2021 03:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgnaEU1ho+eODmteTQU3x2PwQljHV/cZwRbh3bQWIaM=;
        b=G4qDgfQ2+gHcjfximQrtBLvxH4h5Sd4Twr6o/lnKLT59T5Xsea6FdmO+qZx74JcX0/
         dkNthTfQaHCxq0BFmqy0hcnUVAcsySsKz8KZakHifJrSfitwg7gF04i4sMtJjCm75He3
         flet9iBBzgh+3G4tPpg4gsv43JT9Pbp18NnlHeQMMQpbR2AhmokyDKwDWe15wPQAJMvj
         K3ULul6oIUSsRoaJzKdtv1xtCDNV2BvaUkmQyVCOyLFWCzL+yOlQR0XtlnotE0dSOV8P
         94Ih97k8k6Bwxfy+WxzvlXoK3nDfe55NsEODhCX1RjhUughi6lUjnpuryU+GF14UH6ty
         RrPg==
X-Gm-Message-State: AOAM531l2dDczM7Fm1OS5tuARzAMLouh8xpIaG6SAuSR8OmGfLjyR7zP
        Q21omnH3guGOpwnPbrc9ojnJUqKHcZzanw==
X-Google-Smtp-Source: ABdhPJzO2UpYrRxXAzUlGLR7X6tHMreWTfiqcrpVvNMEMPWvPR6q4bp5WgFzzlx9IIj7CmmOcdjU5A==
X-Received: by 2002:a67:d994:: with SMTP id u20mr3992094vsj.12.1639480318651;
        Tue, 14 Dec 2021 03:11:58 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id y17sm231270uaa.9.2021.12.14.03.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 03:11:58 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id t13so34172165uad.9;
        Tue, 14 Dec 2021 03:11:57 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr4130195vst.5.1639480317636;
 Tue, 14 Dec 2021 03:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20211208142729.2456-1-biju.das.jz@bp.renesas.com> <20211208142729.2456-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208142729.2456-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Dec 2021 12:11:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRux4Vg_zXhbHXVoiiPuXVL8B1LjzwXX7A-cg+_=GkTQ@mail.gmail.com>
Message-ID: <CAMuHMdXRux4Vg_zXhbHXVoiiPuXVL8B1LjzwXX7A-cg+_=GkTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add TSU node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Dec 8, 2021 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add TSU node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -539,6 +539,16 @@
>                         };
>                 };
>
> +               tsu: thermal@10059400 {
> +                       compatible = "renesas,r9a07g044-tsu",
> +                                    "renesas,rzg2l-tsu";
> +                       reg = <0 0x10059400 0 0x400>;
> +                       clocks = <&cpg CPG_MOD R9A07G044_TSU_PCLK>;
> +                       resets = <&cpg R9A07G044_TSU_PRESETN>;
> +                       power-domains = <&cpg>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +

OK.

>                 sbc: spi@10060000 {
>                         compatible = "renesas,r9a07g044-rpc-if",
>                                      "renesas,rzg2l-rpc-if";
> @@ -902,6 +912,22 @@
>                 };
>         };
>
> +       thermal-zones {
> +               cpu-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsu 0>;
> +
> +                       trips {
> +                               sensor_crit: sensor-crit {
> +                                       temperature = <125000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +       };
> +

LGTM (I'm no thermal expert, so an additional pair of eyes wouldn't hurt), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
