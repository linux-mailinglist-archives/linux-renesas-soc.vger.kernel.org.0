Return-Path: <linux-renesas-soc+bounces-160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDC7F5256
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 22:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36191C20B7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 21:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F381C2A2;
	Wed, 22 Nov 2023 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sb2CFkvV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75641C28C;
	Wed, 22 Nov 2023 21:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4258CC433BF;
	Wed, 22 Nov 2023 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687583;
	bh=GuBVjZjV1gqDATE7AVDXVR6KbB06LDstoa1u5pJdd44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sb2CFkvVVYZXzOKMOH5EgfoH44/hh5lOLXw/8XpIpRRcBs3438ZP4qZwNBV6VgUt0
	 Ugm8EivgHtAgGie+ZZ1YLf8biVC40cXIejmrQk/Ux8zzfuocKyYNuNhxw+TzKtuB1O
	 oO66SFyRx1xp6ARG9adlEOp4W9wb6Cjj1IOltt8INourZq9xZiw+1gkdvIsAe2eJsE
	 xfvzOCQbDjt4JVmHrS4HzNqJe/C+ATyfBOQ8Nn5aUk47cRsP5sKfDJHv9+syvLP1iI
	 x3vCryPTt3wyel67HKW2rbGInsi5Uj1qC1sQtMoiVD/9RjsCCmuKnipvILIIgE4dJ9
	 3fjGVRs/7BNNg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a3b8b113so213240e87.0;
        Wed, 22 Nov 2023 13:13:03 -0800 (PST)
X-Gm-Message-State: AOJu0YwSd7R3ZbKMNTihRlFsUl0ZSfNne9FJryJ4BvfemFi29DSEjd+8
	NN19UB2DWapjMR9UTNsz06P5xblMQCoTyKwWrmA=
X-Google-Smtp-Source: AGHT+IHWayR4EGGb4sgKiVHICBmTJo1MuoDmYLHsEjt2qHT1ekKZfpyAiACfEC6paYV5C6+kwxlRbJ1dqBHcL71+PtA=
X-Received: by 2002:a19:ac0b:0:b0:500:be57:ce53 with SMTP id
 g11-20020a19ac0b000000b00500be57ce53mr2345053lfc.42.1700687581392; Wed, 22
 Nov 2023 13:13:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-12-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-12-peterlin@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Nov 2023 05:12:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQdksCizkEtiE_wFAJGpyVOEUz4k2aCHi6mQiWieaMEnQ@mail.gmail.com>
Message-ID: <CAJF2gTQdksCizkEtiE_wFAJGpyVOEUz4k2aCHi6mQiWieaMEnQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] riscv: dts: allwinner: Add T-Head PMU extension
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
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..7dcba86cfdd0 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,7 @@ cpu0: cpu@0 {
>                         riscv,isa =3D "rv64imafdc";
>                         riscv,isa-base =3D "rv64i";
>                         riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> -                                              "zifencei", "zihpm";
> +                                              "zifencei", "zihpm", "xthe=
adpmu";
Reviewed-by: Guo Ren <guoren@kernel.org>

>                         #cooling-cells =3D <2>;
>
>                         cpu0_intc: interrupt-controller {
> --
> 2.34.1
>


--=20
Best Regards
 Guo Ren

