Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010EE5A1777
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 19:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243291AbiHYRBq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 13:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242462AbiHYRBf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 13:01:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47C5B8A6D;
        Thu, 25 Aug 2022 10:01:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 645D7484;
        Thu, 25 Aug 2022 19:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661446873;
        bh=FCUk4UJs1rAXkD8yKTUi2xkLbxR8BSJnGHMDu6Tlv+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vVP5b4Ckd32ZmkRmIQfXChFT5SUW6KhbWgJ0Se0q3FUd+rZN8UrRZ2+P4aSo1gIUT
         TIqEDNB6jZGLySOL9TllsKec8hnvyTPHEw2LLRQjUezztg1py516hwnmr+5WlHG+86
         p0WCAxjma9wDigMZDbXgA+6PpdwztKRuLxVBwkxU=
Date:   Thu, 25 Aug 2022 20:01:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marex@denx.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
Message-ID: <Yweq0zrChN+dSwYM@pendragon.ideasonboard.com>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On Thu, Aug 25, 2022 at 02:33:32PM +0300, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 1 -
>  .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml  | 2 --
>  Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml    | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> index 0abd6ba82dfd..82836086cac1 100644
> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -23,7 +23,6 @@ properties:
>    clocks:
>      description:
>        Common clock binding for CLK_IN, XTI/REF_CLK
> -    minItems: 2
>      maxItems: 2
>  
>    clock-names:
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
> index 6eaabb4d82ec..81f09df7147e 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
> @@ -47,7 +47,6 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 4
>      maxItems: 4
>  
>    clock-names:
> @@ -64,7 +63,6 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    minItems: 2
>      maxItems: 2
>  
>    reset-names:
> diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
> index 9248bfc16d48..d5296e6053a1 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
> @@ -34,7 +34,6 @@ properties:
>      const: 1
>  
>    clock-output-names:
> -    minItems: 3
>      maxItems: 3
>      description: Names for AP, CP and BT clocks.
>  

-- 
Regards,

Laurent Pinchart
