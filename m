Return-Path: <linux-renesas-soc+bounces-13178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71357A36514
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 18:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 373F416E811
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 17:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CB3268C58;
	Fri, 14 Feb 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SLMgw/Pl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821962686B4;
	Fri, 14 Feb 2025 17:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555895; cv=none; b=sUhVsZ+unnclZE4LiBx4WsZzFL+nPX0jjvm+xixl0fKp8QlTADdm92aDk/pRyozt4HerHXWwiBP1CFxTk1VI0CpgePfiQIbybNlFuB0wOlL/6rvxBfG327v+l/Kh5feNOBmaHibYGTqbAnLZEDJm21dDZIfKGAEHUMU7vTrswOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555895; c=relaxed/simple;
	bh=rEIAEtvYmdPu7SU6pOY9oo0eRrjpSBROaSuwQduXXpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRjyKn+FfCmjFGjQdb8TZ6o9oTjXPbVAW4go5/nD+MHlumIrGDi6GmlU0dVqJzT+rj5+5I4vQWHO+736DhKdFMXoUCwOXTISOP+YAHV7i31t0qLkfe/4/PdP7yuOVWKwrq9knBZrD6PzdFCRoPMT5ewvkdrUwNa5QCTwMHf93jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SLMgw/Pl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=7FGMyHT2nMROaryKxZJ7vH9rzFPcWv2QRUkO5SYifck=; b=SL
	Mgw/PlyXxpc+zoMVoiLx/UVwi1bqgSEkc0I2F149lnGoWgrao2NyewhMel0nOeK7/2B3mp2RKK8cp
	ifFBk+iGbnvDlEwuoFBBGBQw1z/gHyJZxpXFOoQFNyS8t8Frd6cNi7cyfr9Q4yqAaYxeiz4p917Jd
	I7VvfjOZT+wnzCM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tizwu-00E905-FW; Fri, 14 Feb 2025 18:58:00 +0100
Date: Fri, 14 Feb 2025 18:58:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure
 for mv88q211x
Message-ID: <e91828c5-1a48-43cd-a930-3d178256e5e2@lunn.ch>
References: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>

On Fri, Feb 14, 2025 at 06:46:50PM +0100, Niklas Söderlund wrote:
> When adding LED support for mv88q222x devices the PHY private data
> structure was added to the mv88q211x code path, the data structure is
> however only allocated during mv88q222x probe. This results in a nullptr
> deference for mv88q2110 devices.
> 
> Fix this by using a generic probe function for both mv88q211x and
> mv88q222x devices that allocates the PHY private data structure, while
> only the mv88q222x probes for LED support.
> 
> Fixes: a3783dbf2574 ("net: phy: marvell-88q2xxx: Add support for PHY LEDs on 88q2xxx")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

