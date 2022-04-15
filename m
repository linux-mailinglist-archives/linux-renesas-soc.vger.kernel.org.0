Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63AFB5028BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 13:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349541AbiDOLQf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Apr 2022 07:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245413AbiDOLQf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Apr 2022 07:16:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DA69D04F;
        Fri, 15 Apr 2022 04:14:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-71-107-nat.elisa-mobile.fi [85.76.71.107])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E5F8482;
        Fri, 15 Apr 2022 13:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650021244;
        bh=qzpqaJiap4/DKYJZDwgAmyj6MPeXNP+N02wxXKN4cGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RQwxV/pyn48mqyN34K9eBfLiqTeSEKCeQs2dYVMVOKOt3zyUPzkSuuPPueR9onMY1
         klR6ZwpxkTgBST0aPM6/Shielw3JNBv8sn9C1AdKnkzpV5Yk8D8o4O4kR6CC7vOExD
         pnvFlVQS84Rb8pOUfPf6zjT8i1jY6Mw7dVo7Qc88=
Date:   Fri, 15 Apr 2022 14:14:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <YllTed2IIAwWva6F@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:54PM +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.

Stupid question, but as this DU and the R-Car DU are completely
different pieces of hardware, wouldn't a separate bindings file make
sense ?

The DT description in this patch looks good to me.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description.
>  * Removed LCDC references
>  * Changed clock name from du.0->aclk
>  * Changed reset name from du.0->du
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
> RFC:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 13efea574584..f560608bf4e8 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -824,6 +825,59 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Register access clock
> +            - description: Video clock
> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pclk
> +            - const: vclk
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          maxItems: 1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart
