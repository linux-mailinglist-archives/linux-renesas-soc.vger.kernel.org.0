Return-Path: <linux-renesas-soc+bounces-9453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D27990A44
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481051C21C49
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808FB1CACDA;
	Fri,  4 Oct 2024 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DgKhUTJS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lO1cPTb8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76D50A63;
	Fri,  4 Oct 2024 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063540; cv=none; b=cIFb/uoIC0CwYXD9HMC+79cLn9I1lFe+ZtZJ3w9SFgCtjBUUfe7D7Iuw6T9Zy05J+dLh8OzzoQ1WDKk0sh2Us8kpI4Ho/76UC5g5HIGfkpN0RZEL++hD6DTrI/jLyXHwz36Hu2l2rlNKEv3wOOuq6Js/h5jmFHUSZqAaQZSxuMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063540; c=relaxed/simple;
	bh=6C6rckneoIfeQaVFYy5ysQVY7s7+luoJtIP63xEv2Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Ae2H8do/SEE/yQjVp0QvAqWiuSk/I5h9HXh/VTlfedlaWgIYmPUaOs6kS0mIcRqtNECe+R1GD6BkdYpyeSBxXx1/ZOIJmZKwLkXp1jqiyioRlL4MD3SBe9wRBdD+TpglIF29WbwFIEykYYqG26DakNjdIaeq2u0LtvFsWA8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DgKhUTJS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lO1cPTb8; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 257031380189;
	Fri,  4 Oct 2024 13:38:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 04 Oct 2024 13:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728063537;
	 x=1728149937; bh=Kr3Vl5fZuJ7XMJgVhryNTAWHCxiNXbFT1ubQ2V63qKU=; b=
	DgKhUTJS8CKj3MQGjqTCgOroDVLESvyvVOlpvEiXv0EKevhwEKyEd1V9GY0sNQGS
	9OairBCe1jxDaY+32LaIm5oiHuL+fFf072ACsGrsn3UNBKj4vnXojkQVtLv7opPS
	76SnbvArGjgjAC5S7JrpVFFeTer60fqSJOPavplhBo7ZHhW+7xGUNWkMamFRN1zc
	OaDxS9j78n+jSd8FDKagdkYa/nAfimkVWnEtoq/4XqPgGZnjqy4ngmcUL+Vxd1sB
	wqmJeI4TsE4bg5M2fhiv3OEgQ/gU/S93Mwcuji7U9GULpU3PlT/ppf9YEaIml85I
	l4jQtqMeXn0o09izuUgaOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728063537; x=
	1728149937; bh=Kr3Vl5fZuJ7XMJgVhryNTAWHCxiNXbFT1ubQ2V63qKU=; b=l
	O1cPTb8T8p99fzdVL81QuJ8Raq/HG+BvLrrsk1c7ta0erM4tAodmHUvM4+sPqant
	3CKIq9nRe/l08uKPxoiTHkInCbIFnLh6umpvL/vaa75JKudcwMW2HX4X0dTWCddo
	Fb1OU8rAN8FLDjMf8NScqeUd5454wex7moqoPLaR/l/fv7fw2QMxvJi5MVF8g1Co
	SSTFxm+kW21IwQgc9V563+VMtFMORFzGM/M9W0+ly8YDfpEi1Wyvt/6UjJKuKID3
	TytvX1Kz/nvjjG54GK7IybYJeueF4YsYURfMKoASv9UcmmeH+MEnl73mKmDi36Sl
	KkxQ4pXNfMe1Q4hcyVgGw==
X-ME-Sender: <xms:MCgAZ_05-cnioLrWcGk55abuF58oxMK6yiaU2qyJF8nWOGD0H-etGw>
    <xme:MCgAZ-EaaQy97VEoIYUnRdVpskekOKL02DPz9CM3vqtecJNL6J9iaIO4ic6EmvJWi
    yQLqfCZX7JXS9aiDHc>
X-ME-Received: <xmr:MCgAZ_7vspM69tuUV-2JEzDxTu7SyNJU6YPzVF4VDrILxlGHs36PdzAlgv2P_TWuJ9BUAAHahn0Z3l4zMKOO64_rsIYdfpKMcA>
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
X-ME-Proxy: <xmx:MCgAZ03P2W243yr8_-RhsZlOuQ4fRTsD7xEH6uDirYWE0cWjk4GeMw>
    <xmx:MCgAZyE2PJMGGtriN0R65SmKbphMeESBxk_lAhn4MgfVyRWw5THLaw>
    <xmx:MCgAZ19Ol85T-BlHJ1gMviDOvuAHPcTG4c5omBMpmlCFFPbnM4Y7iQ>
    <xmx:MCgAZ_lJB_tvY367R8g9Uwku3KARP5g8SV9rPAsr_iaFrX2j-GCddA>
    <xmx:MSgAZ34YzQx0kC8XQdcVv54gVyuxp1V9HosK67JLvjH5crfq6Jox8MUr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 13:38:56 -0400 (EDT)
Date: Fri, 4 Oct 2024 19:38:53 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/20] arm64: dts: renesas: Use interrupts-extended for
 PMICs
Message-ID: <20241004173853.GF3542504@ragnatech.se>
References: <cover.1728045620.git.geert+renesas@glider.be>
 <14948b763694f3e78e8c4af35fa9c17ec91b2997.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14948b763694f3e78e8c4af35fa9c17ec91b2997.1728045620.git.geert+renesas@glider.be>

On 2024-10-04 14:52:57 +0200, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm64/boot/dts/renesas/ebisu.dtsi           | 3 +--
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> index 54ebffcd82d4337b..b4e0347d3617a83e 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -514,8 +514,7 @@ pmic: pmic@30 {
>  
>  		compatible = "rohm,bd9571mwv";
>  		reg = <0x30>;
> -		interrupt-parent = <&intc_ex>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  		gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index ca0b5c070ae57dce..08f4e35c414ebbcf 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -617,8 +617,7 @@ pmic: pmic@30 {
>  
>  		compatible = "rohm,bd9571mwv";
>  		reg = <0x30>;
> -		interrupt-parent = <&intc_ex>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  		gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index 4cf141a701c0625a..3d4a64d103b64bfa 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -247,8 +247,7 @@ pmic: pmic@30 {
>  
>  		compatible = "rohm,bd9571mwv";
>  		reg = <0x30>;
> -		interrupt-parent = <&intc_ex>;
> -		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  		gpio-controller;
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

