Return-Path: <linux-renesas-soc+bounces-12806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D185A24B6D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 19:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44DE18869DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 18:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAC01CAA77;
	Sat,  1 Feb 2025 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ARMLVvG8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF671ADC9D;
	Sat,  1 Feb 2025 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738435353; cv=none; b=YTK6mwelOOnON/TO8rCNjA7LvGt5yopkN4DdFLW5MKV9jSIU9lvla3+HjLJnvOe340Ghjr36BCjd6T0PMNdUEqADq+6M29r24Rqwi+LGYaUcEZHEbEFcoliOEoTBXESEzD2X/jveZJ4KYR2qQBo6SUKrdFYIrs/YSdtvT1wybgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738435353; c=relaxed/simple;
	bh=THbhFIvScig0flUbRfQJC4oHOLWX7buHC2KcBF5wS2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxZRilgsNL+e3JY3AC+re0TnUi6WR2DOdrRD5BTkyMW5astiEBeNbe3auFNzEe6ZG970oAFmFDhNgmmH9JmSfsMT3oxJC3GmIUvzoU1HHQBxu/yUxcaZkeKJXPjD/ysm5ovMXhDn9xUPfnPY2YjKIrDKsZWzs1OGfAJUPGPA8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ARMLVvG8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TzIJbIPfk+6vnQOftae6JY8WZoUukIQnI4jFG+nfdIY=; b=ARMLVvG8m+GL/zmJTpcIOm0aSv
	Y53MXHu0kgLah7v275+ZNIKvTJOMfFdSIl34e7YckBP7gQE/NXnYBLH8tF9+hEr1lTXJXG8q7Vslk
	e6WHNIkWVmP14y/X+ylVtoOJffqMbv0tsSOKxPX8Vv60rYya6PUV3Thvb2S/FvCKFBTA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1teIRk-00A2Ne-BY; Sat, 01 Feb 2025 19:42:24 +0100
Date: Sat, 1 Feb 2025 19:42:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] net: dsa: rzn1_a5psw: Use
 of_get_available_child_by_name()
Message-ID: <96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn.ch>
References: <20250201163345.49779-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163345.49779-1-biju.das.jz@bp.renesas.com>

On Sat, Feb 01, 2025 at 04:33:43PM +0000, Biju Das wrote:
> Simplify a5psw_probe() by using of_get_available_child_by_name().
> 
> While at it, move of_node_put(mdio) inside the if block to avoid
> code duplication.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is only compile tested and depend upon[1]
> [1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/

It would be good to point out the status of this patch. Will it be in -rc1?

Since netdev is closed at the moment because of the merge window, you
need to repost anyway, once it repopen. The tree you will be basing
your patch on, net-next, will include -rc1, so you won't need to
mention the dependency.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

    Andrew

---
pw-bot: cr

