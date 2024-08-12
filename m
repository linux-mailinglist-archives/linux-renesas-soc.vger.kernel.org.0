Return-Path: <linux-renesas-soc+bounces-7815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3EF94F1D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 17:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79542281295
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 15:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525FC183CD4;
	Mon, 12 Aug 2024 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMxnuT3f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D017C9FC;
	Mon, 12 Aug 2024 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723476814; cv=none; b=ufssYZ2zvroZgpbZMq7jQK4TcNcvvsXc7rnPKK6zKOeU3qw/TZ8B00NboZpjl8GdhpAdbc6kB7o/tSuoCcMIqQUzqSKQaSPfDrOzHBISODuiViRx5vWfiVrVezx/U01aZpmx2ZCuxibUCO+yEZGCbyYJwL0yuE5miL+0U27/xqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723476814; c=relaxed/simple;
	bh=Oe05rmpT9Fe/XXDh3WVDkzGcqmjHuFRSDMw5JnPkOiU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=NfaVpjDPLZ1oYtWJCTT+911U8/SHTKNrCb/krUxPFO4wdcgfS2ZG5zEPQIdeuloDRkLUjeHRreIqUW6EC6xJi3d449JPJBvGW7rPW54c8UGVqe1cgwp1Ryq6Zh6hwNwbBVvYG/JmXRs57ea1xSk2PG6vecqzZAh4KAejyYfAF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMxnuT3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E87C32782;
	Mon, 12 Aug 2024 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723476813;
	bh=Oe05rmpT9Fe/XXDh3WVDkzGcqmjHuFRSDMw5JnPkOiU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mMxnuT3f9b/GjyJUcG4A/tmtZzbzGRW/OIV0R/LYANfH1mi/CXS9yiS+vGl3IEhFz
	 vCg/F2ewxFikmAy2x0VQie3CJkC5AkCciktWbfV+4w5vlx3O/BMWrKjBB1/nNcdgMw
	 8XxUsBLHWpD/6aDIQ/E4tpnEWboRVUucbDYrfki1JsxgffsX3UXB56t5p8/SLVTmTr
	 PDxGUgyvan02NsCPlZCq0AP7k5nkpu2UAFPrYnGLqa/sSuuAJzTXRcjpRRPe0M8rlj
	 yNCt+3nDeh3d9Rx+ZNjBJJi1+RnyeCETnozUITsZZfgoFdgUXm2S2qnBaX96Hb6LzZ
	 1Ca3UFrObNIUQ==
Date: Mon, 12 Aug 2024 09:33:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <172347672713.922226.6452108729584835239.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] Add support for Renesas RZ/V2H(P) SoC and
 GP-EVK platform


On Sun, 11 Aug 2024 21:49:47 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to add initial support for Renesas RZ/V2H(P) SoC
> and GP-EVK platform. Support for below peripherals is enabled on
> RZ/V2H GP-EVK platform:
> - RIIC
> - OSTM
> - SDHI
> - WDT
> 
> patch #1 and #2 depends on
> 1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> patch #3, #4, #5 and #7 depends on
> 1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> patch #6 and #8 depends on
> 1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (8):
>   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
>   arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board
>   arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
>   arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
>   arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
>   arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
>   arm64: dts: renesas: r9a09g057h44-gp-evk: Enable OSTM, I2C, and SDHI
>   arm64: dts: renesas: r9a09g057h44-gp-evk: Enable watchdog
> 
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 532 ++++++++++++++++++
>  .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 256 +++++++++
>  3 files changed, 790 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> 
> --
> 2.34.1
> 
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


