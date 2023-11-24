Return-Path: <linux-renesas-soc+bounces-245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B477F7748
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 16:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD24282060
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 15:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D52E63C;
	Fri, 24 Nov 2023 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWA60m8G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039EE9E;
	Fri, 24 Nov 2023 07:08:20 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b5714439b3so1040490b6e.3;
        Fri, 24 Nov 2023 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700838499; x=1701443299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=JWA60m8GVHCmekGm5TrSzEdzMNxhDZMrBoumpJ/qvPdSuFxWwRhhDdpR840Op5eTM2
         Z/B3/rsFK/eIpYUADW3dA6jwQPM6zhw8xBG2ufcfILvQY6HleyLo/dq+aHdTJOM3kxfc
         KyWn7jk+nq+3cR4HRQXDPUbZkPLirXCxSHDF7DOKjh3ZLcz9fVbZ3R3yowdl3tqaA2x/
         j47EX143TK10KWviGFekz0RJWS55ZguvMrIgjGAQ3IgPcYpFstA7JGicWRKgY6ZqQ5vi
         kEPBxwHOIZu5KFPxpZ9/lgFSWwPfCdP+NzThvzDztKZw4bc5V4T63su3vXRCUgzABqw5
         yL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700838499; x=1701443299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqb6gmrOIr6APnQsTYHkPk1borpFhD009W5cTbT2h40=;
        b=uKU2EztxoZNlOuBfSJWOXcXvrbetMd42bUVmFEf9Sp3ig9qTbbsjHEzSRd3cJ3A3nS
         3avQ9ASjh2DWn7RAXpgC8NBWB1NWoJZ0RJZRJ/l0NysHpSzFh6Au8hgW9+t8nsu9Yxtc
         1uXjs3DjJ21LUBB0FU/EbSxCMkLIyc2CAixO5PyJe65KlGmtGBFjG2JQVf2VvJ2Qrn1w
         aVuOwv9YaC417ZnKvsfZU60rYa//Dtc1I8eYMYA8iXLmar3DE09WDWFTV8AkS5sekDVE
         3bIx3s5mIjJOVI8bvpfr08V3gwA97Jmu/s8lZp+OuPvV6b2s1InMJxSeaxf2TYYzimfV
         8gOg==
X-Gm-Message-State: AOJu0YxzUSIcGTI38H3557uVO8iJKWGFsHb5qd7GFRCvvNQ7uT1njWcb
	CJbom+m1jnKsS+bgZClT5HpqI4zmioACjfMCzbM=
X-Google-Smtp-Source: AGHT+IG77ETgp0DMV9KXOevkcc677tVxeO+ugYI4hI1PX92j15kxePilfPhpPcHEZVQAcN8ZK/GbSo2YogMF+v/oHCA=
X-Received: by 2002:a05:6358:998a:b0:168:e707:2e56 with SMTP id
 j10-20020a056358998a00b00168e7072e56mr2295754rwb.16.1700838499153; Fri, 24
 Nov 2023 07:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 15:07:53 +0000
Message-ID: <CA+V-a8swHt079fxZfzMnzr3w7MfKpLnceHU_p4zvU+6X-Po0zg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org, 
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com, 
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de, 
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, peterz@infradead.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org, 
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com, 
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me, wens@csie.org, 
	will@kernel.org, ycliang@andestech.com, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 12:19=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> Changes v2 -> v3:
>   - No change
> Changes v3 -> v4:
>   - No change
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boo=
t/dts/renesas/r9a07g043f.dtsi
> index 78072e80793d..5f2f2181638a 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -26,7 +26,7 @@ cpu0: cpu@0 {
>                         riscv,isa =3D "rv64imafdc";
>                         riscv,isa-base =3D "rv64i";
>                         riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> -                                              "zifencei", "zihpm";
> +                                              "zifencei", "zihpm", "xand=
espmu";
>                         mmu-type =3D "riscv,sv39";
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <0x40>;
> --
> 2.34.1
>
>

