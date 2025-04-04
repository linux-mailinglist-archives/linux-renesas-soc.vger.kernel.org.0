Return-Path: <linux-renesas-soc+bounces-15392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B5A7BC3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 14:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D5918952BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 12:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD1E1DE4D6;
	Fri,  4 Apr 2025 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlzvRF2w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEDF1B4254
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743768291; cv=none; b=L2Gi4minyx1WUMhxPeQkTr5nNDO5IcnosbUOzaFhckrhIGExHtf2orAy/oVn8NKpS+ibDB+BIWzduMIVLxtbnhVhCv6ygHW4GHws5bbiaMz6VVrzPBNBvQ/tNVigZZC7ynlmj2pAEPv4+DJj1ADe5JPPYfMqVkdT2vMbNW1zF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743768291; c=relaxed/simple;
	bh=9RyY0I8TiFgdM5iAY/w+YHb5uz0XrHApT93/HZJ374M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/Asn21YsiX1I1anLjXGY90D+VAC8jApqE6HHqe5nILhroOwZDYWmWkR8s2YChLK3d1EkLI2XsXl5cx/5dVspdz6VRgEg30zB2wchxzxFSqbqDz5O1GaoxA6wC88/aJOlfbLj9VzD5sgX3dpd/dSmqzoP3ADKG+wsoAsfCAloko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlzvRF2w; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so3528706a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Apr 2025 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743768288; x=1744373088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ksgi80fBLzSJaAEI7Zj6pS0brYRqc/LQPT3hzVLK7xU=;
        b=OlzvRF2wWkTMKWKCYOBCqeHUhAV5feM0KvIGv+8ZH4WyR3Ngm1giRrjEBxeCp32Icf
         RooKuJt2h0kBh5PiPP+Q48+9fICaiphid2LHzhs6d6D0iI7MoQJj85A10xKNowWWy0N4
         WmaTDw89azI2mNqUkgJCkdk1HWFrZieLQjp81dB3tm68+XcINnePkkh/7adm1FxAL0DW
         37vHoYDeuDd7bY9Zz8IfxnFhJ+GdH9sP3c8TnHt2B3SCG+zis4D2Ht882Lmd4nWbQDX0
         nbO9wyWozadqWwji+bSr8U7S9j2CSy5PT7LF++DPxYkEEKOK16zJSbHpfZaAeydUXJr4
         9/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743768288; x=1744373088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ksgi80fBLzSJaAEI7Zj6pS0brYRqc/LQPT3hzVLK7xU=;
        b=p9ZnpDpa1PpYWJtCRb90sgWruFrHTrPF35RN0IaJ35dM4fPVjWbVsfBCP6lvn/rb9v
         cxYYB85TDPaDEZ9hk08X6bczoxrh+JYw3oDdZuN6bO/6K35cS+PLjBztPph73id+kvcQ
         QPGh3vj2UoSz6AVy+fqG8wfjSj1PKZTb01Lk53eXEGOfAySdHhyFmMu29orMz1TTndba
         zKpYxOvxJs5o7pKPJAMBEwBJneV35A+ezlPC9GnVkXT98rPyZwSt8F0sRr3FjHqTRLVP
         iwm/0nzC2S3xUZrd/AVyoAYIa6BBrAaL9bk12s/FBdx1WwkIf2D5wHHqNj1I/hFatGdC
         ZLUw==
X-Forwarded-Encrypted: i=1; AJvYcCXIJKlyrr6XL3f5+eDt/cbXeFVBKMq1/+Tq/D/XX/tKOQiXns7EcAW4QyHGWc9/A+2kC2ttU+VdWBRDlg5Bvdzd8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIjmV+vEAzaVhBvk+fKWkcT8BmQQzbFnvJqPkYY/KKiLSztKR
	7z+oGOytunUM/XIFMHYUbXs8DMak3DgmB4H6rMZzNOkxx5UFpR276y0nlNA7qUk=
