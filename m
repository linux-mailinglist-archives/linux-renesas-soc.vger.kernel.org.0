Return-Path: <linux-renesas-soc+bounces-18810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED4AEA8F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 23:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7856216FBF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 21:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502CB25F985;
	Thu, 26 Jun 2025 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pxECusUj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dEu44YR/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BB25EF81;
	Thu, 26 Jun 2025 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974120; cv=none; b=bFPr9yRgaN8RIVZmeEvEZpXXJ6rVfr2xas3W0cY/uOvEAuxx9+hiWvcV4D+vulUaddVi1lT1ufdb6rwRFZ3EuCzg9PsnhlsZ/rBSa0Zmnmny9NQM1fVgYX9wSO3LbFU8ZI+MkmIbX+XH2NqEQknQjnCnDG7R2wojISXEdW+b7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974120; c=relaxed/simple;
	bh=SbhTlf+ZNN4wj/OqDrKJkt12GpvChqIALuSr1fGWjtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzoKLZmxVxZswaQkvKoxRkRNgRxzTOLwFI70aGmcAeaWmGL6TCFZ3olnR5+jgsJiJOvHiILdZkB+5vxcubbDiypdrdgqWVgi+4kp+IKPONltIXbakekfc3wkUUs9wSEtw/nPfktzR3+slWhYCZTDiHuQFHAA5wc5zk/kOZJDtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pxECusUj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dEu44YR/; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id A7DF21D00119;
	Thu, 26 Jun 2025 17:41:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 26 Jun 2025 17:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750974114;
	 x=1751060514; bh=gkj2mMHh0GxLUj/eKGxZgIwvH9Co0awqJJJrJZL4T18=; b=
	pxECusUjGGx3J3kjU40da8OIvnNP+kKo+jTZ+jlW/7QovnmEoQvgQlrM99A64P8I
	UKEKKOsSXQ6/YHOYonAJwLr4oyZAGFTez7Senc1cH8hIPtZdAumfzaUPco9sTA/S
	wKNgnGA2GKP1RdYX6pqgxK4fCD1A8WnndpzsxkgvgBnRdBHY7L028bLxYRzMV+0V
	IlA/kQZ0sX7gMPrDnsh2xXd7uaHtkjOfiHtpTZo1haqChq1QB5LOHH10KqeLHLga
	PbXIPvLGrj2W5XhI90+yIBjXQY0vT0tXX1Xr07DvJswmDCLPNtOwuceJw05qV+RS
	E6vwy0LuBcSlg5kkDQj9jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750974114; x=
	1751060514; bh=gkj2mMHh0GxLUj/eKGxZgIwvH9Co0awqJJJrJZL4T18=; b=d
	Eu44YR/gGl1crkcj/CjBg8RWJBHU14zGSZeTsZXe7t17AFG/IrSgbLo7YdDkSAbo
	ZICx4qve7xO3yvY3FQJWGTwfwz3eMmILr0XZ+X7UqAqEZA3vjn2tBeB4I+Fofu/P
	Cvdt8hkG+4dvCD9WTAYvymbMmRAKwha1AHmFV5DPK+PqiG155ifT8HDYnj/mjQzt
	QakdsiuFL/+U8Wy5C/gee15gjnojQxEYSGS2BftsqW3AWPT+wXlV95+tx+AlDTFN
	TlLplfBbeMn5izaf3x46USvIaIK8uh6VOelrC0WPo7Umphzc4eRTY14b0tqUc7wZ
	rT8TYx6zGG6Cpp+peUCRw==
X-ME-Sender: <xms:ob5daPtpSYMHkpxuQZ6UNV19w74wRpigYUXsiblCTFZkPkJ3iWWkcQ>
    <xme:ob5daAe-04Ao55PHg8CMLk-MnzHbLRUrY75D6eps23G7empv90QpTQ-PPxpIJ9Msq
    EfDvGECK8Acsu5FItY>
X-ME-Received: <xmr:ob5daCyLtk6S1-qetEFRMd8BCkYaY9gp7X6ikXEPTQlvJ-mp9y17WJ1YjpX78a4SbxdeY7QFLNaaBR7zYU6UHDQJFzvZgr01VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ob5daOM1Nj7wEN9jhX5fhm3KmEYhKsWOWNCAgRYixxWybykqeJq9Tw>
    <xmx:ob5daP-nBvUVn5OZVoHy9SKv32G_OqTknl4WXCJis2n4vgnU_0BGgQ>
    <xmx:ob5daOU9v9DiYVT9nPUHNCbYxLvTsDnjQy73Zv-5DFad2XBuhdEeTg>
    <xmx:ob5daAeqwsrOLKLqY_UQ4_R7wQxRfdddXmPQAhKo04zs_pUZoAQLBQ>
    <xmx:or5daGTQLtIwmqNSVqJVpCRY0YCh-AiXgZmWc7pxNK9CArwxuI52uouC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 17:41:53 -0400 (EDT)
Date: Thu, 26 Jun 2025 23:41:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
Message-ID: <20250626214152.GA1817595@ragnatech.se>
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thanks for your work.

