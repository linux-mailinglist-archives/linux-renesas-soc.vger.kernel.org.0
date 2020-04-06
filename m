Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A606D19F1D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 10:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgDFIvU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 04:51:20 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37022 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgDFIvU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 04:51:20 -0400
Received: by mail-oi1-f195.google.com with SMTP id u20so12414345oic.4;
        Mon, 06 Apr 2020 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXYbNmUk7gx6u1EZ+3zkQdCAzF6iKPs8wapVvWfN48o=;
        b=aMN52ODD8kobTkvZNddPAdOhAPVyITQ9ulqO5t3+KspgJ6HyJuOTlOSQekERb8/aTD
         Pdb1rL9Jz362WSyxbTsz+L+bZPP4TK2hdnvZDnp03+UUlNKbd3mL58ikJ4JrJPn72aNb
         JeCj6bldY2hekvHhXuRfRrCh6OQ/oTZ653RLOki1JRRZU60h6uTjWq6JBIz5S+j+gRoX
         jY896kxd+D/eIa05du0YNrl0aOsXx5BrS3FxAWzdmFdRu4GZkvtN3YYjNCgqgeTfguI7
         Yx2yrMYRCYkwq97kusGiYSblB0JWh2wTVLMuX0fFtkunL9kZrki+45a8qJZbSgMbDIV3
         hUyw==
X-Gm-Message-State: AGi0Puaar1t+a5E/rI3D11CfZkMVNVcVXM5lt4kYLzgMCLp9YHb+DpN8
        cPMhCAliStrSkFPJUlNRz3UtgqG1/mOsHDm4/PY=
X-Google-Smtp-Source: APiQypIR0yeblmw39zrWYRRtW33lWN0V41HsYayCa9b+tH6tni6QJUl7ScskTs14bJYWvH1xLH3vofcWL4Y1Ilevefo=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr11498601oig.153.1586163080068;
 Mon, 06 Apr 2020 01:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com> <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Apr 2020 10:51:08 +0200
Message-ID: <CAMuHMdW2-JdDk5KB+K1-QMp20edU-5U--y4utvTn0H-RDYgyaQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Apr 6, 2020 at 1:40 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car DWC HDMI TX text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
> +        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
> +        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
> +        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX

R8A77960 (I know you don't support R8A77961 yet ;-)

> +        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX

Wouldn't it be sufficient to just have the SoC name (e.g. "R-Car M3-N") in
the comments?

> +      - const: renesas,rcar-gen3-hdmi

# R-Car Gen3 and RZ/G2

> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    hdmi@fead0000 {
> +        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +        reg = <0 0xfead0000 0 0x10000>;

Examples are built with #{address,size}-cells = <1>.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
