Return-Path: <linux-renesas-soc+bounces-18898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD4AED01A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 21:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649E93B39F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345321DED53;
	Sun, 29 Jun 2025 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Pf+FVp10";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f0tcz0Ze"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CB4437A;
	Sun, 29 Jun 2025 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225094; cv=none; b=uufoE/Bb9j/3Z70MDBSBmPZjkkY6a3st/OLdi4XmJEl2xNyFdopTYqqcH8p4EAFjUbq94nPaLkEolFL197BU2/2NJwlAtvE+yZKKmUoswxk9WR0ivNyX6kly2fKiPybHGjQJY1MUNEN9KdEnKaJJU3jkE4LoJ4V66w7J2tQNguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225094; c=relaxed/simple;
	bh=M3uo0JaklQwzTmPKcY5rP9w46RWGzNqMtz9albwADUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghwVDkXeQ8EfIe9u38I2cu9D0TYwLaJoKSUfKmEgGsXqrBVFhKuo/zfCMCw0/RYMy0l5UsxqVMq4ysJfmCUEfeVFEUpqEL+xYsutnGLmbbiLQs/+R0r/4gJayRoSIF7StoJnj+FNAzKwLkbk/um/zUBV7OaOUEOt1cFxMBVS6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Pf+FVp10; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f0tcz0Ze; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 29025EC00AF;
	Sun, 29 Jun 2025 15:24:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 29 Jun 2025 15:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751225090;
	 x=1751311490; bh=Rqm2hB4A2U11seNCayX+3FB5uqXCs04/E7vyODgKADk=; b=
	Pf+FVp10PiNM80x6rUzZLiEz7QqIHgMX3vRYuHJceLzGt5akboqC8n0X2AYgFGZa
	1odkb5r60ftjo2m3OPbZApMTVj/U3wAUYEPlOB/c7y54oE+hyvEDzGRrnkJdx+K6
	KYG58Y3AyKXRsK2usj77rXR9ur37lF+fEqKHUf7iN9sJe+6e8fyJZMLIK1mEy7A/
	PR3n1jaANBj0XFXnDy8gv/c5NPFzVBV5kzPMfl363f/lhJrIl9oYYJxqw1Yeuie2
	cHYRg2c19bGSPJJzZTGMIpIfLgGrRkxn2Em8rPrcKcIP605CpbPzXXoyCEIh/tf0
	BABKMQSb/dSYmkLQJiiNgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751225090; x=
	1751311490; bh=Rqm2hB4A2U11seNCayX+3FB5uqXCs04/E7vyODgKADk=; b=f
	0tcz0ZeE/jFTOxGk1qRKle1N0e0TS0enaHFj+j47s2AP0C2Pi3viD7eAwEuJMq3m
	ZQLNbnWyHr8q/mW/89wAkZk84stJgFnRTucQXVkIyr8imUNOlA36b15GIkDLTLTR
	jd6xfsym0gtEmxoHLTMcGymOOnCsmrX9tiCLJSHJoOJ9D07IXueqF45shbYxOotw
	RrDZOOZcdZuJdWlG+UWE/VNib62oHFf5Hq3hHl6DDkqBr19swG3z8Vj0P2MUc7la
	1zixzDO9Wt9Ffrcl6xDok5V/jROBv39zt3xQaDejSqTsTtMJQrJtPv15bJ1ndki+
	7PjkfenGCuyWs3Wg0cC8A==
X-ME-Sender: <xms:AZNhaD9Mxu4qG2_E5RFt_NAJd-cMbmdmARZWgkmRpXoZYy0GyhBObA>
    <xme:AZNhaPss-Qas1aF3KwIJ4yR9bt98yF0whCyJxzponNnRkwUDyNlxkgUQAfX53arel
    Ea_hJn9NmqvHzW28Ks>
X-ME-Received: <xmr:AZNhaBABRu_MDc7rrENMDyYnHwtc4yGrmCSVQVRixxc52MCPWa1dGWWEYj54VAdAYKN-hgGi2BO6D8WMn-C-pEVj7qNvClVxFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffejgfef
    udfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtsehmrghi
    lhgsohigrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghs
    rghssehmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvght
    rhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AZNhaPc_ZuWG982-Wajviw7IUa6otmiCTLZF56ZaNETmPVQQbNYI9g>
    <xmx:AZNhaIPq-O-OgfOOqdzclFIvPpRX9hlJOnP589pTpLGrgCGIMjs14A>
    <xmx:AZNhaBkoWBsP1A8edwReGSPfSFtqwAVJmNxFvuVqyS4r0gLidA10_w>
    <xmx:AZNhaCsaOfDoRhmVZKpr-833_S9SgB5CbqBYI9b1EY7oCQrEnfn1OQ>
    <xmx:ApNhaAa3mcNyyzzYJRx7VfgS0EcodQuf9yYg8f-Se8RHcqvtlRX2Py8e>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Jun 2025 15:24:49 -0400 (EDT)
Date: Sun, 29 Jun 2025 21:24:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
Message-ID: <20250629192446.GA2837343@ragnatech.se>
References: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
 <20250628215337.1688969-3-niklas.soderlund+renesas@ragnatech.se>
 <917fedbb-06f3-49a7-8d80-bf6834de055a@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <917fedbb-06f3-49a7-8d80-bf6834de055a@mailbox.org>

Hi Marek,

Thanks for your feedback.

On 2025-06-29 15:40:52 +0200, Marek Vasut wrote:
> On 6/28/25 11:53 PM, Niklas Söderlund wrote:
> 
> Hello Niklas,
> 
> > +&{/} {
> > +	clk_cam_j1: clk_cam_j1 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +		status = "okay";
> > +	};
> > +
> > +	/* Page 29 / CSI_IF_CN / J1 */
> > +	reg_cam_j1: reg_cam_j1 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1";
> > +		enable-active-high;
> > +		status = "okay";
> > +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> > +	};
> > +
> > +	reg_cam_j1_dummy: reg_cam_j1_dummy {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1_dummy";
> > +		status = "okay";
> 
> Is the 'status = "okay"' property needed for these regulators ? I think
> 'status = "okay"' is the default behavior if "status" property is not
> present , so 'status = "okay"' is superfluous here.

Indeed you are correct, the status property for the fixed regulators are 
superfluous. Will drop in next version, thanks for teaching me something 
new.

-- 
Kind Regards,
Niklas Söderlund

