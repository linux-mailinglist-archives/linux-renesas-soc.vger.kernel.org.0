Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCE919F1C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 10:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgDFIru (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 04:47:50 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45888 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgDFIrt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 04:47:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id l22so12345668oii.12;
        Mon, 06 Apr 2020 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ofe9gpx/rAfxW7TO3g+sj7lCoLVUw0RfPyc4HUwJq/0=;
        b=R6bruQB0S4lzRN8lix/535ikbTaHcxwPjU1BDwFxVmhgDYm5eteniRJVce1vahC/9y
         ZgLNg7TZbOStS1m6zNzsT8tEligpjeyARlm8L7AvQynXI2Neqv5GNvZI9ny1AyV1+vMM
         YthPwoow8rVqqC9H9LKPktw+Utx5u0fHjcQd6RsfOeB0lRHbUUZjFgzf1DdhGS438bHs
         uz1yvl2eHPAxhXmZvfi7GK7ZqlChLR3svpjDGnqy4wfzgpiiUiK2RQpInhBD7hOPL08I
         pjMsQJKWR+trxszvu4eLHOXxYAl2nvLIcHDIvArYnuJIwwZ9RgNy5lbMnW0a9JMUXlIg
         rFoQ==
X-Gm-Message-State: AGi0PuaFLm/W7Uacw/vmyvJgoLKrgMwp+i8WVxdZ1UxubohvzNdy29aS
        8vQsj3JThGIJ0Dognz0Xsq4acVtA7ExceYvurI8=
X-Google-Smtp-Source: APiQypI0xhIzfIwCX4pr1CeA1Z/0H4YxMtzB3XTU4byr19XfCp2qMUh0J0OZzFv0dnImP8Rwz0MkG5uV0lsmtuR32VU=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr11513006oib.148.1586162868764;
 Mon, 06 Apr 2020 01:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com> <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Apr 2020 10:47:37 +0200
Message-ID: <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -0,0 +1,248 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car LVDS Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> +  Gen2, R-Car Gen3 and RZ/G SoCs.

RZ/G1 and RZ/G2 (no idea what'll RZ/G3 will bring ;-)

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7743-lvds # for R8A7743 (RZ/G1M) compatible LVDS encoders
> +      - renesas,r8a7744-lvds # for R8A7744 (RZ/G1N) compatible LVDS encoders
> +      - renesas,r8a774a1-lvds # for R8A774A1 (RZ/G2M) compatible LVDS encoders
> +      - renesas,r8a774b1-lvds # for R8A774B1 (RZ/G2N) compatible LVDS encoders
> +      - renesas,r8a774c0-lvds # for R8A774C0 (RZ/G2E) compatible LVDS encoders
> +      - renesas,r8a7790-lvds # for R8A7790 (R-Car H2) compatible LVDS encoders
> +      - renesas,r8a7791-lvds # for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +      - renesas,r8a7793-lvds # for R8A7793 (R-Car M2-N) compatible LVDS encoders
> +      - renesas,r8a7795-lvds # for R8A7795 (R-Car H3) compatible LVDS encoders
> +      - renesas,r8a7796-lvds # for R8A7796 (R-Car M3-W) compatible LVDS encoders

R8A77960 (I know you don't have support for R8A77961 yet ;-)

> +      - renesas,r8a77965-lvds # for R8A77965 (R-Car M3-N) compatible LVDS encoders
> +      - renesas,r8a77970-lvds # for R8A77970 (R-Car V3M) compatible LVDS encoders
> +      - renesas,r8a77980-lvds # for R8A77980 (R-Car V3H) compatible LVDS encoders
> +      - renesas,r8a77990-lvds # for R8A77990 (R-Car E3) compatible LVDS encoders
> +      - renesas,r8a77995-lvds # for R8A77995 (R-Car D3) compatible LVDS encoders

Wouldn't it be sufficient to just have the SoC name (e.g. "R-Car D3") in
the comments?

> +if:
> +  properties:
> +    compatible:
> +      enum:
> +        - renesas,r8a774c0-lvds
> +        - renesas,r8a77990-lvds
> +        - renesas,r8a77995-lvds
> +then:
> +  properties:
> +    clocks:
> +      minItems: 1
> +      maxItems: 4
> +      items:
> +        - description: Functional clock
> +        - description: EXTAL input clock
> +        - description: DU_DOTCLKIN0 input clock
> +        - description: DU_DOTCLKIN1 input clock
> +
> +    clock-names:
> +      minItems: 1
> +      maxItems: 4
> +      items:
> +        - const: fck
> +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> +        # These clocks are optional.
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1

Can the duplication of the last 3 entries be avoided?
Perhaps like in
Documentation/devicetree/bindings/serial/renesas,scif.yaml?

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    lvds@feb90000 {
> +        compatible = "renesas,r8a7795-lvds";
> +        reg = <0 0xfeb90000 0 0x14>;

Examples are built with #{address,size}-cells = <1>.

> +    lvds0: lvds@feb90000 {
> +        compatible = "renesas,r8a77990-lvds";
> +        reg = <0 0xfeb90000 0 0x20>;

Likewise.

> +    lvds1: lvds@feb90100 {
> +        compatible = "renesas,r8a77990-lvds";
> +        reg = <0 0xfeb90100 0 0x20>;

Likewise.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
