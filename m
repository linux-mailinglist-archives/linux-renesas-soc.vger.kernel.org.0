Return-Path: <linux-renesas-soc+bounces-21390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B86B4475A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EBA91665E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA0D281341;
	Thu,  4 Sep 2025 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XR/msGir";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UNGlcOUO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF721F872D;
	Thu,  4 Sep 2025 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017950; cv=none; b=YB+FiN2I0mCDVD5rwD3hm7MyYm2Bw7gOk2bhV0dnLG2/iZX9/nTpIsWDAhP/QOlC+WtyYpxD0xc3Z5ACjj2q23bz8C2p41DKlewHVVvr34TWqi4pE5OK0uC0gowpWPhjQ9Feo+fBKDT7uSUw31Mcuj1URTufyhnxWbt4XuVaKNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017950; c=relaxed/simple;
	bh=ChqRXOId2/fE5fa6prCpjwRvG3GGfhESxSeulGAq+Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdAl9Gpv7a9E/zhy8z6dbuiwK+E1WEEHNzMPjjvk6hiBNcy+JEZXfuXf748iHmbknjOHYFo2HXfcabbUOeZwXC7n9qyRImSnRombCANgjfZTjV13ae5pHWfwBwfvjDyVsNK5gAmy3THN/YLsJGnjkWtDTgELiyrDXOIf4qx9+TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XR/msGir; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UNGlcOUO; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id EA9E3EC00DC;
	Thu,  4 Sep 2025 16:32:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 04 Sep 2025 16:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757017945;
	 x=1757104345; bh=Ebt/vstwY0jx28xgGFV3W5+WTrUhqm/jMksSJk03iCw=; b=
	XR/msGirE0FDnQ+yJIXC/OBzyxilNO+vB4wIUWver24GM5mBQNP539WZ0poW8AL3
	dyG+BAH4FFJf8SBOPJGoOWdBpSJd+QXRe04hj4SfA1jyB3qYAjnzW0fw9OCjosD0
	spXWegIdtsmKhdoVLqaUhvuaoVGr+9V3QK8vpoZHpL5rFGDqtVeqfhYiVh1Jqtbc
	75ZSBBuM+r6y8PkVTqfLJxq0Adpa/SGCLGCPAey2i8wAVXReOM5EHEYNiVzIGYH4
	mMwv5HsqhHurlmQTIqG3SUmOC0CzY+FPhQ/fFsjwX9RjOWuaLYms65S47LfpLXFi
	fwVA1OweJTcRc9h7lgBcZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757017945; x=
	1757104345; bh=Ebt/vstwY0jx28xgGFV3W5+WTrUhqm/jMksSJk03iCw=; b=U
	NGlcOUOPgTqd1HZoWE8AUOJ5vBH4HTT4tNq88iwVVjBLjVRt4iFPMUPMRx8lZ6Zz
	XsEf8RVuo0I2ar6fZAXxDK0Wo/LhPz/KPNm9abua78RIqXAQQonW4n/e984hdhvN
	ocef9BR2eQScO+e04gWJQv4eu1Q5aqXZ8Y8xYCy7WqvGIpRNU9OS4OpG8fkZduiW
	62zB8lH6Ygw4OWqW5WOjrULnDCyrwIl/5+N53BEsHToABWB2kKlh8orflGOfpwd2
	Wu+XNHSsC59/bw8koy7Ho+k1Hn3bnT8IDkHsv5UYIfx2QEi8G5PwgbMjuPHY11tV
	AEMTX7QWMTvCnyuvfOSbg==
X-ME-Sender: <xms:Wfe5aEe52u9PVSWvG4FO9ossShjsA5bTdQBUgS2g8w85P4hF9gl6qg>
    <xme:Wfe5aHypEcslwKT_8b7ZYJ_S6a5kYv7BCWa1LQ6NwJa6zi65awbDnyTlffeBtesDn
    MpUit_ul5mIO-xoIAc>
X-ME-Received: <xmr:Wfe5aL145pJLzXrSR0ZUyrneaEUVJzjziLh-WV3qRHTDpetrNZmfCQM5zPW1itFIACtvGEejR7HFWmP0Ii_7J5pe0bg7Gvxr9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohep
    rghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhh
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Wfe5aFxvfUTk6DsUcxtVtZh79tdYc9oRwTci-GoS8WQNbRFxqz_5tQ>
    <xmx:Wfe5aIUTunyDAbDrqc_Gy_U46_2JAiPgbq4sse-8nmK_BeM5AywczQ>
    <xmx:Wfe5aJ-lffktgVIrTjMpbPbFTLYVp0FK_hp9CdNE5KYai_L4p8YE5w>
    <xmx:Wfe5aDvW4oahmYj9crSTne112x-bTvc_wpTeI4ecaF-C20zX1swhpw>
    <xmx:Wfe5aOwBWTo7aolamIZ8k94kpIpjrWrqxhu06NOLo16TonkKXZkLsDtX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 16:32:24 -0400 (EDT)
Date: Thu, 4 Sep 2025 22:32:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] sh_eth: PM-related cleanups
Message-ID: <20250904203222.GA1560783@ragnatech.se>
References: <cover.1756998732.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1756998732.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-09-04 17:18:55 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains various cleanups related to power management
> for the Renesas SH Ethernet driver, as used on Renesas SH, ARM32, and
> ARM64 platforms.
> 
> This has been tested on various SoCs (R-Mobile A1, RZ/A1H, RZ/A2M, R-Car
> H1, R-Car M2-W).

For all three patches,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

And I tested it on R-Car M2 so feel free to add,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>   net: sh_eth: Remove dummy Runtime PM callbacks
>   net: sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
>   net: sh_eth: Use async pm_runtime_put()
> 
>  drivers/net/ethernet/renesas/sh_eth.c | 30 ++++-----------------------
>  1 file changed, 4 insertions(+), 26 deletions(-)
> 
> -- 
> 2.43.0
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

