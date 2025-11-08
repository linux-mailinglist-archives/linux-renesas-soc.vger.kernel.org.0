Return-Path: <linux-renesas-soc+bounces-24359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637CC4279F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 06:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309CF3A46B9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Nov 2025 05:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115C32D8DBD;
	Sat,  8 Nov 2025 05:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lsllRyvt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AL74nnfV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11EF2D8379;
	Sat,  8 Nov 2025 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762578899; cv=none; b=oxb4exFbAS2OmYZZXq6rGLsda+kwP3XqtPnbyGnl8KBQd6+rEXVnT1gb4IaT7CoS+waVxFEViuJIeSV0aynYu+Hy2FmxRiEFhioAjTMNimAJSX4Jv9wbbmqRc9lTL/qnocWwvFQ8eYfzTxBp3PuA57vc4AzTi6tzD7Q19WDL0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762578899; c=relaxed/simple;
	bh=HCWf3aw6V1YHro9x3O2o188F1PO4Bqmo9fXfj2g37Dk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkePgrXzICpDoRfVLNPDsynR0ObkPeirueYIo7EuZvwrDKqoviujHDRu7RvY3JMPEUnNuVBoEUtJFmJNMHB/b9trbeAP/FBdmSeCn1cKFQZmD7NpBIEYqUNx/0u9iDNv6aqILTKHQElc5WqM59SD4jmui4ngkGx+RoCaytWKF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lsllRyvt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AL74nnfV; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7D60014001FD;
	Sat,  8 Nov 2025 00:14:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 08 Nov 2025 00:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762578895;
	 x=1762665295; bh=0/wONxyUKuX4HQLFjAlRnfYHTz/pLJ+qj99NYeBdvlc=; b=
	lsllRyvt066/9Bs47DSVjIycDGfkEaJjoKIFJIMjeA8K5eKRUAoGoxXuCP6e9P3J
	0X8KrQ77KqSLs5W6Zh9Hzo+xAjqEpIbF+8JMPswDMwh3F4WutZY/BlFbK/S6L6nO
	yQj9tGZGEAfhWSZyiK5epGrWa5eXGenEWfHcxUdBVda5cCCaWtE+fMgZzurzmZz2
	18AlZaoomd1ky4tWzbJ2dub/DLwyMmKeeEDzrV6eo/LyU9dFp/sqp6yhHSY2jUvU
	kGpNVTEuLDd0kmg+5bdQ2ehoVJi+QvOVV+2+Mwrl6HlEXqEN1nknXZ+7K88uTTtc
	4sKXt1IfwsZHG4CH/b68EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1762578895; x=1762665295; bh=0
	/wONxyUKuX4HQLFjAlRnfYHTz/pLJ+qj99NYeBdvlc=; b=AL74nnfVCwbtSURyK
	ae8npVeZu0nl9o+jkt6kV2cihzzmGjMWAu8T0VWC/W6TVg/gU6FG5CAbdtxI/Nxu
	Yzc4poV//gd713hLEWILBZ7TESp358m/OGKd5dpZdaIsJym4k0blAWrpfp7CwNRz
	lugENqwLRgV1hj5N3Q8VfUZ3Xf7WwgcC1DedD3ddChEzjGjTr5XpcgemI6kR1fxu
	RgO74FnF5tO/ejZ+Rts0yMmSJ7w+tWayDBO6lfOJvI853XODgtIH+xdZ4qN+nhrs
	4pekJPFBVBUhPhi6aqgtIXQTMa1F/5cYyV9WC++AEsMLLaf9+NnSUI8qU6hxxnb7
	uOSCA==
X-ME-Sender: <xms:ztEOaY8FG_tUFWa2cY5ESeZo1ABWqH89Z7QIEXl0ficGah4s3F1C6g>
    <xme:ztEOaXN3wbhS4GQnZ0qLn5bu_Ern7-PXqXfyh_44igbObaP4mkZmZKMfitFh-FUNB
    8LP2rlurLoEW5he3P--9X4O-3ZmHaQI6F44uJC96GCOSdEZigrGHUma>
