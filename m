Return-Path: <linux-renesas-soc+bounces-18480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71955ADE04C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 03:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C22116D806
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 01:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65274155A25;
	Wed, 18 Jun 2025 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C07hC+Ay"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE70F9C1;
	Wed, 18 Jun 2025 01:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750208778; cv=none; b=kdbKOJzbofW7cZzS6LegqFDQ8st09SSFNGhvOoCNNjhyaV9yAqLL/sVxYLc1uWR2xpD9LKj8R4oZRtqH95u/iU3T6x111gP7SQPMyAKJiCcwQLWs2KlmP1litbG0hibv7w2H8ls3/mTmc3qS35BvSZtdo6NhCokems79RwwJIIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750208778; c=relaxed/simple;
	bh=NZJoIl5RzB75/8/+ArVBvSfS7CZuIN+ZCDrLpG14HeY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TReBivNfcTDZfqZvx+egazUSswhdLY1O94MOn4JV1783BZL7ye+nx9vvVAjTsuUCVxe4XFgXiCHBEXMXgPvBV/V9XO6ws4Na5yz4QdGuRAQmmsP1s+T5HFn34Dhyb/70xfHA9TKtGYg/mtUxiawcDFZ8bAsNieRsuFAQ9OIvSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C07hC+Ay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E04C4CEE3;
	Wed, 18 Jun 2025 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750208777;
	bh=NZJoIl5RzB75/8/+ArVBvSfS7CZuIN+ZCDrLpG14HeY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C07hC+AycK0p0NjbZ8fCctadijER0Byvo2iBUSTK5e5yLujQ3+2wJLReMzasZemfS
	 1Pqztzxyq+DwauqqR+Pyjps/r22fxb0D9v7UpF1y/4IWp4rJdzdaDMgFw7fCWRpEb7
	 nT7bvQxeugTU9a17anjbMfWtu5y3wBydNQGAcn/UPoi9XcpNFeZh64PUk6DhK7nxDt
	 Q4DN6rtIK4WaqFcB7ea9UyWTFu8PUdyW9/4Njrfmjdcedm+fJ+nk/RFpg4E1un9Ed4
	 rMuRta6Lr+Q2xo7cwJp3cXx7AC0s/FBDnTT8LwpRniqBIWjy44RHvCII0GRLdTjKDn
	 VUlPO855nLHTA==
Date: Tue, 17 Jun 2025 20:06:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <175020874488.4118122.11683882991063236818.robh@kernel.org>
Subject: Re: [PATCH v11 0/2] Add initial support for Renesas RZ/T2H SoC and
 eval board


On Tue, 17 Jun 2025 17:28:08 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series adds initial support for the Renesas RZ/T2H SoC
> and the RZ/T2H evaluation board.
> 
> Note: This patch series is split up from the original series [1] to make it
>   easier to review.
> [1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/
> 
> v10 -> v11:
> - Rebased on latest linux-next.
> - Updated model string in the RZ/T2H eval board dts file.
> - Dropped GIC_CPU_MASK_SIMPLE from timer node
> - Added hypervisor timer in timer node and added the missing interrupt-names
> - Reordered the `extal_clk` node
> - Reordered the `l3_ca55` node and renamed it to `L3_CA55` for consistency
> 
> Cheers,
> Prabhakar
> 
> Thierry Bultel (2):
>   arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
>   arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
> 
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 124 ++++++++++++++++++
>  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  31 +++++
>  arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 ++
>  4 files changed, 170 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
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
 Base: tags/next-20250617 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: serial@80005000 (renesas,r9a09g077-rsci): clock-names:0: 'fck' was expected
	from schema $id: http://devicetree.org/schemas/serial/renesas,rsci.yaml#
arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: serial@80005000 (renesas,r9a09g077-rsci): clock-names: ['operation', 'bus'] is too long
	from schema $id: http://devicetree.org/schemas/serial/renesas,rsci.yaml#
arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: serial@80005000 (renesas,r9a09g077-rsci): clocks: [[3, 1, 8], [3, 0, 13]] is too long
	from schema $id: http://devicetree.org/schemas/serial/renesas,rsci.yaml#
arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: serial@80005000 (renesas,r9a09g077-rsci): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/renesas,rsci.yaml#






