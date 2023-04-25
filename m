Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBC66EDA64
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 04:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjDYC67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 22:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjDYC66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 22:58:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE5719BC;
        Mon, 24 Apr 2023 19:58:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D3A175B;
        Tue, 25 Apr 2023 04:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682391525;
        bh=HIuAn28NxFXj/Q/jaDa9uJMDtQZhMt10o46khfhmUrI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jvOdaUVY633oD0we8rZN87f/W0ntol6zJEVpDt85sTlVv/fh1LOC86+MGoQZ27SXY
         mGR5Yc63EcnRJ/PHHrUC9rGU+M0b0dEOM8X3ztLtDpmzyFeYDPIkYty2G+DRvRj2Yv
         CUpeOH3NjlA74O8DAoR/aXGo+KUT+ERgQeXiv4k8=
Date:   Tue, 25 Apr 2023 05:59:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 3/5] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
Message-ID: <20230425025907.GB11371@pendragon.ideasonboard.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Apr 24, 2023 at 05:10:22PM +0100, Biju Das wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v7->v8:
>  * Fixed the typo vsp2->du
>  * Added Rb tag from Rob as the change is trivial.
> v7:
>  * New patch.
> ---
>  .../devicetree/bindings/display/renesas,rzg2l-du.yaml    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index ab99e7d57a7d..98686ea84d53 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -16,8 +16,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +    oneOf:
> +      - enum:
> +          - renesas,r9a07g044-du # RZ/G2{L,LC}
> +      - items:
> +          - enum:
> +              - renesas,r9a07g054-du    # RZ/V2L
> +          - const: renesas,r9a07g044-du # RZ/G2L fallback
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart
