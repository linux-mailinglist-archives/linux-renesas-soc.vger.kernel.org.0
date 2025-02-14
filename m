Return-Path: <linux-renesas-soc+bounces-13180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D27A366A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 21:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B4487A5439
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 20:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2EA1917F1;
	Fri, 14 Feb 2025 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ssYM3vH/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277515573F;
	Fri, 14 Feb 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739563266; cv=none; b=IMsO49OPPdv+qsBTeHTi1kUTs7e1nUzg3C0UlGJsbT9pEx99qR/y5s2SvGaWxqT+E81rbq6AJ9z6N8bQuEiRRb756yTDyPiSNEb2Hxba1zrqrYR2hbovw273wWUvRq8stvo5OkY1/MHapI4kSgDHJsoapuBTKjGu6EY4fTOt0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739563266; c=relaxed/simple;
	bh=AgL0btgvfeZWjvapvgym8c6V++79NOHgSjd8j7PcvOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CW2nsI30t/EMnt4aDqF8fbQBiRnFmVuHP+0Kx7qH3/kncmVp6X7r5uphzJBp28JTEHfx6wP4+GzIwB6yevtzN9BEioZb8w+7okQuXhWRNqFhdz3UWKJFGNWuUEKD5zams8k0URxAJIEwAIJEv9KquE0mDJdUi2f+UdIWde19RD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ssYM3vH/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=prbYdsxexl7cQhsCL97zAfgtoaroKSarsAydonVCDwc=; b=ssYM3vH/fScPljGQs1E/8HDVAZ
	QW/SFQ0jRFmJQCsx2mk19mQbXIfFDsY7OjWGHtTXVroAmLw0C5ewSG1ay3MKarNHbHIyXty1HV8HJ
	EwgRdzHqJsCLrjpeB0vvMQnxaxpwAiqE+Dk+U1Cx3p5n/5bMjRQPwlJkLK41bf3gU4wQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tj1ro-00EArj-Ho; Fri, 14 Feb 2025 21:00:52 +0100
Date: Fri, 14 Feb 2025 21:00:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure
 for mv88q211x
Message-ID: <dc003649-d6cf-44f1-b8d5-1a602d755dc9@lunn.ch>
References: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
 <20250214193813.GA244828@debian>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214193813.GA244828@debian>

> thanks for your patch. You could also just switch to mv88q2xxx_probe.
> Then you would get HWMON and LED support while fixing this. 88Q2110
> supports both.

It would be good to get that tested. The less special cases we have in
a driver the better.

	Andrew

