Return-Path: <linux-renesas-soc+bounces-7322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D233293089A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jul 2024 07:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC751F2163B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jul 2024 05:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19CEF50F;
	Sun, 14 Jul 2024 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iODBTGt2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h94rPcSR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB3F505;
	Sun, 14 Jul 2024 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720935380; cv=none; b=jUTP5BzHtU7qjYa8MPwkuzw3RxpvcolDzD0UVgbwKqEgxzUZwBp0fC2DfnXGYNUhlMPwI84tjozsGJc+CgF+pb00OjRdkFbEgS1W9LBZ6tc+Tqo6/Ck5UDMkmvM+J/Rt/wEGCSlyaxaIOpYnj6jmUpSx6H79gk2tsYyUQakTH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720935380; c=relaxed/simple;
	bh=xS19+sp17d5w9uukIbZLfcn+Ywz3oyK+S374Ds5EouY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8m8DCL7giGo9L0TW38D91VAyXMuxxhHoSaz+aOcoEPFxlIqoHwsIa33NsE1ubGGK9F2u4qC8FMWZ3XOjcv/pTgcMmGOjATo9CyT8NloFaF3nmMV9nmTV8mPtNXzdzsDuWeg2qc/gDgl38iBpJ/xlV307y0/nLAI0dZO02AT1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iODBTGt2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h94rPcSR; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id CF1221141598;
	Sun, 14 Jul 2024 01:36:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 14 Jul 2024 01:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720935374;
	 x=1721021774; bh=NjoaWqbmCCAWb0YfWSZt7I3ScVnBYV3ErTKM36lGPLc=; b=
	iODBTGt2SZGEl69ClpKrnNMBCezvBbue8dNnluMmHDM92DkeGl3SBB8TspkgAsQY
	JPYf/8KDrPN0+IShXVngT16qf6ypllGQJgrCEeDO4wnGa1kYbxiGd7RGNPojGD+G
	6/qyso9gD1es4ID3ZgKvGLHS9n2o4qCOngzhnGcCmTjVvPxn9eVVPjXnSkKp/7Yi
	J+zOuXSD3zYT3fghKZmt9S/gg5rNeHFVEEiQEog2d7mfEzPOejWZRa2C7ZH4VnuX
	BZZKSNHXSJddbvEnSoNxfBaLRzSl0kLyGjIHM5v5QmZ1lJs+uUQ0Uim8HEKRYpdp
	Fur7Koy/JqKZ8CMbny2o7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720935374; x=
	1721021774; bh=NjoaWqbmCCAWb0YfWSZt7I3ScVnBYV3ErTKM36lGPLc=; b=h
	94rPcSRXTfwdTLRCtV3X4Kqm8qCFXCWDLKHKg0iX1QhMgcWaF6I/ZrC+8w4P+NA/
	nLZOh1gBxUcbpHzcQfWd7/0pDdjPkI5CTixEWOiwetGdS/fzbyH7325i6Ud5xZ47
	NlC7xAG5MmiDg3oXmdMN3IoJTBDPiAYa4DMFo3lAkIYwUmg1E1Gfc6Lm83CY7ayE
	0Ne+ItYOY8jPueY0XvOpSrHH8I4qV0Xx0EErrB2N2X7885+hTHzyTQmulG5lEhMX
	M8rd1rCtmXn68ufe8DT+6q8RoxhvDfaNRN3k9pBWJkXAwCEG8Cb70VgJo4QemS3s
	q5sHY9xvTmVMrEWO6uy1w==
X-ME-Sender: <xms:zWOTZkE_6KX-zpyqliZ4XJBKnz6CR1UflKCRdYsH_fU1gfajafmo9g>
    <xme:zWOTZtVwmULPm89IQOtdHFW8aXALLkyDNMEq6PPcgoZeZq3iZ8jztlOIbf98GeQZs
    FOZ5YSOauMnNHDJCRo>
X-ME-Received: <xmr:zWOTZuLAcOjDztfRgt6EZgCgD1d1qVJ29ZiALvab5h9s3sVdan5_0EJiZU754YTj1jvC8WZvQhsZF-L4nizzHth8VorcxEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfff
    jefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:zWOTZmGYiFZAioT6Yv91woyX3g-GCrvmUpVCd0Y_w8GVwKHGNn6cJw>
    <xmx:zWOTZqXLv2TMHxNrwjdKkdbRszxAJFM0JDfIc66BiPzuXX-w3cW_ug>
    <xmx:zWOTZpOPoolqdJaSuAld4cEgfthlAfLrMmWqLKkqa8alDqKwi6XllQ>
    <xmx:zWOTZh3FVu__bFLgPwwOGRZSoT-z-dD40X3Wz4kDrhuRcnMXzFV5xA>
    <xmx:zmOTZlHaxA5c0-CHsFg8EYC3782eTzCd43YUIYfuMyxN1oGxeUdVu7tm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Jul 2024 01:36:12 -0400 (EDT)
Date: Sun, 14 Jul 2024 07:36:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Cong Dang <cong.dang.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: renesas: rcar-gen4: Initial clock descriptions
 should be __initconst
Message-ID: <20240714053611.GB3428@ragnatech.se>
References: <cover.1720794214.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1720794214.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-07-12 16:26:42 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The various R-Car Gen4 clock drivers missed a few opportunities to put
> constant clock description data in the __init section.  Fix this to
> reduce memory consumption.
> 
> To be queued in renesas-clk-for-v6.12 (unless I get to doing a fixes
> branch for v6.11).
> 
> Thanks for your comments!

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Geert Uytterhoeven (4):
>   clk: renesas: r8a779a0: cpg_pll_configs should be __initconst
>   clk: renesas: r8a779f0: cpg_pll_configs should be __initconst
>   clk: renesas: r8a779g0: cpg_pll_configs should be __initconst
>   clk: renesas: r8a779h0: Initial clock descriptions should be
>     __initconst
> 
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 2.34.1
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

