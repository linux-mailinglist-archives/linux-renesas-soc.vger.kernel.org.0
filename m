Return-Path: <linux-renesas-soc+bounces-5287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8A8C1934
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 00:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE788B225DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 22:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C46129A70;
	Thu,  9 May 2024 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eb11dZR9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zfgl4idI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE7770E1;
	Thu,  9 May 2024 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292449; cv=none; b=IMD+0hMZMyHQaArP9Uf9dLpqaSZ+FAxt6Ufj/GjRAyoZcRHQRTTvDlnLsG8M2ulRh2cl6C0WPNEJD+/+kSE3QeQar5mGuREo3jG5ddkyVVK7rWr7sjZ6bkrqewuSD77hBeJj1kcpKG3kDfFqcAQ2D3HBOb2X9TxAJS/wzzZJvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292449; c=relaxed/simple;
	bh=fHCzB6wJkcBiGdLEJDDTYjP//MBQEsMht904xjKbdxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8NtVxb4Ffk5GFhjDnFiQsFz0ZV9Ded22cUyo0jLFw/tQss/KaPlWJfzNLMddU/OVO9MrGcF0Oo/lhTS1+HweendqpWKsE/Udytk0jlL6Lca5twyUOLllAirNGrqCKA6JFwDAoSztxQS7prTnfZLMl0QfVuXwXR8f+Jo1Mu3s8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eb11dZR9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zfgl4idI; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id E5DB6138176E;
	Thu,  9 May 2024 18:07:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 09 May 2024 18:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715292443;
	 x=1715378843; bh=6ahgDHKkhKkBbfAiFZ2iRo8gkD4PxfgCkFQQPXUJ9EA=; b=
	eb11dZR90fiSGGpOaTwBeoUcn1fUWjSq1eQVoaBk6RXXqDWJSDxCH7rJVvG4tSEs
	H143b02TKo0lr/iJpRQsf5c4DfAiv3XA51Jq/ESCdmJvAyBhilYY/ugoEoPXd6iG
	ip4rwalrWVKu792ZyZ7ADSLTb9QMfQIMcHUmJjtupsGXjJ37wx8AN/tBqpRMa7bA
	uH/oEeLxzD01GEnn/qeAD6aDdy6cg+3YNAs3N1rzMfOtTApfvcigeGgwtv8668ym
	EwMbhIG5c5CEvA+NG6qHXQub8+JLTIusQcdG9Fv0HjcsPkomGZGk9XApzI0lo9Yt
	PRLPQ05h5cokCC3/k7eDdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715292443; x=
	1715378843; bh=6ahgDHKkhKkBbfAiFZ2iRo8gkD4PxfgCkFQQPXUJ9EA=; b=Z
	fgl4idIxYGKItVhywrZNbAO5hH5VQy2ChNWJCfKSOOpu11a5ZreqtxuAOzpnJKq/
	FaMp9fw8H9cNcARI56Y8wMvoZ41Gr/mlG/SR3xpSjG2KmJn9Y/FY0X1Dh9wQ4MEm
	IBd5v/kRcijxLop0SKuojgHaBOaBixLMysJFISy1yUIJ2v1hbTMHitFPcWxCc7rQ
	oWItLpPQVjSq9nUlkOrcF0I+abVNPE4uX0T/sgCqI0ir9I4rwcFE9XCTk+tbRcN+
	fyTNaLOtVV169wtgRYN2jMSEhdUbj3xSa/Z7i3WWZ+tIN3Do2PmPXb5sN69m69jo
	POjmDRbB6pCOZkvPklk9w==
X-ME-Sender: <xms:G0k9Zoru1WfiKPjo0vMPBLGFnZPe8m-diAOYkM2mVb7faTPeJLlddA>
    <xme:G0k9ZuqolEWs4yoofqOd1kQa2Cl54a8P9d2XNedlXIuOOwsW0zsyzkQfTm13CvAPU
    XX99-Y9IsP-XDKhyPI>
X-ME-Received: <xmr:G0k9ZtN_Jsv8ob5Cyb5xf56xY0Mi2cbcpE8-PgwxFueX8aOU0VfvFmFSma8LDTTWa2udDpcOhv1zoRJ6gQDjxdXBmDK4mr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:G0k9Zv5qoyvIl8Hhkjz0qwkzahIKDMjU79YuJvuzRVyQ-XVNRGg2_w>
    <xmx:G0k9Zn6GIImRwlMSO61GZg40pz5L8VhvZlVH_-_NHxRPew8hpW8-jw>
    <xmx:G0k9ZvgTvVydQ52nli5FV-dzHkPKKcS-GVUJne2DPJ_t7G1kSHBbmQ>
    <xmx:G0k9Zh7ir0cLs9PKwFdBUov0b2ynNDqbBnbtg3CesaDCx5Wi7SrX-A>
    <xmx:G0k9ZhsDESUejoEgzJJH4ukGA8H_kefhx4QAOj18EAn5IUnmDZGe2K1f>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:07:22 -0400 (EDT)
Date: Fri, 10 May 2024 00:07:20 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240509220720.GN1385281@ragnatech.se>
References: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>
 <62ab3417-0f2d-40e7-a816-b43788c448e2@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62ab3417-0f2d-40e7-a816-b43788c448e2@lunn.ch>

On 2024-05-09 23:12:43 +0200, Andrew Lunn wrote:
> > +	/* Link verification */
> > +	rtsn_modify(priv, MLVC, MLVC_PLV, MLVC_PLV);
> > +	ret = rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
> > +	if (ret)
> > +		return ret;
> 
> What is link verification?

It's a part of the TSN capabilities, it verifies if the link is capable 
of preemption. AFIK it's described in IEEE802.1Qbu Frame Preemption 
Protocol.

For this device in particular, this register writes enables the Link 
Verification process. Which in turn allows the IP to transmitting Verify 
frames, which if replied too with a valid Reply frame by the other node 
lets the IP know the link supports preemption.

-- 
Kind Regards,
Niklas Söderlund

