Return-Path: <linux-renesas-soc+bounces-12827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F13A261FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 19:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777E6166614
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Feb 2025 18:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3B720CCF5;
	Mon,  3 Feb 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="otQLSMZS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741631D63D3;
	Mon,  3 Feb 2025 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606192; cv=none; b=kJyzAWmk2GZ3heg+h77Suicmykqyzp+5e4+s66fMaWCGDMXbborDhJmjeOxpZxICLy70g7p0hdPlILwWZWgiE6YXawnkbCi8V2hPsHBxs5Ut2/EUe914cq6ji70aOsjtcuZiA3bkqEiRJPGFoIaVScw5Y0/mMmqe7Yvf0/kL1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606192; c=relaxed/simple;
	bh=zD4DkeGd6v8V/QHoJbVvzXjgc+MXhsINszKdnOsTIzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyUTgyPyWmEkwCgblXVMKDNABql+eomWXhjH8EjgW6Dq9sL+veneDxvzAybdCSqgAiiCYk2dxxkSKzFoTjAee26jt/pO7OFXBo3wSd6gKUQ35iNh9NdN6vNw+FAPjCbRDl68d887tiwMoEHJRZZQdakCVxaLblAI00i55ieqhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=otQLSMZS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rEUZSFTPvWY/Plp1K2cVp+BPHTEA9pJQmHMx4a20DyI=; b=otQLSMZS35xoO8+r6QG9zImXQE
	5I916YBJikzTFGpAF/ynlJNlux38SIUjoOQ8Xh/+a36I/6tNsAjrzxB9/FNQ7mLgR98Z+D5+BDptk
	2LTuOWGnkiVkhX4q/y2l9W3QuHZfvj3l39R0xrcMOcnBoN9IZDF17YofhKLct6QIVyg8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tf0t8-00AbOs-TK; Mon, 03 Feb 2025 19:09:38 +0100
Date: Mon, 3 Feb 2025 19:09:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
Message-ID: <59bc0c2b-0ece-427e-80c5-5b6920132989@lunn.ch>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>

On Mon, Feb 03, 2025 at 06:09:41PM +0100, Nikita Yushchenko wrote:
> It was observed on spider board that with upstream kernel, PHY
> auto-negotiation takes almost 1 second longer than with renesas BSP
> kernel. This was tracked down to upstream kernel allowing more PHY modes
> than renesas BSP kernel.
> 
> To avoid that effect when possible, always set max_speed to not more
> than phy_interface allows.

Please could you provide more information about the hardware. Is the
PHY more capable than the MAC?

When you have multi Gigi PHYs, the phy-mode is often taken to be the
starting point. But when the PHY has negotiated a link, it will tell
the MAC what PHY mode it needs to swap to, e.g from SGMII to
2500BaseX, etc.

You should only need max-speed when you have a PHY which can do more
than the MAC.

Also, phylink handles this a lot better than phylib. So you might want
to change rswitch to phylink, especially if you have link speeds > 1G.

	Andrew

