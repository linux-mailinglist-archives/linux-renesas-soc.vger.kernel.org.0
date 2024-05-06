Return-Path: <linux-renesas-soc+bounces-5195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1A8BD600
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 22:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B08E1F216E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 20:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BBE15ADBE;
	Mon,  6 May 2024 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="6Xh3px8h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6B156F46;
	Mon,  6 May 2024 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025662; cv=none; b=l2cRgmW9vDQ+LHFLdmccYTk+Pii4ta9PZWOFVKIX4fkusOGFrhBo4U7SCDkYkt0hEQNjtMrUEwmZH3QeJUvbynYKD4CJTZivyPVlJHiDbm4OTZMMZvnvQ1D3fCgX/OpEjtzdFFPNKOVhBWhWxHtFuEAm9UxmbrulWXs4WetwQL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025662; c=relaxed/simple;
	bh=aUpeEBLTUmXEVh5GDMu1oxWha4/2yFgxd2vn3MAXSyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr7dDvg8lKDKp0bnZCgl199R5BNag18s4j/XNR7eMSh8lUxkheiDH6v8Od4IWj1yuDTMl6Ckaz8UE1YMmJPyd/U31KPi5k/Jwcg8OZG6wmKJ8zjo8Wuivjjz6qDV/UlqDbBtWPROOqQU20MLPpalkUVZRC5g7+Pwguzqx82cTIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=6Xh3px8h; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GAysR8dKRX6QTtp7WFrS61A+RI8BaKzpDO3W65hTKcs=; b=6Xh3px8hHPPxvZ45u1TQv3eWQI
	R3yq/H+XLqO6TBapXS0EQ0F7l8Zu+uhw/Us0SnChBAD7ofqvUyg2w4YqKTHmJqvYALg4AXVqL57TG
	yh/uRn2KOs4FDoJjQqi8qrXvulb+IeDkafistwRJQ+UEIxqgkO5n7rZ8GwxfN7lw3P8g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s44Vy-00EnMa-SK; Mon, 06 May 2024 22:00:46 +0200
Date: Mon, 6 May 2024 22:00:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <2fc4d494-4ec0-48a8-988c-68f31c4f691e@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
 <20240506140533.GD720810@ragnatech.se>
 <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>
 <20240506182615.GG720810@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506182615.GG720810@ragnatech.se>

> Note that this driver differs a bit from RAVB for which [2] targets. The 
> RAVB driver creates the MDIO bus at probe time, this drivers creates and 
> destroys the MDIO bus in sync with the interface state using ndo_open 
> and ndo_stop.

That is not a good idea. It is better to create the MDIO bus at probe
time. There are a few reasons for this.

1) It takes while for the machinary to load the PHY driver, when it is
a module. If it does not get time to do that, you end up with the
generic PHY driver, even though there is a specific PHY driver, which
becomes usable a little later in time. But your network is dead
because the generic PHY drive is not sufficient.

2) It is possible that creating the MDIO bus fails with
EPROBE_DEFER. If this happens at ndo_open(), there is nothing you can
do about it, other than return the error to user space. If it happens
during probe, the driver core will handle it, and try to probe the
driver again sometime later.

       Andrew

