Return-Path: <linux-renesas-soc+bounces-21918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B2B59610
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B91A1B287E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83E031B10A;
	Tue, 16 Sep 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BBQ/25QL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D58630F801;
	Tue, 16 Sep 2025 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025352; cv=none; b=Nbc0FqQJsPJsdSa8ImFkLqMc7V9P+1lFKkau+ybk6ctpYDUyNXmtIVkNuoeye6APMvkj1agtEYeRcQ9O4Ec6sY8EBawbBJK8QfNWpO4icYSU1/pU8MtR5sFBfZM/iSIwmR5OU3eL/MEZzmmXofQtoVrkt8XB4BZS8Ni7hWKjQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025352; c=relaxed/simple;
	bh=DQ66jMMLT0n6nh4A38mjN8ZZ3cw2WkkdN+niNxHw18Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSwCVggdu+9VwvS7+XTLpMt2ebbhzqrpdPoHeH0okA/8DQTxE6mN3gLh/36O4WM6KFi5NZgmv69V8/IY0Or9BMWmKm1OKN4OxszXRU6dBb7DE6Jz5LQOiW7Z9u82+3BuOzX029IV8j+uGK7BJsrsjnb88YCnyQh9b5TIg4i51EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BBQ/25QL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=rAdzrtg37/s4ZoFN3TXa9jj78kk9SLK3gEkTudn0BLg=; b=BB
	Q/25QLU/mVLuli58ZX2YR19+U6nZ2PJRVTK8iJHwDYsECQviA8DW6QXI2pA87faNg9c3Ak8IQ6Wou
	Uyy4CASj5jBloRnRAXefUESLPw4jqFK6qXLY3rmK24BCZ/fx2smadhIn/H5M3uyZlXh4ksPM6oi3B
	/i3K436DZbGHeI8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyUhO-008YfT-HE; Tue, 16 Sep 2025 14:22:18 +0200
Date: Tue, 16 Sep 2025 14:22:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/6] net: rcar_gen4_ptp: Move control fields to users
Message-ID: <52a331b3-275e-4a7c-8852-875e8d5b8f62@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916101055.740518-3-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 16, 2025 at 12:10:51PM +0200, Niklas Söderlund wrote:
> The struct rcar_gen4_ptp_private provides two fields for convenience of
> its users, tstamp_tx_ctrl and tstamp_rx_ctrl. These fields are not used
> by the rcar_gen4_ptp driver itself but only by the drivers using it.
> 
> Upcoming work will enable the RAVB driver currently only supporting gPTP
> on pre-Gen4 SoCs to use the Gen4 implementation as well. To facilitate
> this the convenience of having these fields in struct
> rcar_gen4_ptp_private becomes a problem as the RAVB driver already have
> it's own driver specific fields for the same thing.
> 
> Move the fields from struct rcar_gen4_ptp_private to each driver using
> the Gen4 gPTP clocks own private data structures. There is no functional
> change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

