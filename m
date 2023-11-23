Return-Path: <linux-renesas-soc+bounces-180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E86BE7F622D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 15:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C87281DD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD9026AF1;
	Thu, 23 Nov 2023 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="obSJa5Vo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5391ED41;
	Thu, 23 Nov 2023 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700751584; x=1732287584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EbumtQAp61xxtl1wFucMhCk0s7eSuM0PDcdqsk0vVXY=;
  b=obSJa5VoOIud2t1a1f3MKpv08+Ly8SjUSJ8d2VAfEy46y7XRUHkXzfz4
   hj1UwfrsUHyue0awmNsN8V3mnG2SCv27GCKA8zCZsGuAZGwMjcyoX++Uw
   pf/PAkEpruBu4XJbCgZdv3Q4a5zHSfLimE923xQQbkdEeUfyyjj0Kf+6z
   Ve2i4I5DqQ6OHlNykkAHgad7c3dnutImNvimxUwM5g+fgVtkoO43Vlro0
   KCrgf2WKuNqxDMZm0k07/39It7BEpR2Uec3n/xic/qXeZ28OMXxbu/bpg
   RFMjk/959mBSZ+HSfDfy71yUOmwRJqnNjx0DGXB99AUKb+USkV9leEMmm
   g==;
X-CSE-ConnectionGUID: dphmfmJ6QC2EtHTlf6BQfw==
X-CSE-MsgGUID: yYZjdC/+SzKEzWIlmXahFg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="12119561"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:59:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:59:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:59:23 -0700
Date: Thu, 23 Nov 2023 14:58:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
CC: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
	<alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
	<anup@brainfault.org>, <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<conor+dt@kernel.org>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<dminus@andestech.com>, <evan@rivosinc.com>, <geert+renesas@glider.be>,
	<guoren@kernel.org>, <heiko@sntech.de>, <irogers@google.com>,
	<jernej.skrabec@gmail.com>, <jolsa@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
	<magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
	<n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <peterz@infradead.org>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <rdunlap@infradead.org>,
	<robh+dt@kernel.org>, <samuel@sholland.org>, <sunilvl@ventanamicro.com>,
	<tglx@linutronix.de>, <tim609@andestech.com>, <uwu@icenowy.me>,
	<wens@csie.org>, <will@kernel.org>, <ycliang@andestech.com>,
	<inochiama@outlook.com>
Subject: Re: [PATCH v4 11/13] riscv: dts: allwinner: Add T-Head PMU extension
Message-ID: <20231123-coping-revenue-be284a351c9d@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-12-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/5s3BqTCv3O//+Ke"
Content-Disposition: inline
In-Reply-To: <20231122121235.827122-12-peterlin@andestech.com>

--/5s3BqTCv3O//+Ke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 08:12:33PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.

Allwinner aren't the only ones using T-Head CPUs that the previous
m*id pmu detection code would have matched on. I think the first three
files below will also need to be updated:

rg -l "thead,c[0-9]*\b[^-]" arch/riscv/boot/dts/
arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
arch/riscv/boot/dts/sophgo/cv1800b.dtsi
arch/riscv/boot/dts/thead/th1520.dtsi
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi

Cheers,
Conor.

--/5s3BqTCv3O//+Ke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9orwAKCRB4tDGHoIJi
0mywAQDLiZ7Dv/EbYy9xnbLn22k0W8jszlQjb/0c3Uj362SnMAD+NfU0XmNTf1e8
tbN33jbWPlia/s7ecfUt/OgqNf7XxAY=
=CJRs
-----END PGP SIGNATURE-----

--/5s3BqTCv3O//+Ke--

