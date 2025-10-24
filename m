Return-Path: <linux-renesas-soc+bounces-23560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 152BDC03F46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 02:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62F13B656D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 00:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCECB3AC3B;
	Fri, 24 Oct 2025 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="b4kvzKIv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55034A32;
	Fri, 24 Oct 2025 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761265501; cv=none; b=lbSL1Ds0OrxvT7PFpfU80JsdR5YMvXe9EYhrtdiRdFNRQpiqVwwIoRW/hC/eMI4cOfu4y+CjOyxGYn1KfbJonCTvhpY4yvnhJj1xed31Idju3NwmKIcTbXjzb3WLCgWk5+FHCF1J8aqb1qFy5BGXKHileImEbSGCqkZWzJCPoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761265501; c=relaxed/simple;
	bh=FSNBGlAg7FKvXCJdls/1crLY1kJhxDB9v2AWwP9UgH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irswE7gFYat/mg7O0+K5Aa4M8TMPlKypVbzhnvCsP3J87X5d60UVz2YrDRbNwv/sKOp0ph+jEIy7e3EI3dddXLsbr52jfNT1TgzMWSkrz/Opm4cJ4MUEuFlBTdiVH3AZLqbK5GXD0G0qicGh3gcOeJNeWECkkOr216TrOBXUsmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=b4kvzKIv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Zvpjbe+z5MHqFmu3+PTK6lXqGl0K38QQIGjrxq3Azhk=; b=b4kvzKIvZxLnJ4W+DltOKLFLm1
	KtNTDQ2ZNNYAnq+3Hf2e0uDzEELQNfp9UO0fNjiU8yv5N/dRSGPlK/Nf/vZQNiv7+GP2ywbRCnury
	B1SHu6D2EXkQiAW1aRR94FJTjf+363+6PYfzkRpuTS/L7XkAH2BkUxAxd6ieD2CzK+zQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC5bf-00Bw60-Gb; Fri, 24 Oct 2025 02:24:35 +0200
Date: Fri, 24 Oct 2025 02:24:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: netdev@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dan Murphy <dmurphy@ti.com>, Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net,PATCH] net: phy: dp83869: fix STRAP_OPMODE bitmask
Message-ID: <825c8662-831d-43e0-ba28-a1373f9d5a9d@lunn.ch>
References: <20251023224018.192899-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023224018.192899-1-marek.vasut+renesas@mailbox.org>

On Fri, Oct 24, 2025 at 12:39:45AM +0200, Marek Vasut wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> According to the TI DP83869HM datasheet Revision D (June 2025), section
> 7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
> Fix this.

It is a good idea to state in the commit message what the bad
behaviour is which the patch fixes. Somebody looking through the
patches can then decide if they need to cherry-pick the patch into
their dead vendor tree, etc.

Please add to the commit message what issue you where seeing which
made you create this patch.

    Andrew

---
pw-bot: cr

