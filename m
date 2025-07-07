Return-Path: <linux-renesas-soc+bounces-19292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78014AFAB52
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 07:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE34189DC63
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 05:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F07274B5F;
	Mon,  7 Jul 2025 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="58rxluL0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A213AA3C;
	Mon,  7 Jul 2025 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867799; cv=none; b=WcjEOXGcZf7RvN6J+qDjfXNwduZNAecDuvOU7o/RpJNQy+y7CC+kWu9kWc2iwBAxRpCC6M9l1god0myuNQcf7MFpEbIYJrfs1Ex5Wyrq4Sj90gRrW0t2DjZ+ilgi0ptkxGfGYzYWvosAhfG+iMuDQl7WZ/ZdmqDa00A1Mgz8Q9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867799; c=relaxed/simple;
	bh=I9bWdD/2vSEHFAS1s4M+AMJ63OR9BLcKaO9izy6O3ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLZw3NZURfNKkPBEIUxno5FIWsQ5mvOdJ731mCR6iNPbQ+VgIyKXfwa25r9Wv3qvy+Jb2nx9erUgGP0TVKTUIFL2rOYkQHrc3ny3dtxPHBf0grtUwtTifblrbqJwdTw/AbboIaAByCa45a5CY4/rTMESITg3EIEQ7t1VWRq2Gfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=58rxluL0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=af36WUhq53DHeijl4RH9YsK4MeXEiCZKFQymfZYgllI=; b=58rxluL0rQTMT5yUj1zJuISo98
	FGsPzTW/vgdwv72Xnm2zIJ/vLPd67C3fUtFeVPBEjxQV8Ix6+kzOO0p+DhnZVTvGWgKuiwlzspG3K
	yOc/jG2WwId+CZHwiWNJ5vrnfLTPNkjr4q/NfVFQ1DJW20hB4gZrlg+Hpen8dop7NbLY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYeq4-000gEt-Td; Mon, 07 Jul 2025 07:56:28 +0200
Date: Mon, 7 Jul 2025 07:56:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] net: dsa: rzn1_a5psw: use devm to enable clocks
Message-ID: <4b372f0d-0eda-47b7-a947-1932e61fa28a@lunn.ch>
References: <20250707003918.21607-1-rosenp@gmail.com>
 <20250707003918.21607-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707003918.21607-3-rosenp@gmail.com>

On Sun, Jul 06, 2025 at 05:39:18PM -0700, Rosen Penev wrote:
> The remove function has these in the wrong order. The switch should be
> unregistered last. Simpler to use devm so that the right thing is done.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

