Return-Path: <linux-renesas-soc+bounces-3522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BC873FF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 19:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0942F1C220DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 18:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F48513DBB7;
	Wed,  6 Mar 2024 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lew0p/7I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4A8137C4A;
	Wed,  6 Mar 2024 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709750980; cv=none; b=m2k29g95v+/vAgi1GLnu7LTO6Yq0J8xzB1DBWFqr3kRvl53Kc5Q5JQbPXo71iIhP4j/IRMq1UdD3I5JATIoEBw75p+j593qxhZUbLzMeQYRtK24P48wDHXlnZ/J1ZVEvj3oAECvs5dFRymZgi/3fNpOKJOIwJ060zROYs/ilsY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709750980; c=relaxed/simple;
	bh=akNjyDBohXq6EkpxmGM3xfr48dOsRjxiD0Mr2CPTHp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYnrvdlEM6krWXIJArL4MYScnD1NtI2adeWoMpWOA+VVwc4fiz0P//frwzCg8dYR7zGpKJzHGAhx0crRnQmklEJtLtTkX/BRc54yFG15iD+tX0QeyczRkI/y95CiD0yPXKxCU9fP7pqSERnZva/HmwrNwBaSd7oh3mhNUY5IOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lew0p/7I; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tLWrWIhDdIYYSQoyYZEpUQhvpua0zE4FniIeWjJrPgw=; b=lew0p/7IbEpIiArutlQ7BWuW/Y
	IqcWqtFIBNUNA1/ObYe3wDpBk+jP7ZrDJ/KiRT4RxKw/LdD7b9WqosDCpaNbcxtHoZB/oW9/QUkxf
	9WyHwBHgb3YSytAvGGGM4FtP80yJ+TDQ6jk4mTkw6kfe7QYwpsl4XBVOUqCwXruFX9QY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rhwL1-009WRv-Jl; Wed, 06 Mar 2024 19:49:59 +0100
Date: Wed, 6 Mar 2024 19:49:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Cl__ment L__ger <clement.leger@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: pcs: rzn1-miic: update PCS driver to use
 neg_mode
Message-ID: <1f948883-9e54-4707-9934-b24f8440e353@lunn.ch>
References: <E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk>

On Wed, Mar 06, 2024 at 10:51:41AM +0000, Russell King (Oracle) wrote:
> Update the RZN1-MIIC PCS driver to use neg_mode rather than the mode
> argument to match the other updated PCS drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

