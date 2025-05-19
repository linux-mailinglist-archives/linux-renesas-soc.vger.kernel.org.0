Return-Path: <linux-renesas-soc+bounces-17214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A6ABC1ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 17:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E3E1B63ADD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 15:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF29C2857F1;
	Mon, 19 May 2025 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TEAipUZP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C1eLwpE2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840D284B32;
	Mon, 19 May 2025 15:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667705; cv=none; b=clPo6LgkMoN/y4/ZqbB7+YcyDiP2ZHFIOmylYBpbpCQAVxVaO/He2xNB84uPwhvKO4/oHlkEwbkffDXdSvQJVFHfV1QKDwgs6fuhibvRs0Lt0twoVw/+x5lDFeSSU3VUb9UyExI0n3w9tLFh1G09dpN8kOu3GOS8J18GT0VTvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667705; c=relaxed/simple;
	bh=jYL2bughZhL5fhclYC6ZUjq53/NSvcpXmg9LXkf0Qrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK+rb65h94nAK/qAqvLV8GvYvPzh8JLU6H5KRWoba3MOroyq6VBFgVHixsbgmxBmKqduV9/9qel6uXbt3I9FQSITTzsf19VMJP2fgx6ycS/AVYXFoqA0ZR9Lvq4yR9Ps0wusEMGJ+C4hdZniK7LnBpxJanAYLeUw8848xrYPhV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TEAipUZP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C1eLwpE2; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 28C191140111;
	Mon, 19 May 2025 11:15:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 19 May 2025 11:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747667702;
	 x=1747754102; bh=0hCgPnXImsuIFaEAhK+umfxDXGxtGkWxXQT8k6qoI58=; b=
	TEAipUZPWq8peKMcVBiKqNcBManf9VS8rP0Lu5sYCZqyRblW3kdCUcmU+USc/NCQ
	bETu6pOEZ3e744NOKhWf/TvW0xwkIovo17Mh9vkUhlliD9oPL0whv53812eikARf
	FgUbHjvwGbIbttmqZAP2BAAzl38eW1NonWpm7YmTkixQo4CXN7w+a7sduHTbdMI5
	tEyDMC44rg3XI6KXaehfucIbrcxRFlaKDCM/+4ycKwctFWjxIHKzlg6po2aafWKT
	3HByXZgwQxeqOhhRVpl4OrU3OV2MUwhUFxKQRNlTmyvbhY/fH0aw1YWXbTKM5JNU
	9HaDHFvCBzlJSNaqmgL2qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747667702; x=
	1747754102; bh=0hCgPnXImsuIFaEAhK+umfxDXGxtGkWxXQT8k6qoI58=; b=C
	1eLwpE2Z+cVqE0KWIZplgv+RqfRaxfzRyiOxab1xSq95at2l0FL9KDrO4HCwLbAT
	gyHDhwYvcmfsEKKGuEEoikCOcbNnCJ6zkymAKKtyt8cn6DAiPiE03UiHPMRH63Go
	BsCSoq2lZKznPaXPmt+ny0HjpUSJ9QKZ6lr2pPMyQ4nw0pnSlwPmtJ1nX58Y4CZY
	S4+UOnB9V0sF9rYGpUjLSo4XK7q1k2Ss11wJw79liOznOSv6+zRfm7OvH8juD7OR
	uQuwhk4D9o6MA5RvZFvsRBL9+kXflnu2YEloN/xgiV6C7veVaGReRfvrF6y5nwlg
	03v9991w8UB/fqeccOtKQ==
X-ME-Sender: <xms:9EoraDdRABLDnuB8CsHzIbG6tY1DCSLwbQsAz_trsGq-VR8_CZnfhg>
    <xme:9EoraJMaxMvtgYwlyhZ5FuavCwuoYI6K-QgfYcFKKbKOUKMvFUcEF9bbhn5XBrQ3Z
    t2oRWcsqBAKeTVqlJA>
X-ME-Received: <xmr:9EoraMi6Q-MtDLW-zuzOlh8lABdMd7rRFc6_Xlo1fPfeT2cjhmlaELlEMD2BYucU8xJwOVeSyFbz_7_RL2kwwXfB8-xZtBSpaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddujedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeev
    teegtddvvdfhtdekgefhfeefheetheekkeegfeejudeiudeuleegtdehkeekteenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvd
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgruhhlrdgsrghrkhgvrhdrtght
    segsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvg
    hvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrd
    gsvgdprhgtphhtthhopehsrdhshhhthihlhihovhesohhmphdrrhhupdhrtghpthhtohep
    phgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:9EoraE-j6YIHqx5ub3eJy07-MpWf5DMjzMnZ5TBaI-XEMT70FbGtnw>
    <xmx:9EoraPtGS_F96r9GzySw37YH0gbTt-vRsxUiMvwLyzm_SIiOywGlIQ>
    <xmx:9EoraDFXHfmzbntoeFSCfnJgr_Y3C4YwpVWfLcQRrdpijXwQpqI3ww>
    <xmx:9EoraGO3nb8gnqFNw8bcONO7FHZyHTXZnRMNdHpf0rckDXyGd3t89Q>
    <xmx:9koraBbwJGU0MKucSgI8qmEEAcbMHX8cDoXBtcJDDIP1dr0AL049mgND>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 May 2025 11:14:59 -0400 (EDT)
Date: Mon, 19 May 2025 17:14:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul@pbarker.dev>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Drop myself to reviewer for ravb driver
Message-ID: <20250519151457.GA600042@ragnatech.se>
References: <20250519133354.6564-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519133354.6564-1-paul.barker.ct@bp.renesas.com>

Hi Paul,

On 2025-05-19 13:33:51 +0000, Paul Barker wrote:
> Maintenance of the ravb driver will be handled by Niklas for now. I
> still intend to review patches, and will be using my own email address
> going forward.

I'm sad to see you step down as maintainer, you will be missed. Thanks 
for all your hard work and collaboration! I hope you will be back 
somewhen in the future!

> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20e07e61a148..9d64b1fc5180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20908,8 +20908,8 @@ F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:	drivers/i2c/busses/i2c-emev2.c
>  
>  RENESAS ETHERNET AVB DRIVER
> -M:	Paul Barker <paul.barker.ct@bp.renesas.com>
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +R:	Paul Barker <paul@pbarker.dev>
>  L:	netdev@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Maintained
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

