Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC651D28C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 09:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgENHcO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 03:32:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40345 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgENHcO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 03:32:14 -0400
Received: by mail-ot1-f68.google.com with SMTP id d26so1593080otc.7;
        Thu, 14 May 2020 00:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vhc1vPOe6XCEp9cAZAiq6WN1cflOAJVbZDflQFJ2vjQ=;
        b=JDB2sMytdCit1Mhi6CTKqqWI+CXqtp77Po/uyMf5zjfU+62LjR1MVfWNflNeZE81K/
         KcBao1vg71j8aLO4h5GaGia3wg992ZPXB32dHEHXH7nGZICZDNDalBe1u6IRNIiNhPHS
         JYEX4Il8ISQPWA2IB6pgXTSJyfx91XCRtvEjTKNAxocgVRnb3OwWY68E3Q6bxUK1xucu
         gu5iPbbsfkhxJ+2ul/fhRbv7IVk2+U+X75p7YFjmlORpNeHXLZXUzFtGtqzFCennzArH
         tJmBw3DcBHhCPBh3xUBv/F4is3F1wMlHxO6sB2eTmBWYHv3Q2WgD2AcjFw0/YAK1ZO6E
         VYvw==
X-Gm-Message-State: AOAM531SOkvf714tbkGfhU3sGcQEyWvIQ+gV+rAhVKeIYM7kN/SxmZK7
        Sk4FZ80h7PSfG1K1I9lDKgAJVmo+H/DUpgYI77A=
X-Google-Smtp-Source: ABdhPJyGBQa7yUxMaeUUyVrVubTEBO6u7aeAiflupj4yZkSBefIq/PXr26WIZz78ucQ0WiPzpHtHcVIgcxumEbzSbis=
X-Received: by 2002:a9d:564:: with SMTP id 91mr2543922otw.250.1589441534036;
 Thu, 14 May 2020 00:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com> <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200513232840.22687-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 09:31:53 +0200
Message-ID: <CAMuHMdXRiP3topBOeLdLhJ9wMBAMFEnLYJPPpdmmdK7TKN4X6g@mail.gmail.com>
Subject: Re: [PATCH v1.1 4/4] dt-bindings: display: bridge: renesas,lvds:
 Convert binding to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, May 14, 2020 at 1:29 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    lvds@feb90000 {
> +        compatible = "renesas,r8a7795-lvds";
> +        reg = <0 0xfeb90000 0 0x14>;

#{address,size}-cells = <1> for examples.
Applies to all nodes below, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
