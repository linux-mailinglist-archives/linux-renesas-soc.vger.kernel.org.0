Return-Path: <linux-renesas-soc+bounces-14780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC57A6E0CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F33467A2E6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB66263C75;
	Mon, 24 Mar 2025 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c45RLIpE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090802E3374;
	Mon, 24 Mar 2025 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837292; cv=none; b=gZsp7Zf1zkFBHfnTbPrXN87RRIdaCSMpAnkvPetF6PIuuZr0nMKD38ogozPdN324SmNoExGO/di2OM+srvEcGlx0KPY0e1dBGum5mC7B7NV7ypgN+MJnFd6m/gAsh9dVwfpA2zCR7wVV4sY0P5OwXRSOep1KHWCbX5f3RqVnMrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837292; c=relaxed/simple;
	bh=/4H7AjQXZaVsT17gavq2DxS02ju5pTlk6NZSN3b4w5U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tt0eXohJLZEfIoyz+AB7/jYRurKiZgEG1muTtVOEngbVraSa+Ary+8OuUmSLrlxwb1YDXZDsxFLb1gFPTtbzVyLqfi+OvN2AgXc6F6Ib+K+q30l4ckpOOh1M7X9Y4a3lbEEPCGJQcevvixi+WeZSWvaV8TNeflF8uilxzyj/YWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c45RLIpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473A2C4CEDD;
	Mon, 24 Mar 2025 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837289;
	bh=/4H7AjQXZaVsT17gavq2DxS02ju5pTlk6NZSN3b4w5U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c45RLIpEPNd+1GWa7mm6oUjx2UaBFSB548r2IIcZJZ6oixW1jTAZhEcl09tIwzs73
	 B2mQJ62cyk+shr5ce/lA6v9g2fb0Pdxpi5XgGFhdBkMkEg4fS6qDnouN2DFO/RbIVd
	 UvrZd4HnSQ8KDsG14dp7SL/ROGZbyXXnmlRssHtw3LlxVsybF2CpyCFQ6BzsWPz37E
	 cQInoyvmHcHUwJET0oEK5s4OowAnXuhgtDexyYCiXcxETPMP2cZiC2Q2h+VAvOfJp0
	 wpya/UXiLgzEjx0KWpBSgpzVN3OLC6YmZQWrAzlip5a6/eQApNcHt+hADarU0jJYTR
	 2xfvbyRg9hqZQ==
Date: Mon, 24 Mar 2025 12:28:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
Message-Id: <174283702242.732993.11666137383985833104.robh@kernel.org>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb
 board device-tree


On Mon, 24 Mar 2025 15:50:44 +0100, Thomas Bonnefille wrote:
> From: Clément Léger <clement.leger@bootlin.com>
> 
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since this
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> [Thomas: move the DTS to the Renesas directory, declare the PHY LEDs]
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> This short series adds support for the RZ/N1 Expansion Board. This board
> is a carrier board on which a daughter board (either RZ/N1D or RZ/N1S)
> can be plugged. The device-tree that is added by this series enables the
> use to the 2 external switch ports that are present on this board.
> ---
> V4:
>  - Drop trailing whitespaces
> 
> V3:
>  - Drop bindings commit as it was applied to master
>  - Move Makefile modification to arch/arm/boot/dts/renesas/Makefile
>  - Declare LEDs in PHY.
>  - Use the driver default LED configuration as there was no reason to
>    use a different one.
> 
> V2:
>  - Add "renesas,rzn1d400-db" in list of compatibles for EB board
>  - Replace '_' with '-' in eth pins node name
>  - Split some long lines in dts
> ---
>  arch/arm/boot/dts/renesas/Makefile                 |   1 +
>  .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 120 +++++++++++++++++++++
>  2 files changed, 121 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/renesas/' for 20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com:

arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: cpus: cpu@1:enable-method:0: 'spin-table' was expected
	from schema $id: http://devicetree.org/schemas/cpus.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
	'snps,dw-apb-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40060000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40061000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
	'snps,dw-apb-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@40062000: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
	'renesas,r9a06g032-uart' is not one of ['brcm,bcm11351-dw-apb-uart', 'brcm,bcm21664-dw-apb-uart', 'rockchip,px30-uart', 'rockchip,rk1808-uart', 'rockchip,rk3036-uart', 'rockchip,rk3066-uart', 'rockchip,rk3128-uart', 'rockchip,rk3188-uart', 'rockchip,rk3288-uart', 'rockchip,rk3308-uart', 'rockchip,rk3328-uart', 'rockchip,rk3368-uart', 'rockchip,rk3399-uart', 'rockchip,rk3528-uart', 'rockchip,rk3568-uart', 'rockchip,rk3576-uart', 'rockchip,rk3588-uart', 'rockchip,rv1108-uart', 'rockchip,rv1126-uart', 'sophgo,sg2044-uart', 'starfive,jh7100-hsuart', 'starfive,jh7100-uart', 'starfive,jh7110-uart']
	'snps,dw-apb-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50000000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50000000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50001000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50001000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50002000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50002000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50003000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:0: 'tx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: serial@50004000: dma-names:1: 'rx' was expected
	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#






