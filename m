Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7593B1AA9CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgDOOV2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 10:21:28 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36908 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732547AbgDOOVX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 10:21:23 -0400
Received: by mail-ot1-f68.google.com with SMTP id z17so46335oto.4;
        Wed, 15 Apr 2020 07:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dnvZD4Dm4e5FRgntE759Yt2PxA+q1fuND8zsrub9kLs=;
        b=UqtbL2HMOw6/i35h9bZLflohsFzQ/M1dB4gFcuozzKn9CfG/nTMWnYbj+u2atl8WHI
         qdBU4zqzb/7aw3IgITxhK3SCrb1lxbxobo/+DRwqMOEqQ13WUzuS1d2Ij/oNmVj+B9n0
         q3y9V2GMw2Zzx2ec+aukCino5ZR8mR/998WKiZBaazTt7tLAtlTivJTZ31y1txJFFnUI
         pax5faAWq1pDa7JCKdRc4oA9BhwI4nRyVrHnQkpfcfGbI1MpanyUe/kMdGWVOrxZx7Mp
         j+hRoeTYB+deE5X90aCqUe5zYunZM7ZmUsdd3ISxY04sv67fNiYWpq0KxdGISOrCr3xO
         QNrg==
X-Gm-Message-State: AGi0PuarkBcjqXmaF0tIHIqWOwB09t3hbDq6FRkeUMARpiS7hBeJwdko
        yYtFMHiJRqTqSUjtYBpfLamJ/GvRJcAEKfoKwYA=
X-Google-Smtp-Source: APiQypIG2ckswGmQ7Vt/axIUAX+BtAwJOJQokWKIZnojuoFp2TeGwYdTsUd02L9Tf1SQqNYp+XNW0q+iQh9SWBYejGA=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr21994872otl.145.1586960482326;
 Wed, 15 Apr 2020 07:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Apr 2020 16:21:10 +0200
Message-ID: <CAMuHMdXvZp5GFY5-SjXP0PLE8MiwYencVMti93wU4E3N2c0QVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Apr 14, 2020 at 2:26 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Convert Renesas VMSA-Compatible IOMMU bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/renesas,ipmmu-vmsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas VMSA-Compatible IOMMU
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +description:
> +  The IPMMU is an IOMMU implementation compatible with the ARM VMSA page tables.
> +  It provides address translation for bus masters outside of the CPU, each
> +  connected to the IPMMU through a port called micro-TLB.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a7743  # RZ/G1M
> +              - renesas,ipmmu-r8a7744  # RZ/G1N
> +              - renesas,ipmmu-r8a7745  # RZ/G1E
> +              - renesas,ipmmu-r8a7790  # R-Car H2
> +              - renesas,ipmmu-r8a7791  # R-Car M2-W
> +              - renesas,ipmmu-r8a7793  # R-Car M2-N
> +              - renesas,ipmmu-r8a7794  # R-Car E2
> +              - renesas,ipmmu-r8a7795  # R-Car H3
> +          - const: renesas,ipmmu-vmsa  # R-Car Gen2 or RZ/G1
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a73a4  # R-Mobile APE6

I believe the R-Mobile APE6 IPMMU is similar to the R-Car Gen2 IPMMU,
and thus belongs in the section above instead.

> +              - renesas,ipmmu-r8a774a1 # RZ/G2M
> +              - renesas,ipmmu-r8a774b1 # RZ/G2N
> +              - renesas,ipmmu-r8a774c0 # RZ/G2E
> +              - renesas,ipmmu-r8a7796  # R-Car M3-W
> +              - renesas,ipmmu-r8a77965 # R-Car M3-N
> +              - renesas,ipmmu-r8a77970 # R-Car V3M
> +              - renesas,ipmmu-r8a77980 # R-Car V3H
> +              - renesas,ipmmu-r8a77990 # R-Car E3
> +              - renesas,ipmmu-r8a77995 # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Specifiers for the MMU fault interrupts. For instances that support
> +      secure mode two interrupts must be specified, for non-secure and secure
> +      mode, in that order. For instances that don't support secure mode a
> +      single interrupt must be specified. Not required for cache IPMMUs.

    items:
      - description: <non-secure ...>
      - description: <secure ...>

> +
> +  '#iommu-cells':
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  renesas,ipmmu-main:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Reference to the main IPMMU instance in two cells. The first cell is
> +      a phandle to the main IPMMU and the second cell is the interrupt bit
> +      number associated with the particular cache IPMMU device. The interrupt
> +      bit number needs to match the main IPMMU IMSSTR register. Only used by
> +      cache IPMMU instances.

This property is not valid only on R-Car Gen2 and R-Mobile APE6.

(untested)

oneOf:
  - properties:
      contains:
        const: renesas,ipmmu-vmsa
  - properties:
      renesas,ipmmu-main:
        $ref: /schemas/types.yaml#/definitions/phandle-array
        description:
          [...]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
