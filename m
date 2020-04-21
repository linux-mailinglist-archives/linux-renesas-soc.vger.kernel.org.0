Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1B71B2526
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 13:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDULdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 07:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDULdY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 07:33:24 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD5AC061A0F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 04:33:22 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b2so8123572ljp.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pASQ1uESA6/kWIkQaxhxKLvSZcIndKE3FF71ECQy5SE=;
        b=nKzdxEjwi3K08HrRB1/OvUS/HcnV1wAvJc3hqq2tRwPyiWSA7mCW46d2l011ike/Ru
         dL7aiJp8Tnk7w1nMjx1P5Bx4twJPBGuTFpwxeCnfh5W5HRrecYa9UZjFUKtDjGHVIYU9
         L65tHodjEDOpOJZ3iNsplHP7scNAe0lLbdztBe/Rx54XwBJLu9iajkLLW9Olsow0xcm8
         ril1VhElcAz7EvK7penOT7dLQdDHlPtXfzMqctZPyg+JiiDTeGKJ6eyEWL7BKUIebGuf
         kf9budFqpKvYXL3u9cMzt4e8KyJmpEEWztp86YhFFpUQcGHimaY9aQzFZBTc3PGgx69E
         49WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pASQ1uESA6/kWIkQaxhxKLvSZcIndKE3FF71ECQy5SE=;
        b=hD5lZPrKr/xJ18ZqoHTRD6zlBuQsMpt875EL2zJRD1W7RScobDOwl31guBq5kgJB/R
         Krawj6z+ygrnmGYwfouW2NL/+oyo6s3XnYhhjzlrC4jHoOFAcGqe0TgsiidnBwahKNwH
         wtXNOwyc7XE/vYFKZaM5PqBQAKr24OvsDk71ENa9fdx6+ix+RTXwisy3vScbvlR5FnFX
         dWXG6DBK/6Y9tp63cWuSxPlaNYOofbvRcgcPSTP8iuiAyNP6K2obSm9fkpQIdB5/3V1r
         8DvOgOhjPHnRaw1dayEYIK6JHsscyC5TH0WK6nMPSQ2w0ZWWeZ0CCH/NFpWTx9Iw0BDh
         kvLw==
X-Gm-Message-State: AGi0PuZE6mHHkrNtyoZ1BEQ4RpkV5j/A/kVoR6rg3+/XGxu6m9U9ApiN
        4onjfh+46yoDhyWhoHfjCBjABA==
X-Google-Smtp-Source: APiQypIaj226q0GDPd7Gup/q1afrEhs3FaZHQKW76NXx2egsBtYlHq0U+SYQwjbP7eAmOChoRvMtTg==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr9066352ljj.195.1587468801003;
        Tue, 21 Apr 2020 04:33:21 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m16sm1824513ljp.12.2020.04.21.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 04:33:20 -0700 (PDT)
Date:   Tue, 21 Apr 2020 13:33:19 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: Fix IOMMU device node names
Message-ID: <20200421113319.GA2600980@oden.dyn.berto.se>
References: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Shimoda-san,

Thanks for your work.

On 2020-04-21 18:35:56 +0900, Yoshihiro Shimoda wrote:
> Fix IOMMU device node names as "iommu@".
> 
> Fixes: bbb44da0b595 ("ARM: dts: r8a7743: Add IPMMU DT nodes")
> Fixes: 0dcba3de5835 ("ARM: dts: r8a7745: Add IPMMU DT nodes")
> Fixes: 350ae49b97c4 ("ARM: dts: r8a7744: Add IPMMU DT nodes")
> Fixes: 70496727c082 ("ARM: shmobile: r8a7790: Add IPMMU DT nodes")
> Fixes: f1951852ed17 ("ARM: shmobile: r8a7791: Add IPMMU DT nodes")
> Fixes: 098cb3a601e6 ("ARM: shmobile: r8a7793: Add IPMMU nodes")
> Fixes: 1cb2794f6082 ("ARM: shmobile: r8a7794: Add IPMMU DT nodes")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 12 ++++++------
>  arch/arm/boot/dts/r8a7744.dtsi | 12 ++++++------
>  arch/arm/boot/dts/r8a7745.dtsi | 12 ++++++------
>  arch/arm/boot/dts/r8a7790.dtsi | 12 ++++++------
>  arch/arm/boot/dts/r8a7791.dtsi | 14 +++++++-------
>  arch/arm/boot/dts/r8a7793.dtsi | 14 +++++++-------
>  arch/arm/boot/dts/r8a7794.dtsi | 12 ++++++------
>  7 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 1cd19a5..527a018 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -338,7 +338,7 @@
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -348,7 +348,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -357,7 +357,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -367,7 +367,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -376,7 +376,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -386,7 +386,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7743",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 1c82dd0..d7480b0 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -338,7 +338,7 @@
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -348,7 +348,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -357,7 +357,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -367,7 +367,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -376,7 +376,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -386,7 +386,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7744",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 3f88a7e..bd28f9b 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -302,7 +302,7 @@
>  			resets = <&cpg 407>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -312,7 +312,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -321,7 +321,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -331,7 +331,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -340,7 +340,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -350,7 +350,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7745",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 334ba19..836b580 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -427,7 +427,7 @@
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -437,7 +437,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -446,7 +446,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -456,7 +456,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -465,7 +465,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -475,7 +475,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_rt: mmu@ffc80000 {
> +		ipmmu_rt: iommu@ffc80000 {
>  			compatible = "renesas,ipmmu-r8a7790",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xffc80000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 59a55e8..c1352f1 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -350,7 +350,7 @@
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -360,7 +360,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -369,7 +369,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -379,7 +379,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -388,7 +388,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -398,7 +398,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_rt: mmu@ffc80000 {
> +		ipmmu_rt: iommu@ffc80000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xffc80000 0 0x1000>;
> @@ -407,7 +407,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7791",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
> index eef035c..ddd2ab7 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -336,7 +336,7 @@
>  			#thermal-sensor-cells = <0>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -346,7 +346,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -355,7 +355,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -365,7 +365,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -374,7 +374,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -384,7 +384,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_rt: mmu@ffc80000 {
> +		ipmmu_rt: iommu@ffc80000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xffc80000 0 0x1000>;
> @@ -393,7 +393,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7793",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 05ef79c..bac6a76 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -290,7 +290,7 @@
>  			resets = <&cpg 407>;
>  		};
>  
> -		ipmmu_sy0: mmu@e6280000 {
> +		ipmmu_sy0: iommu@e6280000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6280000 0 0x1000>;
> @@ -300,7 +300,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_sy1: mmu@e6290000 {
> +		ipmmu_sy1: iommu@e6290000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6290000 0 0x1000>;
> @@ -309,7 +309,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_ds: mmu@e6740000 {
> +		ipmmu_ds: iommu@e6740000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe6740000 0 0x1000>;
> @@ -319,7 +319,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mp: mmu@ec680000 {
> +		ipmmu_mp: iommu@ec680000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xec680000 0 0x1000>;
> @@ -328,7 +328,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_mx: mmu@fe951000 {
> +		ipmmu_mx: iommu@fe951000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xfe951000 0 0x1000>;
> @@ -338,7 +338,7 @@
>  			status = "disabled";
>  		};
>  
> -		ipmmu_gp: mmu@e62a0000 {
> +		ipmmu_gp: iommu@e62a0000 {
>  			compatible = "renesas,ipmmu-r8a7794",
>  				     "renesas,ipmmu-vmsa";
>  			reg = <0 0xe62a0000 0 0x1000>;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
