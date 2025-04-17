Return-Path: <linux-renesas-soc+bounces-16129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33FA923FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 19:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E233BD3BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 17:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860102550C2;
	Thu, 17 Apr 2025 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VtmVkxQB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921E02517A7;
	Thu, 17 Apr 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910914; cv=none; b=MEq/opsqPdHgFQBNc2OiNd/HjYfZHs8ZezSkSAU8+qccQbYDvOWYgDjtoJcx+rA2jUiG/5PV6TWGcUtbJB+1qdXGvdr/HvHIJGOhI2ijGdb+DNNGzYOY1VDi2HAS7NSy26UW77EfXk8OBBZXGFiNjOTP5dXI0J7/KdXVk3TYq7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910914; c=relaxed/simple;
	bh=IZ27aO0p5WK6eVXz7aikyRTaG/D9jAX/ZN21m5ODZP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqAlt661iwBzqEt38RObug1NXlzdKZhVzBH1VO0C8a54W7NMXv/9PozsQe4NwbyH8tb8fD2DtqoLbEbzLmp/DlRGBrXBBvntB+QJHWLkJlffcRopVxWxWRKgI5DupF3Nhlljmwjd0q8CNSUOh9PmFKm7qezZlV5TvBRJvtLINio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VtmVkxQB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=my6RB4B1SqEjGjJYQecPt1/jUm3kCBQXDfaFQK4rq3Q=; b=VtmVkxQB0paQAhoEife9zaeVK4
	qhIGuianKk/myGAMpH+06dNIcTlMRTWJ7weZdC+WW0ioDadKkIm01NDoC86BtP9qooILRSXSSECXr
	iZ+4ogmxVnEY8G6IBj5d6qnkuZmrudPb/IwQGEdvMTUxZUaQnK10CJERFNjD6zuIgcTo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5T2H-009oNn-BO; Thu, 17 Apr 2025 19:28:25 +0200
Date: Thu, 17 Apr 2025 19:28:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V2] net: dsa: rzn1_a5psw: Make the read-only array
 offsets static const
Message-ID: <7f9c3991-8c37-4fd0-bb38-82351dd2f1d8@lunn.ch>
References: <20250417161353.490219-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161353.490219-1-colin.i.king@gmail.com>

On Thu, Apr 17, 2025 at 05:13:52PM +0100, Colin Ian King wrote:
> Don't populate the read-only array offsets on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