X-ME-Received: <xmr:ztEOacA4n-yTLcRNtKcANtM1ktIb3WJcEapcwDIN3U0OGLO26oSktaI_Yloh1kCbVRfAGm1ZEL4l_brJaWyT_pfyF_FTXMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleduieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepudetkeejhffghfel
    uedtvedvfefgleeufeeigedvgeetteefveelfeeiheelkeevnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohephhhorhhmsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhu
    nhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtg
    hpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgs
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtg
    homhdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgv
    shgrshdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrh
    drsggv
X-ME-Proxy: <xmx:ztEOabP1cavz2lyBgYhrNv0fswFLm_E06Mub0XGGDckEHTT5ZpX1fQ>
    <xmx:ztEOaTdSNpdZIDYBe8JU4VUAknpicK7YXzMeTUmGjUun2zh6mPe2ow>
    <xmx:ztEOac5eeEqnZlQUPkNrTYa2Wv6gVttDmySfNxd23hd3YVs8iQFivg>
    <xmx:ztEOaVK_zKueLffvBp3yU9C-vhGUIHp42DIqZkSN1GJLJfhtsXDDtA>
    <xmx:z9EOaSkmcwzKjQHst08zQmAHbf5rDvF76IZDhGgYmKQZqYv-8qUDNmle>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Nov 2025 00:14:53 -0500 (EST)
Date: Sat, 8 Nov 2025 06:14:51 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@kernel.org>, Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: ravb: Correct bad check of timestamp control flags
Message-ID: <20251108051451.GC4126953@ragnatech.se>
References: <20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se>

Hi,

Obviously this should have been tagged to target net-next. Will wait a 
few days and resend.

On 2025-11-07 21:01:00 +0100, Niklas Söderlund wrote:
> When converting the Renesas network drivers to use flags from enum
> hwtstamp_rx_filters to control when to timestamp packages instead of a
> driver specific schema with bit-wise flags an error was made.
> 
> The bit-wise driver specific flags correct logic to set get_ts was:
> 
>   q: RAVB_BE + tstamp_rx_ctrl: 0 => 0
>   q: RAVB_NC + tstamp_rx_ctrl: 0 => 0
>   q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 0
>   q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 1
>   q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1
>   q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1
> 
> The converted logic to use enum flags mapped tstamp_rx_ctrl as
> 
>   0 to HWTSTAMP_FILTER_NONE
>   RAVB_RXTSTAMP_TYPE_V2_L2_EVENT to HWTSTAMP_FILTER_PTP_V2_L2_EVENT
>   RAVB_RXTSTAMP_TYPE_ALL to HWTSTAMP_FILTER_ALL
> 
> But the logic was incorrectly changed to:
> 
>   q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_NONE => 1 (error)
>   q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_NONE => 0
>   q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_PTP_V2_L2_EVENT => 0
>   q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_PTP_V2_L2_EVENT => 1
>   q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_ALL => 1
>   q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_ALL => 0 (error)
> 
> This change restores the converted flag check to the correct logic of
> the bit-wise driver specific flags.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Closes: https://lore.kernel.org/linux-renesas-soc/aQ4xSv9629XF-Bt3@horms.kernel.org/
> Fixes: 16e2e6cf75e6 ("net: ravb: Use common defines for time stamping control")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> Hi,
> 
> See link in the closes tag for details on how this was found.
> 
> I added a fixes tag to this patch, however the patch that introduces the
> error is in net-next, so there is no stable tree to port this fix to.
> 
> I'm sorry I made such a clumsy mistake. I'm happy Simon happened to try
> out a new tool on this one commit so this issue could be fixed quickly.
> 
> Thanks Simon!
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 1680e94b9242..57b0db314fb5 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -955,9 +955,9 @@ static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
>  	bool get_ts;
>  
>  	if (q == RAVB_NC)
> -		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
>  	else
> -		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_ALL;
>  
>  	if (!get_ts)
>  		return;
> -- 
> 2.51.1
> 

-- 
Kind Regards,
Niklas Söderlund

