Return-Path: <linux-renesas-soc+bounces-21518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E2B46271
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 20:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7A3564C5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C661E27465C;
	Fri,  5 Sep 2025 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="b7IBxzK8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jY1KznVu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863DBA42;
	Fri,  5 Sep 2025 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097672; cv=none; b=iWC2dwKde+FieElS7Gh/QN78twXg/MwJUeA7b254EqoTNy4o4RktPy6uQM+n5R/Iimi+k22lTAK8XRaxKovtraZWtYu1/QMYwc5JexdrIwakG7S0e0wHQ3mJInvfcIP69vQ06wuvHv34mU9FHqzUHHcjFDiJvxpvSMOk0U8gBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097672; c=relaxed/simple;
	bh=nKIpz5MYB+pV5XUpnBdek51xixMAAVMen0tPjnPjmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNNbxavZ2g0PYTxq3gHu+xqAhSBg7DKojUsm8Aej8UCJGncfVzuGWK8Cz3U++1qsctE5EHO7mekg1/6WMMurnBG+OrHG5qGG8XSI/Av6aHI5SoHrPxVRNWdde7W/r8Lqfj/9jo/YJthGAYne4Op2jos6m0ayzYOZi0Xpo7P1/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=b7IBxzK8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jY1KznVu; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A14AFEC04B9;
	Fri,  5 Sep 2025 14:41:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 05 Sep 2025 14:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757097666;
	 x=1757184066; bh=0SnQdrC7772A3Jfi9YjFftYLT3J8CMkIL+U7gFU8u0k=; b=
	b7IBxzK8bLmJ+WSk9x7VtNmgiycwfVCUmH4jDvhLifXEv2+S1gsNPcJ9raEI6hTW
	mwFUJXpe4krPliPFGT3LYiasuzw5Rde9W6J4Ql5jQzjsIkCcC8uhGHuqRmKnFhh8
	+zzg/2iAVFr79nwfjaRSE+C2Mwxi/007PQOK2ce2EfDhuZdNdtQ49tjt6w9gmEPa
	oIt+mnJe2d6AZ8jtP7bVLtU3DztlzxKBXPQs2UzpUP5uU5Je8WThQt7GIPHaKzg0
	Xenb7QhRa7po4Eu+gcUbAudiFoXzSjYZXwNk49gxynTL2WbDo50/jVjIEV9UOvr9
	bhpY8idqI61tI6FQVwl5ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757097666; x=
	1757184066; bh=0SnQdrC7772A3Jfi9YjFftYLT3J8CMkIL+U7gFU8u0k=; b=j
	Y1KznVuYZs0I5HpDl/LQ6GlYt41Kob4COHSQ2JTWuVgvMTVt3TuetkkgibqeLxHG
	lsO2qD2+DX+OiuoukrpJna0fOd/aNKTnrf2hhGUyBSAkQQNhhu/65NODXTff15V9
	BxT7KVzADf29NPA2zXO0PEzTca3/9jX1fLumWIcJmEOpldAt5RhSBi5kx3O5Dy/q
	s+/AXWZhwVyJVzWtFEQXzwNbajppOq3SH8M7omYysurZAITZen8DI1zHjOkucx2G
	vJZxjvbnAJWjorQN6GexpiCDXO/P3u3l0tW/oXvKaXQbNw3BceLJvKKZ6ezS0O05
	IvUrL43AdmRf4XkcuYZuw==
X-ME-Sender: <xms:wS67aCH6vvSbw1QyU1xrH2fjca_Dm4rewM1rb2if1nqvqsIz7eKDXw>
    <xme:wS67aAuPNpIpVTLhHmwrqCKWlIcZDKTRlVIhJzEXLC77VNCR1GtXZE5cTk-Ps_Sl0
    d_i8Cx_bU_-Rr3M6rQ>
X-ME-Received: <xmr:wS67aFraVHBF7_u0LH0dl7k72-fgeo-IzsVX2O0Kw-vT8f56Wc9B09XvlLOOTsmChk9hYneIFmCK-tPT-KAbnatHIntj2VOG6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghgvvghrtheslhhi
    nhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslh
    hunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuh
    gsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdr
    tghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:wS67aHWWwPCSy7X1Vs8Qx97B4-MIUI5vxRLK-cAk3KQXuPsFGNN0gA>
    <xmx:wS67aN2zgRUpvCpDSw9Fei85Z0rKnGX95yWp7JjWxJdjaLSz6FDg2A>
    <xmx:wS67aMtm3ByQ4Hxx7gW8Nxq0Wq06lNzgwytiYCVKro8M2W__ajfNsw>
    <xmx:wS67aFX5OhKAPO436QzibrGK3U8RT1kVOrij2cf8-I116Q-V9R9R2g>
    <xmx:wi67aD6hQ-VNvLa6iLOTzNDq34e1ZaVo8_u6_G6WmkASInu21t4OX6AQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 14:41:05 -0400 (EDT)
Date: Fri, 5 Sep 2025 20:41:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250905184103.GA1887882@ragnatech.se>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
 <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
 <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1f6fb82-9188-48ed-9763-712afa71c481@lunn.ch>

On 2025-09-05 13:57:05 +0200, Andrew Lunn wrote:
> > You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
> > WoL would be pointless.
> 
> Yet get_wol will return WoL can be used, and set_wol will allow you to
> configure it. It seems like EOPNOTSUPP would be better.

Out of curiosity. Are you suggesting a compile time check/construct for 
CONFIG_PM_SLEEP be added in the driver itself, or in ethtool_set_wol() 
and ethtool_get_wol() in net/ethtool/ioctl.c to complement the 

    if (!dev->ethtool_ops->get_wol || !dev->ethtool_ops->set_wol)
        return -EOPNOTSUPP;

checks already there? To always return EOPNOTSUPP if PM_SLEEP is not 
selected?

> 
> 	  Andrew

-- 
Kind Regards,
Niklas Söderlund

