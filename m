Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB16613884C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2020 21:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387451AbgALU5x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Jan 2020 15:57:53 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33869 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732825AbgALU5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Jan 2020 15:57:52 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so7809740ljg.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jan 2020 12:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UN4XReRlpltgJU5IYYlZuWIY+d5JPFL7kZ7D18dHO8M=;
        b=SbmE2sI4DDp3iy5iAWsofij8Uy3C8/RwP3ouXjGqlPU7TbByzWAh7b+dGOZY3nGHAz
         I7raA62FrZQKMaBb7qaMxEEvEImdee0Y7lkTj3UoeU28hmpzv1nEPv9tfWrueIZfBqr7
         YhNxcPmUEA4Pm8FRneIOPgVbFtJTO0L40T4/aVuJe6Byy12//OV808neJaNIC9ZM6rxQ
         nkAhVXHpeZfHHXXQ07obcSEUv1Fm/DsyHbjuta4EH/R27573xk0AZ3Y/cZm069ME3dz9
         tpS54FaOp1ac5Pc2T9brt7Dpxp1o6wKXJeyaowqhdq5JPxbQyWC+Ju2jwBEtw/KSBTbL
         RXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UN4XReRlpltgJU5IYYlZuWIY+d5JPFL7kZ7D18dHO8M=;
        b=YFXe7nnUCmovt50718QC4FJrS9+Izu3zdQC4E+KRslNQ4iiGCjEeD4qIYbOE3zdpwd
         PEA/jchS4RlsdutRdbvaoQqyBBQzwYI1AbUf88tgaIgQXmwFKCPxldjWNCfNIoaQ86Vt
         TfCHvNijVaPR1BaXAruaUWZ9hxZPKZo8/aRVkj+opyc3v+Awe4a5ZP4ceNJERxMshabg
         2GXt+HGFFRbgMcQmz21lVl02aK236CnBI0bFWPrUF9mXb+tAPCKzYip+3CdtV4T06WHQ
         kYG7HF1ybYnWWDypVxAhYF46wKMnJ8kOY5TX5Le2aVwhxkdZ5NS0JOrELZq5MmU2gRF7
         CU9w==
X-Gm-Message-State: APjAAAXrzVntkpfR7+AdXO03Z/7/US+pip9M6egFfkinvvrc3VALzeWP
        SazDZG4zya4gHPmZPpehuCrB+g==
X-Google-Smtp-Source: APXvYqzu2xf1jitE7NWQvGX/9YYxnhkYBbfPIGbZMA/npAq9/I499WZuYQbzbxaRTyWO6CVoy66CMw==
X-Received: by 2002:a2e:9ad0:: with SMTP id p16mr8919557ljj.111.1578862670960;
        Sun, 12 Jan 2020 12:57:50 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id s2sm4740936lji.53.2020.01.12.12.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 12:57:50 -0800 (PST)
Date:   Sun, 12 Jan 2020 21:57:49 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     marek.vasut@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
Message-ID: <20200112205749.GB784242@oden.dyn.berto.se>
References: <20200112191315.118831-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200112191315.118831-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thanks for your work.

On 2020-01-12 20:13:15 +0100, Marek Vasut wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> The ethernet PHY reset GPIO was missing and the kernel was depending
> solely on the bootloader to bring the PHY out of reset. Fix this to
> get rid of the dependency on bootloader.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> NOTE: Thus far tested on R8A7791 Koelsch

I also only have a Koelsch board, but for what it's worth (for Koelsch):

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
>  arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
>  arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
>  arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
>  arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
>  arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
>  7 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
> index 097fd9317c6e..b88d4f4d5d9e 100644
> --- a/arch/arm/boot/dts/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> @@ -671,6 +671,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
> index a315ba749aa4..98dcfcbf0b70 100644
> --- a/arch/arm/boot/dts/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/r8a7790-stout.dts
> @@ -200,6 +200,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 2b096d5e06fb..6619689a17d4 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -630,6 +630,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
> index f9ece7ab2010..2ba2e8e5f1c3 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -304,6 +304,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
> index 22ca7cd1e7d2..4da82f1e1e94 100644
> --- a/arch/arm/boot/dts/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> @@ -588,6 +588,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
> index f79fce74cd9c..7aa1e8ca808b 100644
> --- a/arch/arm/boot/dts/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> @@ -340,6 +340,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
> index 2c16ad854300..3c0ed684f4a1 100644
> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -391,6 +391,7 @@ &ether {
>  
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +		reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
>  		interrupt-parent = <&irqc0>;
>  		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>  		micrel,led-mode = <1>;
> -- 
> 2.24.1
> 

-- 
Regards,
Niklas Söderlund
