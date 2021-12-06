Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6280446A274
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 18:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhLFRMk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 12:12:40 -0500
Received: from foss.arm.com ([217.140.110.172]:35912 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhLFRMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 12:12:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE1B91042;
        Mon,  6 Dec 2021 09:09:10 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572A03F73B;
        Mon,  6 Dec 2021 09:09:08 -0800 (PST)
Message-ID: <3b6c454a-1572-9344-0436-2866615c3a6d@arm.com>
Date:   Mon, 6 Dec 2021 17:08:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Content-Language: en-GB
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        tomeu.vizoso@collabora.com, Steven Price <steven.price@arm.com>
References: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
 <20211206150025.15703-2-biju.das.jz@bp.renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211206150025.15703-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-12-06 15:00, Biju Das wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>   * Updated minItems for resets as 2
>   * Documented optional property reset-names
>   * Documented reset-names as required property for RZ/G2L SoC.
> ---
>   .../bindings/gpu/arm,mali-bifrost.yaml        | 39 ++++++++++++++++++-
>   1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 6f98dd55fb4c..c3b2f4ddd520 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>             - amlogic,meson-g12a-mali
>             - mediatek,mt8183-mali
>             - realtek,rtd1619-mali
> +          - renesas,r9a07g044-mali
>             - rockchip,px30-mali
>             - rockchip,rk3568-mali
>         - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -27,19 +28,30 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> +    minItems: 3
>       items:
>         - description: Job interrupt
>         - description: MMU interrupt
>         - description: GPU interrupt
> +      - description: EVENT interrupt

I believe we haven't bothered with the "Event" interrupt so far since 
there's no real meaningful use for it - it seems the downstream binding 
for Arm's kbase driver doesn't mention it either.

>     interrupt-names:
> +    minItems: 3
>       items:
>         - const: job
>         - const: mmu
>         - const: gpu
> +      - const: event
>   
>     clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: gpu
> +      - const: bus
> +      - const: bus_ace

Note that the Bifrost GPUs themselves all only have a single external 
clock and reset (unexcitingly named "CLK" and "RESETn" respectively, 
FWIW). I can't help feeling wary that defining additional names for 
vendor integration details in the core binding may quickly grow into a 
mess of mutually-incompatible sets of values, for no great benefit. At 
the very least, it would seem more sensible to put them in the 
SoC-specific conditional schemas.

Robin.

>   
>     mali-supply: true
>   
> @@ -52,7 +64,14 @@ properties:
>       maxItems: 3
>   
>     resets:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
> +
> +  reset-names:
> +    items:
> +      - const: rst
> +      - const: axi_rst
> +      - const: ace_rst
>   
>     "#cooling-cells":
>       const: 2
> @@ -113,6 +132,22 @@ allOf:
>           - sram-supply
>           - power-domains
>           - power-domain-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-mali
> +    then:
> +      properties:
> +        interrupt-names:
> +          minItems: 4
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - clock-names
> +        - power-domains
> +        - resets
> +        - reset-names
>       else:
>         properties:
>           power-domains:
> 
