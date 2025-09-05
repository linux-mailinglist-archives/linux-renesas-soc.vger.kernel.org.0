Return-Path: <linux-renesas-soc+bounces-21449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926BB451A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F223AB168
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 08:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63A4273804;
	Fri,  5 Sep 2025 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eCNHR8eD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g8wtgikn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED51E487;
	Fri,  5 Sep 2025 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061446; cv=none; b=rRRrSK5WYK8Sv2cf0kEPpDw5elJUwRfO8aeJliWJvsFr5sek7uIuRvyMNZ6iw9gqI+ULXpq3wDq/tyTm8p9digatEzxiAneJfiPOyqg3cXBxmxKpj6KJ82m4AxpFALLLZMWg4cjI8lSUREm8EcEJlSQwCYhpn9bsQsjDe6gPn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061446; c=relaxed/simple;
	bh=hCguAcetvhFz1SNlWGPiAidJwl128fo0VPPkstB+foA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/mhNgEHUqHBfU0QgZFlNwNtMxoq4K0mifrS+msAfdG+7OqT8b4Lrw6415xqlSp3DJrpy/zIj8Q06NHvePvF3aT/Ujy4A+CNU73NZvyogi8HEintIuLRvjrbGBkcD8fCzOD1cqld2rn4noqLh0QwFOgr2D5MMqsgejutBRMk4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eCNHR8eD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g8wtgikn; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A15781400399;
	Fri,  5 Sep 2025 04:37:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Sep 2025 04:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757061443;
	 x=1757147843; bh=8uzuwAnUFlVy3lOJTZLC1u8CaKsRBOCuqEdrpOr9r9M=; b=
	eCNHR8eDNP53S4bSpqDOWqsfdj/LU+JRsAOw7ifBnWXpLSnealIG9YAPiDeHapQK
	mqFLNaxtCisrL3x6YpQeov+nDaaqy076LTPXcQ3+GiISJZ8sBkmx94781RR06lfD
	VVELh4ODbJO0YEQ5hIDa3hvyRtTCh3T7+XqyyjeLfBjfUcB18suTWrKZY5CNokAw
	tJkVzg+nXQM4dcvTijXWyI6702FGWk5RWJ1kF7+M5Xw7nR0HboIa7VmHG+yhnVAL
	KgqymI8mW8fXfoY66ftwdf3rPkIAeDkClUTCtX4qBA0wya2/+3B6kAN244YDwGU6
	KBMub4HI7MviezBvUXLafg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757061443; x=
	1757147843; bh=8uzuwAnUFlVy3lOJTZLC1u8CaKsRBOCuqEdrpOr9r9M=; b=g
	8wtgiknNsaPoVm1SEjbA86A+vfF29+Jz7LD5lUb+WypQ0lnQFuwkJZWLMApIrmox
	OYt5gysibrDbYG4CN0p8g+0lZXjgOLhC6C7ieht51Gi9X1FzJUeEJaP6/4t/qupe
	Vavcq2g4QmonVysMfeaurD89qT+z8/PFiilzdbGIS6FMfcci9HwBPIsvgmCdDD6y
	sMHsVYuXBqfYN3Ol0847Gc3ZTipY33CkgrjqDM7zqDuDdH0qXIe0uwYHenKYrExx
	sv079aUJw1OJUmwQa5zwKbqKmCH8JQvIv5SUIvq6u0a4jvJm8qikn81yOc/COGWt
	9DJB0F1VK6cCMj24QCyDQ==
X-ME-Sender: <xms:Q6G6aEuR0yKflpppwxvBeI1MNba2IMOhk2sd-AtABXuDSMV18rXEpA>
    <xme:Q6G6aMFuQmXS3D_D3K3CKK-FTBL7ncp0pJXu1joYpms8T1Blg9caofO8DscpKMfGJ
    9yIIQ0Syr1E1Huc058>
X-ME-Received: <xmr:Q6G6aFxEWFbAE8k_1k7vMIW9JpImyoDlc_WnlP9yEFqipeenm0MPpDSgRlmGGXIWJoXzsmSTzySUiYVOzKuHeyo7fwr3IjrGdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekgedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffejgfef
    udfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtsehmrghi
    lhgsohigrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghs
    rghssehmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthh
    grrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhr
    vghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepug
    gvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Q6G6aG2_1qZFpG7vbNH7aS8SPBdEw9mR7jkpqOAqBFFcbgdH0TIdUQ>
    <xmx:Q6G6aFpWs2-PS1tgQrj0n2nl1tx2g0GJheJndKc0T2GIwsjHNOcz4w>
    <xmx:Q6G6aDXZjsl54spmnFEMltTkz_LF7P9UjfFeQt--AOZ7Pxm71Yu25w>
    <xmx:Q6G6aOoaSYxW3l24dZPoF2J7KauogdwdqcVqU1LaZTuJNYt5I5Rg9Q>
    <xmx:Q6G6aJ6OwoyfH2fQrgo7EhhTJjMVkMZCzcaMpEm-61NmFFU2G-CXbg3x>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 04:37:22 -0400 (EDT)
Date: Fri, 5 Sep 2025 10:37:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250905083721.GB1560783@ragnatech.se>
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
 <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
 <3ace8875-3288-4498-bac7-0fab1769a248@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ace8875-3288-4498-bac7-0fab1769a248@mailbox.org>

Hi Marek,

On 2025-08-28 17:31:08 +0200, Marek Vasut wrote:
> On 8/28/25 12:14 AM, Niklas Söderlund wrote:
> 
> Nitpicks only, see below.

Thanks for your nitpicks, will fix for next version.

> 
> [...]
> 
> > +&{/} {
> > +	clk_cam_j1: clk_cam_j1 {
> 
> -clk_cam_j1: clk_cam_j1
> +clk_cam_j1: clk-cam-j1
>                 ^   ^
> 
> The nodes in Sparrow Hawk root node use - instead of _ in their node names.
> 
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> > +
> > +	/* Page 29 / CSI_IF_CN / J1 */
> > +	reg_cam_j1: reg_cam_j1 {
> 
> Here as well.
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1";
> 
> Is the "reg_" prefix needed ? Maybe "cam-J1" would be better ?
> 
> > +		enable-active-high;
> > +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> [...]

-- 
Kind Regards,
Niklas Söderlund

