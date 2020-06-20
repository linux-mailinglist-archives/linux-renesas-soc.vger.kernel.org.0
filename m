Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38902025ED
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Jun 2020 20:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgFTSRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Jun 2020 14:17:04 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36849 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgFTSRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Jun 2020 14:17:03 -0400
Received: by mail-lf1-f67.google.com with SMTP id c21so7371090lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Jun 2020 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZYkYA7GIIhlmq6rZr8jPfVPdikjKFJ74S4uQrOZ8lX8=;
        b=jiTaB2ldE/0CqQAoMrgIJlY4sEHHGKkEqhV6Xq8/q37E+Tn8RpLWxg3sWKMjsWF6H4
         576KqLJUFxuFdaUfH6dS6fMdtiHOj48gA8H3AVYMF9IOa8lm9fzvBcpAafzbr8oOlHNn
         ia2Qr8BKIM65Lr143XbZd93594eQzH1+GYVYXd/YUXcHmT5H5xpJY50L12DrmxZh9BJv
         H3rlsMSuUodIU+bV3RJ/Nu3b4MxndDppcW4IjF6R3QOl10/gl1hl2Yu/lHpGG4u/mAj4
         taV9VU/fiFVM34OszxcPwph5u/Xb30CanL+9yVntWcpElrtmZW8pLLZlQm0cHLKt7ecN
         Tvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZYkYA7GIIhlmq6rZr8jPfVPdikjKFJ74S4uQrOZ8lX8=;
        b=Nd7x5xaeNf1hWZCRckFoFkkEiz0eOKvjkaStPbZ8zcr3eBLdsX+1Qqj6YHjw0nCH5C
         JmMK2WaNuEcfA0F40swdqVzx+jjCDKfw4P2kX9pQrxB84JQJVUe/cf6TatfhoNeZiaWl
         uHHaH5fewT9Ssf4C/dVRVI01FLKZHWLQbzOSx8i9Q7+6mb+ZDt8mAcBx97Ny2f2YalGu
         ppVaKzvjEzBXz4qKpMKiNgGMTugZw0zWjwAW96eXqrjCd6oylapoNeMVszu6uiKVvLgq
         oCnXqIf5eEMw+jUalTXIWlvVolRweggi1Eo1n7SAqWmc4aAD/cN2XnlXcd/MDE1KCb44
         OA1g==
X-Gm-Message-State: AOAM530oOBAEwQCoBemvs/uIeKUAYDuJUaxU2Ygd1dBJ4ymQLJyd8hg8
        p4L8vpcuTCwKKIgO7aQUmjcPkR6p45YeVQ==
X-Google-Smtp-Source: ABdhPJwYTcUhykaqUtrSppn7BOgc04zksumGxOWHqE0qSBOnw4nB+XC8v6UBOTPrOEbQ2rpLWP9HsA==
X-Received: by 2002:ac2:52af:: with SMTP id r15mr2675378lfm.24.1592676961072;
        Sat, 20 Jun 2020 11:16:01 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:462b:c4af:1cf5:65ea:51a9:9da1])
        by smtp.gmail.com with ESMTPSA id x64sm130214lff.14.2020.06.20.11.15.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Jun 2020 11:16:00 -0700 (PDT)
Subject: Re: [PATCH/RFC 1/5] dt-bindings: net: renesas,ravb: Document internal
 clock delay properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200619191554.24942-1-geert+renesas@glider.be>
 <20200619191554.24942-2-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <75d3e6c2-9dbd-eec0-12e6-55eaef7c745a@cogentembedded.com>
Date:   Sat, 20 Jun 2020 21:15:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200619191554.24942-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/19/2020 10:15 PM, Geert Uytterhoeven wrote:

> Some EtherAVB variants support internal clock delay configuration, which
> can add larger delays than the delays that are typically supported by
> the PHY (using an "rgmii-*id" PHY mode, and/or "[rt]xc-skew-ps"
> properties).
> 
> Add properties for configuring the internal MAC delays.
> These properties are mandatory, even when specified as zero, to
> distinguish between old and new DTBs.
> 
> Update the example accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/net/renesas,ravb.txt  | 29 ++++++++++---------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> index 032b76f14f4fdb38..488ada78b6169b8e 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
> +++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
> @@ -64,6 +64,18 @@ Optional properties:
>  			 AVB_LINK signal.
>  - renesas,ether-link-active-low: boolean, specify when the AVB_LINK signal is
>  				 active-low instead of normal active-high.
> +- renesas,rxc-delay-ps: Internal RX clock delay.
> +			This property is mandatory and valid only on R-Car Gen3
> +			and RZ/G2 SoCs.
> +			Valid values are 0 and 1800.
> +			A non-zero value is allowed only if phy-mode = "rgmii".
> +			Zero is not supported on R-Car D3.

   Hm, where did you see about the D3 limitation?

> +- renesas,txc-delay-ps: Internal TX clock delay.
> +			This property is mandatory and valid only on R-Car H3,
> +			M3-W, M3-W+, M3-N, V3M, and V3H, and RZ/G2M and RZ/G2N.
> +			Valid values are 0 and 2000.
> +			A non-zero value is allowed only if phy-mode = "rgmii".
> +			Zero is not supported on R-Car V3H.

  Same question about V3H here...

[...]
> @@ -105,8 +117,10 @@ Example:
>  				  "ch24";
>  		clocks = <&cpg CPG_MOD 812>;
>  		power-domains = <&cpg>;
> -		phy-mode = "rgmii-id";
> +		phy-mode = "rgmii";
>  		phy-handle = <&phy0>;
> +		renesas,rxc-delay-ps = <0>;

   Mhm, zero RX delay in RGMII-ID mode?

> +		renesas,txc-delay-ps = <2000>;
>  
>  		pinctrl-0 = <&ether_pins>;
>  		pinctrl-names = "default";
> @@ -115,18 +129,7 @@ Example:
>  		#size-cells = <0>;
>  
>  		phy0: ethernet-phy@0 {
> -			rxc-skew-ps = <900>;
> -			rxdv-skew-ps = <0>;
> -			rxd0-skew-ps = <0>;
> -			rxd1-skew-ps = <0>;
> -			rxd2-skew-ps = <0>;
> -			rxd3-skew-ps = <0>;
> -			txc-skew-ps = <900>;
> -			txen-skew-ps = <0>;
> -			txd0-skew-ps = <0>;
> -			txd1-skew-ps = <0>;
> -			txd2-skew-ps = <0>;
> -			txd3-skew-ps = <0>;
> +			rxc-skew-ps = <1500>;

   Ah, you're relying on a PHY?

[...]

MBR, Sergei
