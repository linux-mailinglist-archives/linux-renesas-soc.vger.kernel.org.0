Return-Path: <linux-renesas-soc+bounces-24434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B2C4B3AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 03:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0A4189014A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 02:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E5C34846A;
	Tue, 11 Nov 2025 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cbfK4LSp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8DD348460;
	Tue, 11 Nov 2025 02:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762828855; cv=none; b=ahALCzpO5Ic7xfUbv7s/2hwZFQFnpBTiyYN24wTRKO4bGh2SLRjWGHiW6f7kr5P1wcgHi7gX5jilCCrPrsdow/DcTydisp9DxObf8f4s8pvieugfgX//hJRtABYxO92HiUDryB0WcryLdBvWFDZUvBt6qb58J9nTFrNvys965eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762828855; c=relaxed/simple;
	bh=fJ49jzTT+lvI6CEyuiHc4kFI2OLMGXFPJ/7BF+gjduA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtrsuBgoU3O8ws7vpQW/+DtJ3TSBA3WFjz9NZFyuzU6S2G9exW+4LCwkNpfJm4a+UuRoEc8hITp1LFUGg0N62MkMeCUIClBE4YePLRgFXF2ehRtTe7QwdKi5HLvVR38C40npzXlRRDFb8yB/C7zTjOzrxmmSUzKCQDu2gwsQkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cbfK4LSp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mLu6fyQIWnvYdy2npzJcu8BCKxp0W1/nSWiF9WaoSyE=; b=cbfK4LSp9QDYWerrvdGEBpQiEb
	5h2QSas+l0KBjLd1IksLFFpDSDrb6pAK6JF3DmFgZLT8x8aYH+xGN6bNsK/CeMkRY74Wh5Ux4X0i1
	FcIRgchucl+ra4Vq9YlXIF4nT7QdJ5JSr+Oh4a9B9GJuxywsNVZFad/vJs7WdOHa57R0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIeJ8-00Da9K-9L; Tue, 11 Nov 2025 03:40:34 +0100
Date: Tue, 11 Nov 2025 03:40:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mscc: Simplify LED mode update
 using phy_modify()
Message-ID: <006dfa32-55ba-4460-ad14-b695e040d69a@lunn.ch>
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251107201232.282152-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107201232.282152-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Nov 07, 2025 at 08:12:30PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The vsc85xx_led_cntl_set() function currently performs a manual
> read-modify-write sequence protected by the PHY lock to update the
> LED mode register (MSCC_PHY_LED_MODE_SEL).
> 
> Replace this sequence with a call to phy_modify(), which already
> handles read-modify-write operations with proper locking inside
> the PHY core.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

