Return-Path: <linux-renesas-soc+bounces-25763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D746CBE47E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 15:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 847383047447
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 14:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2853522126D;
	Mon, 15 Dec 2025 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="fUmNs04/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gClGOi7x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1509526B95B;
	Mon, 15 Dec 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808580; cv=none; b=KT/exFdbM3WEmqPVvhbDsBSLIUMzEFg4AUmQVvMVABWk5Xu0YC8MUHwA1kXv5/nLNKJui96zIpBTXlo3Ayygh3Xw4Zx7v2N0R+j9yoqM9kddwCt8NKGoS0CMPXglMNA462HJHP2jdS2CoELwRUsaPgOuDlm+3FzEbR6SRu3YJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808580; c=relaxed/simple;
	bh=PoZsp6I/U0mZRXWPxK5+Og7evIjaW/yFvuWxwoLCfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAlb6RYOv2IzxFq+/oXFtrEm7IHhJHu5QxKQQPLcnnRkO03Du6tvtmeyK/tYP1E2BGZGGK7NKlw8f100oe5ysoUCtIW2IKDzOl6ZdMXwAvGbkkvuVupV2ckq+fHqxwlipppYO1zKmJIhWjoZmcU85ccb15unuhEq1HAPX/P37+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=fUmNs04/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gClGOi7x; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 04DBAEC00EB;
	Mon, 15 Dec 2025 09:22:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 15 Dec 2025 09:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765808576;
	 x=1765894976; bh=9HyQIW7paZTmpd7oGNgDO8ECgFOi2OBLlj9No90UqJE=; b=
	fUmNs04/zi1RmvmhfEQwU24OSg5RnVJCi6TE5G7pVyjIQJZdyn4v8qt/Ib/TQ4R5
	RGwvZnCwNYjyy9iE3XOHYoyqJ96ZQgVWbniJ8vUVSyda9ULJOWHyDB5ZQMunEEc/
	EJ3SQSf47ZFkj1Na4gU50g4mwXn6/lvD5w9OJYurKEaSUrZ8zGhyXnl2Ia3NWgIm
	qeJ//iexQPzZGxOI9/lfBK4VkLwlAPgEiLymkfwgty/LGUw266AIl/p10IKHCiqT
	KTRx0Q5OkyhEg6AW4XXUmYsZF89jOWKp5uPcmi79rJKPrKx5SGkpSaNus1IsPDT9
	94onQAVGOU7dOsI9urBfjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765808576; x=
	1765894976; bh=9HyQIW7paZTmpd7oGNgDO8ECgFOi2OBLlj9No90UqJE=; b=g
	ClGOi7x0V3ubDir6IPd0JOUKXRki7j8vadqQFkQi8ChSImC+n7eUHpxqTHEFdriJ
	jD/y5B//if9yTB/tPxajcjYmdLaV6XGkcBDyb85X3E4kdlzBnh0jvJ5Vvy4PYYVf
	obGoPm6f03oIKl4o5sKqTSy8V6KJsC3yeHkwlYUjFpO4mvs+69IqJ3xc02fZw1qk
	D45WfxVzYCyLPEavCdsRzimTREQKYG3kUHhKlnUucHI84+uxTpKxuyV92UlEkb2Z
	QwAmL2uDIsGx5yonF0qUu0Q4lKYur9hvSzCHWUFGKV+FgFva2UoVwnJmQn/Gkv9h
	Uwb1fnoJPwdUgBozIQd7w==
X-ME-Sender: <xms:vxlAaV3tGXQi_rADmwrXrB32m5j_K5kT40eQpP-4oxD7w7JKv70H4g>
    <xme:vxlAaancjRFEHR6WNFoppWhPer6a3AtVqO1d2pRxzVRZP6c9uzaZzbk4_NRUyb1op
    15Kp9avyfS_DSGYyoeeUwl7cQa-y2cMxR6m7jXVvpqvxkentF7Q5Kwi>
X-ME-Received: <xmr:vxlAacvlbl02fZdEHrt-SypV76w-WIm5kTuunNoxkiWEGuXWYF243iY6qioOLutp-TdbHAUSInxVk8lxy-6Oknxq6x9gevU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefjedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdtgeefveefgfeutdevveelgfelkeeu
    vdefgefgfeehfeeijeehudelhfejkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihsrgdorhgvnhgvshgr
    shesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehfrhgrnhhkrdgsihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehmrghtth
    drtghoshhtvghrsehimhhgthgvtgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtph
    htthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epthiiihhmmhgvrhhmrghnnhesshhushgvrdguvg
X-ME-Proxy: <xmx:vxlAaS2FNh0lEQB1ZK2Cqg4GaSoUvHiGPXfSst_8TeaxMIkltiL7ng>
    <xmx:vxlAaQRgWAd9M13wpdXLgwtt5DK7By9Q7GdlJzaJI-XH3dnU2ZbU1w>
    <xmx:vxlAaev3zL7wTy2rlblRt-e8gBFnJRS7WSRMC_c4bPECJeNmJXWBLw>
    <xmx:vxlAaeK2U5k-UCUNqVrFpMI3xnJPxuHZUa1t5zPm6btNjJjLx9Nsrg>
    <xmx:wBlAaasLEDGARWAjwac-SK0PL6fjL9khye6eJ7OEW01Dh54O3-58EHvX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Dec 2025 09:22:54 -0500 (EST)
Date: Mon, 15 Dec 2025 15:22:53 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car
 V3U
Message-ID: <20251215142253.GA1324977@ragnatech.se>
References: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

This is posted already here [1], not sure why it have not been merged 
yet :-)

1.  https://lore.kernel.org/linux-renesas-soc/20251106212342.2771579-2-niklas.soderlund%2Brenesas@ragnatech.se/

On 2025-12-15 22:36:35 +0900, Wolfram Sang wrote:
> R-Car V3U has the same unit as M3N and its GPU was already added to the
> DT. Add the binding description now, too.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Fixes:
> 
> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
>         ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
> ...
> 
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 225a6e1b7fcd..86ef68985317 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -20,7 +20,9 @@ properties:
>            - const: img,img-gx6250
>            - const: img,img-rogue
>        - items:
> -          - const: renesas,r8a77965-gpu
> +          - enum:
> +              - renesas,r8a77965-gpu
> +              - renesas,r8a779a0-gpu
>            - const: img,img-ge7800
>            - const: img,img-rogue
>        - items:
> -- 
> 2.47.3
> 
> 

-- 
Kind Regards,
Niklas Söderlund

