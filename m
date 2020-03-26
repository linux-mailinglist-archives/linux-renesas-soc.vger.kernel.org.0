Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A268193B61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 10:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZJAD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 05:00:03 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37812 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgCZJAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:00:02 -0400
Received: by mail-oi1-f193.google.com with SMTP id u20so85384oic.4;
        Thu, 26 Mar 2020 02:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfBoZ6XWbQ4KrliwGJFyfFIGFoQRaKutoj2iGGBbZ/8=;
        b=PjgH72PTZxyHhiNPl+U6nqCtGjvFzor94e8Bn+QveG6NE6SyNYIIDFIEoQF/AVlM4c
         vfmclA5kQfZpKucrTJHQQpYb4nRlCTQfmFHJFboDXNgHmlWzHe6Jdq4C66Aq+85vSuZv
         4aYJsWzbCe6bB9iryyrUksRnhzRGfxx1yFf5myMJU3gQxO5Iipup3gsFLxmzE0VRWB10
         Zb4YUvMmSBuYP7XHgHZgubhBbNzQdGNIRbEQefx+DpvCDm8CGN4Yog6StJoqDD4eGGvu
         9FNRcC2PyollbVv48jxfcXZdWWk0X8zJRRCK3FBY3mgMczd3YDMmdvO+ghDMCp01McZz
         lzQA==
X-Gm-Message-State: ANhLgQ2ypIyuOFgKxw44jsjWA/K4hjUtE8eW4HzzTgCY7iMCo1drQpje
        TH8jToLztvK/4Tw1cJP34t+y3zh9lQ6xJZFN+oQ=
X-Google-Smtp-Source: ADFU+vunNPMm7n4lDtng9ONOCC+CUOSNaxldESCtYKuWG26njMdjPZls8Bkeas3fZwolEuBeS6R5akyYkDNpy9/Z57M=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr1128472oie.54.1585213200541;
 Thu, 26 Mar 2020 02:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585200559-30033-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585200559-30033-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 09:59:49 +0100
Message-ID: <CAMuHMdVuiAqqERf_ZEAqkhuTfOrn-VUj8rpuAHMwL=QdRNi3qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: renesas: usb2-phy: convert
 bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Mar 26, 2020 at 6:30 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0-only

I think Rob would prefer to see

    # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

> +  reg:
> +    # base address and length of the registers block for the PHY.

The comment is not needed.

> +    maxItems: 1
> +
> +  clocks:
> +    # clock phandle and specifier pair(s).

Likewise.

> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    # for RZ/A2

if:
  properties:
    compatible:
      items:
        enum:
          - renesas,usb2-phy-r7s9210

> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: fck
> +      - const: usb_x1

> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    usb-phy@ee080200 {
> +        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
> +        reg = <0 0xee080200 0 0x700>;

Examples are built with #{address,size}-cells = <1>, so

    reg = <0xee080200 0x700>;

> +        interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 703>;
> +        #phy-cells = <1>;
> +    };
> +
> +    usb-phy@ee0a0200 {
> +        compatible = "renesas,usb2-phy-r8a7795", "renesas,rcar-gen3-usb2-phy";
> +        reg = <0 0xee0a0200 0 0x700>;

reg = <0xee0a0200 0x700>;

> +        clocks = <&cpg CPG_MOD 702>;
> +        #phy-cells = <1>;
> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
