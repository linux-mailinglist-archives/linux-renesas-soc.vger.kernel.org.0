Return-Path: <linux-renesas-soc+bounces-3734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D9879E35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 23:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 503FF284046
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 22:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5707B143C50;
	Tue, 12 Mar 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pw0LDRaw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF114375A;
	Tue, 12 Mar 2024 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710281316; cv=none; b=W4gvygOw/oUV4Pbd9MfNoMMwHbd3D14bBlYaqpUdcXz7Tz+vvGTRdQvzWyNW59s2LNLgz42Ylplqz496P0EDZ1m+3JYN/Vy5YZnk4MaP9QAYlZRZGTF/RiIWnKZrONxXEr9cfib9cbBtLdzjHFuJXPIYNQ3sCr7W6hCJzJdQ5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710281316; c=relaxed/simple;
	bh=EwLB/Uj8ergRJBNGwWQlW4XkmUVZZ9flY4qHr8CZgQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpn/FXZVHSJnE9hr/wxeIkIFys4Z11lmFoa94CLw3GkmJpBxyPO/MgJRywGPOojkp0jM+DuXoGPo8a8m/WoqfJ30QGaDBJk4+lNOAob5khU/eiQHME4aFhm2KNuXJyN4UHH5DsqSZVPx20fgV00eXVH4+HD1vD7SxfkTSeTbqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pw0LDRaw; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=NaYmM985J2Hs7IMwWlZXXpYWlwHkuTD2tIFBINip91s=; b=pw
	0LDRawXce8PbFmKpEv5C+mxdma2weSF/7nHhSfnB3MHAMZIP7pNEkxqU4+oxS257Z70TbGOFYU3nF
	wNxXRd4L86yzHL6KGbLIEC8Gs4fV06pTHTbCgL+diOkXxGwL4t5keIu5n8gcboCus+ZwhfbYE1OeL
	E1kcmWJ9Ysy1lZo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rkAIy-00A5Hs-Dj; Tue, 12 Mar 2024 23:09:04 +0100
Date: Tue, 12 Mar 2024 23:09:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] dt-bindings: net: renesas,ethertsn: Create child-node
 for MDIO bus
Message-ID: <be37815e-f47b-4f26-9921-38cae0d4b545@lunn.ch>
References: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>

On Mon, Mar 11, 2024 at 03:35:07PM +0100, Niklas Söderlund wrote:
> The design for this driver followed that of other Renesas Ethernet
> drivers and thus did not force a child-node for the MDIO bus. As there
> are no upstream drivers or users of this binding yet take the
> opportunity to correct this and force the usage of a child-node for the
> MDIO bus.

Could you expand on the history. When was renesas,ethertsn.yaml added
and via which tree? Is this currently only in net-next and just sent
to Linus as part of this merge window? Or has it been around longer?

   Andrew

