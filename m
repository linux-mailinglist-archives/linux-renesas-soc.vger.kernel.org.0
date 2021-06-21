Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC143AE20D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 06:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFUELk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 00:11:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229807AbhFUELi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 00:11:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D002F61009;
        Mon, 21 Jun 2021 04:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624248104;
        bh=MGtK5Q8aQv5cOmJha8F0EMM1SwE+xd03W08dLK11hDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ljax6mjU1oYqOyJmlUcirdeeFHbfv87ldbj0CKVpgzQ73BGgWo1skBfF5azmiJOpK
         sfLPnhMnxAYIsoNQC8/YINANqKAnENw1yREWwbbk7JpaQb7qwJJEln8XMKjDfO96pC
         bNamfH/PKNSN9/Fke6YgGXlOozM2hcVi3JaPp8Op+uWWvNH6Hpm4XcTl/tzQlUVmjh
         6ZFQ7AdZZSkNKOHUhi7LQXD1wMQ3ha7ymcS8lHeYOv4OlAAK6Ey115a1x35zf1nJes
         18De9b4YecvVWDwNdVQf9iEQV6YlPzkaoob/1Uz9A7q9WHibveaHJEt505LWIpgBsO
         Qp8Hfftrvfxow==
Date:   Mon, 21 Jun 2021 09:31:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: renesas: Document RZ/G2L USB PHY
 Control bindings
Message-ID: <YNAPJZ2nUB7rp0FU@vkoul-mobl>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
 <20210611134642.24029-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611134642.24029-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11-06-21, 14:46, Biju Das wrote:
> Add device tree binding document for RZ/G2L USB PHY control driver.

Rob ?

> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> new file mode 100644
> index 000000000000..5fd316a2e79e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,rzg2l-usbphyctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L USB2.0 PHY Control
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description:
> +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down of the
> +  USB/PHY.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> +      - const: renesas,rzg2l-usbphyctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    # see phy-bindings.txt in the same directory
> +    const: 1
> +    description: |
> +      The phandle's argument in the PHY specifier is the phy reset control bit
> +      of usb phy control.
> +      0 = Port 1 Phy reset
> +      1 = Port 2 Phy reset
> +    enum: [ 0, 1 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbphyctrl@11c40000 {
> +        compatible = "renesas,r9a07g044-usbphyctrl",
> +                     "renesas,rzg2l-usbphyctrl";
> +        reg = <0x11c40000 0x10000>;
> +        #phy-cells = <1>;
> +    };
> -- 
> 2.17.1

-- 
~Vinod
