Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11437477D71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 21:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbhLPUXH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 15:23:07 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:45830 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbhLPUXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 15:23:06 -0500
Received: by mail-ot1-f47.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso262907otf.12;
        Thu, 16 Dec 2021 12:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O8UFdnai6s7snpmbwkSl36M4XrxKlc+aoRmeuFCVzpU=;
        b=bJU1uDt7wZScVoy+c2bBj0kmanZepJonRt5Tr9tUVKsOr8+bFhPYBIHNwkp113822H
         YxTjcPTp+6h0Viretl5KJKfVXEZzfAY5b5oOSDLJUNtaOEH9mKiWHQi5ojnDUzywTajg
         nm2K7jHPpgWJAQbDkG8RsveoZS2pa3QPoHWM+0iJ8ryXpcLHv+bmZHrXTbsOg4wlOTxs
         qYdtzAFLUhnMoKrrJSkhKQibEL7mGUxel+2lZuRLGONWth4cfyxv4euLL1hWOBrLA/Pq
         HmwbL8AIYT2SZ8XImpfugCXwgVL6uWauMeUpZrJ9ELCMd9GcJ/JRn2OOoT5ilbRQojqR
         4T7w==
X-Gm-Message-State: AOAM532e1uS3ugAzn9TH8btzERxDurO6GKWzg4Np7t2Ug+NKU3LC1gZ7
        CPUTDcV5pzcjqhlnGIdlRg==
X-Google-Smtp-Source: ABdhPJyndhm5K0m9V6/DCjWTrWsPJVH01HL98W25VKieC8BJwh1QrMqZCdZpi152ne28QCC7piMKew==
X-Received: by 2002:a05:6830:2693:: with SMTP id l19mr14584490otu.338.1639686185961;
        Thu, 16 Dec 2021 12:23:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j5sm1223576oou.23.2021.12.16.12.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:23:05 -0800 (PST)
Received: (nullmailer pid 693232 invoked by uid 1000);
        Thu, 16 Dec 2021 20:23:04 -0000
Date:   Thu, 16 Dec 2021 14:23:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
Message-ID: <YbugKD5KH/x+NavY@robh.at.kernel.org>
References: <20211215154619.166360-1-miquel.raynal@bootlin.com>
 <20211215154619.166360-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215154619.166360-2-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 15, 2021 at 04:46:16PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
> 
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> new file mode 100644
> index 000000000000..03a4e99b4d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,rzn1-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-nand-controller
> +      - const: renesas,rzn1-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB host controller clock
> +      - description: External NAND bus clock
> +
> +  clock-names:
> +    items:
> +      - const: hclk
> +      - const: eclk
> +
> +  "#address-cells": true
> +  "#size-cells": true

You can drop these 2 as nand-controller.yaml should cover them.

Reviewed-by: Rob Herring <robh@kernel.org>
