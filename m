Return-Path: <linux-renesas-soc+bounces-21912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6BB59400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45D907A2C14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF662C11FB;
	Tue, 16 Sep 2025 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBAakvcC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F246E2C0F90;
	Tue, 16 Sep 2025 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019523; cv=none; b=CjWc0ShZjXmF9zW7l7v5TNifJwVexD86N61hCzVDMvJkS1UcsHcM4jnFfZ69kmNrocchFmG2SHI30AuqFpbpmlExl54o7/V+yJLt1ePPl8sJ4LJIFihnIVXSozPcH2yEFfsN9p/mXSetDednzrK4/i6IEZrT/GleTci2HnLO6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019523; c=relaxed/simple;
	bh=DoMHpv5hxCJ6SlceuYF08FYrofkwsQdeayNjraFmhEk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osTBeh+w/r+NfB8sDDiufQ9O1Uzp2IvBM/NT3t8KgYboDfKG4PfjdEi0UkuzHXkwK6gcPd89ipaFWqLIpIpjTU8k6pZA+BkkSSbD38ynmphudbIJItsAjPZwvRvB/3r4IPkjrFCmPCHJxDh7Ee6i9GAkUrcF2UeoCGh78/lHyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBAakvcC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A44C4CEEB;
	Tue, 16 Sep 2025 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758019522;
	bh=DoMHpv5hxCJ6SlceuYF08FYrofkwsQdeayNjraFmhEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gBAakvcCjgq2oS3wsInghchTT5cKoQBzEpqDxdVrrJv3e+T8RhSL4J2TBAd0OxPT7
	 3OiXl013/Q0H535qAqag0FEXrMVd755U/yZlQpP4zABcyMxLli2mewsbt3usQpcZ+8
	 n0VJztfRgxVnxMfZyi6WmggeeX5PjRYrl6iF63/CLunfzKUN4IB0QO1QGHGc091FqW
	 3+gYhafBzZwtaoZOvjUfnt4TCDk3ZWYEPv/jzgFdR4XoOrT0jn+9BGXyA3IwfFkY5F
	 rIA70kVHxfcLZhbqVokDi6DjynHgMBC2F5yU6quyS/ODIVJ0W8s1m8g9aV5lCt0Hrx
	 ZdwZRGIp7nUnQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyTBX-00000006gRs-2dkS;
	Tue, 16 Sep 2025 10:45:19 +0000
Date: Tue, 16 Sep 2025 11:45:15 +0100
Message-ID: <86v7li1xs4.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,	Adrian Hunter <adrian.hunter@intel.com>,	Alexander Shishkin <alexander.shishkin@linux.intel.com>,	Arnaldo Carvalho de Melo <acme@kernel.org>,	Catalin Marinas <catalin.marinas@arm.com>,	Conor Dooley <conor+dt@kernel.org>,	Douglas Anderson <dianders@chromium.org>,	Geert Uytterhoeven <geert+renesas@glider.be>,	Ian Rogers <irogers@google.com>,	Ingo Molnar <mingo@redhat.com>,	James Clark <james.clark@linaro.org>,	Jiri Olsa <jolsa@kernel.org>,	John Garry <john.g.garry@oracle.com>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Leo Yan <leo.yan@linux.dev>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Mark Rutland <mark.rutland@arm.com>,	Mike Leach <mike.leach@linaro.org>,	Namhyung Kim <namhyung@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,	Peter Zijlstra <peterz@infradead.org>,	Rob Herring <robh@kernel.org>,	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,	Will Deacon <will@kernel.org>,	devicetree@vger.kernel.org,	linux-arm-kernel@lists.
 infradead.org,	linux-perf-users@vger.kernel.org,	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
	<87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kuninori.morimoto.gx@renesas.com, kan.liang@linux.intel.com, adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, acme@kernel.org, catalin.marinas@arm.com, conor+dt@kernel.org, dianders@chromium.org, geert+renesas@glider.be, irogers@google.com, mingo@redhat.com, james.clark@linaro.org, jolsa@kernel.org, john.g.garry@oracle.com, krzk+dt@kernel.org, leo.yan@linux.dev, lpieralisi@kernel.org, mark.rutland@arm.com, mike.leach@linaro.org, namhyung@kernel.org, oliver.upton@linux.dev, peterz@infradead.org, robh@kernel.org, shameerali.kolothum.thodi@huawei.com, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Tue, 16 Sep 2025 03:38:47 +0100,
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> 
> From: Hai Pham <hai.pham.ud@renesas.com>
> 
> Add initial DT support for R8A78000 (R-Car X5H) SoC.
> 
> [Kuninori: tidyup for upstreaming]
> 
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi | 756 ++++++++++++++++++++++
>  1 file changed, 756 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> new file mode 100644
> index 0000000000000..82e27ce39c127
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi

[...]

> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&gic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		prr: chipid@189e0044 {
> +			compatible = "renesas,prr";
> +			reg = <0 0x189e0044 0 4>;
> +		};
> +
> +		/*
> +		 * The ARM GIC-720AE - View 1
> +		 *
> +		 * see
> +		 *	r19uh0244ej0052-r-carx5h.pdf
> +		 *	- attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> +		 *	 - sheet [RT]
> +		 *	  - line 619

Are these documents publicly available? If not, I don't think this
helps much.

> +		 */
> +		gic: interrupt-controller@39000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0 0x39000000 0 0x20000>, // GICD
> +			      <0 0x39080000 0 0x40000>; // GICR

In v2, you indicated that your GIC was configured for GICv4.1, which
implied 256kB frames for each redistributor. Here, you have either
just enough space for 32 RDs for a GICv3, or 16 RDs for GICv4.

So either this is wrong, and you're missing half of the RD space, or
v2 was wrong. Which one is it?

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

No ITS? That seems... surprising.

> +		};

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
> +				  "hyp-virt";
> +	};

Why use interrupts-extended here? Everywhere else, you're using the
basic interrupt specifier. Can't you move the interrupt-parent
property to the top and simplify the timer (and everything else
outside of the 'soc' node?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

