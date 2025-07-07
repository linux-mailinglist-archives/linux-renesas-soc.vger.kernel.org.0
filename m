Return-Path: <linux-renesas-soc+bounces-19342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E458AFBA31
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 19:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2F311886E68
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9CF1FAC4E;
	Mon,  7 Jul 2025 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqlifN5B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B218A6C4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Jul 2025 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751910926; cv=none; b=PJXJ6+hxytQABsP556SE4BEb8I2Q8c1S7BuqjE0wxH3hJzHp73m0PViLl05VfXAFrlscY8a5NGNsotp8WF0gHHhJMOAJKcMwlwTg/3t7q6zvk54RT7+CuiOU81M1XolA3J79xQDZVRVBOLPPV9xpueHATID4MbLh+ijbdVJsoKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751910926; c=relaxed/simple;
	bh=9RI1XNRLU+F8pLlE7Yt7aAxeX/dhWxvg6lRu/mCIfsE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lyUVm9mh4mK+egfvrcmV7EAEps8B0wQPQYYTneGsqEDH/VK3oFMRP+V/wl6YKBLOiv+sUR/oeDmQ3pIVvQY33AcFLrL/+STEzM47KLuY9mdGJgtNh75Hj12+iqWUuh+QwGIq142nzd8Pg6BhdYBONExuLzs1ILRWaTVLfZj9nTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqlifN5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E868EC4CEE3;
	Mon,  7 Jul 2025 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751910926;
	bh=9RI1XNRLU+F8pLlE7Yt7aAxeX/dhWxvg6lRu/mCIfsE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sqlifN5BB1tlyoxRFtRB4nhO5ALJQv5YWraFxF4s9Sfw8rNKZAlnjZQMtmwrFTCs7
	 6/VWiBNwaMIjpM+pfUI2SrXLBBHX02IwLXHuiai8cvl27ilYJcAnVgECKQNm5VAR8H
	 oORYmII5wfFIbblLwSNZmCVWTDZ5BZ9yNcbh3GauzPSoU42BBMz4POu1wDciFBNmLz
	 0gJEzEFwcrsMM4x/r4P/qmM8zTVs/FMOLl9Gf8QVPQYZ3U8a4BNAPcI/RJxWTJxcP4
	 lJMi/Z4cTFeGhVi5KABYO26zhWxamQoELw/Uj5AWvyP/1ebBB6DaseouOUfuwBez8+
	 4nWFU2x1IOX+Q==
Date: Mon, 07 Jul 2025 12:55:25 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, 
 wsa+renesas@sang-engineering.com
To: Magnus Damm <damm@opensource.se>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Message-Id: <175191074120.3364537.16527238039356772179.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add rpc-if to RZ/A1, RZ/A2 and update/add board
 support


