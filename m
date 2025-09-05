Return-Path: <linux-renesas-soc+bounces-21477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AFB456FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48FE07AADDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC11334A31F;
	Fri,  5 Sep 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="sD2hx1nX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D91220F37;
	Fri,  5 Sep 2025 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073441; cv=none; b=RG9YFwOByMalIL/Wo1Dt9JK01jyaiC8P3u++uzcL59n+3/dUiIvNMJ+FLleRFBfZVltb8Lv2LyOG7baR/T4CiHRfhPgzJAAqewiNQCYYqJwzL9bHX5N1LVcVCeyE/oT8BAqXXo8QuktOBLc0X7MMu1JwKtfPxvxQkC1n9712Boc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073441; c=relaxed/simple;
	bh=pcLcfsenlsbQqyhif/rjlPxcd+aY9qObPnN6hxaX3+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzTA6B/D8bcvsB+Wxk8Tycn4pIkNbEClesiP3WkD0TyLDj/NJd5+fci6kx/uYZ1x+f+USF+B0o3keGvMTeuap5HYnmgFQqreRkcK9bpCCnuAk5QwRt0T9AVwGNF3u7L6UTPK/NuwtfzsLe6iMGqpLLiu2bKFNrmzNINtCkCy4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=sD2hx1nX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FFWcbo36EERWGu8vswNHfEQ8IMpnr4yCjxikNwrrxkU=; b=sD2hx1nXdpQDVjqgkQoKm7gLQh
	tbEvMBt7LbupdavnczvTWofauFXCQ6FTXt53TAas+nCgIUWLIcLSInwdd22lSP5ldr4fkmQkTeojg
	N4eTtNuuEPutf4TX47znd0bCcMDPUSiVyYJeRlk7wpypIXTzC9164QZQZm67ph5e12as=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuV3x-007LMM-61; Fri, 05 Sep 2025 13:57:05 +0200
Date: Fri, 5 Sep 2025 13:57:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
 <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>

> You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
> WoL would be pointless.

Yet get_wol will return WoL can be used, and set_wol will allow you to
configure it. It seems like EOPNOTSUPP would be better.

	  Andrew

