Return-Path: <linux-renesas-soc+bounces-10158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B839B0887
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A31283BF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C887616849F;
	Fri, 25 Oct 2024 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QVRCqaio";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cd3sSaQz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC115E5CA;
	Fri, 25 Oct 2024 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870788; cv=none; b=Ss4WQm6fARJzKz7siTsxZxXEV4t8LX2ZIMZ3BS/JxR2/rrId9YyBwU7MpoPXzeGCJgXs9sotC9TzwmkDV8UnzTJbVOii6zZnx79Ghuz+6HP3EzkFscVux2kXGfDG3SbSOkGsvUFy4kyQ6nb20unZzYaWVw8SyUNfB/aJwz2xAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870788; c=relaxed/simple;
	bh=K2X2TKQnsT18GORezUXHpdD6bbTTA924bUv+E2baR+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgOCPTtpwd2Z1QOYscoZt04dchtZ14InXIcnclf81sAUvH6gpNMLVgwFhHbpBmuMt8pmR+HmANc5jeRWyAbjd0OieuLdeAdmhQnJvjKNB7gT1qQKJRR+Dyq9nHlG/3oS99ZcOn/mQAxrAa2Z5cf3qS/LiV3HxXBbP2qQSoIn0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QVRCqaio; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cd3sSaQz; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D6F2A13801B9;
	Fri, 25 Oct 2024 11:39:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 25 Oct 2024 11:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729870784;
	 x=1729957184; bh=lw5fu38WNLcRdf3hLGVXc1U5uuw+MxciiYMc567xIhc=; b=
	QVRCqaioHq2X/X9Msi5OfSqjucNvq7xa1+o3RcGiOij70hQl0O8bXhdcpPn+9cGP
	/xxVYKEm1w84RYcfN23OGmViARbBJ7lg3ZmKFo6vdwGVm9dyiE/TTMVkodmYEyFc
	keDUevOnMDkJIehQJYo+XOuAt6BCq6qWWNNzEaDfqMjYOS6XAXw0bk4idqbigYU+
	gMs/c71W8HxRZrzn8hjycEQgOlKpOUMtptcwaOI/jMGxCSlqzBOrmz+kHoPyLFvf
	vBvlIQB9VKe5dvgT0+lZryycYgFuU1jKRe4lk7celIn5gKIW1wg3IaMlAVhIN/QP
	tQlVlwc7w6+HkC5DLncn3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729870784; x=
	1729957184; bh=lw5fu38WNLcRdf3hLGVXc1U5uuw+MxciiYMc567xIhc=; b=c
	d3sSaQz1MKyZHw2zs+eJ8j5JySWGMjwjgOkijWOxpw6Z1hz/oVH20goVSjXAx/SX
	IegsXby+9ZfjF9cUlu1DSUuWs4Sd2WW7F3IhoxsSRbkC27WCKHMTHgCgtfGOsgnL
	uLHEaDlMTvAnVmGAh53ArXDnRFNqJLXQPe1D6VT7RHJgFajUsTB4D6UCbHJyvqXY
	cw6aFBnth6GVAkug/fSJQ21N0i1/oq9pqz9kMyZJIMX8UD4kZm3A7/ak1M1spItH
	pzO2gxHhVH0QJh5qRj9wPsRS+VDUleTzUkp8bJlvPDeBZwI3xdmj2HQ+X1gmLR8y
	ayHriXXBqQWHlgsKN45nA==
X-ME-Sender: <xms:wLsbZ9XsaVTGkbtwrQJ-olZYQHRMJJCtVtsiG_8O9OShmgJ2ikq2kQ>
    <xme:wLsbZ9lQM24ovilKzde1LTBpeYqU8Is9s0_GfxDyxkyOIJKTrwSWjoDUrMbxEGyt_
    Ab7QZI0a_zjy0qpQ1U>
X-ME-Received: <xmr:wLsbZ5a66LNJW20cWpTnJZkqDvSK3k7MpF2-cV6F5NtcvuASi1FcFdGgZrU08X_uz04u4Bm78wUA3ZgEp6txHTwU9dns1ZFYog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefieejfffhvefhtefftdffieefveevtdevieeiffdttedttdefffegtdefte
    fhhfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrg
    hssehglhhiuggvrhdrsggvpdhrtghpthhtohepshgvrhhgvghirdhshhhthihlhihovhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprd
    hrvghnvghsrghsrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdr
    nhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgv
    ughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:wLsbZwWi5QwwlxjmtYIi_xfEbMWjLg2Xh-r3nnP_B74e_wxkMKUOUg>
    <xmx:wLsbZ3k-NryqSV52Equ5vl-E6QdLqhHxLDEbdk-IU8MIpKNkhla5MQ>
    <xmx:wLsbZ9frq-WgY1LbO_f8aZLtfrBicU2JaGDUwykSoQRQNVLdBCuFwg>
    <xmx:wLsbZxEm6I7CcdCfEb1yTupkyRA7llb1iEmGh2x_JhdIU10DIISo3A>
    <xmx:wLsbZxncylnKrAdjqI0rGGdwlQABMT_7NHV4dFhTmVUwnhTiEycwl7jZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Oct 2024 11:39:43 -0400 (EDT)
Date: Fri, 25 Oct 2024 17:39:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,ether: Add iommus property
Message-ID: <20241025153940.GB2223028@ragnatech.se>
References: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ca890323477a21c22e13f6a1328288f4ee816f9.1729868894.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-10-25 17:12:24 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
> 
> Ethernet Controllers on R-Car Gen2/Gen3 SoCs can make use of the IOMMU,
> so add the missing iommus property.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/net/renesas,ether.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> index 29355ab98569daf6..d6c5983499b87d64 100644
> --- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> @@ -59,6 +59,9 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  iommus:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>  
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

