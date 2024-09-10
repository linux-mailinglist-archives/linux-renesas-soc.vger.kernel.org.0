Return-Path: <linux-renesas-soc+bounces-8930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 072309743FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 22:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39A791C2573A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 20:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0D5183CA2;
	Tue, 10 Sep 2024 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1tt27u2o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ADA566A;
	Tue, 10 Sep 2024 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999552; cv=none; b=fjNr2zzrayJQxcVCx8PiW/wDpPhd+FAK9iFJYlXngoqfqQVJK6/ECtutUqtwImH7eA/XbUb55tYHgVcEoBzhnHkhHvp/xHraH+jOQDE3QEUD+CcZYj05c+1FyLA9hECP7KCaWyexNlrCz/JS5aDj0wDriM8/ojYz9ghba9i9mPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999552; c=relaxed/simple;
	bh=6ivQaTPWjCd21BMFtSZ8l8cCBDFhqHHe7/bzRTJM5rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzUvLck/eG+xirJ8Jbl8cBO3Kj3oAErm5B2WnY4xi5rXD8xjRbrGm6E1vCJW1HtxiwK1G+SMlpJXesjKX9vwRzwwyGhevdemJul4xW+dVvRup8H3i+fmQEyOKTpAOmGT9DiXa4/efpyFoMREs+QtHSabps289iw5QOotNc5jO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1tt27u2o; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZRR4pzCck5kOfd3Tevwuyw9lPOTZahfq45S73rOgYPI=; b=1tt27u2oUJ6gDLyXbw1DIfXOoA
	ZwXuXe07zcPzY1uRznOLsn/w9scZxsWG2ozHuXrSoxxVzs5XjTIRZe4etXwT4Q3/ZoIaPUj6daZ1J
	fJfnWH1fFQ6XrRL24+o106WQqiVaWyZ4WwHlD4Hv/W3q5zp6vmNQZJzFnntux6uH5Jn8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so7KB-0078rF-Ua; Tue, 10 Sep 2024 22:18:55 +0200
Date: Tue, 10 Sep 2024 22:18:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <3a39a016-2ef5-4efb-bd3f-7f5a37eaba41@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <c334205e-6289-48da-b0c7-7ba82c6d2709@lunn.ch>
 <20240906213923.GZ3708622@fsdn.se>
 <f18ef2e8-f3ac-43df-95d4-96cea73e72d4@lunn.ch>
 <CAD4aGmRrofQzh56BSJKhmQnVM6qC8yLYuBsukirttZak26vRHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD4aGmRrofQzh56BSJKhmQnVM6qC8yLYuBsukirttZak26vRHQ@mail.gmail.com>

> Sorry I didn't reply before, I'm currently travelling. That's also why I
> couldn't test the changes yet.

No problems. Please report back when you have tested it.

> For our use case the proposed change shouldn't be an issue.

O.K, it would make the whole story simpler if auto-neg was the
default. So if this does not cause you any issues, lets go with that,
until somebody else reports a regression.

      Andrew

