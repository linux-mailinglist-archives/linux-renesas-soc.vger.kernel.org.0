Return-Path: <linux-renesas-soc+bounces-22016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FEB83F30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD2E173938
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73F1235345;
	Thu, 18 Sep 2025 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqyH4rWB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762CC1E505;
	Thu, 18 Sep 2025 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189690; cv=none; b=eqDb1V/zAfFAgKMoozexNY5dvA5sLWyPAdbgKflvQjWkZgpL/Gfq0z5twbrnOWZqi3gKbNUTPcbr2nMqunJE6RGQsWBotZ0rXY/ad4skBbieS7w6ciBXmhDdvQojJjOHf6NyPc8a3Oza1gjG8CvLH7IIjcIHFVnkz/aHfm9eF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189690; c=relaxed/simple;
	bh=xZIRfI5Um819Cxzoa75KMsq+fWpcyT2KDlvZiPVOiiU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZVrrSHBeUepe1Bqgl1kGfwGioPZ4E3dsFMF8EE7KneB9QbdLP7C04OspvxwnoiBtaMlR6B7e60WARX20Uf94XVbK8AcVOeiWoj3KYA8QRL4uIW2XMCPaW+oJVCUm1RXevaA2uORo2JgnquTblYauPzZW1Mr7UBynxmWGxXlHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqyH4rWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0047C4CEF1;
	Thu, 18 Sep 2025 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758189690;
	bh=xZIRfI5Um819Cxzoa75KMsq+fWpcyT2KDlvZiPVOiiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iqyH4rWBACtteGABcOGNiyBIAuNLVlMjDqz93gMllRoyEaHqc4GAoQegOlcSQdf1N
	 q3+gi3nKLgiQDGk0bR+i8gYfGVL0InJNqKjSEi7pxatS2kI75ZCkrgwZT2jsN1VVS+
	 4GgYZfZr3ug+5THIDsm7gHLF9+NGrMWVHdIcyt8phzFONPlzsOiFLK32tLqskCr1H/
	 Cf6k1wNNTq5qIqMQs7zsAaNdTtH5G8R/MeJdwEN+SNCmHAV59XNgpLmD5fLImRAEBy
	 OQSR8FsPRXIOpFqzfJGvNcMRIsGVUAaorG4dr88Oalj1p6dY+a1qX47MgLUuC84UFE
	 vUCnO3jaRHubA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzBSB-00000007Nkh-1YoN;
	Thu, 18 Sep 2025 10:01:27 +0000
Date: Thu, 18 Sep 2025 11:01:26 +0100
Message-ID: <86ikhg13m1.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
	<87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
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
X-SA-Exim-Rcpt-To: kuninori.morimoto.gx@renesas.com, kan.liang@linux.intel.com, adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, acme@kernel.org, catalin.marinas@arm.com, conor+dt@kernel.org, dianders@chromium.org, geert+renesas@glider.be, irogers@google.com, mingo@redhat.com, james.clark@linaro.org, jolsa@kernel.org, john.g.garry@oracle.com, krzk+dt@kernel.org, leo.yan@linux.dev, lpieralisi@kernel.org, mark.rutland@arm.com, mike.leach@linaro.org, namhyung@kernel.org, oliver.upton@linux.dev, peterz@infradead.org, robh@kernel.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

3rd resend in a matter of hours -- how about slowing down?

Also, dropping Shameer's bouncing email address from Cc. Surely you
can fix your (enormous, and pretty random) Cc list?

On Thu, 18 Sep 2025 07:27:26 +0100,
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
>

[...]

> +		/*
> +		 * The ARM GIC-720AE - View 1
> +		 *
> +		 * see
> +		 *	r19uh0244ej0052-r-carx5h.pdf
> +		 *	- attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> +		 *	 - sheet [RT]
> +		 *	  - line 619
> +		 */
> +		gic: interrupt-controller@39000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0 0x39000000 0 0x20000>,
> +			      <0 0x39080000 0 0x800000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};

I already asked for:

- this comment to be dropped, as it serves zero purpose to the common
  mortal

- the ITS to be described. The HW has it, it has no dependency on
  anything else, so there is no reason to omit it.

So I'd suggest you slow down, and take the comments reviewers give you
into account.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

