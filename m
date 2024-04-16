Return-Path: <linux-renesas-soc+bounces-4650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8799F8A6BC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 412F9282155
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAD312BF15;
	Tue, 16 Apr 2024 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uObp0SzK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0F1292D7;
	Tue, 16 Apr 2024 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272747; cv=none; b=TVIseHOeSe5Py8ujflCqPDobBXSr3pzfh3GuZSLNG3hQtrdDwULk9Ol10Dgv95gHUZWFVmx/u+QilNIWUMz6ybo0MvpD8Fc4s/rp7dP+IsXOMYpkKuH4kpyNV4DSusiswkt3n+eGMlBu3bvrVn8V1wlC+BBE7OGlR7LU98qSidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272747; c=relaxed/simple;
	bh=b1z3yu3eZywZK7+zjDREyjlZk2rviWYA77P5xb/Dv+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqfD5Pw30Il6KilwIuK/tGKe94/cp0BdW2Ses6pgKZAkRMWGs+QTkljfa3wIanJWzZK2/tR2qjoqTSa44Wpyfydrt5eVXIDP3yr3aa3EMv08JJlHjJGTjoy4E5lYoqxICnLpzbaZdTepYwI9uMZFzhxuNvtnAjm2APHffYmLEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uObp0SzK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zM0/CS5VSR/WGDhL4tzrJI5y+WJyrZo6sbYVZeKuV0o=; b=uObp0SzKYIgu+STLoM0fAC8Cus
	L0HscPInySKXrrDI15sxi3MXI3aaaTKaNfHBrvcT57qbU5mCT9z5CLkun7xcnFoB7B+JnkSb2y8uT
	C84D4DbREUSeBfxMK1TpjMI1z004cjqqGjhl1Hh2nFrJsSiW0f547sXU38fLT832G4Mk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rwiV9-00D8WS-ST; Tue, 16 Apr 2024 15:05:31 +0200
Date: Tue, 16 Apr 2024 15:05:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <ba68dd2b-b605-435e-8f6b-457bf8af08c6@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240416085802.GE3460978@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416085802.GE3460978@ragnatech.se>

> > > +	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> > > +		if (delay)
> > > +			val |= GPOUT_RDM;
> > > +
> > > +	/* Valid values are 0 and 2000, according to DT bindings */
> > > +	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> > > +		if (delay)
> > > +			val |= GPOUT_TDM;
> > > +
> > > +	rtsn_write(priv, GPOUT, val);
> > 
> > So you seem to be using it as bool?
> 
> Yes.
> 
> > That is wrong. It is a number of pico seconds!
> 
> The issue is that the hardware only supports no delay or a fixed delay 
> that can depend on electric properties of the board.

The general convention is that the MAC does not add delays, it leaves
it to the PHY. Probably 95% of boards are like this, and many MAC
drivers don't even add support for configuring their hardware delays,
it is not needed. Those that do, it is generally for fine tuning the
delays, being able to add/remove 100s of pico seconds, not the full
2us. This hardware cannot do that.

So i suggest you drop all this code, and just hard code the delay to
0ps.

	Andrew

