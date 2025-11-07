Return-Path: <linux-renesas-soc+bounces-24291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF65C3E1B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 02:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 130B74E0644
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 01:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13442F5307;
	Fri,  7 Nov 2025 01:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pc2o/WBY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF6258EC1;
	Fri,  7 Nov 2025 01:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762478312; cv=none; b=o3/2eL+x88sBwlMsujuk0lWmH9WvRWyDLemOq1TwLvnpJKP1KdFHu6PzkvwXOWTD7NkGygQkXb8zPOI6J7hwZtp17pt5blVABVXThkxaatAb20PNhy0dj3k1W+xVkBmWHkXbzcIYOQrWtu/lRYfV3JYiGiDBrlhRaCWKQ55z8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762478312; c=relaxed/simple;
	bh=/XUQcLX/DssFEYToi8ATQRAgC0ocRUSMxXEws7yFSrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfteWQ9zrIMYa1GPbETYyKsrcTicmX4C0Pke6BQbmpDpLI9wuu2zRlzKZoN9YfD4KxizASSSKUHn6MqEUJxbC/ned4P5jly2VMFzb2QxGNeuIdYbVVfE+GXf5ez7Q6YGdgraDiVqjcHCXf8FhRTXc3xhg73zb/Kbeaf0zEf4RzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pc2o/WBY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=25TG0nkSoZM06L8ojtd4p89MV096ynikw4UCVzYnK+8=; b=pc2o/WBYexNYxkS5/JYR99/NCt
	8ViTIBUa5zf5gUtik31d4coztpUTRzQvJLtm1EdsajhqGzU+vcmtj3DQlbliolZ2+3d/4i37Uqspa
	EC6/saxxsaBRrOurFfPDnN1B+tQWcSO9u9QwTFuuOsVCWFbe9SGI/C3QsvZhP5r6fPt0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHB7N-00DAjh-5I; Fri, 07 Nov 2025 02:18:21 +0100
Date: Fri, 7 Nov 2025 02:18:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 06/10] net: renesas: rswitch: add MAC address
 filtering
Message-ID: <8144664b-1c84-4e1a-8758-f4fd2eb9c9ff@lunn.ch>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-6-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-add_l3_routing-v1-6-dcbb8368ca54@renesas.com>

On Thu, Nov 06, 2025 at 01:55:30PM +0100, Michael Dege wrote:
> Enable MAC address filtering in Rswitch HW.

Please try to answer the question "Why?" in the commit message, not
"What?". Why would i want MAC address filtering? Why is it being
enabled now, when it was not enabled before?


    Andrew

---
pw-bot: cr

