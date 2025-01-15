Return-Path: <linux-renesas-soc+bounces-12187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE3A12DBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 22:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2663166B89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 21:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFD01DD525;
	Wed, 15 Jan 2025 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VfRRWyBP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Xv94Ds2N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F221DB15C;
	Wed, 15 Jan 2025 21:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736976633; cv=none; b=roF1dky+HJ6T/LLFf6NahDbKLFgfitS21DA8dqmP6gjDx+9R/wtXKaCVyb20Ju9t4Xg4FUFq50ULGT/0GnsXbooIii82SQ20Uh63A2LjIOf8qUonug3CnCE2h09y3N6Rx1hFUg73pBA/DYQ63PESG6MS77lBLWkywnlhoSNlLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736976633; c=relaxed/simple;
	bh=4+PhaF69XpFDwIMRxLaaQ/lKTN27yvN1sabY5PNgfQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CscqI3Hjl/4m9p75W22QyFXLGSL57dnMnYMvNMNb2dz8wkf5Zd1T5GTRCsC634elwoMrlvF5tRV3Zkqolk+R7fRenI2sbsMl1vzfKdRUb+b4n0gAq+xGkSd4MpMxk4hZ+SZsQb5IN49pXOC9iOTAp3k7TMTEu4I5BHVtbo6oJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VfRRWyBP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Xv94Ds2N; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4963E1140154;
	Wed, 15 Jan 2025 16:30:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 15 Jan 2025 16:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736976629;
	 x=1737063029; bh=YUcsWeoV3wIOBCBaweHUgrzhTAW7eZ6e7vGdEohA5A8=; b=
	VfRRWyBPagQUeFUVcc31UsPdcHZEYl0t9y5T2+TK+BPHlCijuv7swi+u6IdTQs/O
	ZzIXMgAJAfDqVqoapZjb2fBcDpE8uVFICH8zxjVzd9sJIaTIyJI8IH5rgDcCNrmP
	HRnAX6IDNgMI+voy6Hotam6PI4bKsEM3A9b4lRTGH0aCjMiICZnZgArXvAiNHW2C
	pDjKWxnX4iFjx/XalQG/+oSo4eaOI0dbATgdKnYs5+mNj1S7ldg10RLa3CXYhlK9
	KcDB1d//3w47QUFjCVLUBqO3Qw2l+lmWtIcmOgJ0Lc8zX7+5JYcqm40BuZokj5zC
	QTB48PvvcXOvj9d/yDj/eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736976629; x=
	1737063029; bh=YUcsWeoV3wIOBCBaweHUgrzhTAW7eZ6e7vGdEohA5A8=; b=X
	v94Ds2NqoZ/tTcu76qXTyHGBMk3UQ0n+5BYBUPKb392czqr9+9AY5GeyvYYnu6gs
	VK/kYosm0jd126a65nQWblFOokmU16HxDU9ko/WVJI64Z4OdcmuHM/euxQvnDAul
	jZilbNVwfQDkJLCNE/3D9vUpNFutLUbukR9XJ2etubTS00wcERKabq8v/agjaxnV
	jYDdrvHVXEqcakqwzdPwmUh881OULdF6vuLMo1sQTNfKip4AUlCanHAS119CjqUr
	i17MUKReydHq46Bnk1kzVlx2u9wylhvHmx8XNOgNagbBEwO0tdiMqpMg2/KvhdE5
	jEI0hpUVTKsE62qJhdglQ==
X-ME-Sender: <xms:9CiIZ9VBYGPBAyUjAXR7qBc50bbdo1p476970L_psbJr1ufAGJrcQw>
    <xme:9CiIZ9mBc3l_-599TTQAcpYkZgMQryJEA5TB_JyO0vWM8UfRzgH5eatcAyoFc_ucb
    yebRe0lhLNllP2gfDI>
X-ME-Received: <xmr:9CiIZ5aXQ1Zbc562mJ2LZz-88L874BEuW3x3tQoHAB6JCf-mZ1H-ZgWrR0fjL-I7i1I0WBTPEBJTCp8yq0I5GiZntiuOMpO6Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohif
    shhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrsh
    esghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9CiIZwW7I4xgppVEGqRqreJtsfffgtcojYYn0Pc0fb-BWAZTvs4ozw>
    <xmx:9CiIZ3njHMBm7wI_cE6xJtzjF0OVUQjAh43A2wlMvyUlJTcZeKqzTg>
    <xmx:9CiIZ9csHuPclLNKyyTcBhP8Qm362689ftowS_2J0swl_CObSsqIsg>
    <xmx:9CiIZxHT8wo7_HhCQgS-nvoF9rupybOeYMyeC329bKPUZbGhBbrJuw>
    <xmx:9SiIZwin4ZcjYyYhoI_zXFOCWqGIY4fQwXq9Wuwj4BQNBDL3nJIG7jph>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 16:30:28 -0500 (EST)
Date: Wed, 15 Jan 2025 22:30:25 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Align GPIO hog name with
 bindings
Message-ID: <20250115213025.GB873961@ragnatech.se>
References: <20250115211755.194219-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115211755.194219-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thanks for your patch.

On 2025-01-15 22:17:55 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   r8a77970-eagle-function-expansion.dtb: gpio@27: 'vin0_adv7612_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../boot/dts/renesas/r8a77970-eagle-function-expansion.dtso     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> index 9450d8ac94cb..0c005660d8dd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> @@ -70,7 +70,7 @@ gpio@27 {
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  
> -		vin0_adv7612_en {
> +		vin0-adv7612-en-hog {
>  			gpio-hog;
>  			gpios = <3 GPIO_ACTIVE_LOW>;
>  			output-high;
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

