Return-Path: <linux-renesas-soc+bounces-5087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D008BA939
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 10:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D106C1C2163D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 08:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5591474AA;
	Fri,  3 May 2024 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MaEwLsR2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LXpduzK5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC379CD;
	Fri,  3 May 2024 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714726235; cv=none; b=irqOVGul/uaYP+sxAktUMS289jO43Bptsfn9GiuB9dvU0jt9hjhQrhsOSrIsZ9gt5WLu0RO/oHV+EgsWAlVbWvTff9+OpS0gIt8FtNL8cRNTPLloJfCFb2QLkXeKZtjXoZLemTsrfnZ3c7ecffxDPdkQOb5du+DI4g72BVQ8/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714726235; c=relaxed/simple;
	bh=B5s9Jk+/x6jSelp/LHfg+HBZm7VnwyFuIXtkYlnwJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC6LY534VwZEX0oUMzpcQ88I+vGwAoR5q2yC6zQ2xAXyj37IacnMC+RUN1o4Pmh+6AEJ7iM3twX48/7szs/VF3PsOjUMkoakkzCdRUV8vLKtAWZuNi0zaM2L1/lUOPl8OLTnmKcQJtJxaU0YhDD35l4XQ2es9tMFbAg32zvrt20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MaEwLsR2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LXpduzK5; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C6FFB1140197;
	Fri,  3 May 2024 04:50:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 03 May 2024 04:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714726229;
	 x=1714812629; bh=4F4Rdkqm7UslI+ESUP+/52ZmCMFB6KZpSmoKNx1SG/k=; b=
	MaEwLsR2XmH708YsYaOEgT0MTRjRznab/LQZN3Ta2oyC8cQF4yXbwLcfzuxPjWra
	X0npsEMWuJlNz9KI6p/3GA9Eo0mFYhYJ08OfJlqVWxziCOpjxem7wVOuasfONre+
	37YeGwMPW/70v7Wj3DLN8nWiK9ikSShWc0TzHDE+LvH3MsgCRv/CVgwYhdNiJlZs
	sQx+WgmMPqkny+Pm97t30EAF8ONdk8TQA0YmgE3wD9sJLMVU3xIL24BsSsAq3IDj
	/HuoGs6vwGniBjP/q8qNkmN6+UzvtHqkcpzhfXIMWOXknil+oIIFyB06C1XVAjmC
	im9ALDr91f6PPyrs2i0sXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714726229; x=
	1714812629; bh=4F4Rdkqm7UslI+ESUP+/52ZmCMFB6KZpSmoKNx1SG/k=; b=L
	XpduzK5wBQGaiRYKS17XoAvJ41ZFkjxW6zAHL4lj1SZrGRSaxpkLQRt8nYB9P2/o
	uCe0F9v9RuAE3ddyFgiYWywO5gUGTR2nJ29DeBQHWIiLfhOsYhZdNq4sXWYi40nh
	Am+5fF8DH0VrFYcO8zh1f+ZM9ppuRh1IJY2lar8EZwWjw5RMvzIKVwXH/zdYj8ZJ
	dSc9FQhBBAdA4W8pCfnvNgqOhyZ4f9R+tSeAdFCTYh/hNh2yzcml7rd6GB7pa/aS
	j7ct7F5PsVDTwKE/Dk22ealxpjJMFrDcNInHzPipgd2OiUTPSxdI5QsW+XygDzvU
	GpziDOBnyR14V8ULzoERw==
X-ME-Sender: <xms:VaU0ZrDQmojy_F5FUzcVe0PlhPQEe94964yDDT-xqQ_4-ueKKurVxQ>
    <xme:VaU0ZhgXn4vr4SeDOp4spd1WdgrF_YTxumZx0OT7XIi4UThD887Vovim9hvrDTygg
    gnkT7hH5CKj5itg6q4>
X-ME-Received: <xmr:VaU0Zmm9_HIo7N_FG3fD_DPFzDcSY86iCcNDG2vUfWbZuRdrBRrZoyncr_QE7OiZzOxFV0uohEbfs1PxnSUugeLPwAgqlmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:VaU0ZtxnePf1yVJPgjycl2lwgaZVCc7TRXGMHTSG8Pacrn_WcDb11A>
    <xmx:VaU0ZgSlp06aDHeRByimrcS462yzwwqKecXevMk5Q8asrYhXwOuQ9w>
    <xmx:VaU0ZgZ3OTSqrTMw9P-TntnX6pObBCOVlCh1UcNYNMJeFLfzFaG_zQ>
    <xmx:VaU0ZhSjjD32CRBhozWGrsuzfY1l7uRYPIYz-ETHtqTTqlYmpGT-sg>
    <xmx:VaU0Zp83J3POwczAs23FgbVudjsKCWPtSMqX-8xGv5fMXMneOawZmgvI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 May 2024 04:50:28 -0400 (EDT)
Date: Fri, 3 May 2024 10:50:26 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240503085026.GH3927860@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <20240418183207.GL3975545@kernel.org>
 <7c8d6791-ea36-45fd-be07-df789263890f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c8d6791-ea36-45fd-be07-df789263890f@app.fastmail.com>

Hi Arnd and Simon,

Thanks for your comments.

On 2024-04-18 21:03:51 +0200, Arnd Bergmann wrote:
> On Thu, Apr 18, 2024, at 20:32, Simon Horman wrote:
> >
> > Hi Niklas,
> >
> > I think that the use of __iowbm() means that this will not
> > compile for many architectures: grep indicates it
> > is only defined for arm, arm64, and arc.
> >
> > Perhaps COMPILE_TEST should be qualified somehow?
> 
> 
> >> +	/* Re-enable TX/RX interrupts */
> >> +	spin_lock_irqsave(&priv->lock, flags);
> >> +	rtsn_ctrl_data_irq(priv, true);
> >> +	__iowmb();
> >> +	spin_unlock_irqrestore(&priv->lock, flags);
> 
> I think this needs a comment anyway: what is this trying
> to serialize?
> 
> The arm64 __iowmb() usually tries to ensure that a memory
> write to a coherent buffer is complete before a following
> writel() is sent to the bus, but this one appears to be
> after the writel() where it has no effect because the
> transaction may still be in flight on the bus after it
> has left the store buffer.

Indeed, this is a leftover from development. Thanks for catching it, 
will drop for v2.

> 
>       Arnd

-- 
Kind Regards,
Niklas Söderlund

