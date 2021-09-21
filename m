Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A924136BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 17:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhIUPzd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 11:55:33 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:38816 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhIUPzc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 11:55:32 -0400
Received: by mail-ua1-f41.google.com with SMTP id 42so6655113uar.5;
        Tue, 21 Sep 2021 08:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xeKByOTS+lpH6VM+sT0RbBcDyOchg2h9uI8kPYfUR3g=;
        b=6bafJajwRRAZhSsw6HgHk239LsSGIjbsy274zbWe+LNaM25X+Se8bWtlk6mHKKIOPy
         XV6JvxSA/NguF4n/LNLKxghka98ua4SRoXZ4ETKRVgrMid6HBRvHEN9d0/c4XTcjVywd
         hAKzpfOM1+bgJ0oPOhEH1GA/iBsGSSsJVSmf+WFrIWZLNGZyYVRI0TQfApl2DIl7TaB5
         FcDUsq8p6nTQLLtb69To9LALUIsevWq6IvlRR34OypewBH7Fjh/UkOfxspd1Te6Futd7
         x5p6jux70D9hqMKabqxRRfXl1SuefUonQtqIMcoVIT9tsmSNXIIeuw9fbnMcz23u3Vcz
         Wm2w==
X-Gm-Message-State: AOAM531BpVHFigaNDZhSukiCaUlnp8LsPsG7aXiW1e/KrppV32Br1BZi
        UT0q8QDSitp2XtM5IWS43exmsA3ff6aiKosdAiw=
X-Google-Smtp-Source: ABdhPJzjty7MGs32K3rhY6sUGT5fb8yVFIHG9t8ODt4dP8iZWbOtrhi5vyGYC5HXNaufTLBguH0mUeHSZNy5UK8vZbE=
X-Received: by 2002:ab0:6ec9:: with SMTP id c9mr18455990uav.114.1632239643731;
 Tue, 21 Sep 2021 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com> <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
In-Reply-To: <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 17:53:52 +0200
Message-ID: <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add binding
 for R-Car MIPI DSI/CSI-2 TX
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> can operate in either DSI or CSI-2 mode, with up to four data lanes.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> +  to four data lanes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Functional clock
> +      - description: DSI (and CSI-2) functional clock
> +      - description: PLL reference clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: dsi
> +      - const: pll

No interrupts?
The hardware manual says there are 9 interrupts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
