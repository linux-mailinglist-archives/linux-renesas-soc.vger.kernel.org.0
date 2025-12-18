Return-Path: <linux-renesas-soc+bounces-25900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D9CCCD24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 17:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C46E03109EDF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFC43570B8;
	Thu, 18 Dec 2025 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="drTlsmJc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C9A2F49F1;
	Thu, 18 Dec 2025 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075070; cv=none; b=b7PVX4BwAr+Bxnz/V3ybv4WcO7pVyWIVsIWRkOAbjUI0WlQVmdrfoH4VDVuZhgUVTn2XGG93X4yophc74krNsRTeaFTfkPWADs3Sja0ECTzN8M50O1RNBAeJ4zlJXx4ZQqYX9xvo1H6aNcgJEIBwE6lpFRQermPX/e590pyqoTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075070; c=relaxed/simple;
	bh=/lpz2oIHLovis2e3jie0hBGprwHoazeb7ENFgVjVQXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/C+orQK2smu8RSDnpBxC1qUikPLqw1tOqMvNpo8timoHBs6ls+JFVGMFXKuZJAvMp5M5hbdUl3Imytd+Ll0QUTB2pyCaXF4FEeVtV87ZAmFNdElNw2nfR1wQS6/dYUXgfm/1pGQVTPLC07yZQatJ5MtRQR9INgtl/1XNYgpDOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=drTlsmJc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wfcZt7qNcxi98tw/5J1IA5qzDVmXbp0zLFyBZDCWT3E=; b=drTlsmJc3MFZby5esPNoFYuawj
	M/ZBsMdFjGXq8DIOJZtqM15ZszS1sYlUE2LA2kvCVbwfY92hrBaworE37pP9DiEubZ4jvYRxeK2w9
	dCfM+GaSeimLpDPFTjnDVCak/hKDQeFC2kqXrdmrk618ygpmu51EGvzuRkKnPu/XpWE0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vWGnW-00HM0s-SU; Thu, 18 Dec 2025 17:24:14 +0100
Date: Thu, 18 Dec 2025 17:24:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Message-ID: <e9d1495f-0d61-4e23-89c9-f06373b52bc0@lunn.ch>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	nvmem-cells = <&fec_mac0>;
> +	nvmem-cell-names = "mac-address";
> +	fsl,magic-packet;

I might be repeating myself here...

Have you tested WoL? Does it work? Or is this just copy/paste from an
example?

We have a lot of DT blobs which suggest WoL should work, but it does
not. It is something we need to improve.

Thanks
	Andrew

