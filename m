Return-Path: <linux-renesas-soc+bounces-4720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F18AA27D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 21:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295681F21666
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 19:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73E217AD82;
	Thu, 18 Apr 2024 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="f1JYFqIF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QeQ6nDrH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83F177980;
	Thu, 18 Apr 2024 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713467161; cv=none; b=mEV0dTUHmxPYWeKwcNE3QDnouHWnqsIobhGjF1/1yaIp8hyIuy1/d0tRoQFSa0pxoD6qmYqb4gNniiJVcCLFK7ElclczXNg1ttZKGCVCqqOhHy5GnYnsMi34GWiXpl7X3GPOd9gs9GeGep5LYELsYXzbE8qBQktFkSj5uTLLYwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713467161; c=relaxed/simple;
	bh=/SG9Ir+mZfybYXhArpXmG6/nEoX6Uyc39l7u5KJ43LQ=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=AQxGjitqT6/wSDMSvSq8bAi+LTW+BTmlRV3vx/CSe15bmN0FYTfQX4bwTD7HPoVKGp/Iox04Xa4/gDlb221kebn1zVngHYCNRfvxXzlsPdmfsv55ojwarOuHvICtwMU6b/eYYpRlPXlNVEHF6f7kJRTeX3iM9/bM0cVKEDqFj/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=f1JYFqIF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QeQ6nDrH; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3571F13800DF;
	Thu, 18 Apr 2024 15:05:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 18 Apr 2024 15:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713467159; x=1713553559; bh=xw4iYbOWpL
	zKoft1kCTm9IJANkwJjt+D2g8Ypy+Bajg=; b=f1JYFqIFH8ZD5LeeUuo8zzsP8k
	l1D3lMNm53vXtuvpHdFXJG2ROZUa0DjoZW/1f8R2WIThSw5Eyh+HubGAlabgYPfT
	vCfXOazR9xlr+bXAvnD0n2b0rngW4f6jHrtv1zdTynRcDhF+c+M969amP/MI0gsP
	JoKHCoTmo9RBmGe10K08OUsJApMWfdbP1Znfdb5bXPTAXOaJr2p+ZX9lgU8ZmYB0
	pd/1HhZ2qN1hEcoeePT4dIohhed0Ce5xW8jbZ+JNuupjA17UjN5u2s1tY0M36OMX
	j2i6kepWWEZP3bg2tzIYR3jpqBUcrlTIccB1pqsBK4+QVTWLkKkNE+ZLo/4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713467159; x=1713553559; bh=xw4iYbOWpLzKoft1kCTm9IJANkwJ
	jt+D2g8Ypy+Bajg=; b=QeQ6nDrHOfQw30DJ0S1ICzKD8MIyXLppZhWKrk6pE0UU
	EhXzm55r5AMd+2PhxtMV1uPcFfac+fRXSqykx/zLaxWqQSjLZTyPp8U4dyLwQOA8
	gb56SyPgYpvNYrDqTb2+xBZH2XiIfyRtSXz4Ws26LKSrrZHHRTyGCtg5xQrAuCuB
	zs25yW1Y0wyslcp6UqnZbs80dLMTAYmVaUsa/PSjSy3eu3MmLUVTwqTzTIZ0c6cQ
	Nqti0w0u591M2+j0HCTjyUh+HrDUpQlLllBMFxaaYWpcs4FZbOvMSrj97T1l0cKV
	tFqGhgMHQHXuumQn6oPIsitIte+QJ3WUD/Cbw9uPWg==
X-ME-Sender: <xms:Fm8hZir9qAAiANPZe3LBBuZ_NDO3d1Q90onwSaeUKaLKC2g7zPgYxA>
    <xme:Fm8hZgqjFTJN8yZrt9A7WagD0GzQrw5_IryVpXZHHWWgynknqBLaaGVs4z3Rb7dAC
    VD-rRHysTNFE22LnZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudektddgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Fm8hZnO_SbT4hkkAoGibDRO4xo8aOGIjQmHXQw8suloF8FL_xhl-Nw>
    <xmx:Fm8hZh5CT4IgUcWdD_NZ4H6O0xEaibMib3QN12eWlunTVs-EPqLoHg>
    <xmx:Fm8hZh7fEeUE1n5srwkc7s7n3niPkF386mUYhNGGQ_xVIWY4evTw-g>
    <xmx:Fm8hZhiQn8s-hjgLQklFVkkn7cOcZG-HJ4X7HG7hhhf23ZkZgvvRgg>
    <xmx:F28hZrtqA3LerQfdxkd7LRwzJdtr0jLOtFE4v5cqupYz5VrOp7Hb6Uxo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 92D7EB6008D; Thu, 18 Apr 2024 15:05:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7c8d6791-ea36-45fd-be07-df789263890f@app.fastmail.com>
In-Reply-To: <20240418183207.GL3975545@kernel.org>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <20240418183207.GL3975545@kernel.org>
Date: Thu, 18 Apr 2024 21:03:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Simon Horman" <horms@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, Netdev <netdev@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
Content-Type: text/plain

On Thu, Apr 18, 2024, at 20:32, Simon Horman wrote:
>
> Hi Niklas,
>
> I think that the use of __iowbm() means that this will not
> compile for many architectures: grep indicates it
> is only defined for arm, arm64, and arc.
>
> Perhaps COMPILE_TEST should be qualified somehow?


>> +	/* Re-enable TX/RX interrupts */
>> +	spin_lock_irqsave(&priv->lock, flags);
>> +	rtsn_ctrl_data_irq(priv, true);
>> +	__iowmb();
>> +	spin_unlock_irqrestore(&priv->lock, flags);

I think this needs a comment anyway: what is this trying
to serialize?

The arm64 __iowmb() usually tries to ensure that a memory
write to a coherent buffer is complete before a following
writel() is sent to the bus, but this one appears to be
after the writel() where it has no effect because the
transaction may still be in flight on the bus after it
has left the store buffer.

      Arnd

