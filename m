Return-Path: <linux-renesas-soc+bounces-16911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950EAB1D63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 21:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A3D67B4872
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 19:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F15525DCF5;
	Fri,  9 May 2025 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sj1SJoyC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CD153BD9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819453; cv=none; b=mNaAxXyHhUAlV0+VBtoocJZcqJXgV7mRm2/GZ31LTjL2vDuWUK+IMPuATHKYoh70Xp9tyB+ioGjWBH4pWdMmZb0F/4mf+wzJFuyDKo88C77tpXwMmxYndC5EEt1sQf4pAdojslCbAtN/gQYT9jjTXuLuVJOu7fzu2PBV+Ua3Cy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819453; c=relaxed/simple;
	bh=83FRY+Vnw9dJkqYlgDfGaSE9Kj39v0Para6kPePwCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9yaA+/Jmi11fpgLUzryQTUqpUYm6eVBYGikCbVSVoR8fGfG29+zhimf3Ex0fiUTOClK7Q3oUdJ2Czorh2dofMiu0CZEHafhkTjDEolVScM7QK1Rh2ugNid1tErdBgxayY8bNOfN34lF6kz4lNXPv6e5U30EootR8ug3lwQ0nLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sj1SJoyC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a108684f90so1378194f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746819449; x=1747424249; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3oAZerdoqNvoXq669EYro8m/ZBQ7UghYajG9A/pxU8g=;
        b=sj1SJoyCn4CW3AOEPW9sZxaCUUwASKRm1y7R1m08uNBzkIhMCnTMdFgYZ58bB0JybV
         QdDbZKzkb3V5QSVgvy7qaDs033977bnqzR/GGNBis8Y8VyGrpT93zwpW+sNSVJSop/hh
         J9bY/XWd9Y7zY3V1VN6yOnBy2RASdanigNIkLM50YZV4aEa94cw5kZXG3jHxdDunjb9U
         eU9/vo96UP0QLlHcaiqBF5e/ZmHxs4yrILK7U6oc/VYBcG5OpkmUfqPJdDGqBcW8qr3e
         njX0//EBDYLVpcYAe6EfWZpkYCKM1CToLD2nGS1bhpaQ9nJj1RqhONB/HOGslLOD8NGH
         E3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746819449; x=1747424249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oAZerdoqNvoXq669EYro8m/ZBQ7UghYajG9A/pxU8g=;
        b=KUThSr5gpkH8xXEatWOnwHYTqrU6oMh+hYjygelVCp8nSR0TKLhpyN36HBxWlBTYBS
         c6v4xZ9iY8RteO+Xz6uv9wXR3TWzhJKAKeQ3wmFP7ImMkP5QEzI5zzXQ6IoYlK/b2f22
         EFwsBBoYQSSEUfiW1iKTYRubMB9P75jB6JTW6iV0dyvPAo4KP0PEK4Xibik8OXnobhXb
         UKxZ9LzU1DSssrLHzU07b44hwnpqFJvIxb3QVBD5euiIhOGhvDrm+acpP689KH0QFqgX
         TbpKbIZChIzzySfKJiFn+54BQO1NxASgKax2KJPMuVr/654IjLleRKy9C1UXym017/Wg
         1j1g==
X-Forwarded-Encrypted: i=1; AJvYcCVLQlTC6+y30j9EurCdS+CepgoKm+6os1CaZrmHfRJSMKyK34+Cc4gH1a/EMuT1D+mjthJUhYkp6Vh9NlmRVd/5wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnBCB/RtrRcY2HlEo3tQm2cON5b8tx3EgzALCOlOv9DG5iTEg
	Vy5x8ZmrcZbbUgf7d5yRvttUZ2HyvW/JsRcrwkv1C0mybbT8I7+SnccyveGVSw==
X-Gm-Gg: ASbGnctCbcbvCjcnXowzP3qHzfJCcV1Mc5hbKAZSE8jgCq8YmRenZ925ukNnJ78QWw9
	Aa7irp5fIqEvsV5tcO/fZ9jKGPl67EBf32JQVrDlM1gv1ku1XJGzPTNFCZ7JOR0rvGlePz5rBzV
	4skIlzFTveVyr5+zgib208SP62qPBEB7sctblm/Yxsi6qT7HN1OLSUBpOCSStzaIJRMatZFose+
	cTgvhVeHVcxk19DPkH2d3WalmjBaJuDYoBYeK+Fu8BRbZXNeosK2G68N1+EuiAjoH0j0ePY0m1/
	TQaPGFPfSqwJFxkXZqOBgrkMkpBdzHrCFQYB60UhoFEUlomF2q5mO3N4JJ6TNCh3cSVXji4xVSd
	N3TJzwSy86G5am5KAJvzejQV7zQW+xWhp1tsLSap34D0Q
X-Google-Smtp-Source: AGHT+IHZrI/GvToEb7dCPGeWvlRmWso5d9JAzN2/1ym+EDk2TzhgDNhcO92+4YHwNzODFUBXeeEH/A==
X-Received: by 2002:a05:6000:18a9:b0:39e:cbca:7156 with SMTP id ffacd0b85a97d-3a1f6422625mr4225502f8f.1.1746819448739;
        Fri, 09 May 2025 12:37:28 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f33b5sm4223527f8f.54.2025.05.09.12.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:37:28 -0700 (PDT)
Date: Sat, 10 May 2025 01:07:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>

On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> Document 'aux' clock which are used to supply the PCIe bus. This
> is useful in case of a hardware setup, where the PCIe controller
> input clock and the PCIe bus clock are supplied from the same
> clock synthesiser, but from different differential clock outputs:

How different is this clock from the 'reference clock'? I'm not sure what you
mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
and the binding already has 'ref' clock for that purpose. So I don't understand
how this new clock is connected to the endpoint device.

- Mani

> 
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> The clock are named 'aux' because those are one of the clock listed in
> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
> fit closest to the PCIe bus clock. According to that binding document,
> the 'aux' clock describe clock which supply the PMC domain, which is
> likely PCIe Mezzanine Card domain.
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
>       instead and add 'bus' clock outright ?
> ---
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: "Rafał Miłecki" <rafal@milecki.pl>
> Cc: Aradhya Bhatia <a-bhatia1@ti.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Junhao Xie <bigfoot@classfun.cn>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Add TB from Niklas
>     - Document minItems in clock-names
> ---
>  .../devicetree/bindings/pci/rcar-gen4-pci-host.yaml      | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> index bb3f843c59d91..528b916fdb99b 100644
> --- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> @@ -46,12 +46,15 @@ properties:
>        - const: app
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: core
>        - const: ref
> +      - const: aux
>  
>    power-domains:
>      maxItems: 1
> @@ -105,8 +108,8 @@ examples:
>                           <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
>                           <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
>              interrupt-names = "msi", "dma", "sft_ce", "app";
> -            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
> -            clock-names = "core", "ref";
> +            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>, <&pcie0_clkgen>;
> +            clock-names = "core", "ref", "aux";
>              power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
>              resets = <&cpg 624>;
>              reset-names = "pwr";
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

