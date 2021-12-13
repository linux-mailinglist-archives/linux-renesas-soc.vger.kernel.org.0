Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41147322C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 17:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241030AbhLMQqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 11:46:20 -0500
Received: from foss.arm.com ([217.140.110.172]:60116 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241018AbhLMQqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 11:46:07 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A3FD1FB;
        Mon, 13 Dec 2021 08:46:05 -0800 (PST)
Received: from [10.57.6.131] (unknown [10.57.6.131])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DCE33F73B;
        Mon, 13 Dec 2021 08:46:03 -0800 (PST)
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        tomeu.vizoso@collabora.com,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Robin Murphy <robin.murphy@arm.com>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <20211208104026.421-2-biju.das.jz@bp.renesas.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <46cf467b-8385-167e-1fde-64fcb9859bc6@arm.com>
Date:   Mon, 13 Dec 2021 16:46:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208104026.421-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08/12/2021 10:40, Biju Das wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
>  * minimum number of reset for the generic GPU is set to 1.
>  * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
>    SoC-specific conditional schemas.
> v1->v2:
>  * Updated minItems for resets as 2
>  * Documented optional property reset-names
>  * Documented reset-names as required property for RZ/G2L SoC.
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 6f98dd55fb4c..63a08f3f321d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>            - amlogic,meson-g12a-mali
>            - mediatek,mt8183-mali
>            - realtek,rtd1619-mali
> +          - renesas,r9a07g044-mali
>            - rockchip,px30-mali
>            - rockchip,rk3568-mali
>        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -27,19 +28,26 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> +    minItems: 3
>      items:
>        - description: Job interrupt
>        - description: MMU interrupt
>        - description: GPU interrupt
> +      - description: Event interrupt
>  
>    interrupt-names:
> +    minItems: 3
>      items:
>        - const: job
>        - const: mmu
>        - const: gpu
> +      - const: event

FWIW: I think it's fair to add the "event" interrupt even if it isn't
included in the bindings for kbase. While pretty much useless on Bifrost
it is a hardware feature and in theory it could be used.

Reviewed-by: Steven Price <steven.price@arm.com>

Steve

>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names: true
>  
>    mali-supply: true
>  
> @@ -52,7 +60,10 @@ properties:
>      maxItems: 3
>  
>    resets:
> -    maxItems: 2
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names: true
>  
>    "#cooling-cells":
>      const: 2
> @@ -94,6 +105,36 @@ allOf:
>      then:
>        required:
>          - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-mali
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 4
> +        interrupt-names:
> +          minItems: 4
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: gpu
> +            - const: bus
> +            - const: bus_ace
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          items:
> +            - const: rst
> +            - const: axi_rst
> +            - const: ace_rst
> +      required:
> +        - clock-names
> +        - power-domains
> +        - resets
> +        - reset-names
>    - if:
>        properties:
>          compatible:
> 

