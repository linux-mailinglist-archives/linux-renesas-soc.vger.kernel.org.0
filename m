Return-Path: <linux-renesas-soc+bounces-16024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EAA8A2A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 17:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E48189E5E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276CC20E70F;
	Tue, 15 Apr 2025 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f96StIq7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8520E003;
	Tue, 15 Apr 2025 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730866; cv=none; b=Zcpv4BQc/YrO58LJy2P2mdxojtwIHSF5YDfaYjuCm+afrgu1TvzlIQKFuCIcR+Mm/JBGry6i/n2r+4MTrzMwaH85AVmzwtIA9rF3GwNSkbZPKRU/b1rkfosbR5aEFg0+rXK/+kZjiWBf6DmnUAfT/uiTD7x8PuctiWUQLkdpn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730866; c=relaxed/simple;
	bh=VErCuvMt2wWRUemVF5KwKivhZmgRpbT0ckqDN43FWYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVAg/+mEBs/+5er+Fcd/blILhbRSIAQbIQGxFWptjLqcrXwa/slfkJiHKt5zqO4cxRCAt9bzpw3b0Cpn0rZ9Ski0YRP8je2xApnMAQTDJVRK0yNl3WS2GD4eUQVZUUP265KXAs3hm8FlFAs7/sGnEi1a7WX7ugdQDy9Xyz/yoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f96StIq7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oml1Mrnp47RusR5d0ApAKkTSky1zT7/Gd1S7AMinXF0=; b=f96StIq7u2cg4/MtulmKNAp16A
	1OO3m/xvx3je0VnrZwj+YB4U8Civ6zLKNI1Pucg9kLD/hU0/wiD11+A0p7CP++SyR98rp4KN+EfaE
	wz5adawaEkkukTZnuA0pAJIyACMaWt3JJkgjKwLPlNiccEJESrZjkZhZx7+k43yeTNlE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4iCH-009TLQ-L9; Tue, 15 Apr 2025 17:27:37 +0200
Date: Tue, 15 Apr 2025 17:27:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8XxS
Message-ID: <aa21556c-8c79-4d03-b6db-3b4cf450fc3a@lunn.ch>
References: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
 <20250415133301.443511-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415133301.443511-2-alexander.stein@ew.tq-group.com>

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	fsl,magic-packet;
> +	mac-address = [ 00 00 00 00 00 00 ];
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_ethphy0>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			reset-gpios = <&lsio_gpio3 22 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			interrupt-parent = <&lsio_gpio1>;
> +			interrupts = <30 IRQ_TYPE_EDGE_FALLING>;

EDGE_FALLING is very likely to be wrong. PHYs are generally level
triggered, not edge.

	Andrew

