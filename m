Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A938D1BAE90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 21:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgD0T7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 15:59:45 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39622 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgD0T7o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 15:59:44 -0400
Received: by mail-ot1-f67.google.com with SMTP id m13so28442140otf.6;
        Mon, 27 Apr 2020 12:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCux3WFhsUzhnpQIYTb6iBn0WfJCEnqGmFf2x3Obejw=;
        b=X3A1lrexDO9cQu0M28QqyRB7f/BxEtGFwbWeYMJBAjZl3FiESmSFQX2uQewhH40OZ3
         sXgbUzYdYAQjVW47eKzX8nfSFcCsIZnyxodKiSRI8IdhDbDjc8wxRQn7QL3sMeoTp3FW
         ElT7hiRH2MjNM6OUFhVOs2sv/OOGex5VZXglJmtQ4lKuKTSgwIJx4gXKPS+KNcog25es
         bG8/DI6An+ks9c+Aqtr0s4qhPouc3+jjwc/krMk6zekcemiQ1+sFUpsJBMq7PtqWwKEn
         4S+UO0BGMXJ7kEB7X8ho+7PX2DexPGDXkChNCa+WQcf67kdbNNLfuuRBmEDPITSyydMy
         KsIw==
X-Gm-Message-State: AGi0PuaWyE197bp32zEv5cJr50U94MErc3YbUso3KLDKtv2yeeShIOvf
        uRmA8mh0mtkk0ps8v+zFbPT4bWc6o21a3IwBBfo=
X-Google-Smtp-Source: APiQypLPJTcQTVlxVhJcfPDdHKtGYcKy3uvV5JgdLt2s6vgHNEyA98htHEn2T1akaPpGIpF8clQG+IgKiuVpLVxonxA=
X-Received: by 2002:aca:895:: with SMTP id 143mr237114oii.153.1588017583685;
 Mon, 27 Apr 2020 12:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588004391-8461-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1588004391-8461-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Apr 2020 21:59:31 +0200
Message-ID: <CAMuHMdXG_hpb==xY88vCEguc-n8kg_4vjv_Xmmh5jEGr37BPKA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7743: Add missing compatible strings for
 iic3 node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Apr 27, 2020 at 6:20 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add missing compatible strings "renesas,rcar-gen2-iic" and
> "renesas,rmobile-iic" to iic3 node of r8a7743 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -551,7 +551,9 @@
>                         /* doesn't need pinmux */
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> -                       compatible = "renesas,iic-r8a7743";
> +                       compatible = "renesas,iic-r8a7743",
> +                                    "renesas,rcar-gen2-iic",
> +                                    "renesas,rmobile-iic";
>                         reg = <0 0xe60b0000 0 0x425>;
>                         interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&cpg CPG_MOD 926>;

This was intentional, cfr. commit 072b817589b17660 ("ARM: dts: r8a7743:
Remove generic compatible string from iic3"), and my review comments on
"[PATCH 02/22] ARM: dts: r8a7744: Add I2C and IIC support"
(https://lore.kernel.org/linux-devicetree/CAMuHMdVt2DDQJ9Ud6i=GWAeWW0TdpF5xiCxtRiv0dZTGCPEt8A@mail.gmail.com/).

The note at the bottom of Section 45.1 of the RZ/G1 Hardware User's
Manual says: "Automatic transmission for PMIC control (DVFS) is not
available ...".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
