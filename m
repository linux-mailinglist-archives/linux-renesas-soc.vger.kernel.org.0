Return-Path: <linux-renesas-soc+bounces-8931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461EE974400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 22:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 724951F269A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 20:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACB6183CC7;
	Tue, 10 Sep 2024 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZexFf+SY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF01225A8;
	Tue, 10 Sep 2024 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999685; cv=none; b=WvPLgAlNMVi29OBStra3pv9X4oCSS4JB8YkdMWkhVd3FXDXj30niF7AkY7KpsMRZszillWkYv84M4pCBLyazkuPiUiKaPtHd6GF/F1XMNi6hnb2jZ83HINd0s22ArUVPNpl+4WITcxf7AIuLcJ8kA5dAOw13oqzLtH15ikTQfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999685; c=relaxed/simple;
	bh=5gGz4/repS+HnMCJHP3BUj8k2XgMj7oh/lyP3iPi0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npUKVUPMjXb+/nta8tw75fECICWVFv5pd1N5dMiTf76WTYXjJcnLoklqgu1XwYVWClvJhL3VzoD30n+4Qz/KQuZ6cjSlBo7SIDsNORnyTPgOP6nsb1ei8s6ulPTK4naVr7h5JC/UTnnMuHyjPbepYyIzHY5wzaHMpyW8gtf5XoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZexFf+SY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=BQMNvEvTZyBkro1NdoLjMyz8efBDDw9HCIOMj80hZF8=; b=Ze
	xFf+SYVazXttYvn2x9kQbL5RHEkMCSCgP0XzlVTcdGhGsDi7ndVU8xFDpXP9Dkli9T3lr3yd7Lymq
	fseaEq4QGHxWDfvKOUI/vuXN2/o3qaSLlgsdvduHyv7o+s2wu7b71un8CyXHcIyh7nOm32jvuh0PE
	PKWJvZzS5piJJwY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so7MN-0078sH-4n; Tue, 10 Sep 2024 22:21:11 +0200
Date: Tue, 10 Sep 2024 22:21:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 1/3] net: phy: marvell-88q2xxx: Align soft reset for
 mv88q2110 and mv88q2220
Message-ID: <3486c75b-90bd-43a7-bc2a-ae37a4ea6c28@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 03:39:49PM +0200, Niklas Söderlund wrote:
> The soft reset implementations for mv88q2110 and mv88q2220 differ as the
> later need to consider that auto negation is supported on mv88q2220
> devices. In preparation of enabling auto negotiation on mv88q2110 merge
> the two rest functions into a device generic one.
> 
> The mv88q2220 behavior is kept as is but extended to wait for the reset
> bit to be clears before continuing, as was done previously on mv88q2220.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

