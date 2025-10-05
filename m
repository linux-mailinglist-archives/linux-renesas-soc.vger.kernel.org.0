Return-Path: <linux-renesas-soc+bounces-22666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B1BB9808
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324883B80B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 14:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6013B293;
	Sun,  5 Oct 2025 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dFzZmemy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gbtx3Pnm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DC5A935;
	Sun,  5 Oct 2025 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673973; cv=none; b=ns+WaQhI/vfFGmuA3qCV3m9B9E7AEqU6IbrjGOzJnjgABGjpFl1NJJbIBrVKXrb6LiRmTew+QACXhjULOL59VRRGowwLH/jDGkn5C8qtEmGcg3dEU2Zm73VxrKhPCrPk3chXIyAJgK80PEDhqliirkpBkoCh4oN9MTBYP0u3VaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673973; c=relaxed/simple;
	bh=mFSXTfQU3yOeCglPcP/To78XvVk1YPQn343Bx/mNRyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uetMOBIDEWgvU/N9kG0Q6t9Mlbtgy40pqz5hFW3IUNVZd7PCGel0RRe2K7Gkg+TkdrMsHF6J71RwpEE3NpeGPyxmL2Fl7hG0l6R8bTopM6XwCgy348emX9WkX2KwaY4yovdPO+HYaN6giJc3QR0LxRDswxUYK84jlWo9A2YwVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dFzZmemy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gbtx3Pnm; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DD39014000B5;
	Sun,  5 Oct 2025 10:19:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 05 Oct 2025 10:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759673970;
	 x=1759760370; bh=jA59cn6swCrXo1Qb1s4scUzP1SMSDzyk7A4NjSUgh6c=; b=
	dFzZmemyfkB2Uy90KYcYYQ27oClKDyBNMC4QFmxNJZF1cdBi0MiUcMjGw/+RVyXo
	LJxSRfL9r13az4DBkwtVhm/gbug532EQo6wzagcDmn6v1zCZGh4X8Jqpo79vfXKR
	F/efqHq6EbYnhfm6u0AmTGRYILJZUf67myODkrKqjQspBXivNN2Zu/Gw7zbVByR+
	h4FSOaR/dbYN3B5GMo2NTBAADOHUJ9xZXOArg/wBd1CPC9XAPOLXeYzWmJMWy4SO
	H9r/ED/p7xUr7rEzHQfEa8jYHddTvs+Y1JAy21kiSXbJek0DLUi44Djwcf6YuB3n
	smKGWJ0Z9OfVdKrgQrex9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759673970; x=
	1759760370; bh=jA59cn6swCrXo1Qb1s4scUzP1SMSDzyk7A4NjSUgh6c=; b=G
	btx3Pnmw4fcGZqcUHZJK4RORy9TinZcU2W0xTjNhuGta+z2mASrQ9bh0HbHucxGE
	Oey6as5N4WxAhf8WbeQtuXlQNlvZRelIthlRn0mElYIqh3tf2IgMLusBcpwgXP+Y
	4PPGgMIM7m/zkQx+dueLMeX+90LUhHUPCTZp1e0zPxEJxQn4OM9sUEXZFSIC+rQT
	5R8m0w30XH2dbB0rda6MlNeZR/ugFVr3ucQtQEyJXGLr5NZ98J/vsSsdMrvQQpvj
	7qo3Ll33U9IWQMb9pwsdAEnec3jRhEbpfiHVNNPiwQ5M/h4769iKO6a+xDhnruzw
	D4kACTJb7reEjOhn+vtaA==
X-ME-Sender: <xms:cn7iaMFiYbmDJJkB524SHrK5tawKursKNrb9LAJKlvVc9N97O-Sf9A>
    <xme:cn7iaGFBkjum5v-TdAfEdaElIJgtG7_cBY-lExOq1Ghe9Mwk-tyapDZv6KHuYzeOh
    7b2witWXcoziIU_grk9LWQbSd6On6qV8ulpUjqXeyA0Zlu8etlMLbU>
X-ME-Received: <xmr:cn7iaCQbn7Zt9M7PB5MiblyHdtP2PqTOhgmKR3If-XH4sDQVZ2laRN0Pa4r_sN0UB2fjxftJRRmN2s1pdR3hFVmX9VAH0dk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepsh
    gsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cn7iaPJcWf8oojZ2zYeOQBDw_zaOxH_QVY-_LSlJpUPJ9X2uUgjtSw>
    <xmx:cn7iaFYDdIwUsaeQikDzLMOBnXH6aPRm4cXoIDobtm1hKucBAB8lBA>
    <xmx:cn7iaJ-L8Jodg0KTK7TID7UBIKvreGe5k9vGoVtf36MIpnFrueI6OQ>
    <xmx:cn7iaOa6Hz30SE7v6q69eU8D2qwRZbrBNbX6wYi5rwDUHJa-AyN0dQ>
    <xmx:cn7iaFLMbPX3_YZOF2Pur9hZrTHKasz3Ky7HRBmuyW7q0hVvG9_I9vpV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Oct 2025 10:19:30 -0400 (EDT)
Date: Sun, 5 Oct 2025 16:19:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
Message-ID: <20251005141928.GB1015803@ragnatech.se>
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thanks for your work.

On 2025-10-05 15:14:58 +0200, Marek Vasut wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> after reset has been asserted by writing a matching reset bit into register
> SRCR, it is mandatory to wait 1ms.
> 
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.
> 
> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

With R-Car ISP that had issues with v1,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Add RB from Geert
>     - Use ca. as abbreviation for circa (cca.)
>     - Switch back to udelay(), risp triggers this code from atomic context
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index be9f59e6975d7..ddc234942a85a 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>  	/* Reset module */
>  	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>  
> -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> -	udelay(35);
> +	/*
> +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
> +	 * On older SoCs, delay after SRCR has been written is 35us
> +	 * (one cycle of the RCLK clock @ ca. 32 kHz).
> +	 */
> +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +		udelay(1000);
> +	else
> +		udelay(35);
>  
>  	/* Release module from reset state */
>  	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

