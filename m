Return-Path: <linux-renesas-soc+bounces-6102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF01905066
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 12:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 491C4B22057
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 10:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78C916E86E;
	Wed, 12 Jun 2024 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Y8ZNkSv5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PLQSg78K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548416EBFC;
	Wed, 12 Jun 2024 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718188234; cv=none; b=oe16lObCfhqAHPc5s8cMl1FmbY1nIT1Lah9KQoeU7e4ZrR4sN8rKeMjbbLX8Tv9raLKbbgiB+jeqD4OSJcVvcmZafzQskfzkur1ySQQP+8KnrOdtDqJJI/XBX7DXclQirjxd9J/cZ/1eLBXjN2CFed6ccTKFSW035qjJb7yqW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718188234; c=relaxed/simple;
	bh=iIabPgz7ADBGrxrIM1dfsdAmZA/3xu0aZ+W63LuFjpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftml2kxhjQyzyp/ssHmb6xF/Lunf9IdqewWllW1/HtuyQTxqI9ryGro/sX1H35UstMHLNz5Vyovxj5QB+i2l/9sljEv484t3xjI7P1h42XPYT8ZNSNdwOGXn7wmYHE+fm4iANIWfxxjayN8CGXjtqUp9m+jbJXnvyRo1vX8oHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Y8ZNkSv5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PLQSg78K; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 38CFA11401CC;
	Wed, 12 Jun 2024 06:30:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 06:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718188229;
	 x=1718274629; bh=t6OE9qM11UVWjiJ5yzDrZ+Br3A7hHV4coGXvTdagDCs=; b=
	Y8ZNkSv539/Ca3DgZLLUaC06HtPDY0XrRXzmxQ6tvcw14eN5LixNlOo4lxvPt1Xi
	VHGrUccJddF/OWAKOtIBcvP+GrIs1FwIIcxuIPnO1HvAF0zqUk2RtJzXGD0CnKPA
	l5QltMdEj4m4wKWJNDgLvzv+MiyzGpa7jLSxrCJUWTfmGPTVN5IlZuLvXWGEIQhJ
	bhL6pAstJqe9GbJosUQEzVHAMR/j5KV6dcXRCYAsYk3TOHO5zFzPdsJswntu3PfX
	6/doc9ek/5KNyfG4xH3o/pyKkIGwpHYJ8a02gty8luoyq0suc0k3Ldbu6xwDEpCB
	FpX88aXf+qQ8mOV5Ku+QmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718188229; x=
	1718274629; bh=t6OE9qM11UVWjiJ5yzDrZ+Br3A7hHV4coGXvTdagDCs=; b=P
	LQSg78KGkDXRse6YXWcYO76LbIYeiT+Tp5RYL/ostEqnK5AYoXdr79ic01jG+B3M
	7ED64FvVypCvqykpY9RW2mQXUwKuHrAev3kgXLvikIhA+KwxYMOPhUGYwAYHCaYG
	8MhLAAV8Lbo0NS9wGFjRCFXc1E2Us1TjHtuUXm216mzA30/kRFkTyBJYf72+ecvq
	Jk8H9+idrtiMm5pSJy3JoCAyzMr2OqSWx+OICKjfitVD5aQ6wrhsgA3rvpcqRArD
	PhUdjpfrvcxbYt+d2SeqEyCrwtf8a7KF3fGl7zTrfU2Nqwl1sz/U7g9fJAH/nIBC
	203VWwMK1RP7fIj5hIc5w==
X-ME-Sender: <xms:xHhpZhHa0zBP312oYxTewjB1CpvORQgeaBuakw3_ew96ZAGEM40C_w>
    <xme:xHhpZmU7wS1XnRKwFuRzfiPvDVVoN0tZ85N3I6W93bxjIOwQuq-b-jr59XERyaFBw
    NdosRKdQL9InIfxoQQ>
X-ME-Received: <xmr:xHhpZjJgH2XtRLheFFJFbeBIMxKTkjm-X63zaTxQzw-quSxg5qyF-9-NhshbkqTuFyGRoJvSpg7XcLWf2gCiNbfW2-yNWTU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:xHhpZnFNxI3qdL481qFa1mhuRscq4E8qs7kg4dCeK6XTXFfTTqoBGA>
    <xmx:xHhpZnVDmFh5-ghUFyw2EX6yWOUxyZFL1toNO8s3qZIw6Yuhoeuc6g>
    <xmx:xHhpZiNzMqxh6kZgpZHuwCGe6uuefFTBwyajZ3EpUR8QVZYyh620lg>
    <xmx:xHhpZm0JzpWQV31mxWFWRWqvhajiRz0whl4cl9Gq-Cf6VRqh1b4iMw>
    <xmx:xXhpZuFotNwgMm1Xsf7657yjWNW7DCH26oiH2vAKvkleBogGQaFr2HbD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:30:28 -0400 (EDT)
Date: Wed, 12 Jun 2024 12:30:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cong Dang <cong.dang.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Fix PLL2/PLL4 multipliers in
 comments
Message-ID: <20240612103025.GE382677@ragnatech.se>
References: <07126b55807c1596422c9547e72f0a032487da1e.1718177076.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07126b55807c1596422c9547e72f0a032487da1e.1718177076.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-06-12 09:25:16 +0200, Geert Uytterhoeven wrote:
> The multipliers for PLL2 and PLL4 as listed in the comments for
> the cpg_pll_configs[] array are incorrect.  Fix them.
> 
> Note that the actual values in the tables were correct.
> 
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: f077cab34df3010d ("clk: renesas: cpg-mssr: Add support for R-Car V4M")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v6.11.
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index 0a553d5170d5fdde..1057a2b6a72769dd 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -243,10 +243,10 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
>   *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
>   * 14 13 (MHz)
>   * ------------------------------------------------------------------------
> - * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/16
> - * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/19
> + * 0  0	 16.66 / 1	x192	x240	x192	x240	x192	x168	/16
> + * 0  1	 20    / 1	x160	x200	x160	x200	x160	x140	/19
>   * 1  0	 Prohibited setting
> - * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/32
> + * 1  1	 33.33 / 2	x192	x240	x192	x240	x192	x168	/32
>   */
>  #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
>  					 (((md) & BIT(13)) >> 13))
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