X-Gm-Gg: ASbGncuSWtvn5LLvzQnUPRzzKxObc7HkdwWgTYciUiF0+oIdX7+gYS8t54NPJid0zYQ
	b/FIIldwwz+/7G4DqJT3M2/QapZpN9gvqam7/yrIlAi5ow8gIk0mdrPh6KOydMsNaK6gFNEkMt5
	gsEay5cuZxE24PBaauVGo0g1NNykB2AZeDRo8vOhkhFLpGnic19ACiiZexDNDihz3z3FiTy8Cfc
	aIyb6kypNt8fvHURhA/u+B3OcdQyeMwQL8K6I8JPIQ+VL0N6+sLjdfncQjLxvan/cb85HU9BGaN
	UQ55hRQcjE2WSHua6Bneq/PNux70bMRp2jZE45dcCC3uDFgFREbULY0A
X-Google-Smtp-Source: AGHT+IH5Ij+fmf2Cv6jAlPmeJCCy1hd8btt4BuhHv/bD/os6ByinB+7Aq8sAGgjUE/8mRPndj8Zo0g==
X-Received: by 2002:a05:6402:2708:b0:5f0:9eb3:8e71 with SMTP id 4fb4d7f45d1cf-5f0b3e34eafmr2516192a12.27.1743768287658;
        Fri, 04 Apr 2025 05:04:47 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:e124:1321:48a4:8c63])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a458csm2276353a12.69.2025.04.04.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:04:47 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:04:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/19] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
Message-ID: <Z-_K2XDEcbtcCMVM@linaro.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org>

On Thu, Apr 03, 2025 at 09:59:27PM -0500, Rob Herring (Arm) wrote:
> The "qcom,acc" and "qcom,saw" properties aren't valid with "spin-table"
> enable-method nor are they used on 64-bit kernels, so they can be
> dropped.
> 

The bootloader we currently use on these devices reads these properties
to set up the spin-table, so removing these will break booting secondary
CPU cores.

The motivation for implementing it that way was that 32-bit vs 64-bit
kernel shouldn't be relevant for the describing the hardware blocks in
the device tree. The code in the bootloader is generic and handles
different SoCs (e.g. msm8916 with 4 cores and msm8939 with 8 cores, the
enable sequences are identical).

Can we keep this in somehow? To be fair, I'm not sure what property we
could match on to check if these properties are allowed ...

Thanks,
Stephan

> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 7cd5660de1b3..36f2ba3fb81c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -46,10 +46,9 @@ cpu0: cpu@100 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x100>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc0>;
> -			qcom,saw = <&saw0>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -64,10 +63,9 @@ cpu1: cpu@101 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x101>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc1>;
> -			qcom,saw = <&saw1>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -77,10 +75,9 @@ cpu2: cpu@102 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x102>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc2>;
> -			qcom,saw = <&saw2>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -90,10 +87,9 @@ cpu3: cpu@103 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x103>;
>  			next-level-cache = <&l2_1>;
> -			qcom,acc = <&acc3>;
> -			qcom,saw = <&saw3>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs1_mbox>;
>  			#cooling-cells = <2>;
> @@ -103,9 +99,8 @@ cpu4: cpu@0 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x0>;
> -			qcom,acc = <&acc4>;
> -			qcom,saw = <&saw4>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -121,10 +116,9 @@ cpu5: cpu@1 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x1>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc5>;
> -			qcom,saw = <&saw5>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -134,10 +128,9 @@ cpu6: cpu@2 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x2>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc6>;
> -			qcom,saw = <&saw6>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> @@ -147,10 +140,9 @@ cpu7: cpu@3 {
>  			compatible = "arm,cortex-a53";
>  			device_type = "cpu";
>  			enable-method = "spin-table";
> +			cpu-release-addr = /bits/ 64 <0>;
>  			reg = <0x3>;
>  			next-level-cache = <&l2_0>;
> -			qcom,acc = <&acc7>;
> -			qcom,saw = <&saw7>;
>  			cpu-idle-states = <&cpu_sleep_0>;
>  			clocks = <&apcs0_mbox>;
>  			#cooling-cells = <2>;
> 
> -- 
> 2.47.2
> 

