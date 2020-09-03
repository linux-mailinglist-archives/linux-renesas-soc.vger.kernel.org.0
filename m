Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5B225BEF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 12:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgICKTA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 06:19:00 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34568 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgICKS5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 06:18:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id z22so2609053oid.1;
        Thu, 03 Sep 2020 03:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/K2TceG+YMiMk03lA1/MkZv11rftVfSaLBq2a+jxQc8=;
        b=qaaBS6RtHt1XYsqBC1a7I57NwwAEXblT8/S9by8t2/hUFF0xKlgoJv6z2P7QMLw7AX
         Y0XXBb/XwDLGowjUZvpiRNjceI1s5ZWDXm0YIQKaULmI11vEXkWuoI5T8g67Bn626I6S
         pujx5ZtFZLfR9uXLSi+EAuxNV1UCN8Q6Rb0xcbZbnEdiJJtSatq9omYuUOyodHGbtpxn
         qLvw0ATUW6qjizwkzGp99dQpOMlVcojra82vEp/79Xp4/5CRrKda8E70ZdGLzisoRzXl
         1zHXjtjIlu8xnQ5y3sTuBmzP2o+q2xhOSUpmbuKbQULdS5gC0+lbCArp3ayXsXoL031A
         jjeQ==
X-Gm-Message-State: AOAM5319hro6XSn7ACOjCMX5KEGuGI9UVKfdaqMNG5b2/dJ/JRUUhGqv
        IPAFiLxfHdsA8xUume6SV4Hpp7DW79BRlJaUBY+rQG2fP0A=
X-Google-Smtp-Source: ABdhPJygFHNDUkjk3+rmdBnoZmAJdF/YWtr4NhfoiZrjCH9Eq7jvuwgTPXwEDXAMPSmAWyXJS+rtQBViBj54DoQym+g=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr1540672oib.54.1599128336542;
 Thu, 03 Sep 2020 03:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 12:18:45 +0200
Message-ID: <CAMuHMdVVvDEq-GSsPDrx09TCfGCWkNQvGYrNWP4gK2=63G2z1w@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable PCIe Controller and set PCIe bus clock frequency.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

One thing to double-check below.

> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> @@ -238,6 +238,18 @@
>         /* status = "okay"; */
>  };
>
> +&pcie_bus_clk {
> +       clock-frequency = <100000000>;
> +};
> +
> +&pciec {
> +       /* SW2[6] determines which connector is activated
> +        * ON = PCIe X4 (connector-J7)
> +        * OFF = mini-PCIe (connector-J26)

The table on page 14 says it's the other way around.

According to the CBTL02042ABQ datasheet, PCIe_SEL = low
selects the first channel (PCIe x4), while PCIe_SEL = high selects the
second channel (mini-PCIe).
Enabling the switch ties the signal low, so the table must be wrong.

> +        */
> +       status = "okay";
> +};
> +
>  &pfc {
>         avb_pins: avb {
>                 groups = "avb_mdio", "avb_gmii";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
