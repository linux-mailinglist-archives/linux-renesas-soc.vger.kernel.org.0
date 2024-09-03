Return-Path: <linux-renesas-soc+bounces-8671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD196A6B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 20:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939B01C236B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 18:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9741917F2;
	Tue,  3 Sep 2024 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ok4jyGQz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B215574F;
	Tue,  3 Sep 2024 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388881; cv=none; b=sEEyfN3G2RV1JOaQGqMXQvyRhljRlQ8PHNaGjjABNgaKLPUe/ggT9qSRK2YsiESor4VKpzWDwE8Na2n4+IuXZHKrhfg8WzVP+9t5xveVsRGeNOQhW+0Ix0DogI4rNh08fln0biqPoHwSKwfx5Slof1TlHNbD4LSS40j0R/IHGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388881; c=relaxed/simple;
	bh=CZXIpq1IQk39rfsb0wPJ3zFZ6pZtmbXVHIZxEx/v6Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDM87N7yw02gXiVITnt/LOQmtI/xS6qXJpGI2811ZGal+mf0a5mpgdnGYOX0EHDVS4RlviDQ/wr2yAQXN4dDFhAKiRbrFxS0N1u2aSB7vYmvTb9EnFWJS3ZKNmNwcvL7p3xXsAGAK2sy5B8AXc7Hzc4239HH3LjXA3jbVs9a/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ok4jyGQz; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=BaSEjCyHzcCyUy3kvtvU5gvLj82QnRR+Pt0Rb/0BUzs=; b=Ok
	4jyGQz5nl7muOCK3qg4Xa0ACL451MCXKMH2tkBD9Cuules1kyOSzihR+n4AnAz9sVDbL6K5xrVVGP
	+ZIQHUUmGCKrFz/YlWvYqXUPAaf7O6VwLCs38a8HAma4oEN3Ab7lOCFrGPxntgWS9f0xRD8G1/x3f
	kmotfToIZMOHd8g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slYSg-006SZP-Mn; Tue, 03 Sep 2024 20:41:06 +0200
Date: Tue, 3 Sep 2024 20:41:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: Check for read errors in SIOCGMIIREG
Message-ID: <49f85a5f-3393-4d7b-8fcb-5eec00e564d6@lunn.ch>
References: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 03, 2024 at 07:15:36PM +0200, Niklas Söderlund wrote:
> When reading registers from the PHY using the SIOCGMIIREG IOCTL any
> errors returned from either mdiobus_read() or mdiobus_c45_read() are
> ignored, and parts of the returned error is passed as the register value
> back to user-space.
> 
> For example, if mdiobus_c45_read() is used with a bus that do not
> implement the read_c45() callback -EOPNOTSUPP is returned. This is
> however directly stored in mii_data->val_out and returned as the
> registers content. As val_out is a u16 the error code is truncated and
> returned as a plausible register value.
> 
> Fix this by first checking the return value for errors before returning
> it as the register content.
> 
> Before this patch,
> 
>     # phytool read eth0/0:1/0
>     0xffa1
> 
> After this change,
> 
>     $ phytool read eth0/0:1/0
>     error: phy_read (-95)
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

write is similarly broken, but i don't think we care about that.

Thanks

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

