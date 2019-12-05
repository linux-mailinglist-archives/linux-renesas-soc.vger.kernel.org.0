Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12CB9114658
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 18:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbfLER4S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 12:56:18 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37399 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbfLER4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 12:56:18 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so4623770lja.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2019 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=c4t/2lH9ADnhGOla0nH+1fkWqSg9AnmdrIjfqIOk9Mk=;
        b=CyujlaIgveuIQDkTmHRARroODnsP0l8ebNnlLr/WwEPrOwxoaZlQ5YdC3DgODinCQJ
         1C8ddc4GaR6+7eqhAuEXg31uUCj25Cxi0wVoB+sGU9GWG6wDSgSPbUZI+ByIP4ah6M08
         UZhP+FgJwszIcvqzSztw0pERIUaFw5kVqyK1SxUgitraUbWqETN9gfFeO4R7pBmdfvBK
         Gjl0aBteS2rtODUFNnWnYJFZ/2h7lCzFTOn+6Gownz6WOFkDJU9zI9P2bwuYyGRjSXAs
         VJJNHdAVLJ2tt/NlY8AYKOJXaW9cQU/S0+4N/3eDBgO3XytmNMZ1JhAufPh5Mj88hiH5
         lZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=c4t/2lH9ADnhGOla0nH+1fkWqSg9AnmdrIjfqIOk9Mk=;
        b=FesDOwJaRJHO0DdDAYWBijeD6FrFlIxqHOvTT3rwA2Ba7KwxcGmGjlsEzug7K0jRKD
         92Thqawal10cUAYkjlj/HB7Ng39qK/Zl5R+//CAL7bMAUx3+tnnuCp7ptYzTK1xVCeI5
         +cGNIjKRhgAAE/BqypVCGw0ESjJenGaMfKDzpIABNEJ/iNi/KMZRq+QvqubwMtd6lQ8+
         Got6p7LgGjo30/yJdL0U0/uzN4elTdDG2Djj6dJwQOMSWj/+11+QMZpkbGWTLiVJFx7O
         MlYympx1jMe7MKjpF0nYUfSmDwcWnVUKT5AL4+zwtkvkXwP4Vdl1l6DmRE/8PcZoESwt
         wDHw==
X-Gm-Message-State: APjAAAX4ZYsbf1NjtkEjc2RR3h2d07jIETeyKtVkgujx7jAOquFBBn/D
        yR1PstC8kdJhr5U0FBAGoz+rbFj8HD8=
X-Google-Smtp-Source: APXvYqztueSe84EvxOgy/5oWqGBVCnt1FjjfsdvaYI9RZmrsOXFgNBejQD6MS3BEIRTsJ7T1F5v8wg==
X-Received: by 2002:a05:651c:204f:: with SMTP id t15mr6593009ljo.240.1575568576925;
        Thu, 05 Dec 2019 09:56:16 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z13sm5332330ljh.21.2019.12.05.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:56:16 -0800 (PST)
Date:   Thu, 5 Dec 2019 18:56:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: ravb: Document r8a77961 support
Message-ID: <20191205175615.GG28879@bigcity.dyn.berto.se>
References: <20191205134504.6533-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191205134504.6533-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-12-05 14:45:04 +0100, Geert Uytterhoeven wrote:
> Document support for the Ethernet AVB interface in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,ravb.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> index 5df4aa7f681154ee..87dad2dd8ca0cd6c 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -21,7 +21,8 @@ Required properties:
>        - "renesas,etheravb-r8a774b1" for the R8A774B1 SoC.
>        - "renesas,etheravb-r8a774c0" for the R8A774C0 SoC.
>        - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
> -      - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
> +      - "renesas,etheravb-r8a7796" for the R8A77960 SoC.
> +      - "renesas,etheravb-r8a77961" for the R8A77961 SoC.
>        - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
>        - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
>        - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
> @@ -37,8 +38,8 @@ Required properties:
>  - reg: Offset and length of (1) the register block and (2) the stream buffer.
>         The region for the register block is mandatory.
>         The region for the stream buffer is optional, as it is only present on
> -       R-Car Gen2 and RZ/G1 SoCs, and on R-Car H3 (R8A7795), M3-W (R8A7796),
> -       and M3-N (R8A77965).
> +       R-Car Gen2 and RZ/G1 SoCs, and on R-Car H3 (R8A7795), M3-W (R8A77960),
> +       M3-W+ (R8A77961), and M3-N (R8A77965).
>  - interrupts: A list of interrupt-specifiers, one for each entry in
>  	      interrupt-names.
>  	      If interrupt-names is not present, an interrupt specifier
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
