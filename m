Return-Path: <linux-renesas-soc+bounces-3448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9B870321
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B17B2839F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859433E48C;
	Mon,  4 Mar 2024 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="n0yvI7wW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF23F9FD;
	Mon,  4 Mar 2024 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559938; cv=none; b=hfxsUajvEbG/fG01ENeXAIM8Y0NXHfLOcIugCB/ftQlwiifXpi4iATycvsOPaUMQauOextx4NYHWy93rZ5ewRI2BcZhPBx3TPrzKHFJ0IZPHmYivFQgcctgfs6kyUhUAuI3uIacJ8Ls/GwSJ495k84y5MXMI7+hoBzCZ4uZ93cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559938; c=relaxed/simple;
	bh=xFHy3ny7U4gLnQ0muE8V74wZ7nXlRt75NucSIY3Slbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXpz8d1Elp/BIvSvQkcLJXJgCJIX+ZEkjD1jjIAPTZTPgHV9jUD7fQqCHJHnv3NWYWYNNqDCb133Y9+qxVtpO95to4PshppdyrRBIJB6zmPWF9UweAwhih81KS4AFvKYsrmbJ31bfGbFoTNXbTaXWTBnvDiJP181qkhYiaRWNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=n0yvI7wW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=4CuK9RJoUFE9osShBaBC+MEtYr4Lrx6dWTQvApzazpo=; b=n0
	yvI7wWmtpTh6ozGtepbm43S2CDPww3ic1yk1xzIp6tQ6hdhKdseD+jYMY3hWGGUcW7FzaY8zyfBka
	HTIJLacJyFMYeyLJEWC9rWjhp2pKQMfmsFzFcX16jnzoD88s7Ny33ywPa39aoQAnrohk4rDknOeVG
	MU8kK8QFq4CqeQU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8db-009KQc-Pb; Mon, 04 Mar 2024 14:45:51 +0100
Date: Mon, 4 Mar 2024 14:45:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v5 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Message-ID: <1ed62b95-679d-4b88-9dee-37a547ac277c@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-7-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301-rxc_bugfix-v5-7-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:35:04PM +0100, Romain Gantois wrote:
> The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
> started before it initializes its own hardware, thus before it calls
> phylink_start.
> 
> Implement the pcs_pre_init() callback so that the RX clock signal can be
> enabled early if necessary.
> 
> Reported-by: Clément Léger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

