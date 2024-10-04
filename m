Return-Path: <linux-renesas-soc+bounces-9454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C16990A45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF3C281A7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDAD1D9A5E;
	Fri,  4 Oct 2024 17:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NUMlFjya";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GdyB2sZ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93850A63;
	Fri,  4 Oct 2024 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063558; cv=none; b=tRP6WD3fpES1BXhcqYx+tMFYZk7GmNMXAs+kXhyMKu2SaE+g9Z9ObOkG7vaprtvS1fgeRdHGa6G7A+tQELSgsOdaVX8pa7kNlrT6+eUtv6m6LcCSWkvNyOBQKcoWwuE5rOoUKKnTzKB+9tipcrgak13g/h9TMahcEIHVmCKrNkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063558; c=relaxed/simple;
	bh=OrhQ+SyYcO2/RJEU/ZyKeSsEA1egosvAGhatozWU6fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hb7oMcDpuefpuagX9QKq8hE0UawUo2zjKpu0Me4dFGJVxR4h6YK2LqmHbnvyfaNoHmKz3AgRqE/7IhPM7hNTEm9wnHJSm0k2wH+r7JdsDb05sTO3rCYJIRFIcUrv0i/E9mrr/uWJRlLFaWHYi9CcevIXDay9yBQWmudK8yzKgxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NUMlFjya; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GdyB2sZ7; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6B9831140210;
	Fri,  4 Oct 2024 13:39:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Oct 2024 13:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063553;
	 x=1728149953; bh=6NxozmCLj+6J+30gnQcc9OLXqm9vSomkzMTLoTZQrCc=; b=
	NUMlFjyadTFRvMfUwmjEeAJohNdAxVj+NhxROONz0taCIOMJ4SFjZZ5YPPx8INEW
	NMX4BCTMaqrnhCdIMobI/6BBdJH+p/5o6gJHRCFih8WJHxAEXHMHPAJsN5Dkx9py
	G50RVPmpqMyfhTOiYevlOyQ+fUDVsuyK+K/pF5oYG9GCwWz4tvG6INuuRknd4+pw
	r2cvI47q5OZk/AP2FZ/iXVPUGmS1U6ALqHaKd4q/eBTGIIt7g6LYOplABBV496WR
	hoscsADszwNetTNj0IU/Ityt5oQji88+0UP+oJprCXwl1+4F/6HC317s1iDcOZaW
	pXkNlCYLWHt8hUkems3l0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063553; x=
	1728149953; bh=6NxozmCLj+6J+30gnQcc9OLXqm9vSomkzMTLoTZQrCc=; b=G
	dyB2sZ7KjEU1304vWxs/v17eGrqfjVEDi4bD0eZzi4l5XOnnkZhzE53Bc3JS3LI2
	Xk5lPx6PnN4zbgSkt9Tq8q8FNE2CBpTaULQJ4V6b/ZA5psz1rEzXCAolJgqIGMbs
	R0bvFp9nAR+3ntBWR/M/Q31RQc1LPM3cC7Uq1Luj+D2RhuqoB8goLlzyAUjklJuR
	6nI+FPBd+Xf/R7wfz5Aw0oSFil5U7OTtNnsn1VC5rZ2Q1LBi400pnP0KTD6Lzz/+
	YLXadhDsXO3FH6vt18H8A0z1SAmFtDfR8XEMX/cwIDHeAiq289E5hi4xPeiOtZjr
	I28kmWhv5cxJUIwwS0IJA==
X-ME-Sender: <xms:QSgAZ-L4RI2vmHj8Ql951vS6rhG_sHL7quOEbaGiJ5YW_SS_Ccv57w>
    <xme:QSgAZ2IgR9JWg62Kj0XyUtam-VccJYgzS47_Qg9Puu40VKx8vZ5Ec1qBnhWHUX2_z
    7JHp6V9EXwyCeeEuZA>
X-ME-Received: <xmr:QSgAZ-stGT2oNJ4uchR1EpAM_GscJoND-WfGy0FYrDKHR7G_iRgyWaxRDoh0cZlSDyTfBFBt6guBjXjd1vCfzmzPda4dhelVnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedguddugecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:QSgAZzYbgQYsJkMJGfPc5PvHm9_wH2hjn_g7ny1qowBxst_GwBp4Jg>
    <xmx:QSgAZ1bedunCtuQ8YFtmWf9yzCLOvTTX1oUJbl5MTkqbMvwcCNI_4Q>
    <xmx:QSgAZ_CKjD9dFOoTGFZrLECFqlBgJv7Ch3rLnW6VV-04yJdfLkuqJg>
    <xmx:QSgAZ7ZZiPudIZ8P4spYUVuWfpJ00pmP6tHywRttoRhH8BeC-b8vTQ>
    <xmx:QSgAZ6NaSppLvfeVmcDL0PSB1IIQ0zMXzUw7BmF81vYUzYq55-fyF9I1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:39:12 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:39:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 16/20] arm64: dts: renesas: Use interrupts-extended for
 USB muxes
Message-ID: <20241004173911.GG3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <b65bc4b90074f13f7b36e61a8ea47afa07eb1221.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b65bc4b90074f13f7b36e61a8ea47afa07eb1221.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:58 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index 9436b249ebdd9dcd..fd1dd2875644dd60 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -448,8 +448,7 @@ touchscreen@26 {
>  	hd3ss3220@47 {
>  		compatible = "ti,hd3ss3220";
>  		reg = <0x47>;
> -		interrupt-parent = <&gpio6>;
> -		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio6 4 IRQ_TYPE_LEVEL_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 486688b789b8cd58..94d85273064e9bc8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -208,8 +208,7 @@ &i2c0 {
>  	hd3ss3220@47 {
>  		compatible = "ti,hd3ss3220";
>  		reg = <0x47>;
> -		interrupt-parent = <&gpio6>;
> -		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

