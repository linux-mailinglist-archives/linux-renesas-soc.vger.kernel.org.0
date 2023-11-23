Return-Path: <linux-renesas-soc+bounces-179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66A7F6200
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 15:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E75E5B21709
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 14:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E160833CE7;
	Thu, 23 Nov 2023 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="patFbzNa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655A71702;
	Thu, 23 Nov 2023 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700750978; x=1732286978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m2nW/1LGl2QcBaiWsug9W+DfxO0d6D5rULUZW5FVoIc=;
  b=patFbzNaN+HMJ8n8YT6FHc7F5yw4r9luSaWB1jKB5Ucx5Cx483cZubyf
   Db6+rxOqwc3EIie0C1Z83+dsKOXo3et5KbJfpMnXzXlHalsHE97yyKcO8
   5XGcrRGTWD2ZawQozDubvm9m+X0vfIrxVP5ZtWfKL6tQEay1y/LZobMDe
   8FgJAaj/a3ybizYSgPWGNkzD0wzHCT8sm0aSx8rwnVIwtOv+3HPYWFdKR
   gX7LG3XjwoIeVcG3f9NdEqp/Vf59Kck73YZbK6pOy3fWKA0aP8LnXTXzO
   LS/6+n4rVlDlEwDJ16LvRipd15xEynX/X2vtbbyWArj/MXX/FIkwix/+y
   Q==;
X-CSE-ConnectionGUID: vFix+VS6R167bl20z2qAHg==
X-CSE-MsgGUID: XREYd5SfREaoPxmFZbFNwQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="179320751"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:49:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:48:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:48:48 -0700
Date: Thu, 23 Nov 2023 14:48:20 +0000
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
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231123-obscurity-copied-7a7bcc66d69d@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fR4tnML+siyABFnW"
Content-Disposition: inline
In-Reply-To: <20231122121235.827122-10-peterlin@andestech.com>

--fR4tnML+siyABFnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 08:12:31PM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..694efaea8fce 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w. For more
> +            details, see the chapter 12 in the Xuantie C906 user manual.
> +            https://github.com/T-head-Semi/openc906/tree/main/doc

I'm pretty sure that I asked on the previous revision for you to
identify a specific revision of this document.

Cheers,
Conor.

--fR4tnML+siyABFnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9mNAAKCRB4tDGHoIJi
0i3IAQCWwY2KygG9PG216qosb6qNvHpfqqlRDK3j837NZ9ZYcwD9F+crFMrFfbDL
Nhs4rUikhLgCdhfK3SG8kkfTQRWL7QM=
=yQh/
-----END PGP SIGNATURE-----

--fR4tnML+siyABFnW--

