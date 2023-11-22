Return-Path: <linux-renesas-soc+bounces-161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA27F525E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 22:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A226A1C20B08
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994C21BDE3;
	Wed, 22 Nov 2023 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eniAnwuR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA51A590;
	Wed, 22 Nov 2023 21:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9A6C43395;
	Wed, 22 Nov 2023 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687685;
	bh=AdLucksemJuNek6Q2mYTXAkYIMbYexxotameJ9QABko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eniAnwuRxcfrtO+5FXPi7U/gy0Q4Gbg+Wn8Q9WJRpf5IEfdeUI9uiRcKtgWd1UrYk
	 sFXK6Y1lbQ6hSRJtK+tUi5YTpCX8BLFVnIxI8N9gw9yx18dcztECxsqtvkoOG/pRhG
	 rU7IaYLnMxdkiZKYhg/wZWYV+3+t1TsayR6pnOmQn7n9lI+uG8jfSyRi+eee/7NU3S
	 UTWu/G9247A0tyU++WddY9FcvlnaK2hGFwDCiVfjFxcXV/j5+kqrARX742bbXC4pEX
	 7op2lIl8LsU/H8wI69JPLBHy+5bgWVD1KqlKhA4rmZWKmvUSU9diGbTM5MQIpor7g3
	 HWbd6PXRCZHhQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a0064353af8so259876166b.0;
        Wed, 22 Nov 2023 13:14:44 -0800 (PST)
X-Gm-Message-State: AOJu0YyBJDYvB7IAWAT/BDjVzr68Xz7he3Ajq1sA2r/SWqEnpraMWGAb
	Z3q4r345m3ZFs5oHYYYLJ44YlGrD93wnKxTJYvc=
X-Google-Smtp-Source: AGHT+IGIAQGj/hNQ0yottVsGW32nM9K4Wad//z6CZkRNPSM4tQ2oBX2Rax3OWYHQw9MprWovLzjIL1OmqUf1i6gr5yE=
X-Received: by 2002:a17:906:b218:b0:a04:98ef:c73c with SMTP id
 p24-20020a170906b21800b00a0498efc73cmr600541ejz.23.1700687683439; Wed, 22 Nov
 2023 13:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-10-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-10-peterlin@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Nov 2023 05:14:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Message-ID: <CAJF2gTSMe-yfzKfX92eWhBnJ_WwoYQu7_7fsOQuNqXdafHA1dg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension description
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, heiko@sntech.de, irogers@google.com, 
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com, 
	mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com, 
	namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org, 
	sunilvl@ventanamicro.com, tglx@linutronix.de, tim609@andestech.com, 
	uwu@icenowy.me, wens@csie.org, will@kernel.org, ycliang@andestech.com, 
	inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 8:17=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..694efaea8fce 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
>
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w. For more
> +            details, see the chapter 12 in the Xuantie C906 user manual.
> +            https://github.com/T-head-Semi/openc906/tree/main/doc
> +
>  additionalProperties: true
>  ...
> --
> 2.34.1
>
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

