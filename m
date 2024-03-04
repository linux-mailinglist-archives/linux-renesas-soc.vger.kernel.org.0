Return-Path: <linux-renesas-soc+bounces-3442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A38702D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F0D1F2683E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159D43E468;
	Mon,  4 Mar 2024 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="P/qGRyeH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1743DB9A;
	Mon,  4 Mar 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559383; cv=none; b=SY6wcDJunJo8Y9Jac0X2MA2m6oFyk3C264JL9a1WZy7gGbwrN4qeEcTQX72XtT/2xm/lUONz0tqBJhsnZjDASumsekgOlOY+ofC9ixu3IXguCNdzms63VF3tNBLvr5yFGkuGMgf4otV12XEN+JWYkcWcMlys3IoBpW2Bw2FIrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559383; c=relaxed/simple;
	bh=U2A2rpmEQo11oi681qbIL+M5V2zTCapKL53vb0yJE3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD0pIMoYyfn5nviFH2SAzbDi3U3GaylYauMsSGG/Y25Meb5S2w7SIvqDVjl2qR1VQ1yy6ksRCYMSLjFBcAZJBWrOn3yIg+8fc0QH+d+ARfNxGcer7oQ2sibxzqEsS5pA0d44bwZzj81X4wscwW3g5jHqRWwFwoHP7xvFAfMg2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=P/qGRyeH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q+5OPzz4NIQWwsOu2Ul0G/RCOG5konrpG0RHNsuPh7g=; b=P/qGRyeHr1iJbfnHWC5Jsw/Prf
	qdzn5LRUk9hl/JiNyz3WZ/87K97J2H2fqKGMgYQTILwXOWGOXtzpLZUeC6vlShZ3Od/CWCt8aTFkM
	dlzyALQ+5OwwicydMRoFvXE1U+HNqB2KhSdjAGZHai6XYnhUSu2/szBcPJM8qmQHNjFM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8Ub-009KHc-FT; Mon, 04 Mar 2024 14:36:33 +0100
Date: Mon, 4 Mar 2024 14:36:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON to
 PHY dev flags
Message-ID: <95968657-04a3-4558-9ecb-92d7721592ff@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:34:58PM +0100, Romain Gantois wrote:
> From: Russell King <linux@armlinux.org.uk>
> 
> Some MAC controllers (e.g. stmmac) require their connected PHY to
> continuously provide a receive clock signal. This can cause issues in two
> cases:
> 
>   1. The clock signal hasn't been started yet by the time the MAC driver
>      initializes its hardware. This can make the initialization fail, as in
>       the case of the rzn1 GMAC1 driver.
>   2. The clock signal is cut during a power saving event. By the time the
>      MAC is brought back up, the clock signal is still not active since
>      phylink_start hasn't been called yet. This brings us back to case 1.
> 
> If a PHY driver reads this flag, it should ensure that the receive clock
> signal is started as soon as possible, and that it isn't brought down when
> the PHY goes into suspend.
> 
> Signed-off-by: Russell King <linux@armlinux.org.uk>
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

