Return-Path: <linux-renesas-soc+bounces-9457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D360E990A50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3F81F24618
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F251DAC9A;
	Fri,  4 Oct 2024 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MW4uFmMT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QPnyYEyx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3E1E3784;
	Fri,  4 Oct 2024 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063712; cv=none; b=r9WKtcoW5/NAtUWucvC0IkkEbFkqgfY+I2Q0uRLxbi7poXjjeYNTLyc/+cXKhAetnoAt8xaAMTJ0hQI8x5dg46hISUGeRzxHwhSNEVN3CO7C9wz2rf9j98h4mAtDcwyWakOerMPeuJKAu5Bpay+X706q2QrNIWg2SIQOeYGwWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063712; c=relaxed/simple;
	bh=GofTP7icgpmUBpj0DGb0Qr2CELd2RY9KjBMXFMq9zLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+BlI2y2qKbZdxpstrY5N2VHNK+feGsLVdM6vdHUOhYFiCXOzBcUYtGh2ST+ZuAikeJW5Z5o8/T2mdWoWjuoW5eyBNVDOvUAmEvW7pLuJ2PqpTlsirQSu64BS42gFLtwNhNlNp6jOvlXPNkdqIk4EeugbAcAQQxVhQj0ffTZ4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MW4uFmMT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QPnyYEyx; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D967C1140085;
	Fri,  4 Oct 2024 13:41:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 04 Oct 2024 13:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063709;
	 x=1728150109; bh=lgc1SPOLYXJK2p0mc5PQEIz+/ykAa933yZebBb1PdUo=; b=
	MW4uFmMTvACnKKBliFzJWSxu9zh359BxeQCjnufwWkrg6V+N9iqBDKwZAUzcAUYX
	lYUkm8AdXJVhxDWRcUbqxbDbQIJI/YjQ1SP/ltmbOoRbBSmmyonucGrxMIOAP1gL
	GxWsGba4qzLLphDQeTC1g+uEWMMLFpaIyOH/gnAbuLvILiYiWKUZPIBvR5T3bdyj
	PSzBuyWQAQjgeSuhsSizrfVEHQCdpH/So4BWs+uhqzZCJ2WyEWzc5kAFD55Vaa4d
	FV+U9ZzCHrbdiisA9w1rSNDIg2pqb3/zF4yjVWN1MCcsdtcFbHfNu6VrE0kSLl3Y
	i3Z/20z9LSCrAb6QXSG07g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063709; x=
	1728150109; bh=lgc1SPOLYXJK2p0mc5PQEIz+/ykAa933yZebBb1PdUo=; b=Q
	PnyYEyxi5s6RGDIt1HCcGtraRbvDcq3f1iFEQNsX56NOxKlfdVZCg2MkNSvDE4Es
	rGnlqQEAvYfBHynvl7OfjzeM8yUOgwu0dWXwP7PMeZpDxYlBkks1D0Trs733J0oA
	4SrEuhJELj5EdXxEzO2e6sfX/31MSziwTSyCi6nGWKoAqdHOjZafj+0g32GSa8JT
	2UBRV33KjLNDkob7ebxDVSSTymIin55NA8F7LgX741Ab4cO5J2Hkzw9aBbXYKKz0
	VMm+pdMNjmLzmZV3ofWPBXdWdmeUhcNx1Dvk19V+zsZG50gd89iL5P2H2/UJA28F
	WtFSKPGVQ6pdwTkYuSQKQ==
X-ME-Sender: <xms:3SgAZ-oTIoMkUGIn8u-voxZamnp05kbudyu2-j8JYeiFRm8TkwuDQA>
    <xme:3SgAZ8rSFAON_6mZYP7nw09Acjtfuffu96BQeT8CtDCfGExucbGQ2Qib6khWKptw0
    6RkkiQZ9pZHFqdDXBo>
X-ME-Received: <xmr:3SgAZzOU13pnaJGFkBoY_gK5sB-8CTbn1EGwdQPqh6YpDA0qXvr5lYn3Ivh5_VG8FwUA3GKz03rza1f7v1SMbMaZn1SYcLCONA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhi
    nhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvg
    htrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:3SgAZ95X1xqtBlG4CmZSX8SeMYO52qYFUL5jtfrka3aP2nSTikTyNg>
    <xmx:3SgAZ96hjafGsygtzRblVHTBQYsj3dQ2PWS-E-uqWLieJx2P1zFfRQ>
    <xmx:3SgAZ9j7SdRHf1zgp-1CXFKmx55mscBYiqyFICvRQc1XAw2edASDjg>
    <xmx:3SgAZ37cgclfTfpbdkBDo4Vk-P1LbhK5z0krbOOzUjbASLQJ7eN_sg>
    <xmx:3SgAZ6tHRAGZKTpegj_Fu4EdXbmF5Ouutxat5SX8ltVP6cxHKGfADCbS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:41:48 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:41:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 19/20] arm64: dts: renesas: beacon-renesom: Use
 interrupts-extended for touchscreen
Message-ID: <20241004174147.GJ3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <c1ee39ab194f1d04d56af6804fd9e7632710154f.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1ee39ab194f1d04d56af6804fd9e7632710154f.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:53:01 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index fd1dd2875644dd60..729d165f909a5257 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -440,8 +440,7 @@ wm8962_endpoint: endpoint {
>  	touchscreen@26 {
>  		compatible = "ilitek,ili2117";
>  		reg = <0x26>;
> -		interrupt-parent = <&gpio5>;
> -		interrupts = <9 IRQ_TYPE_EDGE_RISING>;
> +		interrupts-extended = <&gpio5 9 IRQ_TYPE_EDGE_RISING>;
>  		wakeup-source;
>  	};
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

