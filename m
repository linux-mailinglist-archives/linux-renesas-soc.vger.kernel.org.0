Return-Path: <linux-renesas-soc+bounces-6292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F002909B13
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 03:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4F9282931
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 01:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73AA15532E;
	Sun, 16 Jun 2024 01:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="j0UJoMBU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF5154C0E;
	Sun, 16 Jun 2024 01:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718501019; cv=none; b=uO0CKzsRYfnRiP1NFm5AqH4970X/0JB0X6QzVIhGKXgnOMsHHqlyIO+xq5B/pVnc7JSZUnqZwO/3Cp2Y0lKXYmOo7g2FwhNa4BTIZHjxb2YeAs5ZUNsxclgSI17Yq4U5zati5YN8aq9I3MOhuJOaDQCYusBVwueTBkP0j1vfr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718501019; c=relaxed/simple;
	bh=dh9mvuWyp0eU8teIlxNhIfF/1X5fszgM5t6Y9dIWI1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2wPYgu1rmptU/A1VM0PucpaMZuLjk5xHcHqCdvSUtdm7PffNIpBOEGQZr4/8EqHxAA2TEX+dJ1O2ztkb2csofaxGViwlASMqhGeS+t2gqrcxOKiZej70VhYPjdUl/UhohjFy48rZf3mHiiLs8Ol+Km4GbwdxmFBDY9QJi2Ox7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=j0UJoMBU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lTZVCyklv744EcLdTU/mwOhqQgHd93wrrqaAFyjVQtk=; b=j0UJoMBUy2xcOTBYcPIotdDHpl
	M5UWGpUoXwN6Ty5kjkNNus8bkPanMxPHqcPvhA5k71tpRZIoqRl80LkYkl/zjKI4sehQNRZabQx3k
	WZIu5Ut6V7GrcTRVyz/jNI2ezExmBLkRkcBz2e/FMX2Lj6tqg5VVSMOb/P+dTdQit8K4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sIec1-0009x2-5t; Sun, 16 Jun 2024 03:23:17 +0200
Date: Sun, 16 Jun 2024 03:23:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Message-ID: <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615103038.973-3-paul.barker.ct@bp.renesas.com>

On Sat, Jun 15, 2024 at 11:30:38AM +0100, Paul Barker wrote:
> The RX frame size limit should not be based on the current MTU setting.
> Instead it should be based on the hardware capabilities.

This is a bit odd. MTU is Maximum Transmission Unit, so clearly is
about Tx. MRU does not really exist. Does TCP allow for asymmetric
MTU/MRU? Does MTU discovery work correctly for this?

In general, it seems like drivers implement min(MTU, MRU) and nothing
more. Do you have a real use case for this asymmetry?

      Andrew

