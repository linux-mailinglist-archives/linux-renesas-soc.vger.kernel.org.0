Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0CE41768D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 16:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346601AbhIXOJR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 10:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbhIXOJR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 10:09:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF888C061571;
        Fri, 24 Sep 2021 07:07:43 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8D7345E;
        Fri, 24 Sep 2021 16:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632492461;
        bh=AwPmXkRlyjGfTUBeWuuwp376O+K8p10BbvbV7ciTI14=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oviW0a58rWiVPYftqBagCjaMu2CEKo7FVI+ERAOCArVDRFI69LIMODMD6n/+04TAo
         Cwu4Nlit0wbWflpJXFDxD9k+rBmyAJ8lir+NpyvFImk8eT73DpyBIbtbMh1tImnB7K
         J6hYG8NNb+KvKk0k84GtGWJ9yESM8JHR7u4539Rs=
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sandeep Panda <spanda@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <59cdc5f1-0fe1-d1d4-87b4-4ab13dd20eba@ideasonboard.com>
Date:   Fri, 24 Sep 2021 15:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/09/2021 13:35, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml: bridge@2c: reg:0:0: 45 was expected
> 
> According to the datasheet, the I2C address can be either 0x2c or 0x2d,
> depending on the ADDR control input.
> 
> Fixes: e3896e6dddf0b821 ("dt-bindings: drm/bridge: Document sn65dsi86 bridge bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Also seen with the in-flight Falcon DSI display output patch:

And having been running dtbs_check today on this branch I was going to
tackle this same issue ...

But you've beaten me to it ;-)

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> 
>     arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: sn65dsi86@2c: reg:0:0: 45 was expected
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 1c2daf7c24cc0417..911564468c5e0f86 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -18,7 +18,7 @@ properties:
>      const: ti,sn65dsi86
>  
>    reg:
> -    const: 0x2d
> +    enum: [ 0x2c, 0x2d ]
>  
>    enable-gpios:
>      maxItems: 1
> 


-- 
--
Kieran
