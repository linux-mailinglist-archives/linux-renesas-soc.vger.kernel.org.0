Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4A3A0DA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbhFIHWE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:22:04 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:44653 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235514AbhFIHWE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:22:04 -0400
Received: by mail-ua1-f46.google.com with SMTP id 68so12507766uao.11;
        Wed, 09 Jun 2021 00:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vEzEWwPPQJal1lECMJPyuIxAIHK1BCu2t3MQxt0rxY=;
        b=sYwjgBoieHcFXaPk6rIEHoibhcn7kyte9ZNeFPdfNBWTgN+sf2+2DpQQSYyh+F3GIb
         s7KQU7GZ3lQAqKD1yWBC6E6sTvxLetG2QxOUo8tKwX9OUFN9RBLc+lNY5nN1chVh4dfv
         IS+BHqT8SSfHdpxN9O6FGUhgyZRZGu605zdsNlJgT3D0PcE2sISfVC5W9EQvHBu4QbA0
         w7VeyEDAioTc6WPxrgBQLbCzH8Ng9nAbXdL1F2So3hAm46h6hppLUUIwvnBw/tiA4lK2
         7/T2eTHHDePR7dNjNJdH7VyjOh9Rl+d4DeOnP6tQSSeqrQ+NC+Hv75UdeQ+PXDvpc9MT
         NK5Q==
X-Gm-Message-State: AOAM533MrCZxWIHJ2XArQNaogLbpk4jvK0SD41ai3hJIz5In9UScPrNd
        B9/qInTp5TK8YS2QZ21GwadrnP1dEkgiSkXOmiQ=
X-Google-Smtp-Source: ABdhPJxsYvKyembJ2mLXNHZGsICwfLodPU5UwBt7P7NkAoNmB4qdcXulBtZF+Mnm+hCeYXrbJzyCAQDvqbTMan04IVc=
X-Received: by 2002:ab0:2a4e:: with SMTP id p14mr8581199uar.2.1623223200990;
 Wed, 09 Jun 2021 00:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210604180933.16754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210604180933.16754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:19:50 +0200
Message-ID: <CAMuHMdUTvCpZ97U_S_GmMy9nHuEDYcD3PBqhNVecFsHzk74xNQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: renesas,rzg2l-sysc: Add DT
 binding documentation for SYSC controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakr,

On Fri, Jun 4, 2021 at 8:09 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add DT binding documentation for SYSC controller found on
> RZ/G2{L,LC,UL} SoC's.
>
> SYSC block contains the LSI_DEVID register which is used to retrieve
> SoC product information.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/power/renesas,rzg2l-sysc.yaml    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
> new file mode 100644
> index 000000000000..616a5139644f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/renesas,rzg2l-sysc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas RZ/G2L System Controller (SYSC)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The RZ/G2L System Controller (SYSC) performs system control of the LSI and
> +  supports following functions,
> +  - External terminal state capture function
> +  - 34-bit address space access function
> +  - Low power consumption control
> +  - WDT stop control
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 4

For multiple interrupts, you may want to add descriptions, and
interrupt-names.

The reset looks good to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
