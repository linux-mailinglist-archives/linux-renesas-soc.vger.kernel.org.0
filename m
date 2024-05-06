Return-Path: <linux-renesas-soc+bounces-5167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1648BCFA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 16:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC351C2387A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 14:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10AC8175E;
	Mon,  6 May 2024 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fp9mKMuN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X9VhyV+K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824215A5;
	Mon,  6 May 2024 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004341; cv=none; b=NHfCGPqHjSqWObdwpWdKPkubKreJQap33Av6nl9m5EAYilNspZU3HnMTiKk3AkUgbFyF0PRsflh+mZZRXWLYUuUUiD0zSLxUC5u8/bJ7/tk8AHr18EVWXIuaAemt1ZL1JovrS+VHQunMq1WxG98G0uJdQkemlEyIEgIIJJyMl50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004341; c=relaxed/simple;
	bh=kJvurmAd4Huzk7xJLL+fdoKaaexCaT28q6J9IH5vbUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k63C1EL9fKVjk61Hh0MZ0wRsJ5R7bQXbbH+EynHltbgKNc19iBFlQBwkqVOacJ4AUMeTkhyaKBX0GwXorZcD4t4jh3oAdnv83ag3w828yXToedOiHORsRc7BGPwS3FE18MH0+LObbOl0+hsVZW6id834JybmiuD3wikQgRRspIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fp9mKMuN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X9VhyV+K; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 2831D1C0017D;
	Mon,  6 May 2024 10:05:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 06 May 2024 10:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715004336;
	 x=1715090736; bh=5m5LZqjJlr1xGKll64ocIdbEm6uTXlrNkLO3vlro68Y=; b=
	fp9mKMuN93Sc0IuPN8x7Yb6mF8aRMErIV9HymDtHmNUVDgBsBhXC4QBQvcYTOL4u
	cY8actE6R4jd2+OTAr4/OycBLIN+08cGaZa16XUoOsYQnA4VCDlHsCXiRt2P4c0P
	O1IpCPijtJ0Iu/SdhI9pRDEkSuGEHJV/yFVfHKmxAQlOyctitfwTd1o9TSz3QNut
	e/z1xGXMLTZisuwhX0VE1xUiQtDRgufsyjnTxmXAa1N2Oo83Zy9dTMTEoPRYKXNK
	pWCuRVhRPpidJY00UZPuXq+1J61P3YOU7atAL1sz32SEcWhRohXXb4tpQzri7UF5
	PtXKJx0s9+GOLCzevmgpVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715004336; x=
	1715090736; bh=5m5LZqjJlr1xGKll64ocIdbEm6uTXlrNkLO3vlro68Y=; b=X
	9VhyV+KrfZcfqEgHUFjX4gjOzW3SBJPV8NUkQbknlTFklcIkCTJFG78cexMtk44F
	DmocTDXbCK3YsiDEVhz0GZRmt1Y1WsEy3+MExVNypDtJ2ZS652BJm7o0zNvo5cGb
	+hJ05tW8Q8mQZV3jAAjEVpmgQxtXpxDM7DNktJ+yQUp3cR4DWcV+fqKuV3UWQUAV
	nla5ZwIHKBqY9Tnn2W/BYb0TShM8nkRU2Vr/KmMEEoRxNG4QQtrcLtpAN3LM07Cq
	8ZEYxlCn0UrvVfFC+LIHgMKpBCLKhMijjZOiSDvWfpAj5AMsr3cUeYC15DFfz+Sk
	30qHx6mRhhsJnow2JTlsw==
X-ME-Sender: <xms:r-M4Zt6-Z9mX3wMOHE3DiTpWXLPFQq7c7LMGz411J9Dzj8xzG38vcw>
    <xme:r-M4Zq7URYc5NtYX7coGypvjnim9F74sFQuXLmEj1pA4G_cagqk-tSQy45kZMiZFh
    CkXwSeCtH79DLwmHNo>
X-ME-Received: <xmr:r-M4Zkc6mEE1tm1Z6UsfO6bVLKMwpoOBPBHM-eck0ERI9pr-ATVHv67ftb96XApu-Gd_lkFvVi-2Vd8IolJYGfefny5A4Nc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:r-M4ZmIGhEL3HfghWvgAYCRm3bMISo4f9g51N5Cte23dastfxWQxMg>
    <xmx:r-M4ZhKIjgo10dTCS9MtF1d45sq-vBjDFnF4ggGU8vJ8acrPBxLr4w>
    <xmx:r-M4Zvy3bhp1TtCL073bEaJaWOZq0q-J9JhEd3X7grh9QQP1FFzMrg>
    <xmx:r-M4ZtJPXlFXXBe4sDx_PNjI8nAR89tsl-wwjfB1IJWjsRMvGs_zXQ>
    <xmx:sOM4Zo9C9heV7vBH3ibK2guf23iZrjdTVfC1jXsU5484lHVMVCMYBpun>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 10:05:35 -0400 (EDT)
Date: Mon, 6 May 2024 16:05:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240506140533.GD720810@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>

Hi Andrew,

Thanks for this explanation, it helps understand what's going on.

On 2024-05-06 03:51:45 +0200, Andrew Lunn wrote:

> What PHY is this? Does it have C22 registers? Can it be identified via
> C22 registers 2 and 3?

The PHY in question is mv88q2110 (drivers/net/phy/marvell-88q2xxx.c), 
unfortunately I do not have a datasheet for it so I can't tell you much 
about it.

<snip>

> 
> So i would drop the compatible. See if C22 is sufficient to get the
> correct driver loaded.

- Remove C45 compatible; Remove C45 read/write in driver

  The PHY is identified as "Generic PHY", and the correct PHY driver is 
  not used. I can't test more than that as the generic PHY driver do not 
  implement some quirks I need to get the link up.

- Remove C45 compatible; Keep C45 read/write in driver

  The correct PHY driver is used and everything works.

- Keep C45 compatible; Remove C45 read/write in driver

  As described earlier in this thread, the MAC driver can't connect to 
  the PHY as the call-chain described earlier fails.

How would you suggest I move forward here? Shall I keep the C45 over C22 
read/write in the driver or can I do something else more clever?

-- 
Kind Regards,
Niklas Söderlund

