Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5425EFC55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 19:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiI2Rww (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 13:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbiI2Rwu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 13:52:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5E6146639;
        Thu, 29 Sep 2022 10:52:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46D99620AE;
        Thu, 29 Sep 2022 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A1CC433C1;
        Thu, 29 Sep 2022 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664473968;
        bh=6RkdqatvXniTqq3irGHyhxNMR9dOkRwo4amwsdmSxs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pismeB3ua2lBfXLrtYHzNJ9uGFgE3Mr6kMBhIlwf+6K43PQyPaMexVt9i5WLtpL+i
         LTCbQZh1Jz2D79SPwGdwT9kCXnLDc8TsAXiVSP3TDX3HPAzcTC92BUFJ7jR03p0pLi
         bep0w0yFquHmFFbLpQcO0/blTLklXWyJYMws0/qosKZpqm6mpfWxv3q0yrfIQv5fkr
         1KHKpYV52+mAv1Xe5q0pBL5+U7JLdLQi/fHcXWf/rp7Hk/xmIczO5BxrbcXi8m1DlF
         EaEKGyPAXdgscLwRXzDPMtd5VKCuRFEEJszHvVml1CFcVIvjXdMzvi2BrC0lpwx30K
         ugdsKe99nQS5A==
Date:   Thu, 29 Sep 2022 18:52:43 +0100
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Message-ID: <YzXba2Sk0jBYof4S@google.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Sep 2022, Biju Das wrote:

> Document 16-bit and 32-bit phase counting mode support on
> RZ/G2L MTU3 IP.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  * Updated commit header.
> ---
>  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)

Counter binding?

> diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> index c1fae8e8d9f9..c4bcf28623d6 100644
> --- a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> @@ -192,6 +192,37 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +patternProperties:
> +  "^counter@[1-2]+$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: renesas,rzg2l-mtu3-counter
> +
> +      reg:
> +        description: Identify counter channels.
> +        items:
> +          enum: [ 1, 2 ]
> +
> +      renesas,32bit-phase-counting:
> +        type: boolean
> +        description: Enable 32-bit phase counting mode.
> +
> +      renesas,ext-input-phase-clock-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1 ]
> +        default: 1
> +        description: |
> +          Selects the external clock pin for phase counting mode.
> +            <0> : MTCLKA and MTCLKB are selected for the external phase clock.
> +            <1> : MTCLKC and MTCLKD are selected for the external phase clock
> +                  (default)
> +
> +    required:
> +      - compatible
> +      - reg
> +
>  required:
>    - compatible
>    - reg
> @@ -270,6 +301,10 @@ examples:
>        clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
>        power-domains = <&cpg>;
>        resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
> +      counter@1 {
> +        compatible = "renesas,rzg2l-mtu3-counter";
> +        reg = <1>;
> +      };
>      };
>  
>  ...

-- 
Lee Jones [李琼斯]
