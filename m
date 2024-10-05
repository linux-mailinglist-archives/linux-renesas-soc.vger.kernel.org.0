Return-Path: <linux-renesas-soc+bounces-9493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DB991885
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 18:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA40282954
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 16:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3514815820C;
	Sat,  5 Oct 2024 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EI3GzqwF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD178F70;
	Sat,  5 Oct 2024 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147160; cv=none; b=fyRzwiBtKkhd2LRU5yGloeSqgm39BS29h2vp+4PjM6YLs/F3W1Q45f7tU123o4Eg/fHFDjsZtdhi46sACXs1ImPW6YHpdvq9szgJZYLgckz8G8tRNQie2B/7wTe0Gg25ajE4D66KDdNmIW+ZGt/1kivAnG3o+2bfKU22mir4n0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147160; c=relaxed/simple;
	bh=WIbnNXd7Tu+07WfI+ahblVIpJv56xr822LSz13IZT6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC6ho4vg3wgljPiQUrp9fvHWwIaLbBZyPh+L0ey51S50u8Dht3TU9s0HW1i/8anIIk6KuoqNFOl8WrgOfgj7v/FF3OLkVmT0GKVEwqZTqUZUM6Y7uArD7ZzRmyb5TuFdfwm2JctbLIKTCbv2Nu9icQV4LxJ8QcAeRwcNQh7HvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EI3GzqwF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=PhGp+QsrC4pvoYbysHsC5tVBpSCxTsid5flXMvcwyiM=; b=EI
	3GzqwFGSjdvgXvNmkcxGW9AvUvjqgwh0Sh50VB2RH+t1WiNmBAc6fqhlX5mQqZjAwEyVIYZ4iIsgF
	ogq4Z5FdG41UatvxSxKQSlVTitBBhn5MEjAIGFL6qfedbRrcCMPeQTknZfF2Bdn3oIlFXgG10BpKS
	X9wWWaSNsvf7S+U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sx814-0098xQ-Ah; Sat, 05 Oct 2024 18:52:26 +0200
Date: Sat, 5 Oct 2024 18:52:26 +0200
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
Subject: Re: [net-next,v2 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <78226f37-be01-4bab-a496-97597daf3b68@lunn.ch>
References: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
 <20241005112412.544360-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241005112412.544360-4-niklas.soderlund+renesas@ragnatech.se>

On Sat, Oct 05, 2024 at 01:24:12PM +0200, Niklas Söderlund wrote:
> The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
> PHY without auto negotiation support. The reason documented states that
> the provided initialization sequence did not to work. Now a method to
> enable auto negotiation have been found by comparing the initialization
> of other supported devices and an out-of-tree PHY driver.

So lets merge this, but if a regression is reported, we will revert
it, and make autoneg default off, but you can enable it using ethtool.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