New warnings running 'make CHECK_DTBS=y renesas/r9a09g057h44-gp-evk.dtb' for 20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,gp-evk', 'renesas,r9a09g057h44', 'renesas,r9a09g057'] is too long
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
		['renesas,gp-evk', 'renesas,r9a09g057h44', 'renesas,r9a09g057'] is too short
		'shimafuji,kingfisher' was expected
		'renesas,r9a09g057h44' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
		'renesas,r9a09g057' is not one of ['renesas,r8a7795', 'renesas,r8a7796', 'renesas,r8a77961', 'renesas,r8a77965']
		'renesas,r9a09g057' is not one of ['renesas,r8a779m0', 'renesas,r8a779m1', 'renesas,r8a779m2', 'renesas,r8a779m3', 'renesas,r8a779m4', 'renesas,r8a779m5', 'renesas,r8a779m8', 'renesas,r8a779mb']
	'renesas,gp-evk' is not one of ['renesas,kzm9d']
	'renesas,gp-evk' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
	'renesas,gp-evk' is not one of ['renesas,rza2mevb']
	'renesas,gp-evk' is not one of ['renesas,kzm9g']
	'renesas,gp-evk' is not one of ['renesas,ape6evm']
	'renesas,gp-evk' is not one of ['renesas,armadillo800eva']
	'renesas,gp-evk' is not one of ['iwave,g21m']
	'renesas,gp-evk' is not one of ['iwave,g21d']
	'renesas,gp-evk' is not one of ['iwave,g20d']
	'renesas,gp-evk' is not one of ['iwave,g20m', 'renesas,sk-rzg1m']
	'renesas,gp-evk' is not one of ['iwave,g20m']
	'renesas,gp-evk' is not one of ['iwave,g22m', 'renesas,sk-rzg1e']
	'iwave,g22d' was expected
	'renesas,gp-evk' is not one of ['iwave,g23s']
	'renesas,gp-evk' is not one of ['hoperun,hihope-rzg2m', 'beacon,beacon-rzg2m']
	'renesas,gp-evk' is not one of ['hoperun,hihope-rzg2-ex']
	'renesas,gp-evk' is not one of ['hoperun,hihope-rzg2m']
	'renesas,gp-evk' is not one of ['beacon,beacon-rzg2n', 'hoperun,hihope-rzg2n']
	'renesas,gp-evk' is not one of ['si-linux,cat874']
	'renesas,gp-evk' is not one of ['si-linux,cat875']
	'renesas,gp-evk' is not one of ['beacon,beacon-rzg2h', 'hoperun,hihope-rzg2h']
	'renesas,gp-evk' is not one of ['renesas,bockw']
	'renesas,gp-evk' is not one of ['renesas,marzen']
	'renesas,gp-evk' is not one of ['renesas,lager', 'renesas,stout']
	'renesas,gp-evk' is not one of ['renesas,henninger', 'renesas,koelsch', 'renesas,porter']
	'renesas,gp-evk' is not one of ['renesas,blanche', 'renesas,wheat']
	'renesas,gp-evk' is not one of ['renesas,gose']
	'renesas,gp-evk' is not one of ['renesas,alt', 'renesas,silk']
	'renesas,gp-evk' is not one of ['renesas,h3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,m3ulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,m3ulcb', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,m3nulcb', 'renesas,salvator-x', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,eagle', 'renesas,v3msk']
	'renesas,gp-evk' is not one of ['renesas,condor', 'renesas,v3hsk']
	'renesas,gp-evk' is not one of ['renesas,condor-i']
	'renesas,gp-evk' is not one of ['renesas,ebisu']
	'renesas,gp-evk' is not one of ['renesas,draak']
	'renesas,gp-evk' is not one of ['renesas,falcon-cpu']
	'renesas,gp-evk' is not one of ['renesas,falcon-breakout']
	'renesas,gp-evk' is not one of ['renesas,spider-cpu']
	'renesas,gp-evk' is not one of ['renesas,spider-breakout']
	'renesas,gp-evk' is not one of ['renesas,s4sk']
	'renesas,gp-evk' is not one of ['renesas,white-hawk-cpu']
	'renesas,gp-evk' is not one of ['renesas,white-hawk-single']
	'renesas,gp-evk' is not one of ['renesas,white-hawk-breakout']
	'renesas,gp-evk' is not one of ['renesas,gray-hawk-single']
	'renesas,gp-evk' is not one of ['renesas,h3ulcb', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,m3nulcb', 'renesas,salvator-xs']
	'renesas,gp-evk' is not one of ['renesas,rzn1d400-db']
	'renesas,gp-evk' is not one of ['renesas,rzn1d400-eb']
	'renesas,gp-evk' is not one of ['renesas,smarc-evk']
	'renesas,gp-evk' is not one of ['renesas,r9a08g045s33']
	'renesas,rzg3s-smarcm' was expected
	'renesas,smarc2-evk' was expected
	'renesas,gp-evk' is not one of ['renesas,rzv2mevk2']
	'renesas,gp-evk' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44']
	'renesas,emev2' was expected
	'renesas,r7s72100' was expected
	'renesas,r7s9210' was expected
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
	'renesas,r8a779g2' was expected
	'renesas,white-hawk-cpu' was expected
	'renesas,r8a779h0' was expected
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
	'renesas,r9a09g057h44' is not one of ['renesas,r9a07g043f01', 'renesas,r9a07g043u11', 'renesas,r9a07g043u12']
	'renesas,r9a09g057h44' is not one of ['renesas,r9a07g044c1', 'renesas,r9a07g044c2', 'renesas,r9a07g044l1', 'renesas,r9a07g044l2']
	'renesas,r9a09g057h44' is not one of ['renesas,r9a07g054l1', 'renesas,r9a07g054l2']
	'renesas,r9a08g045' was expected
	'renesas,r9a08g045s33' was expected
	'renesas,r9a09g011' was expected
	'renesas,r9a09g057' was expected
	'renesas,r9a07g043' was expected
	'renesas,r9a07g044' was expected
	'renesas,r9a07g054' was expected
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: /: compatible:0: 'anyOf' conditional failed, one must be fixed:
	'renesas,gp-evk' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
	'renesas,gp-evk' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
	'renesas,gp-evk' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
	'renesas,gp-evk' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
	'renesas,gp-evk' does not match '^renesas,em-(gio|sti|uart)$'
	'renesas,gp-evk' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
	'renesas,gp-evk' does not match '^renesas,hspi-r8a777[89]$'
	'renesas,gp-evk' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
	'renesas,gp-evk' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
	'renesas,gp-evk' is not one of ['renesas,smp-sram']
	'renesas,gp-evk' does not match '^(?!renesas,.+-.+).+$'
	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: /: failed to match any schema with compatible: ['renesas,gp-evk', 'renesas,r9a09g057h44', 'renesas,r9a09g057']
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c00000: clocks: [[3, 1, 163], [3, 1, 165], [3, 1, 164], [3, 1, 166]] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c00000: clock-names:1: 'cd' was expected
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c00000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c10000: clocks: [[3, 1, 167], [3, 1, 169], [3, 1, 168], [3, 1, 170]] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c10000: clock-names:1: 'cd' was expected
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c10000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c20000: clocks: [[3, 1, 171], [3, 1, 173], [3, 1, 172], [3, 1, 174]] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c20000: clock-names:1: 'cd' was expected
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dtb: mmc@15c20000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#






