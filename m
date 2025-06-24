Return-Path: <linux-renesas-soc+bounces-18683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91DAE70EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 22:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DC1D169EA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 20:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC0C2EBBB6;
	Tue, 24 Jun 2025 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UXknAuxx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F232EACF2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jun 2025 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750797300; cv=none; b=ScwEUFXlzAo6TywU6X8LYA/pk+H/1zfo3AoJA81T0wpnRn1P2FDtVP2fnE6QwXaz/OgqBKj5yFHIx2CD6wLkN2sjZo9QIul//9vQWrjPiq16MFpwYSJ4szRsxMK5a30Hg1UIDYm3B1dAjhk0Wd14jUW6wHNyjqD/vx92zAOzOTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750797300; c=relaxed/simple;
	bh=iwdCuNtR2YXeb5TxPwBg0rEU43LuxCwr1/0SKioxc/s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfqcMTK+k3C5zlK1hP+vZj9ADmbtKMfXmK32RNA7we14PSkjrdruX/9joVYCjvz7AyXAoIuX5LyW6qhgMuiBjJ1a8bvLECdxy0Sc07VRfFXvH8DFHcMtSkk6YDWa2t9+6xnggqPnbL8bZ/aMwGpMYZTg8x9U6z97/rCRg/cn7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UXknAuxx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7AuJ
	9YU9jFDUljZO+hquoP9p/rWqhnul6Xl2GFZxwtM=; b=UXknAuxxM2nUZiVNhIV0
	ukczPTnOpElPLZiDJtCSq7WpZU4KY65gH3hsRfmtwXKfGOsnHDmVRdSnYh8Q0siM
	UOnWCWf7f7ZJuq16C23DMjYPi22FjHOSfD+ebjB2/2LMtKnO32dIlOAbRxebJu+T
	bJUclI5vIxmuvoAHHFMj92pxB2BUisnKYz/rcHrNeIv4L0YupwxcQrYh7R8RZqIk
	iS+q89uQ3xSZtdpNqbiKzXBRzVTM/AceLcCR5/R4Fxbz6b1oc5fSCK0pzJpftU/q
	igRCurDWYQT9Aa+qFZSUQzEJ6o12TvVlbPIic36hMdRg3FEX/MNRSqHTfFFXxDFA
	qA==
Received: (qmail 392374 invoked from network); 24 Jun 2025 22:34:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2025 22:34:55 +0200
X-UD-Smtp-Session: l3s3148p1@4ZbHQlc4cOBb5ybD
Date: Tue, 24 Jun 2025 22:34:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>, linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aFsL3pJBT6IpYD5M@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEvyfM42WTKENbFO@shikoro>


> > > There is a specified timeout? I couldn't find one in the specs, can you
> > > kindly point me to it? So, the solution is to use 100us as timeout?
> > 
> > See: 5.1.2.5 Controller Clock Stalling
> 
> Ah, I missed this one so far. Thanks!
> 
> > The spec have not defined what exactly happen if stall clock more than
> > 100us.
> 
> I am going to the I3C Plugfest in Warszaw in 10 days. I could ask people
> there...

Well, I also couldn't get an answer here. It seems that part of the
spec has not been excercised a lot so far. The best recommendation was
also to use a timeout < 100us, so that you have a bit of time for
cancelling.


