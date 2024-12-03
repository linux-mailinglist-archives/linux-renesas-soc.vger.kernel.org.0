Return-Path: <linux-renesas-soc+bounces-10873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A99E3003
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 00:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4322F166EDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 23:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2648220A5EB;
	Tue,  3 Dec 2024 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MEdCVjdM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCC20A5C8;
	Tue,  3 Dec 2024 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733269413; cv=none; b=CYyZv/cOPjUkPqJ8VX9DjE4JpGdoW4Vd5mN2ttl9CdD+ENey9oyzCpPYmkOu5O8pYrzbGvSZSdCtfw7f1THByczD9YtCIg1l+cljaGnlXVfh8RF2TcOC887RXwKDsNFXE4GQD75RD8aELjr0WoF5FanhrmPyOvOrdxNnW8tLZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733269413; c=relaxed/simple;
	bh=LyFhfcGDDp3iiYe/wE2NO59JldwCNkV+RWAKPRQ7Li0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXijwFVExE4AaXxbtwDG+5T38HtSHfnI6A3zbswV6qLOS3z74DI2clvSiDTwPwosn1mBYj+tL0L4QIGg8CPtHE+z9XtzMIrOFWIT16gX3Ey5GMtOSUsci5RpnAqVcU1qNOMWWhKean0HULq5hGdV2PZ4Q6usJBLLWoFPLIACetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MEdCVjdM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=V8QHq4a9upy6xV6oH7z/GpPKpi3TAWM6aw8hyiRiWdk=; b=ME
	dCVjdMWyQ5j42ILX0uD8yK4dyVMMq0aU0p76M+HA8VapHjuCN0ituCjqZeFp4dUTG1eRpUD+rqR09
	A7F8NnRQuZ70kuworHookiBvDRh81sZ00KDNBJuBZngoIw5fa3ObQGzhXBQIbbgvEJvsBl/SXdjs/
	+WZd1Vc+6SFmowI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIcXx-00F95B-2j; Wed, 04 Dec 2024 00:43:13 +0100
Date: Wed, 4 Dec 2024 00:43:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Richard Cochran <richardcochran@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv4 net-next] net: modernize ioremap in probe
Message-ID: <09215f37-883b-4627-8f37-04a2a5ef8ae2@lunn.ch>
References: <20241203222750.153272-1-rosenp@gmail.com>
 <Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>

> This is not equivalent. This means if ioremap() fails inside
> devm_platform_ioremap_resource(), we end up printing a message that
> blames the firmware, which is wrong.
> 
> It also changes a "resource missing, proceed anyway" situation into
> a failure situation.
> 
> Please drop this change, "cleaning" this up is introducing bugs.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
says:

  1.6.5. Using device-managed and cleanup.h constructs

  Netdev remains skeptical about promises of all “auto-cleanup” APIs,
  including even devm_ helpers, historically. They are not the
  preferred style of implementation, merely an acceptable one.

  1.6.6. Clean-up patches

  Netdev discourages patches which perform simple clean-ups, which are
  not in the context of other work. For example:

  Addressing checkpatch.pl warnings

  Addressing Local variable ordering issues

  Conversions to device-managed APIs (devm_ helpers)

  This is because it is felt that the churn that such changes produce
  comes at a greater cost than the value of such clean-ups.

As Russell points out, you are breaking things which probably worked
before. "If its not broken, don't fix it". These changes cost reviewer
time trying to find what you have broken, when it would be better
spent other places.

If you have the hardware, and wont to work on the driver to add new
features, then yes, you can do this sort of conversion, because you
should find your own bugs via testing. If you don't have the hardware,
please just leave it alone.

	Andrew