On Sat, 05 Jul 2025 21:08:43 +0200, Magnus Damm wrote:
> Add rpc-if to RZ/A1, RZ/A2 and update/add board support
> 
> [PATCH 1/6] dt-bindings: memory-controllers: renesas,rpc-if: Add RZ compat str
> [PATCH 2/6] ARM: dts: renesas: r7s72100: add rpc-if nodes
> [PATCH 3/6] ARM: dts: renesas: r7s9210: add rpc-if node
> [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
> [PATCH 5/6] ARM: dts: renesas: gr-mango: initial board support
> [PATCH 6/6] ARM: dts: renesas: rza2mbtc: initial board support
> 
> Add support for rpc-if to RZ/A1 and RZ/A2 SoCs and update/add a few boards
> to make use of this and other devices as well.
> 
> The support level of the boards when this series is applied is as follows:
> Genmai: (RZ/A1 SoC) Serial Console, SPI flash, Ethernet
> GR-Peach: (RZ/A2 SoC) Serial Console, Ethernet
> RZA2MBTC: (RZ/A2 SoC) Serial Console, SPI flash, Ethernet
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> ---
> 
>  Applies to next-20250704
> 
>  Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |    2
>  arch/arm/boot/dts/renesas/Makefile                                       |    2
>  arch/arm/boot/dts/renesas/r7s72100-genmai.dts                            |   71 +++--
>  arch/arm/boot/dts/renesas/r7s72100.dtsi                                  |   22 +
>  arch/arm/boot/dts/renesas/r7s9210-gr-mango.dts                           |   87 ++++++
>  arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts                           |  133 ++++++++++
>  arch/arm/boot/dts/renesas/r7s9210.dtsi                                   |   12
>  7 files changed, 300 insertions(+), 29 deletions(-)
> 
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/renesas/' for 175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa:

arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: spi-flash@0 (jedec,spi-nor): $nodename:0: 'spi-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: spi-flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dtb: / (aprg,rza2mbtc): compatible: 'oneOf' conditional failed, one must be fixed:
	['aprg,rza2mbtc', 'renesas,r7s9210'] is too short
arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dtb: / (aprg,rza2mbtc): compatible: 'oneOf' conditional failed, one must be fixed:
		['aprg,rza2mbtc', 'renesas,r7s9210'] is too short
		'shimafuji,kingfisher' was expected
		'renesas,r7s9210' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
	'aprg,rza2mbtc' is not one of ['renesas,kzm9d']
	'aprg,rza2mbtc' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
	'aprg,rza2mbtc' is not one of ['renesas,rza2mevb']
	'aprg,rza2mbtc' is not one of ['renesas,kzm9g']
	'aprg,rza2mbtc' is not one of ['renesas,ape6evm']
	'aprg,rza2mbtc' is not one of ['renesas,armadillo800eva']
	'aprg,rza2mbtc' is not one of ['iwave,g21m']
	'aprg,rza2mbtc' is not one of ['iwave,g21d']
	'aprg,rza2mbtc' is not one of ['iwave,g20d']
	'aprg,rza2mbtc' is not one of ['iwave,g20m', 'renesas,sk-rzg1m']
	'aprg,rza2mbtc' is not one of ['iwave,g20m']
	'aprg,rza2mbtc' is not one of ['iwave,g22m', 'renesas,sk-rzg1e']
	'iwave,g22d' was expected
	'aprg,rza2mbtc' is not one of ['iwave,g23s']
	'aprg,rza2mbtc' is not one of ['hoperun,hihope-rzg2m', 'beacon,beacon-rzg2m']
	'aprg,rza2mbtc' is not one of ['hoperun,hihope-rzg2-ex']
	'aprg,rza2mbtc' is not one of ['hoperun,hihope-rzg2m']
	'aprg,rza2mbtc' is not one of ['beacon,beacon-rzg2n', 'hoperun,hihope-rzg2n']
	'aprg,rza2mbtc' is not one of ['si-linux,cat874']
	'aprg,rza2mbtc' is not one of ['si-linux,cat875']
	'aprg,rza2mbtc' is not one of ['beacon,beacon-rzg2h', 'hoperun,hihope-rzg2h']
	'aprg,rza2mbtc' is not one of ['renesas,bockw']
	'aprg,rza2mbtc' is not one of ['renesas,marzen']
	'aprg,rza2mbtc' is not one of ['renesas,lager', 'renesas,stout']
	'aprg,rza2mbtc' is not one of ['renesas,henninger', 'renesas,koelsch', 'renesas,porter']
	'aprg,rza2mbtc' is not one of ['renesas,blanche', 'renesas,wheat']
	'aprg,rza2mbtc' is not one of ['renesas,gose']
	'aprg,rza2mbtc' is not one of ['renesas,alt', 'renesas,silk']
	'aprg,rza2mbtc' is not one of ['renesas,h3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,m3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,m3ulcb', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,m3nulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,eagle', 'renesas,v3msk']
	'aprg,rza2mbtc' is not one of ['renesas,condor', 'renesas,v3hsk']
	'aprg,rza2mbtc' is not one of ['renesas,condor-i']
	'aprg,rza2mbtc' is not one of ['renesas,ebisu']
	'aprg,rza2mbtc' is not one of ['renesas,draak']
	'aprg,rza2mbtc' is not one of ['renesas,falcon-cpu']
	'aprg,rza2mbtc' is not one of ['renesas,falcon-breakout']
	'aprg,rza2mbtc' is not one of ['renesas,spider-cpu']
	'aprg,rza2mbtc' is not one of ['renesas,spider-breakout']
	'aprg,rza2mbtc' is not one of ['renesas,s4sk']
	'aprg,rza2mbtc' is not one of ['renesas,white-hawk-cpu']
	'aprg,rza2mbtc' is not one of ['renesas,white-hawk-breakout']
	'aprg,rza2mbtc' is not one of ['renesas,white-hawk-single']
	'aprg,rza2mbtc' is not one of ['retronix,sparrow-hawk']
	'aprg,rza2mbtc' is not one of ['renesas,gray-hawk-single']
	'aprg,rza2mbtc' is not one of ['renesas,h3ulcb', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,m3nulcb', 'renesas,salvator-xs']
	'aprg,rza2mbtc' is not one of ['renesas,rzn1d400-db']
	'aprg,rza2mbtc' is not one of ['renesas,rzn1d400-eb']
	'aprg,rza2mbtc' is not one of ['renesas,smarc-evk']
	'aprg,rza2mbtc' is not one of ['myir,remi-pi']
	'aprg,rza2mbtc' is not one of ['renesas,r9a08g045s33']
	'renesas,rzg3s-smarcm' was expected
	'renesas,smarc2-evk' was expected
	'aprg,rza2mbtc' is not one of ['renesas,rzv2mevk2']
	'aprg,rza2mbtc' is not one of ['renesas,smarc2-evk']
	'aprg,rza2mbtc' is not one of ['renesas,rzv2n-evk']
	'aprg,rza2mbtc' is not one of ['renesas,rzv2h-evk']
	'yuridenki,kakip' was expected
	'aprg,rza2mbtc' is not one of ['renesas,rzt2h-evk']
	'aprg,rza2mbtc' is not one of ['renesas,rzn2h-evk']
	'renesas,emev2' was expected
	'renesas,r7s72100' was expected
	'renesas,sh73a0' was expected
	'renesas,r8a73a4' was expected
	'renesas,r8a7740' was expected
	'renesas,r8a7742' was expected
	'iwave,g21m' was expected
	'iwave,g20m' was expected
	'renesas,r8a7743' was expected
	'renesas,r8a7744' was expected
	'renesas,r8a7745' was expected
	'iwave,g22m' was expected
	'renesas,r8a77470' was expected
	'renesas,r8a774a1' was expected
	'hoperun,hihope-rzg2m' was expected
	'renesas,r8a774a3' was expected
	'renesas,r8a774b1' was expected
	'hoperun,hihope-rzg2n' was expected
	'renesas,r8a774c0' was expected
	'si-linux,cat874' was expected
	'renesas,r8a774e1' was expected
	'hoperun,hihope-rzg2h' was expected
	'renesas,r8a7778' was expected
	'renesas,r8a7779' was expected
	'renesas,r8a7790' was expected
	'renesas,r8a7791' was expected
	'renesas,r8a7792' was expected
	'renesas,r8a7793' was expected
	'renesas,r8a7794' was expected
	'renesas,r8a7795' was expected
	'renesas,r8a7796' was expected
	'renesas,r8a77961' was expected
	'renesas,r8a77965' was expected
	'renesas,r8a77970' was expected
	'renesas,r8a77980' was expected
	'renesas,r8a77980a' was expected
	'renesas,r8a77990' was expected
	'renesas,r8a77995' was expected
	'renesas,r8a779a0' was expected
	'renesas,falcon-cpu' was expected
	'renesas,r8a779f0' was expected
	'renesas,spider-cpu' was expected
	'renesas,r8a779f4' was expected
	'renesas,r8a779g0' was expected
	'renesas,white-hawk-cpu' was expected
	'renesas,r7s9210' is not one of ['renesas,r8a779g2', 'renesas,r8a779g3']
	'renesas,r8a779g3' was expected
	'renesas,r8a779h0' was expected
	'renesas,r8a779h2' was expected
	'renesas,r8a779m0' was expected
	'renesas,r8a779m1' was expected
	'renesas,r8a779m2' was expected
	'renesas,r8a779m3' was expected
	'renesas,r8a779m4' was expected
	'renesas,r8a779m5' was expected
	'renesas,r8a779m6' was expected
	'renesas,r8a779m7' was expected
	'renesas,r8a779m8' was expected
	'renesas,r8a779mb' was expected
	'renesas,r9a06g032' was expected
	'renesas,rzn1d400-db' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a07g043f01', 'renesas,r9a07g043u11', 'renesas,r9a07g043u12']
	'renesas,r7s9210' is not one of ['renesas,r9a07g044c1', 'renesas,r9a07g044c2', 'renesas,r9a07g044l1', 'renesas,r9a07g044l2']
	'renesas,r9a07g044l2' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a07g054l1', 'renesas,r9a07g054l2']
	'renesas,r9a08g045' was expected
	'renesas,r9a08g045s33' was expected
	'renesas,r9a09g011' was expected
	'renesas,r7s9210' is not one of ['renesas,rzg3e-smarcm']
	'renesas,r7s9210' is not one of ['renesas,r9a09g056n41', 'renesas,r9a09g056n42', 'renesas,r9a09g056n43', 'renesas,r9a09g056n44', 'renesas,r9a09g056n45', 'renesas,r9a09g056n46', 'renesas,r9a09g056n47', 'renesas,r9a09g056n48']
	'renesas,r7s9210' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
	'renesas,r9a09g057h48' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a09g077m04', 'renesas,r9a09g077m24', 'renesas,r9a09g077m44']
	'renesas,r7s9210' is not one of ['renesas,r9a09g087m04', 'renesas,r9a09g087m24', 'renesas,r9a09g087m44']
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dtb: /: failed to match any schema with compatible: ['aprg,rza2mbtc', 'renesas,r7s9210']
arch/arm/boot/dts/renesas/r7s9210-gr-mango.dtb: / (renesas,grmango): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,grmango', 'renesas,r7s9210'] is too short
arch/arm/boot/dts/renesas/r7s9210-gr-mango.dtb: / (renesas,grmango): compatible: 'oneOf' conditional failed, one must be fixed:
		['renesas,grmango', 'renesas,r7s9210'] is too short
		'shimafuji,kingfisher' was expected
		'renesas,r7s9210' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
	'renesas,grmango' is not one of ['renesas,kzm9d']
	'renesas,grmango' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
	'renesas,grmango' is not one of ['renesas,rza2mevb']
	'renesas,grmango' is not one of ['renesas,kzm9g']
	'renesas,grmango' is not one of ['renesas,ape6evm']
	'renesas,grmango' is not one of ['renesas,armadillo800eva']
	'renesas,grmango' is not one of ['iwave,g21m']
	'renesas,grmango' is not one of ['iwave,g21d']
	'renesas,grmango' is not one of ['iwave,g20d']
	'renesas,grmango' is not one of ['iwave,g20m', 'renesas,sk-rzg1m']
	'renesas,grmango' is not one of ['iwave,g20m']
	'renesas,grmango' is not one of ['iwave,g22m', 'renesas,sk-rzg1e']
	'iwave,g22d' was expected
	'renesas,grmango' is not one of ['iwave,g23s']
	'renesas,grmango' is not one of ['hoperun,hihope-rzg2m', 'beacon,beacon-rzg2m']
	'renesas,grmango' is not one of ['hoperun,hihope-rzg2-ex']
	'renesas,grmango' is not one of ['hoperun,hihope-rzg2m']
	'renesas,grmango' is not one of ['beacon,beacon-rzg2n', 'hoperun,hihope-rzg2n']
	'renesas,grmango' is not one of ['si-linux,cat874']
	'renesas,grmango' is not one of ['si-linux,cat875']
	'renesas,grmango' is not one of ['beacon,beacon-rzg2h', 'hoperun,hihope-rzg2h']
	'renesas,grmango' is not one of ['renesas,bockw']
	'renesas,grmango' is not one of ['renesas,marzen']
	'renesas,grmango' is not one of ['renesas,lager', 'renesas,stout']
	'renesas,grmango' is not one of ['renesas,henninger', 'renesas,koelsch', 'renesas,porter']
	'renesas,grmango' is not one of ['renesas,blanche', 'renesas,wheat']
	'renesas,grmango' is not one of ['renesas,gose']
	'renesas,grmango' is not one of ['renesas,alt', 'renesas,silk']
	'renesas,grmango' is not one of ['renesas,h3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,m3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,m3ulcb', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,m3nulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,eagle', 'renesas,v3msk']
	'renesas,grmango' is not one of ['renesas,condor', 'renesas,v3hsk']
	'renesas,grmango' is not one of ['renesas,condor-i']
	'renesas,grmango' is not one of ['renesas,ebisu']
	'renesas,grmango' is not one of ['renesas,draak']
	'renesas,grmango' is not one of ['renesas,falcon-cpu']
	'renesas,grmango' is not one of ['renesas,falcon-breakout']
	'renesas,grmango' is not one of ['renesas,spider-cpu']
	'renesas,grmango' is not one of ['renesas,spider-breakout']
	'renesas,grmango' is not one of ['renesas,s4sk']
	'renesas,grmango' is not one of ['renesas,white-hawk-cpu']
	'renesas,grmango' is not one of ['renesas,white-hawk-breakout']
	'renesas,grmango' is not one of ['renesas,white-hawk-single']
	'renesas,grmango' is not one of ['retronix,sparrow-hawk']
	'renesas,grmango' is not one of ['renesas,gray-hawk-single']
	'renesas,grmango' is not one of ['renesas,h3ulcb', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,m3nulcb', 'renesas,salvator-xs']
	'renesas,grmango' is not one of ['renesas,rzn1d400-db']
	'renesas,grmango' is not one of ['renesas,rzn1d400-eb']
	'renesas,grmango' is not one of ['renesas,smarc-evk']
	'renesas,grmango' is not one of ['myir,remi-pi']
	'renesas,grmango' is not one of ['renesas,r9a08g045s33']
	'renesas,rzg3s-smarcm' was expected
	'renesas,smarc2-evk' was expected
	'renesas,grmango' is not one of ['renesas,rzv2mevk2']
	'renesas,grmango' is not one of ['renesas,smarc2-evk']
	'renesas,grmango' is not one of ['renesas,rzv2n-evk']
	'renesas,grmango' is not one of ['renesas,rzv2h-evk']
	'yuridenki,kakip' was expected
	'renesas,grmango' is not one of ['renesas,rzt2h-evk']
	'renesas,grmango' is not one of ['renesas,rzn2h-evk']
	'renesas,emev2' was expected
	'renesas,r7s72100' was expected
	'renesas,sh73a0' was expected
	'renesas,r8a73a4' was expected
	'renesas,r8a7740' was expected
	'renesas,r8a7742' was expected
	'iwave,g21m' was expected
	'iwave,g20m' was expected
	'renesas,r8a7743' was expected
	'renesas,r8a7744' was expected
	'renesas,r8a7745' was expected
	'iwave,g22m' was expected
	'renesas,r8a77470' was expected
	'renesas,r8a774a1' was expected
	'hoperun,hihope-rzg2m' was expected
	'renesas,r8a774a3' was expected
	'renesas,r8a774b1' was expected
	'hoperun,hihope-rzg2n' was expected
	'renesas,r8a774c0' was expected
	'si-linux,cat874' was expected
	'renesas,r8a774e1' was expected
	'hoperun,hihope-rzg2h' was expected
	'renesas,r8a7778' was expected
	'renesas,r8a7779' was expected
	'renesas,r8a7790' was expected
	'renesas,r8a7791' was expected
	'renesas,r8a7792' was expected
	'renesas,r8a7793' was expected
	'renesas,r8a7794' was expected
	'renesas,r8a7795' was expected
	'renesas,r8a7796' was expected
	'renesas,r8a77961' was expected
	'renesas,r8a77965' was expected
	'renesas,r8a77970' was expected
	'renesas,r8a77980' was expected
	'renesas,r8a77980a' was expected
	'renesas,r8a77990' was expected
	'renesas,r8a77995' was expected
	'renesas,r8a779a0' was expected
	'renesas,falcon-cpu' was expected
	'renesas,r8a779f0' was expected
	'renesas,spider-cpu' was expected
	'renesas,r8a779f4' was expected
	'renesas,r8a779g0' was expected
	'renesas,white-hawk-cpu' was expected
	'renesas,r7s9210' is not one of ['renesas,r8a779g2', 'renesas,r8a779g3']
	'renesas,r8a779g3' was expected
	'renesas,r8a779h0' was expected
	'renesas,r8a779h2' was expected
	'renesas,r8a779m0' was expected
	'renesas,r8a779m1' was expected
	'renesas,r8a779m2' was expected
	'renesas,r8a779m3' was expected
	'renesas,r8a779m4' was expected
	'renesas,r8a779m5' was expected
	'renesas,r8a779m6' was expected
	'renesas,r8a779m7' was expected
	'renesas,r8a779m8' was expected
	'renesas,r8a779mb' was expected
	'renesas,r9a06g032' was expected
	'renesas,rzn1d400-db' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a07g043f01', 'renesas,r9a07g043u11', 'renesas,r9a07g043u12']
	'renesas,r7s9210' is not one of ['renesas,r9a07g044c1', 'renesas,r9a07g044c2', 'renesas,r9a07g044l1', 'renesas,r9a07g044l2']
	'renesas,r9a07g044l2' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a07g054l1', 'renesas,r9a07g054l2']
	'renesas,r9a08g045' was expected
	'renesas,r9a08g045s33' was expected
	'renesas,r9a09g011' was expected
	'renesas,r7s9210' is not one of ['renesas,rzg3e-smarcm']
	'renesas,r7s9210' is not one of ['renesas,r9a09g056n41', 'renesas,r9a09g056n42', 'renesas,r9a09g056n43', 'renesas,r9a09g056n44', 'renesas,r9a09g056n45', 'renesas,r9a09g056n46', 'renesas,r9a09g056n47', 'renesas,r9a09g056n48']
	'renesas,r7s9210' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44', 'renesas,r9a09g057h45', 'renesas,r9a09g057h46', 'renesas,r9a09g057h48']
	'renesas,r9a09g057h48' was expected
	'renesas,r7s9210' is not one of ['renesas,r9a09g077m04', 'renesas,r9a09g077m24', 'renesas,r9a09g077m44']
	'renesas,r7s9210' is not one of ['renesas,r9a09g087m04', 'renesas,r9a09g087m24', 'renesas,r9a09g087m44']
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
arch/arm/boot/dts/renesas/r7s9210-gr-mango.dtb: /: failed to match any schema with compatible: ['renesas,grmango', 'renesas,r7s9210']
arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dtb: spi-flash@0 (jedec,spi-nor): $nodename:0: 'spi-flash@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dtb: spi-flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#






