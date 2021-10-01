Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C517841F372
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 19:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355428AbhJARp0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 13:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354723AbhJARp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 13:45:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCFDC061775
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 10:43:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id b192-20020a1c1bc9000000b0030cfaf18864so7256859wmb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Oct 2021 10:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JbCierPieNoW3/azUKor2WMUEq9XV26EWPgrT0BEXys=;
        b=q9m6EI2xLZu+udZrImKwlCmHMZmm+4wiTGo+A+DXi6zc/J5OOI1teKt18rla51wMx5
         y0V3xMNXQlxIA2yUEIvyvFZz9sr4SiIEUvdjgPWVK7kZdsKPLJgMFzxXfS8b5VGtXlKl
         YGvQxSrJqw5jcqkp6h/EcQuHBX6KBmnGeTLx/slusn1ct4G65vkS921sNaPEatJ3xjdd
         QLZONhOzuDVBGqDnMZHotx5FlHjTQDvMZe1qrne03hIsOIvQHS9RyA0hKzEVe9EmFW6o
         qF5AC7grcThH6vWoUpYM3kNq/Gb3XoAP1YOaEU65ngIpJkrYcbY2/rQygKA8mAGXjXUL
         dVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JbCierPieNoW3/azUKor2WMUEq9XV26EWPgrT0BEXys=;
        b=03T8SDHGTwSQrlmDcJXcXAZlXCzg+D6NdFiZZO/GJ0ixlIY+8vLOiOiuUeUhFdm3U0
         NzDPDNAzDEOqg/0Jh77XQZsuOnwPpHOKSmktBaD6DXGVOtYJoz3SQZsUsc0XcahY1X0n
         KqY2UxN3XAyv73M7CG/MgLqdN7P4gYl+9VEJjjK8i5kswS0Z7d2IBro1hBlTjUjp/ksb
         Q3cJm5WnizwtobLD5hoCWnHKaCzUq5JEfwzjaCDCf0L2Sg6O0TLfgsl5wYOBXC56TjeX
         fy4+0FnkfCNCBaQLx3mmzVJZ011ljrGgmXDzUbx4iEFpQgffVvYboC84Gy8fks59Ho5Y
         Q85g==
X-Gm-Message-State: AOAM532B8ME5kNQZzRN2i0CyHqE3ntu/VOSVARqUTLWXQGfH5O36Uzci
        9BgXMEVudVkywRWJ3+fC6J6FfQ==
X-Google-Smtp-Source: ABdhPJxo8kSEMkub10r1oi30AJapWK4Rfku+hO0xbpjs793Z2l8po+6OQS+QuMKVY5ObMsqB0z+Y/A==
X-Received: by 2002:a05:600c:40c4:: with SMTP id m4mr3295317wmh.116.1633110219928;
        Fri, 01 Oct 2021 10:43:39 -0700 (PDT)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id k1sm6525203wrl.33.2021.10.01.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:43:39 -0700 (PDT)
Date:   Fri, 1 Oct 2021 19:43:39 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,etheravb: Update example to
 match reality
Message-ID: <YVdIy9JF3et1DFT8@bismarck.dyn.berto.se>
References: <7590361db25e8c8b22021d3a4e87f9d304773533.1633090409.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7590361db25e8c8b22021d3a4e87f9d304773533.1633090409.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-10-01 14:13:55 +0200, Geert Uytterhoeven wrote:
>   - Add missing clock-names property,
>   - Add example compatible values for PHY subnode.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index 4c927d2c17d35d1b..bda821065a2b631f 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -287,6 +287,7 @@ examples:
>                                "ch13", "ch14", "ch15", "ch16", "ch17", "ch18",
>                                "ch19", "ch20", "ch21", "ch22", "ch23", "ch24";
>              clocks = <&cpg CPG_MOD 812>;
> +            clock-names = "fck";
>              iommus = <&ipmmu_ds0 16>;
>              power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>              resets = <&cpg 812>;
> @@ -298,6 +299,8 @@ examples:
>              #size-cells = <0>;
>  
>              phy0: ethernet-phy@0 {
> +                    compatible = "ethernet-phy-id0022.1622",
> +                                 "ethernet-phy-ieee802.3-c22";
>                      rxc-skew-ps = <1500>;
>                      reg = <0>;
>                      interrupt-parent = <&gpio2>;
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
