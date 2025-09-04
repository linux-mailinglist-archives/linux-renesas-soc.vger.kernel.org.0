Return-Path: <linux-renesas-soc+bounces-21396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD1B44797
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B85A4E12D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FE9284686;
	Thu,  4 Sep 2025 20:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qY/1p+ir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569D271475;
	Thu,  4 Sep 2025 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018606; cv=none; b=U4Xjs4lJcG6HTuRy2xKxg0RACdokt6piOp99/GQ6l2tBrmr5PKUS6eJ5Smurvs+W1K3MZE7HAtXranqFbrXkAZswPJKPhUus5kVwfD0QfC51ssevixwe4VUTOFqd2/2nOW1GwrbrC47Gm7mgfsKTbVrkPriYTrFhbMej++KEhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018606; c=relaxed/simple;
	bh=NzH5f6y970hhv0kh6FwfAIeMgXKfPv4dAoq/Y/zQ/0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9bWper+iUf1zJ44DcsMIx6Gt6KvBZWaqiORHBFxiGKh6g5jPtlEFbq30BEhEsFEaTsMGNP0rq5HpmumUkscMk8XurMonWZwue+uJgZEvh5AL+XBEkw83g9WfvmUfeGsT/L1GVpKV7pFWiQT4+5u3+HGBdtGgHEdka9UuXwleiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qY/1p+ir; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2zGbgW/cDgXPG1zOwlu2oL2V6JgF6ORfLuZCn2FbO7o=; b=qY/1p+ir1YlJHB57jjuWNokeH5
	NbfgM4VdUW5OJMgZnZ8326YcQ2uPlgdmW0cqOiNZTwIn49/+gQxyzXp1VJ8XTN1ni1UKbWl6D6QDk
	UBrB3EXFNsALXJDpmVMJkASMiaivvhYs6BUjAQrKzc2tF3cNy7cGGVAEJYBSkiVJc+ws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuGna-007Gpp-Q0; Thu, 04 Sep 2025 22:43:14 +0200
Date: Thu, 4 Sep 2025 22:43:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 7/9] net: pcs: rzn1-miic: Add support to
 handle resets
Message-ID: <9ad6ec03-bd01-463f-b076-e537bb7eada4@lunn.ch>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904114204.4148520-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Sep 04, 2025 at 12:42:01PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add reset-line handling to the RZN1 MIIC driver and move reset
> configuration into the SoC/OF data. Introduce MIIC_MAX_NUM_RSTS (= 2),
> add storage for reset_control_bulk_data in struct miic and add
> reset_ids and reset_count fields to miic_of_data.
> 
> When reset_ids are present in the OF data, the driver obtains the reset
> lines with devm_reset_control_bulk_get_exclusive(), deasserts them during
> probe and registers a devres action to assert them on remove or on error.
> 
> This change is preparatory work to support the RZ/T2H SoC, which exposes
> two reset lines for the ETHSS IP. The driver remains backward compatible
> for platforms that do not provide reset lines.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

