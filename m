Return-Path: <linux-renesas-soc+bounces-9607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0E9955EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 19:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0E3BB213FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 17:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7908C1E0B6B;
	Tue,  8 Oct 2024 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZLv7FIn6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KgVBBkmP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433F113B5A0;
	Tue,  8 Oct 2024 17:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409521; cv=none; b=jgEIylTQIbFNfFme7EFjF3yt2sG4CIANKtUtFaloOWz2rMzrm1aTV2306F0HpB02nyKktmo6TxjyxZqngoE3LNdsa3QqTWzEG+Lu99f67irJfLgZOiUrVEAC7zL8gjTKXXRxQOx9+fCLzOhoqz1WahvQX9Js4dp3m4cWU4f7eUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409521; c=relaxed/simple;
	bh=mjvMd+PMHWzPvITnrv2lyOdHuFw0fWEYDaxFHTxCXCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeYGmuk6CX9oAO/P+r8jpK5cdhvo2S9jE50/ZLqX1kByP/Myd0IIW+Se4pGROJDfhAOVf7N7KJAitss4ZcPxfFpQiuNCEY442sLWmC3lgeS/0KLuJYOUZgJlOLWhw4iRlgQ5++dJoLrvWHbkbDlsK/D36HHblE135Kw8Fr85f6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZLv7FIn6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KgVBBkmP; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 59420138034C;
	Tue,  8 Oct 2024 13:45:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Oct 2024 13:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728409517;
	 x=1728495917; bh=2uZ7ArmpWLy0zyLsAA3vJOJ3mRf4DA3RfvUA+p6UGtw=; b=
	ZLv7FIn6Glr3B3vfvJPbtHnWouY7qTYqk9SCJmB/7LQBkDf1z96iLgRDgiX+0Dyw
	FH7KnQ9NmKNzHwmfxIgRfBPJ34quWIqoWD/w74Awr4nIfBbZ7R9t4TPWBHkuvTQj
	pPfxVK7GKP1ftGsjA0eNi3U6CbryRSI6aXpuFQNKZByGpi52XtQMv7hq8LW8MU23
	7RvSfp5zVpXkYkGtuNkoFNx+tTHbhPRQ/1LlhfxLCl+Q8HGi2qO2yZO3wSk9w4Ck
	a8Eki8S1qOVN2hpG+rS6PcFmYAplKMmFza9hvud+sk+LI6fumRBLnCoPGeu0ijiD
	5MIVqLTFWeJt+3fPectD1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728409517; x=
	1728495917; bh=2uZ7ArmpWLy0zyLsAA3vJOJ3mRf4DA3RfvUA+p6UGtw=; b=K
	gVBBkmPhZru3K7IUncQe3knqrSPBdUziGd8++XGQUK3Bt4mvVt9Lcyjvj+ZRsGuU
	OB9UbxpxfM/qnUjLCOB2tkOQgEa1x8/wYNMSPd2Q5+sTI0KruU8XzxkEyCRobJ6i
	VXp48OpYpb7VIkaQJLLC5BbtMdVVHSZcRMlCY+vrM7IwZsVaNehQ8SR6hMvG8CLJ
	t2e3ZM8Seb/N+hRKNkipmcmJewGRy13P0fjkwXGRMeQK/C9mGZaccvlejI+/ttP9
	sqiwNeeUNn92gGOYvM/VcNpioeqEujERBesBytQcjF596IRGI+zTYZTe2s7OBCre
	t4l2qM7vsNaM3hrl8T1pA==
X-ME-Sender: <xms:rG8FZzXkdVli_q0NR2BP-Elx1lNm5hazsLMWSzBWrhimCjjA5oLTDA>
    <xme:rG8FZ7nkC6GDzhyXrSevMRmv1M-4ezjxV2nN9e_F-hBODndVll6dyKd79MAAUlXJN
    IBTSTI31bUnjxBBu8U>
X-ME-Received: <xmr:rG8FZ_bweoE6bw66hWs_COkyW5GGfXvvBFbdac4bUIFlfk_dWWizeFIgxEUJgC3IZZzl6ft2HFcm7OY_fZRQMRl2GmLtsRaX5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepffekgfdukeeghffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvd
    ekffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshdrshhhthihlhihohhvsehomhhprd
    hruhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthht
    ohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgvnhgvshgrsh
    drtghomhdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprdhrvghnvghs
    rghsrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhrvghnvghsrg
    hsrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvhdqlhgrugdr
    rhhjsegsphdrrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:rG8FZ-UIgVEgjha4eDkM1yBZnlsba88nMtXkzNRZKcGybnhu3fZa5w>
    <xmx:rG8FZ9lLTqfkVs3A6yDiL6fxZoIxJpjR9mEPB9ivwOaT4qsvSO8lew>
    <xmx:rG8FZ7fdbS8JtRBH1nzXfALuxTdIm6R_R83o404Qh84KBwL7gJJ6iA>
    <xmx:rG8FZ3FiS3CD3ZxKQnsHfC81BOaQib0nL82o4jOkc1VmWAch_xtN_g>
    <xmx:rW8FZzfMIjwe8ZWuNgnzXmY-zC_Qz3CBxkW8U0o2jJtn2pm0081gGO5x>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 13:45:15 -0400 (EDT)
Date: Tue, 8 Oct 2024 19:45:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ravb: Only advertise Rx/Tx timestamps if
 hardware supports it
Message-ID: <20241008174512.GA4146181@ragnatech.se>
References: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
 <a733e3df-1fc3-41a1-9025-0eb02c5ffd0a@omp.ru>
 <6737d975-cf87-452b-92b2-abc7141a98cd@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6737d975-cf87-452b-92b2-abc7141a98cd@omp.ru>

Hi Sergey,

Sorry for missing your comment earlier.

On 2024-10-08 20:26:21 +0300, Sergey Shtylyov wrote:
> On 10/7/24 10:05 PM, Sergey Shtylyov wrote:
> [...]
> 
> >> Recent work moving the reporting of Rx software timestamps to the core
> >> [1] highlighted an issue where hardware time stamping where advertised
> >> for the platforms where it is not supported.
> >>
> >> Fix this by covering advertising support for hardware timestamps only if
> >> the hardware supports it. Due to the Tx implementation in RAVB software
> >> Tx timestamping is also only considered if the hardware supports
> >> hardware timestamps. This should be addressed in future, but this fix
> >> only reflects what the driver currently implements.
> >>
> >> 1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")
> >>
> >> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
> >> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > [...]
> > 
> > Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > 
> >> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> >> index d2a6518532f3..907af4651c55 100644
> >> --- a/drivers/net/ethernet/renesas/ravb_main.c
> >> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> >> @@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
> >>  	struct ravb_private *priv = netdev_priv(ndev);
> >>  	const struct ravb_hw_info *hw_info = priv->info;
> >>  
> >> -	info->so_timestamping =
> >> -		SOF_TIMESTAMPING_TX_SOFTWARE |
> >> -		SOF_TIMESTAMPING_TX_HARDWARE |
> >> -		SOF_TIMESTAMPING_RX_HARDWARE |
> >> -		SOF_TIMESTAMPING_RAW_HARDWARE;
> >> -	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
> >> -	info->rx_filters =
> >> -		(1 << HWTSTAMP_FILTER_NONE) |
> >> -		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> >> -		(1 << HWTSTAMP_FILTER_ALL);
> >> -	if (hw_info->gptp || hw_info->ccc_gac)
> >> +	if (hw_info->gptp || hw_info->ccc_gac) {
> >> +		info->so_timestamping =
> >> +			SOF_TIMESTAMPING_TX_SOFTWARE |
> >> +			SOF_TIMESTAMPING_TX_HARDWARE |
> >> +			SOF_TIMESTAMPING_RX_HARDWARE |
> >> +			SOF_TIMESTAMPING_RAW_HARDWARE;
> >> +		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
> >> +		info->rx_filters =
> >> +			(1 << HWTSTAMP_FILTER_NONE) |
> >> +			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> >> +			(1 << HWTSTAMP_FILTER_ALL);
> >>  		info->phc_index = ptp_clock_index(priv->ptp.clock);
> >> -	else
> >> -		info->phc_index = 0;
> > 
> >    Is it OK to remove this line?

Yes it is OK, see the discussion that sparked this patch.

https://lore.kernel.org/netdev/20240829204429.GA3708622@ragnatech.se/

> 
>    Also, how about inverting the *if* condition above (and doing an early
> *return*) and avoiding reindenting the code below it?

I thought about that but opted not to do so. The same check is used all 
over the code and I think it's value in keeping it similar. I will go 
over all this code again as Gen4 will need more work to fully enable 
gPTP. My hope is to abstract the check into something bore descriptive 
instead of sprinkling yet more conditions on to this one. Is it OK for 
you to keep them aligned for now?

> 
> [...]
> 
> MBR, Sergey
> 

-- 
Kind Regards,
Niklas Söderlund

