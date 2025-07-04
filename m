Return-Path: <linux-renesas-soc+bounces-19190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A4AF8C0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF8E587BC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 08:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB12E9ECF;
	Fri,  4 Jul 2025 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1o7ErPiY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1B28982C;
	Fri,  4 Jul 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618051; cv=none; b=WTiaM05pMnLP0+D1x+uFZa+5MD/JzkGzJ7w5TbaklXmsl6/mpSlEVbcyRHs/1CjX36moAySorAh9tBiGrTcRVZMYivqSKteywiANl5T2DX7oAVHvuYphWa0gQoVRIckBKrW7E+OPAAngONhZfjGO5uk85x55hT7Rg9qpfzTo4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618051; c=relaxed/simple;
	bh=YQUj8cYV3IXVm6+I4pRxyP86i6gcIjFheOeNfzHOmJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJIGLW7IyRnt3CTtXoGlKOx+kwOB0sNL3e0TLkWd03e8/pehU6FXfbw2EoWkR8v51HIcAEPmb9dhjO7kVOCUIHPYWlr6VHAcnjFkJv4kF976dMcYqMn/RGK/2fRTZHVcVIDHo2ZBBA2TP1+ywvz8xn6fmLWaSugbn5CdGjD5Hvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1o7ErPiY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ii+04oA884vMBHGqgm2iM/7pdCvGxYzxkHgc7OFD5wo=; b=1o7ErPiYwFG0I1AJC8FGdPMkQe
	+qmFD1YvD3prV7TWYVN14UjVNjFJRYAT7YMMjtSSxPU32cW4Digf2oxF4OJrvXn4qBfXCp242BMow
	hGBTUWmfsnGmaw0J4FtGwRXbhmC3KS5f0kXqsNCYaMmIoFLdhNsNCa7eQPKfhNa4gOVc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXbrr-000BYx-Ek; Fri, 04 Jul 2025 10:33:59 +0200
Date: Fri, 4 Jul 2025 10:33:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Message-ID: <9c8cb213-7daf-43bb-8d20-aaefa13127af@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>

On Fri, Jul 04, 2025 at 07:51:14AM +0200, Michael Dege wrote:
> Hello!
> 
> The current R-Car S4 rswitch driver only supports port based fowarding.
> This patch set adds HW offloading for L2 switching/bridgeing. The driver
> hooks into switchdev.
> 
> 1. Rename the base driver file to keep the driver name (rswitch.ko)
> 
> 2. Add the L2 driver extension in a separate file. The HW offloading
> is automatically configured when a port is added to the bridge device.
> 
> Ussage example:
> ip link add name br type bridge
> ip link set dev tsn0 master br
> ip link set dev tsn1 master br
> ip link set dev br up
> ip link set dev tsn0 up
> ip link set dev tsn1 up

It is not wrong, but it is normal for an interface to have a number of
some sort. So br0.

> 
> Layer 2 traffic is now fowarded by HW from port TSN0 to port TSN1.
> 
> 3. Provides the functionality to set the MAC table ageing time in the
> Rswitch.
> 
> Usage example:
> brctl setageing br 300

brctl is deprecated. iproute2 has a method to do this, which would be
a better reference to give.

  Andrew

