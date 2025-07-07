Return-Path: <linux-renesas-soc+bounces-19314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB9AFB2A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A214E7A12A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4801D29994A;
	Mon,  7 Jul 2025 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="s/XG/WfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637751373;
	Mon,  7 Jul 2025 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889226; cv=none; b=F1r28Ikosn6L1hYfIYyDTXLMiLVpgp6OHtzWmuUnrvr5AbtBNaUmo/RCXcDSLL/8cg9xZqGMxvisKaCp7rIRGzHTkcx3Bc6LyBEhNYQ6SUzbqNmv1fc/ix2agn2kzMk+nXcizxVlr+lq6d6/S8AB7S/mBAcGeG6JEtweeQE1zvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889226; c=relaxed/simple;
	bh=jM+/UUCJoXc+bzfrp40R7IOgg6i7fASt5M7fn2z62CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOzWgkOB2JkaA1Q820QF3JLGCuYXWs3oexY9jEjHlOOWEP2HIwN4QuEG0pA/9Wpsjo0PJSgQSOz0tP9N/0Qr2jDl0NSaBTisIffd5ln9OBoOkyY2DcoiOutaSLJOxZOGuTPbscYH5srZpRDy7G+Je6awMJ74KSGCG4aUbfXR3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=s/XG/WfU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xjTX6YNdxABo8Jl2jn8Lm6RPCYX+HMZYyUJcZGWNE5w=; b=s/XG/WfUD5TwLxJR21YjurMr1+
	uIrql8eVFB8xIOWZb4jN66SOFhAIiOzXDuBzM8UYaxQPnp47ksUndJ1Mo8p9nminew4/FcaTjzxfH
	vpDQ1eD4Ib2UtLuPW5FSqB7k5isk46x6lgS73u0NqgVfNgvLtqQYrjdEF9pRl//l0ReY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYkPc-000hxy-QL; Mon, 07 Jul 2025 13:53:32 +0200
Date: Mon, 7 Jul 2025 13:53:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Message-ID: <dd75a12d-17cd-45a7-97d0-a243df54c215@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <9c8cb213-7daf-43bb-8d20-aaefa13127af@lunn.ch>
 <TY4PR01MB14282E8A9E82714106D448EA0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB14282E8A9E82714106D448EA0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>

> There is a discrepancy between the value being passed by iproute2 and brctl. Iproute2 passes the
> value unaltered in seconds and brctl passes the value in seconds multiplied by 100. So far this
> is OK because brctl is deprecated. But the default value being passed when neither brctl is called
> nor the ageing parameter is added when the bridge is created is also multiplied by 100 resulting in
> 30000s being set as default ageing time instead of 300s. Is this a known issue?

You need to be careful of 100. It is probably the value of HZ you are
using. This means it is probably in jiffies.

It could be whoever added support to DSA was using HZ = 1000, and so
assumed it has milliseconds, not jiffies, and the API is broken.

If you have time, could you dig into this. Trace there where jiffies
are used, seconds, and what conversions are preformed, for the default
values, netlink API and sysfs API. Once we know where it goes wrong,
we can figure out how to fix it.

	Andrew

