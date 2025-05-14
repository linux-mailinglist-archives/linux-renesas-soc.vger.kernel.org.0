Return-Path: <linux-renesas-soc+bounces-17101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A0AB6C45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 15:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE68D1B636C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92BE27A442;
	Wed, 14 May 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQw9I1C+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31B27A130;
	Wed, 14 May 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228270; cv=none; b=Swzg9wWJrgNhIq4YLuoVe8MzRLo4uckmPjxQuJtyauHiH+0CNlvbRXmXzAzpR6oIkLP5TPY2lOacLQwMSBYN1Xb0RTPJe9FR8tm061fKTbvQae8IkeBqv73Q+SrzUX2miCH15xaJTY8bgkyNOHY+uAEZglwQheggi4TMiDprMQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228270; c=relaxed/simple;
	bh=ACTc1qtxv3iJUb1fSk4pVQhfR7x7JfY8PZE/Ox88sfc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jWylo+P42y/+e7Mfg54twaIHNt3ClYkY6DUMB2bbWKJb9nKfOCRKzQfC6sWwUfiA1EHPeRKkOc35ZxTwh0gMb/1K1esZJpFhS+a3DErPMVmcH3MtjM2PsZr+iSzaVuiBc82e8NaXTeepVaCJFNbnEyn4hREsZr+IywJpyrhsVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQw9I1C+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5779BC4CEED;
	Wed, 14 May 2025 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228270;
	bh=ACTc1qtxv3iJUb1fSk4pVQhfR7x7JfY8PZE/Ox88sfc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FQw9I1C+EdwWtQuRSfpVhAuWKrgUgwQR2snvUZisSiSy82gL0Zwx+BlyjpkMUATi6
	 O2afthiShX2WKbNgrQ1gCbDx/fqt7sQ8i/3JH9tGVSAKdb/EsoMrZ2CAbOyEeSI97X
	 JEF/X5/FKEb5fL1Zlc5/Z+PdsGWwfmXr737MLYExFVwJlj6yjh46Qce1bSp7YLm3xY
	 pfMoYo6ElBnWcXx+zInlAt7RcgRxIQoBMazin89dPXfGFBjtRD8fRH6j71UcyBJJhW
	 29njaxnq6cpPLiELuWKClppKVSdXOZfp96y1EgPbqf94uKhIQL6gUTozup3ECVrVjk
	 of8iM1mFmlECw==
Date: Wed, 14 May 2025 08:11:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 devicetree@vger.kernel.org
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <174722778646.1826247.6383994216168902303.robh@kernel.org>
Subject: Re: [PATCH 00/10] Add GBETH, OSTM, RIIC, WDT, and GPU support for
 RZ/V2N SoC and EVK board


On Wed, 14 May 2025 11:15:18 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the following components on the
> RZ/V2N SoC and RZ/V2N EVK board:
> 1. GBETH (Gigabit Ethernet)
> 2. OSTM (General TImer)
> 3. RIIC (I2C)
> 4. WDT (Watchdog Timer)
> 5. GE3D (Mali-G31 GPU)
> 
> Cheers
> Prabhakar
> 
> Lad Prabhakar (10):
>   arm64: dts: renesas: r9a09g056: Add GBETH nodes
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
>   arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on
>     RZ/V2N EVK
>   arm64: dts: renesas: r9a09g056: Add RIIC controllers
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
>   arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
>   arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU
> 
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 569 ++++++++++++++++++
>  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 211 +++++++
>  2 files changed, 780 insertions(+)
> 
> --
> 2.49.0
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250514 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@11800000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@11801000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@14000000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@14001000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c00000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c01000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c02000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: timer@12c03000 (renesas,r9a09g056-ostm): compatible:0: 'renesas,r9a09g056-ostm' is not one of ['renesas,r7s72100-ostm', 'renesas,r7s9210-ostm', 'renesas,r9a07g043-ostm', 'renesas,r9a07g044-ostm', 'renesas,r9a07g054-ostm', 'renesas,r9a09g057-ostm']
	from schema $id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@11c00400 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
	'renesas,r9a09g047-wdt' was expected
	'renesas,r9a09g057-wdt' was expected
	'renesas,rza-wdt' was expected
	'renesas,rzn1-wdt' was expected
	'renesas,rzg2l-wdt' was expected
	'renesas,rzv2m-wdt' was expected
	'renesas,rcar-gen2-wdt' was expected
	'renesas,rcar-gen3-wdt' was expected
	'renesas,rcar-gen4-wdt' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@14400000 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
	'renesas,r9a09g047-wdt' was expected
	'renesas,r9a09g057-wdt' was expected
	'renesas,rza-wdt' was expected
	'renesas,rzn1-wdt' was expected
	'renesas,rzg2l-wdt' was expected
	'renesas,rzv2m-wdt' was expected
	'renesas,rcar-gen2-wdt' was expected
	'renesas,rcar-gen3-wdt' was expected
	'renesas,rcar-gen4-wdt' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@13000000 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
	'renesas,r9a09g047-wdt' was expected
	'renesas,r9a09g057-wdt' was expected
	'renesas,rza-wdt' was expected
	'renesas,rzn1-wdt' was expected
	'renesas,rzg2l-wdt' was expected
	'renesas,rzv2m-wdt' was expected
	'renesas,rcar-gen2-wdt' was expected
	'renesas,rcar-gen3-wdt' was expected
	'renesas,rcar-gen4-wdt' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#
arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: watchdog@13000400 (renesas,r9a09g056-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
	['renesas,r9a09g056-wdt', 'renesas,r9a09g057-wdt'] is too long
	'renesas,r9a09g056-wdt' is not one of ['renesas,r7s72100-wdt', 'renesas,r7s9210-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a06g032-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a07g043-wdt', 'renesas,r9a07g044-wdt', 'renesas,r9a07g054-wdt', 'renesas,r9a08g045-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r9a09g011-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a7742-wdt', 'renesas,r8a7743-wdt', 'renesas,r8a7744-wdt', 'renesas,r8a7745-wdt', 'renesas,r8a77470-wdt', 'renesas,r8a7790-wdt', 'renesas,r8a7791-wdt', 'renesas,r8a7792-wdt', 'renesas,r8a7793-wdt', 'renesas,r8a7794-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a774a1-wdt', 'renesas,r8a774b1-wdt', 'renesas,r8a774c0-wdt', 'renesas,r8a774e1-wdt', 'renesas,r8a7795-wdt', 'renesas,r8a7796-wdt', 'renesas,r8a77961-wdt', 'renesas,r8a77965-wdt', 'renesas,r8a77970-wdt', 'renesas,r8a77980-wdt', 'renesas,r8a77990-wdt', 'renesas,r8a77995-wdt']
	'renesas,r9a09g056-wdt' is not one of ['renesas,r8a779a0-wdt', 'renesas,r8a779f0-wdt', 'renesas,r8a779g0-wdt', 'renesas,r8a779h0-wdt']
	'renesas,r9a09g047-wdt' was expected
	'renesas,r9a09g057-wdt' was expected
	'renesas,rza-wdt' was expected
	'renesas,rzn1-wdt' was expected
	'renesas,rzg2l-wdt' was expected
	'renesas,rzv2m-wdt' was expected
	'renesas,rcar-gen2-wdt' was expected
	'renesas,rcar-gen3-wdt' was expected
	'renesas,rcar-gen4-wdt' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/renesas,wdt.yaml#






