Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D94FB1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbfD3OKo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:10:44 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41672 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbfD3OKn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:10:43 -0400
Received: by mail-ua1-f66.google.com with SMTP id s30so1564033uas.8;
        Tue, 30 Apr 2019 07:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=is2MtEzfqe3NopmKzPvB7kAsyJ90xw92BJ3XiahsHzQ=;
        b=ghnCqoic2NR+MeAk3FMuP65rEfC/r0VaUitEJJ0IQTtLX5Lbhl0EJ/V97DtcJe6DSK
         IQNAoriRZt8RhSv38B0EyZOwb1U7P8YZayQ8PoXkA36lsTxqVSPS4a3DJ9KOcRn9Z4qA
         XrFqwYIscUq2q1KQTtznu9BbKwgaFlihogoiQFu+Wk/J5PY6LVZHu0dZEtB6VEgirv1Z
         YHA33Dwahhq+FByLvtSmHB9Pn3LHgTOUsy+RlTkBQpifNTL2eKKyN/jYa0yp2TsZsVAY
         S7+1uqpbx+d8uno8shzeB9sebAQhncZznuePZ46+XUo4s5x6nR7PNSWm9w+MoUpiZ+0Y
         i2Ww==
X-Gm-Message-State: APjAAAUBxrP5/Dgk1tOJvixrSBk4P/wIYsh+0frf2R4mmn99YBpg9N+Y
        l6CdzsKloCMn6WBmmLBsFVyPqYDL9een8fPjct8=
X-Google-Smtp-Source: APXvYqzqrcgkWgGIpETv+ZHwtImkGnC4V+K19HPeRGvUOFWTlGAiCkUEFOGWEUlOjEUvsnz4hxJ6znYNY3eqBhhaGHM=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr3807866uar.28.1556633442203;
 Tue, 30 Apr 2019 07:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com> <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555428717-18376-2-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:10:30 +0200
Message-ID: <CAMuHMdV4PiVjYotbR-LF-2BNkpY61Q7XsxKFKDk56dvA_0iibA@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: r8a774a1: Add VSP instances
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Apr 16, 2019 at 5:38 PM Biju Das <biju.das@bp.renesas.com> wrote:
> The r8a774a1 soc has 5 VSP instances similar to r8a7796.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -1877,6 +1877,61 @@
>                         iommus = <&ipmmu_vc0 19>;
>                 };
>
> +               vspb: vsp@fe960000 {
> +                       compatible = "renesas,vsp2";
> +                       reg = <0 0xfe960000 0 0x8000>;
> +                       interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 626>;
> +                       power-domains = <&sysc R8A774A1_PD_A3VC>;

I have my doubts about vspb (and fcpvb0) being part of the A3VC power
domain (also on R-Car M3-W).


> +                       resets = <&cpg 626>;
> +
> +                       renesas,fcp = <&fcpvb0>;
> +               };

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
