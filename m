Return-Path: <linux-renesas-soc+bounces-32088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBGZI0cL+mlsIgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 17:22:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B14D0208
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21CCB3022960
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8695939182F;
	Tue,  5 May 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QAwxbQw9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UMDVuNbE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3730E85B;
	Tue,  5 May 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994386; cv=none; b=fRz1w1p3+hJQL7JAI5Ei73Hp/U+JKoRvECXJ7gIIVh9NCf9LVWDAM2EmW0FuC2DA7qUgmVzcBMsAv7abbhCF91h+MqSbaRO9voLFIqhctXGKc9WVdfzZ/UM+K92+xLGgAl4kftbeZbPwReCMdXG3qSuUvLCHhHsvAAFY/XkuMM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994386; c=relaxed/simple;
	bh=LQr4cBxXY6qeN0ZjlhV6hHWmeaNVtg7FfEz1sQg+U80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkCILcEgc8TN0DkrgRRWqhEGnGQynrkl24VgKbkbso5iV2Ur4D8OL0aj+lB6BP4Mi3s8ZuZ5+tSr1XKUtoxiUxxssItQtHujr7blOrg/73mLsGrOOUK/10KUC/mrLCh2F8AnO2WfqBAL8lKVAT2RPAZmsd9emff9Jmm0XgWwOW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QAwxbQw9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UMDVuNbE; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 49C811D000ED;
	Tue,  5 May 2026 11:19:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 05 May 2026 11:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777994383;
	 x=1778080783; bh=5yZtvwrkX3K8nWs503UpWbOdO8pvGI0ASvbyRoznDvo=; b=
	QAwxbQw9rQNX+RNYYiuSClr9kxWe2a1s1EoxmfI5TJUiS4t4KnTCcs7C3NSnrAhf
	9KYZQVTJEcGrxOw392vZN+jeLU7ZoR6jAJtW9Xu3NnjMoP2Hc4owmIyA6q3AwKcR
	9JEst3o6PmpsafDVoP4lvCax4zOBt7seG1CqxLCcw0tc8FlDvIDnXj6KJP+Um+mY
	bbqdaOFnwHD03p7hOOZXLl3LiL4sdfPV7wm0Ur5rkEx95M8+GiPbcIg9tS66Konv
	StNLhB2HWlGmMeVlmVsrk6AhV+jJQ+x/UUWZYOmE0lS0bO5ktcWhMJZq/7qURuZV
	sLVDbkurmCEcrCQfW+mRTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777994383; x=
	1778080783; bh=5yZtvwrkX3K8nWs503UpWbOdO8pvGI0ASvbyRoznDvo=; b=U
	MDVuNbEV0WU4catOVamQNfhopS+9A6igivNihShI/IdkTxnCUaefysE2jgpbTNod
	R/Xyns/28hxL8o+w0pnS5mfzf2JS8pr9AgrLNOutJ0UVLBLs0lFZmeoffwj0ROFg
	zTCrrEloJnE0XMq1LdOcXBct6OTruDSL7BmQrKGwL6MY+Giofq5+4UzsdvT/a/2a
	gargupk2NTUmq5IoYopLukMlA1JNE+DT3eKSOZtc6pel0L5WEHQEVyZoWKJsdtl2
	0cZIw+yUiFICnkKt9xzBqQVBZnNVbGEUIsO3iYOcscNhkHX3M29kRYJAEn9lk7xC
	Lu58nVhs9uGnIlAlOx6aw==
X-ME-Sender: <xms:jgr6aT5SkGCqGH4yCoM5z4uUpFK068iO9z8xMdQHOGnC8kOFvgXlxA>
    <xme:jgr6aRCKfYcMp-Vpx76KZKhth9njSLaRS5YtdkYo3_C1xroS3fufjB_zfnxGWf8Wj
    VAJe5r5c7nqi6RJjLmMA30_Pun_9n5p3E2NC98AoMmz_tQn5z28lw>
X-ME-Received: <xmr:jgr6aZ8212pgE9y-YLA1mUGqtbsph-t0IC9IkP-01iS_e5A7cCIeZzJIuajML5C6obs-6lNkIIK1qQkqcYpsmTMsGt6pOOfyvAQl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdegfeevfefguedtveevlefgleek
    uedvfeeggfefheefieejhedulefhjeekgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhhithgrlhdrghgr
    nhguhhhigeehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvsh
    grshesghhlihguvghrrdgsvgdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdp
    rhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtph
    htthhopehhohhrmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhes
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jgr6aUGas2eRAUNOcw-_BfZA_4UYpI-pfpCaDcSIn95340Gu4jXvPQ>
    <xmx:jgr6aTQ165JUVVenIanlabEjTtJgZFm8-xq_xEQPn271NZ_FCswmCQ>
    <xmx:jgr6abT-T2lnNdGWV-69kozByZPzHeH_-PZA5WTk3IHh3sflG76kYw>
    <xmx:jgr6aW01vzQChs6gP2ySdan7kffhkTMXFWIkncSvgTsh1V1pUzA4Aw>
    <xmx:jwr6acPT6FrnVp9p6lIvbs-TEAhqRZXHL5LcNjXQpcDD6wTIE_SCErCG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 11:19:42 -0400 (EDT)
Date: Tue, 5 May 2026 17:19:39 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH net v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
Message-ID: <20260505151939.GE683841@ragnatech.se>
References: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Rspamd-Queue-Id: 356B14D0208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32088-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cambiumnetworks.com:email,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid]

Hi Shitalkumar,

Thanks for your work.

On 2026-05-05 18:02:36 +0530, Shitalkumar Gandhi wrote:
> of_get_child_by_name() takes a reference. The rtsn_reset() and
> rtsn_change_mode() failure paths jump to out_free_bus and leak
> mdio_node.
> 
> Add out_put_node to drop it before falling through.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes in v2:
> - Restore blank line between `return 0;` and `out_put_node:` label (Geert)
> - Add Reviewed-by: Geert Uytterhoeven
> 
> Resent as a new thread (no code changes) so netdev CI picks it up
> (Andrew).
> 
> Link to v1: https://lore.kernel.org/netdev/20260504200356.3529873-1-shitalkumar.gandhi@cambiumnetworks.com/
> Link to v2 (mis-threaded): https://lore.kernel.org/netdev/20260505085840.352206-1-shitalkumar.gandhi@cambiumnetworks.com/
> 
>  drivers/net/ethernet/renesas/rtsn.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index 03a2669f0518..ee8381b60b8d 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -797,11 +797,11 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
>  	/* Enter config mode before registering the MDIO bus */
>  	ret = rtsn_reset(priv);
>  	if (ret)
> -		goto out_free_bus;
> +		goto out_put_node;
>  
>  	ret = rtsn_change_mode(priv, OCR_OPC_CONFIG);
>  	if (ret)
> -		goto out_free_bus;
> +		goto out_put_node;
>  
>  	rtsn_modify(priv, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
>  		    MPIC_PSMCS_DEFAULT | MPIC_PSMHT_DEFAULT);
> @@ -824,6 +824,8 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
>  
>  	return 0;
>  
> +out_put_node:
> +	of_node_put(mdio_node);
>  out_free_bus:
>  	mdiobus_free(mii);
>  	return ret;
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund

