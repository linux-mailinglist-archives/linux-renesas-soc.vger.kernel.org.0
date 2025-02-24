Return-Path: <linux-renesas-soc+bounces-13561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F060A41C2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 12:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8B43AA9A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5936D259483;
	Mon, 24 Feb 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ATyj8RyJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tFmwMZHN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30051A3165;
	Mon, 24 Feb 2025 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395634; cv=none; b=NxxsvjeevMlYnT1MVK3rtCmlw5uCLD038u2dOrhy+FrFR2z4te2twR8B0swgKqZ7uwMgJ6zStDkJZEFFLz8ysO4OQpBltbUU08MRjJQW3wMT8yLENoOt34pqp/74z5/RvdxVgtrrfdhnkKcvibzhkOAzUnkpeHgMJosIfujr2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395634; c=relaxed/simple;
	bh=MMDvmvrS0Eti+sDwqqljVm+32DgG/Q1qSKrXEPDeg1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnKFxFZm6gWw+K9Y28Lr0+hJn1a3n9gaH4F4NHk8v0z+V4XJDn7wt+6rdCgB5Qirb8CVsQx6F0nYgnMi69i+rupMFHu27ZAQJvdYKxZsTeDWereB0dUCi6ETPPqnka1iD4WO8Ow/cBO0NwKfxZhSFdnquTR++cXxtb9X73NtAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ATyj8RyJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tFmwMZHN; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 74B3E11401A8;
	Mon, 24 Feb 2025 06:13:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 24 Feb 2025 06:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740395630;
	 x=1740482030; bh=q/WWSDIGgNonfOGqFQW8MDgJxWFPr0j3B1LaVBN50m4=; b=
	ATyj8RyJFEpx9ntfoEb0XJVpHPglhp/VYcjO5drWWVbly+IpDt3SCtrzKNDDnmpy
	NwZNub4OomTQJTVvntGiStaPEXKVh6dBx/3DR53foxcrnmhazx0sw5iwZEeR4pJu
	H4Hyx93EgaMEAdaa9Lkq1BZn/vzD3Maji1EC36+1pBBAqlXq0llOww5daN32SQmE
	cn2nqyn7qSpxbbpFzaVZy0jSw9i1FmxeCF/IPAP8JHizlA6woeBL86Qg4eJEPZLz
	aWkTAk2tl4GIfNMIdty8uuxAyVJ0wLIT6YIgr/Uc7ZCI4mzwXPFxOo7YNN74JskE
	s1l6uxQZrtlmbcB2Hn4+LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740395630; x=
	1740482030; bh=q/WWSDIGgNonfOGqFQW8MDgJxWFPr0j3B1LaVBN50m4=; b=t
	FmwMZHNbO3SAGIGlIrXxFhUXMXBjrDjJx8NVwtB4cnXF0+450RHcVmxlrEsRQGHv
	asfh//fePK2G7dKVMEHDwG/jNVJ9MUXkfOnpLepYIzaNxb0y73y6JBhduKZGNr2j
	FXJfhraa9H5CKwob+wfhB390PQoPvMJo1p63nhb/QLnkWI/vDpp7ykq/i+6aBXC+
	D5tGy6kKyOVXQAtiHycsZRzMc7ZPVIA6C4lURl5FSubu02BRua570T4yfiP97rkb
	h4pUTzI/+uZbxcVwlYNIb1yRvZsRHq3QUOpoVrReOmrubc5feSmllEhHWMdSt683
	cR4m247FYh2tt76hAbRqg==
X-ME-Sender: <xms:bVS8Zz3BQXUlKScqpdzDYt26Em9b1OMM80kp6k6KSE_FdTVvPUhi4Q>
    <xme:bVS8ZyExzlKHL6SEvyWje-pG1SwS9Jrar1mcmjEThmV6VCf0QNe6BWb1YHClME5Nb
    uuLcdnEFjz9h0ieB_U>
X-ME-Received: <xmr:bVS8Zz7pumG2B9tGFl6dsP_e2iPRHAkUpPLx5VT8Kx9RkwQ__jShOcU-XVHPpkG4x-82aS7yx3daG3TmOFthxRZz6S1jt31Glg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddupd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhorhhsthgvnhdrsghluhhmsehl
    ihhnuhigrdguvghvpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruh
    hhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvhes
    lhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpd
    hrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehk
    uhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrth
    drtghomhdprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bVS8Z41vLpiI9rB0Ozt0FTyRXKF6zDrRcGdoj7W41S-YZzFwcKi4mA>
    <xmx:bVS8Z2HxPdy4S07mwEc0fiXpr1uG2YHx5dhSyjpPzinkJmu5ecpifQ>
    <xmx:bVS8Z5-Ij5G48d5MIu8BqNqW5HzsmLUee7XVo_kmfFAfBHpSrZDImw>
    <xmx:bVS8ZzmXDTYaFzoiqb_8n6bbZU1rAmdP83NhjJ-rf2fKvJZXM04Y4A>
    <xmx:blS8Zx8BJdsM12M13ne8aWv1vIYQeH5EYPgAFHFO-3bIeBPEA-ICfslX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 06:13:48 -0500 (EST)
Date: Mon, 24 Feb 2025 12:13:45 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: renesas: rcar_gen4_ptp: Remove
 bool conversion
Message-ID: <20250224111345.GG515486@ragnatech.se>
References: <20250223233613.100518-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250223233613.100518-2-thorsten.blum@linux.dev>

Hi Thorsten,

Thanks for your work.

On 2025-02-24 00:36:11 +0100, Thorsten Blum wrote:
> Remove the unnecessary bool conversion and simplify the code.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
> index 72e7fcc56693..4c3e8cc5046f 100644
> --- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
> +++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
> @@ -29,8 +29,8 @@ static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
>  static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
>  {
>  	struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
> -	bool neg_adj = scaled_ppm < 0 ? true : false;
>  	s64 addend = ptp_priv->default_addend;
> +	bool neg_adj = scaled_ppm < 0;
>  	s64 diff;
>  
>  	if (neg_adj)
> -- 
> 2.48.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

