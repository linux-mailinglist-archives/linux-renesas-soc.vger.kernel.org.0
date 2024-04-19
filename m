Return-Path: <linux-renesas-soc+bounces-4738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE728AAEE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 14:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190BC283AFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F388A86651;
	Fri, 19 Apr 2024 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="THwDFaE4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15348126F3F;
	Fri, 19 Apr 2024 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531399; cv=none; b=MPoTP/pC+GVBAtLugeOuzJTEyZMtrc4u3B2aJGoy+9qwrssWfN71uVfFjWQR9MPMpF4IMrHsQX4SB83zw0oh/6xvjGvnjXTr+VxxhtkZCj8/P5YFz0LVh5YgR2xYfNeaOyN0vadfatR0V1APi84zlzywPO7guveUZTLsW4jpsKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531399; c=relaxed/simple;
	bh=bi8dwQbQtBnDJweaMJsbQecckwLVFupaC5aYCUp1JzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2bkwoyKNx5EaeWM3IdlG3LRIZQl3g+CCmfhe+6L01MKAPgppenu0QApJm2SbPKnqsg6biYfgTWcArdUXhpdVTGQJD00XDnw6gOXOpta6sRR2rAwDNRa5P1xWMDil/Flb2K/M6AYlXy07oTuz9bW7P4WLkeE9AccOLh6zYiG4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=THwDFaE4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2Jif6fV62mbs2xw8j5iges5QYiK5uXaZ46PS1C8iYc8=; b=THwDFaE4MSIOXnxkRWVg+AT90O
	YnR+FLaBZxIBykDwHnnkxgUJcFMlNICBZ2AvVoZxSS5/d0UYHPrp+kGBTQ+ZPKywmZO4DmKdSx909
	n9WsIPWXK2QD7VdeCqVPyrv0bjl7wHcgcsDX3UZxO7g+iq+5HAItuvyt7lkuk/67AMpY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rxnmw-00DRx8-19; Fri, 19 Apr 2024 14:56:22 +0200
Date: Fri, 19 Apr 2024 14:56:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <e6e3fbd2-7a6c-4ee4-aaca-4b8164b88cac@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240416085802.GE3460978@ragnatech.se>
 <ba68dd2b-b605-435e-8f6b-457bf8af08c6@lunn.ch>
 <CAMuHMdXt8z-fD7XQ74nfu=jSL8MT-1tauZk0iRzieyNUB4cyRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXt8z-fD7XQ74nfu=jSL8MT-1tauZk0iRzieyNUB4cyRQ@mail.gmail.com>

> IIRC (from users of RAVB, which have similar delay bits), the issue
> is that some boards require a larger delay than the maximum delay
> supported by the Micrel KSZ9031 PHY (960 ps).  Hence these
> boards need to enable the MAC delay.

Which is fine, just comment in on.

Whoever, some MAC drivers which implement the delay get the phy-mode
passed to the PHY wrong. The board requires rgmii-id, since there is
no extra long clock lines. So i would expect the DT to have
rmgii-id. If the MAC then implements the delays, it then needs to mask
the PHY mode and pass rgmii to the PHY.

	Andrew

