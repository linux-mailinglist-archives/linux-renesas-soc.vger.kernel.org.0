Return-Path: <linux-renesas-soc+bounces-5284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C98428C1828
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 23:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E661F2133B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 21:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C35183A0A;
	Thu,  9 May 2024 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SD3JI7le"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1780034;
	Thu,  9 May 2024 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715289176; cv=none; b=QdZnVf1q12kn7YkGVw+Av5zqMEjBpQUwfX0mNiP6sRctKP5YFXsYtXUgNqEwcNOMzHNP28ulZsjpFQWll3gyYz2qvd81stJFpiBJwm+u4WaZaOro4B33NC9CbLQZrqYeo0Ox+mpZcrtvnf/d/jfcJChpUMMtH/kG2M3rFTO48vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715289176; c=relaxed/simple;
	bh=5c6eiEd7YpsXlJ2LB2ULdLsMl8CyS90Zyzz9T+JM+ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk4Kt/5vwV0rzfPTeuSMXjIACRRsjHnAkOpWJJ+PGzuOjHqQowPk6qwjky8qmlNH6VP3eZlS31HyWfI79e4YhMy/dsxRoUsfCjk1BKA+DalEjjxaQfJuTUKKc0pOOHvqPgvUEffbcoFfeVBde3my2J/iS9xryzbokGmPF+bu9sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SD3JI7le; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LlSqISV7WXEK47eGlA4wlTa2PuiEB5ZFjsadTPL9bjU=; b=SD3JI7leozgVPmDq4OOkFesqC4
	OaUNNKXG/tIa9e2ohno6+6N9Qvm+My3spaBb/iVTfMg/62MR0IGQAkV5ubqc/J26emNsBiVcxm1N5
	qCgV/W9YXjF1xgjAKJG25XYPAD6nVd5hlr5jgjt1i4XOS/dDDtcCKRAyT1VX8KJfSXWA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s5B4F-00F59r-8O; Thu, 09 May 2024 23:12:43 +0200
Date: Thu, 9 May 2024 23:12:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <62ab3417-0f2d-40e7-a816-b43788c448e2@lunn.ch>
References: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>

> +	/* Link verification */
> +	rtsn_modify(priv, MLVC, MLVC_PLV, MLVC_PLV);
> +	ret = rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
> +	if (ret)
> +		return ret;

What is link verification?

     Andrew

