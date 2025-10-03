Return-Path: <linux-renesas-soc+bounces-22636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA5BB83E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 23:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63A774E46FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 21:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C3B271458;
	Fri,  3 Oct 2025 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dKH8RN5N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bqcUQvMc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1381F1306;
	Fri,  3 Oct 2025 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528528; cv=none; b=bBb7J0JBswxLbkK/B7sTMdoUYh0Nbjyj8j/6+NlYqdfpPti84XbG7LvUzpysMAi0v2Sr7nBjgdo1pLwWsdmSfJJ1NyAjdHOHalSp+9Dqld1lZOa9w5lSslcXOuIn8S/wT0pyDWD+eiaQYrfKjJgZjUbEIfT6QwmHG6oq4slkXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528528; c=relaxed/simple;
	bh=P22XIg6U6MnQjtjp4dejYBXOegJ2pg/H2vmHp4ltC6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8cMQcXQiufGVCrnBmf8nhVXSejveLbgcY1Botq2jTJvtyGkx2SHkXTEYIkOXuNL4DMyxww6d2K+fot+eB9j+mbSfdeqJoqnZrzX9YYURQ8utMxIYoCDxrsS2gscfkU2EmSoj0LZo/4Y3/0/6xfoMIlPPPiXYrG1B2tAjPRoKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dKH8RN5N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bqcUQvMc; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id E9C7A1D00109;
	Fri,  3 Oct 2025 17:55:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 03 Oct 2025 17:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759528525;
	 x=1759614925; bh=dCtadyJ255ZdiFjmOdtJ/wxySsmrVyUJ3dMPlDgV8pg=; b=
	dKH8RN5N/Kdk6jU/hJC8zff1FiDTt6T/aD2kqGk4yKcKKe1zCfWYTt856hvgTk4H
	ldAXc+ExecoobLUXO0pGB5QwQqyF9fzA3sw689KfKQh/4sHvB3+CwsrqcCxe0Qmo
	mCiTb/q+E2Brmj1N8kCi/nA6aW6tAPnUhUm85ejmM87ZTtHkKzuJboKS3c4vSl/f
	li3gYXh3oY6KdW9IJlHoOk9L31ULUKqrPR9vFPeTIIloeJlv6m0PVjQCqHq6TLNT
	WSBhjcY5AH5L7l8x+RwDKH9ch/Lmu0TZDI+NZaYTSplssl0glB7VYUTeZcgUUP7u
	idGwWySb0kPZQzxEsisRsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759528525; x=
	1759614925; bh=dCtadyJ255ZdiFjmOdtJ/wxySsmrVyUJ3dMPlDgV8pg=; b=b
	qcUQvMcLM6UFERa+cAxPMV/oJbhBV1Bv0ayEKEEEvQ1AKwaqB6yeQb8Bi7f8KXOL
	lnRg6ghuAUSPUwdaUxUcjp0hM0VdSO7Qk6HzVnZE97QdyKvQzwd2SYSOuLNU/UOQ
	2fWd8qa0UvfDHsVnwfTBXrGkcaoGqXgX5/kPHlBbga3fGbQ237QLnsUwpZaFPFIm
	6dhFCLUk1mkSPampkNmYK81w8MaLvdABpfmcey2ZbbgIXrFFw/Z4viyOsYdL4LKa
	vnutS9i9mmTqWvKBx/zaAe+nJLQjHBdmQz6uhAAxIbeR0EaBLc5puRfqvZBQjWvU
	kV8FVZBBfgFG195ebOyEg==
X-ME-Sender: <xms:TUbgaBc49qjuVnbxAlOpjKHfy1I47Urzk4pldC9iXJymiRPFr6GGHA>
    <xme:TUbgaEJB-9te2qIelmueFWKFF21AGSZsYBGmOeeQjyPl7noPa9wcxeqEyVXxTM5by
    b_u_t_SynkQk2WNl_sbIGHxR0h3p2wDKqXrx8KbjiQ-1j5EPeLaf4O3>
X-ME-Received: <xmr:TUbgaOxE9EwDJBbNTt0LEzpK82_wJNlKY3S6vJjodH-W8TgYhypxTyt7Xx3aYGP0dsLOXif1CR1s9c1S-cEFnxNh9PoF0pM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeltddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtoheple
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgr
    nhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinh
    hugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvg
    hsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhm
    rghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TUbgaKsWH31Yy9VJjpIIlqeFrjMDWKOWTDB2VWltuU-SRGRccHkouQ>
    <xmx:TUbgaBBFRS3AimmhHvDh_T8ZolrhKIR-Kl162c_RrQQ6AywNu7QyZg>
    <xmx:TUbgaMGuFoX-zGUAOAwL5PSxii9lSmOVLDL7xgAFtR-RwFcnFdLmdA>
    <xmx:TUbgaBAHPPfQrZtW8-YvWAV6BFAkqCV0zAowupO3fymysHWxSq_wgQ>
    <xmx:TUbgaJHxBtZQqRWdTzvV_j4-ZPnCvZk2blfIcWtdYGVyt9BXPn-m9Z8V>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 17:55:24 -0400 (EDT)
Date: Fri, 3 Oct 2025 23:55:22 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: gose: remove superfluous port property
Message-ID: <20251003215522.GA399701@ragnatech.se>
References: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWrMB5ZdRgX0BwLJeOgJPecxm_kw2J=RcFegdZgtHwtYA@mail.gmail.com>
 <aNr2y8XckvuaRyKW@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNr2y8XckvuaRyKW@shikoro>

On 2025-09-29 23:14:51 +0200, Wolfram Sang wrote:
> 
> > I think r8a7791-koelsch.dts has the same issue, but currently it is
> > not flagged by dtbs_check because adi,adv7180 uses slightly different
> > and less modern DT bindings than adi,adv7180cp.
> > However, according to the schematics both Koelsch and Gose use
> > ADV7180WBCP32Z, so r8a7791-koelsch.dts should use adi,adv7180cp, too?
> 
> Well, Niklas has a Koelsch and would probably be happy to test his new
> Gen2-enabled CI with this change? :D

Tested, CI pass, sent. Thanks for the original work and the ping, much 
nicer!

-- 
Kind Regards,
Niklas Söderlund

