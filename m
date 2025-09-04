Return-Path: <linux-renesas-soc+bounces-21368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DEFB44595
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1598C16C08A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC822FE04B;
	Thu,  4 Sep 2025 18:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f/va8AFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD422D6630;
	Thu,  4 Sep 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757011094; cv=none; b=egD9023teQfQ2Ljs7nSU3CAGAoY5AUdeJgDT1lCnoahdR8M2+eq5Nv8XAN+kArNdwu+CffBdCmjuMiwh3rq7w4Uwwq2Gt28MFYYjOOCekHhEDmZbVMuWnojlbRGytkHJAiVh/u0Tl5VUPiv2aNU7id5Y/QjUms5gqnkaF1KWMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757011094; c=relaxed/simple;
	bh=7ZM4gYor2Oovgm5w/3fx+oYeIFJdMfwRVOiY52xewhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XM4cJSz9QHGCrZZzasfTPFawoFCWr6GX5B2rJwxw2eU4Le17K+QN13+DM0Uymq6H2KrSO4ZC8us+kPcAeL3CrBG59tf/5Q1Xh3LHmC2oskgLD3WjFKEyZg8IqXPSYLcuu0S63KdLf7tFWjgU4MDXDqICEJnjEaSuQOSgI/c4Zh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f/va8AFY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CCCXak8vuRbEff2dpkystrR6rmvUolqqpIXg8SeBTuA=; b=f/va8AFYdOzfopSGuNjk8X6U0B
	jvxB6jPQzjv0f1z3zKymT2cLWvXCDsiVJIqyh5vdIfGYTWLimVfHnqRlzeBcufk6i0SaK1qz6IW+z
	XDiMbLagql9FEGE2ErSvG28+uZ5kAVdIBNmcNh85eKUZqEzFyW7fFlCOeXAYipTchONY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuEqT-007Fsx-Lf; Thu, 04 Sep 2025 20:38:05 +0200
Date: Thu, 4 Sep 2025 20:38:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] sh_eth: Use async pm_runtime_put()
Message-ID: <4a05bcbf-aebc-490f-b143-c6051af35a08@lunn.ch>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <77562617360e30a47746e53e392905ea312a2f97.1756998732.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77562617360e30a47746e53e392905ea312a2f97.1756998732.git.geert+renesas@glider.be>

On Thu, Sep 04, 2025 at 05:18:58PM +0200, Geert Uytterhoeven wrote:
> There is no stringent need to power down the device immediately after a
> register read, or after a failed open.  Relax power down handling by
> replacing calls to synchronous pm_runtime_put_sync() by calls to
> asynchronous pm_runtime_put().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

