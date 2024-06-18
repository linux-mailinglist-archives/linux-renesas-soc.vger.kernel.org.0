Return-Path: <linux-renesas-soc+bounces-6405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410C90D24C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 15:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04328B24BD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 13:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD18158D7F;
	Tue, 18 Jun 2024 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="z5xt0w2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B3D1A256C;
	Tue, 18 Jun 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716342; cv=none; b=jK5n0xNmFhZnSEhttdFO917Hy7X796Fk+yLpvq+dvfexILAjSIF2O9dD2BwYTXl13wyh2ny5/x+zbciMquLJKFIYKhcPEjQQViWIEsVtIKJssjowCSh+lUVtld/JSTmX9LQS29U7owlPOITi4j1eaQSB9D7V+hYH/pRF6S8j4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716342; c=relaxed/simple;
	bh=+WBtBaXJS8lGOL2imZ14JcqZkZGdXR8BOMRv4NDSygs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ura3WniSqQjGz7MYrtHtXIOaQXCEoSfwa3cstnGMuctpA3+qG7SbwbaQfTx4aaCPX3S5FcAVCvSRdD5vnjRJnPajN73JlISgdUYWxb510UK+vzNbXbi2C+BQ4sfJNYSlYuFfMSSJLMPp2RY9HgV49P0jCybKYYrNinLvr+sXo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=z5xt0w2v; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=CQIqotw36tjk6fbxHqnuwmapbS+Ywwh5FqF8IZHzgVk=; b=z5
	xt0w2vAaOs77BFE5Lph64xBPvF3cSOKvSY6x4yUY0L0zRxWcVwr/U80qfuPWmEzYrZB97OtmZEw8u
	xA1mpj8KEamRoNfhQ6jHRByMh7z5TzFjQgBjP2zzF3bvZ7j6UsN2kuUfPnRZKFINfDHo/a51irrsO
	JtQ0YUFNlQWLjZw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sJYct-000NUL-1Q; Tue, 18 Jun 2024 15:11:55 +0200
Date: Tue, 18 Jun 2024 15:11:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <7d4958cc-0fed-4f17-9e50-afb8cd836962@lunn.ch>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Jun 18, 2024 at 11:08:24AM +0200, Niklas Söderlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
> 
> The driver supports Rx checksum and offload and hardware timestamps.
> 
> While full power management and suspend/resume is not yet supported the
> driver enables runtime PM in order to enable the module clock. While
> explicit clock management using clk_enable() would suffice for the
> supported SoC, the module could be reused on SoCs where the module is
> part of a power domain.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