On 2025-06-25 12:01:56 +0200, Marek Vasut wrote:
> Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> to generate more heat. To prevent potential damage to the board, adjust
> the temperature trip points.
> 
> Add four "passive" trip points which increasingly throttle the CPU to
> prevent overheating. The first trip point at 68°C disables the 1.8 GHz
> and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> trip point at 72°C disables the 1.5 GHz mode and limits the CPU to 1.0
> GHz frequency. The third trip point at 76°C uses thermal-idle to start
> inserting idle cycles into the CPU instruction stream to cool the CPU
> cores down. The fourth and last trip point at 80°C disables the 1.0 GHz
> mode and limits the CPU to 500 MHz frequency.
> 
> In case the SoC heats up further, in case either of the thermal sensors
> readings passes the 100°C, a thermal shutdown is triggered to prevent
> any damage to the hardware.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index 9ba23129e65e..ba81df3c779d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -38,6 +38,7 @@
>  
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "r8a779g3.dtsi"
>  
> @@ -797,3 +798,139 @@ &rwdt {
>  &scif_clk {	/* X12 */
>  	clock-frequency = <24000000>;
>  };
> +
> +/* thermal-idle cooling for all SoC cores */
> +&a76_0 {
> +	#cooling-cells = <2>;
> +
> +	a76_0_thermal_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <10000>;
> +		exit-latency-us = <500>;
> +	};
> +};
> +
> +&a76_1 {
> +	a76_1_thermal_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <10000>;
> +		exit-latency-us = <500>;
> +	};
> +};
> +
> +&a76_2 {
> +	a76_2_thermal_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <10000>;
> +		exit-latency-us = <500>;
> +	};
> +};
> +
> +&a76_3 {
> +	a76_3_thermal_idle: thermal-idle {
> +		#cooling-cells = <2>;
> +		duration-us = <10000>;
> +		exit-latency-us = <500>;
> +	};
> +};

I did not know you could do this and use it as a cooling device, thanks 
for teaching me something new!

> +
> +/* THS sensors in SoC, critical temperature trip point is 100C */
> +&sensor1_crit {
> +	temperature = <100000>;
> +};
> +
> +&sensor2_crit {
> +	temperature = <100000>;
> +};
> +
> +&sensor3_crit {
> +	temperature = <100000>;
> +};
> +
> +&sensor4_crit {
> +	temperature = <100000>;
> +};
> +
> +&sensor_thermal_cr52 {
> +	critical-action = "shutdown";
> +};
> +
> +&sensor_thermal_cnn {
> +	critical-action = "shutdown";
> +};

Is this not the default action for critical trip points? In my testing 
in the past R-Car systems have always shutdown when the critical trip is 
reached. If it's not I think we should move these to r8a779g0.dtsi. And 
likely add them for all other SoCs too?

> +
> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> +&sensor_thermal_ca76 {
> +	critical-action = "shutdown";
> +
> +	cooling-maps {
> +		/*
> +		 * The cooling-device minimum and maximum parameters inversely
> +		 * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
> +		 * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
> +		 * This is because they refer to cooling levels, where maximum
> +		 * cooling level happens at 500 MHz OPP, when the CPU core is
> +		 * running slowly and therefore generates least heat.
> +		 */
> +		map0 {
> +			/* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> +			trip = <&sensor3_passive_low>;
> +			cooling-device = <&a76_0 2 4>;
> +			contribution = <128>;
> +		};
> +
> +		map1 {
> +			/* At 72C, inhibit 1.5 GHz mode */
> +			trip = <&sensor3_passive_mid>;
> +			cooling-device = <&a76_0 3 4>;
> +			contribution = <256>;
> +		};
> +
> +		map2 {
> +			/* At 76C, start injecting idle states */
> +			trip = <&sensor3_passive_hi>;
> +			cooling-device = <&a76_0_thermal_idle 0 80>,
> +					 <&a76_1_thermal_idle 0 80>,
> +					 <&a76_2_thermal_idle 0 80>,
> +					 <&a76_3_thermal_idle 0 80>;
> +			contribution = <512>;
> +		};
> +
> +		map3 {
> +			/* At 80C, inhibit 1.0 GHz mode */
> +			trip = <&sensor3_passive_crit>;
> +			cooling-device = <&a76_0 4 4>;
> +			contribution = <1024>;
> +		};
> +	};
> +
> +	trips {
> +		sensor3_passive_low: sensor3-passive-low {
> +			temperature = <68000>;
> +			hysteresis = <2000>;
> +			type = "passive";
> +		};
> +
> +		sensor3_passive_mid: sensor3-passive-mid {
> +			temperature = <72000>;
> +			hysteresis = <2000>;
> +			type = "passive";
> +		};
> +
> +		sensor3_passive_hi: sensor3-passive-hi {
> +			temperature = <76000>;
> +			hysteresis = <2000>;
> +			type = "passive";
> +		};
> +
> +		sensor3_passive_crit: sensor3-passive-crit {
> +			temperature = <80000>;
> +			hysteresis = <2000>;
> +			type = "passive";
> +		};
> +	};
> +};
> +
> +&sensor_thermal_ddr1 {
> +	critical-action = "shutdown";
> +};
> -- 
> 2.47.2
> 

-- 
Kind Regards,
Niklas Söderlund

