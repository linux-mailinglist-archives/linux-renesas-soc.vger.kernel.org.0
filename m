Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9894417159
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 13:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238892AbhIXL5E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 07:57:04 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:43686 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhIXL5E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 07:57:04 -0400
Received: by mail-vs1-f48.google.com with SMTP id n17so9687132vsr.10;
        Fri, 24 Sep 2021 04:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=njhF2fjmzlPu4MUjW05N7XqVTAmx4mOJ8Egu47QXE5o=;
        b=VgIbMasfCJBJQJF11xkFcDs3tiZpx4j+L38ADsN4dbo4BwK/gXReuEIGxgZ5E+kJuf
         wY42xuCx9JlokW/d8N3E6NviJrvthrdmHLVI8V80B9Wf1dB4kd8mXtOhvGR4i/k1aWKG
         uTkmVB53HvI8ilJsCchLIVqmTUMdpPLtWvJyIK5mjywK/0VH0GaxEMjkDGBCMGpKPUIx
         HHZ66xcZlAqYCAifo8sNMjyDNx1OkRQ3OrUv3JbfWNgT0pIEDpNshZmBi5kCuMZKbvS7
         rxewUFfP45503rIknaQP2kanpTukwNmRgL5X8negz6wvuNlbHG9dG7WzR9RhvOukQJv5
         SWXQ==
X-Gm-Message-State: AOAM530+UQjZ55SCk4p1ZJHQynSVvZC82OY0GxJ4rDHqArv/0eLJe4BQ
        xiq0BgHcgAQ8mW/0fdd6m23Nofd63KaGGcDSG/8=
X-Google-Smtp-Source: ABdhPJzl+L13oorihQMmbMpIpFTxmVqwwX3DNXl/5J5pOstztN8S+XS5g6nVujeVyw+wQEoi5sGupJ6416iQyupzeQE=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr9066913vsl.9.1632484530477;
 Fri, 24 Sep 2021 04:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210922085831.5375-1-wsa+renesas@sang-engineering.com> <75713e8e-f675-240e-b503-99618d07afda@canonical.com>
In-Reply-To: <75713e8e-f675-240e-b503-99618d07afda@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 13:55:19 +0200
Message-ID: <CAMuHMdVgfeHt9At7qh7syttN-2HcHg8bhi85FK3CGTevtSs9yw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rpc: renesas-rpc-if: Add support for the
 R8A779A0 RPC-IF
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Fri, Sep 24, 2021 at 1:48 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 22/09/2021 10:58, Wolfram Sang wrote:
> > --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> > @@ -33,6 +33,7 @@ properties:
> >            - renesas,r8a77970-rpc-if       # R-Car V3M
> >            - renesas,r8a77980-rpc-if       # R-Car V3H
> >            - renesas,r8a77995-rpc-if       # R-Car D3
> > +          - renesas,r8a779a0-rpc-if       # R-Car V3U
> >        - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2 device
>
> Where is the driver or DTS using these compatibles? The bindings can
> come even without users, but are you sure this is what you want?
> Changing them later, if ever needed, will be more difficult.

Driver:
    drivers/memory/renesas-rpc-if.c:        { .compatible =
"renesas,rcar-gen3-rpc-if", },

DTS:
    [RFC PATCH 3/4] arm64: dts: renesas: r8a779a0: Add RPC node
    https://lore.kernel.org/linux-renesas-soc/20210913065317.2297-4-wsa+renesas@sang-engineering.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
