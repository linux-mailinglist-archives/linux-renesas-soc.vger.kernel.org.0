Return-Path: <linux-renesas-soc+bounces-239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520047F770A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 15:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069672822AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 14:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6426AC8;
	Fri, 24 Nov 2023 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYAgDlSt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B909AD72;
	Fri, 24 Nov 2023 06:57:41 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b83c4c5aefso1200748b6e.1;
        Fri, 24 Nov 2023 06:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700837861; x=1701442661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=iYAgDlStmihvaAAHvkuY517osyQUEeXuPRxlxbpuIx6Jqc6qzTOBdMbBNgMAgOokDQ
         bE9+1Wba+KgixwrhJoeDGs7r3OSjA1J7UCR2seVBEW18VAO0CJmGLXhOuNwg/FwJdys6
         69tl+lx9LSSeVTSfhMAxUBc5SgWA+FzGj/yVuKXc/HDtGA84O5GrWpKXD54CTY2C8RPX
         wRjvzbhmiNXUcB1og0gspWRAC2u/8cxBk01zwLDxdOdauM/8+vtE4f6u+vi5TAzRHJrU
         RbbOqKRHLXN9HV7F+BAOBD/NHLA528OFGGhJHc2ngJn/kE9mlT2/Qmfknb2z0LLCsHy7
         QDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837861; x=1701442661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McONVnnVXBzrRAKYWOt6koN2Gq2PdEQz7Bj2evyzgvA=;
        b=UU0rRCrWkd9sPgFQvwfCrMMDUsmJOBRr7C6Tt7SEVqNm/Tq23QwGOmzKkAGqgkwoPa
         X7SualHbi94NeifXcDg0sp6blzlPz9fgMs3NBJfOxEBGgj+37CtJAT3jBkmAAc/e0gw7
         6t2ACvNtxB5paXzYCZStksIc1lGdJR9SqTy5Yd8GbFfW3tQMcTtVb1TggZweRSfi90+K
         qZfupPcUkQmUlbrQK/G1SVxUdK5McCE2OaWP64E4eNYcFJzc1r4L9HzHMsh1ldjMlLcC
         YnibFP1/enM+w/z7hKFG34TQf+6OxfNszE6WDzl4Dfh9fDHCTA2uayrtGRlokruUZLGi
         v2Vg==
X-Gm-Message-State: AOJu0Yx3q8Iv0+reFcNMUQjWY87i6mZAV5848CCYvn0LouamtYVcGFfW
	OSdBTPZLWApjBOBOMZBk7cDITbca2dwnO3okxBs=
X-Google-Smtp-Source: AGHT+IFyw54KdvX5NZtpjxNOebZ/DdQWx5nul4bTgzQLtaMiqrgW8bakiEzPtq/Ulcd5S/faM446P2Jo1/UeRTY/fHI=
X-Received: by 2002:a05:6358:9198:b0:16d:f02d:d394 with SMTP id
 j24-20020a056358919800b0016df02dd394mr2754632rwa.14.1700837860947; Fri, 24
 Nov 2023 06:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-2-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-2-peterlin@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 14:57:15 +0000
Message-ID: <CA+V-a8tS0hE_aDEk6RwhhjjEPP-OQpg1zuRbFrK7JdHtLCUTYA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] riscv: errata: Rename defines for Andes
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

On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Using "ANDES" rather than "ANDESTECH" to unify the naming
> convention with directory, file names, Kconfig options
> and other definitions.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes v1 -> v2:
>   - No change
> Changes v2 -> v3:
>   - Rewrote commit message (suggested by Conor)
> Changes v3 -> v4:
>   - Include Conor's Acked-by tag
> ---
>  arch/riscv/errata/andes/errata.c       | 10 +++++-----
>  arch/riscv/include/asm/errata_list.h   |  4 ++--
>  arch/riscv/include/asm/vendorid_list.h |  2 +-
>  arch/riscv/kernel/alternative.c        |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index 197db68cc8da..d2e1abcac967 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -18,9 +18,9 @@
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
>
> -#define ANDESTECH_AX45MP_MARCHID       0x8000000000008a45UL
> -#define ANDESTECH_AX45MP_MIMPID                0x500UL
> -#define ANDESTECH_SBI_EXT_ANDES                0x0900031E
> +#define ANDES_AX45MP_MARCHID           0x8000000000008a45UL
> +#define ANDES_AX45MP_MIMPID            0x500UL
> +#define ANDES_SBI_EXT_ANDES            0x0900031E
>
>  #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND       1
>
> @@ -32,7 +32,7 @@ static long ax45mp_iocp_sw_workaround(void)
>          * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is=
 missing and
>          * cache is controllable only then CMO will be applied to the pla=
tform.
>          */
> -       ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_=
WORKAROUND,
> +       ret =3D sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORK=
AROUND,
>                         0, 0, 0, 0, 0, 0);
>
>         return ret.error ? 0 : ret.value;
> @@ -43,7 +43,7 @@ static bool errata_probe_iocp(unsigned int stage, unsig=
ned long arch_id, unsigne
>         if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
>                 return false;
>
> -       if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=3D ANDESTECH=
_AX45MP_MIMPID)
> +       if (arch_id !=3D ANDES_AX45MP_MARCHID || impid !=3D ANDES_AX45MP_=
MIMPID)
>                 return false;
>
>         if (!ax45mp_iocp_sw_workaround())
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 83ed25e43553..4ed21a62158c 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -12,8 +12,8 @@
>  #include <asm/vendorid_list.h>
>
>  #ifdef CONFIG_ERRATA_ANDES
> -#define ERRATA_ANDESTECH_NO_IOCP       0
> -#define ERRATA_ANDESTECH_NUMBER                1
> +#define ERRATA_ANDES_NO_IOCP 0
> +#define ERRATA_ANDES_NUMBER 1
>  #endif
>
>  #ifdef CONFIG_ERRATA_SIFIVE
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index e55407ace0c3..2f2bb0c84f9a 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -5,7 +5,7 @@
>  #ifndef ASM_VENDOR_LIST_H
>  #define ASM_VENDOR_LIST_H
>
> -#define ANDESTECH_VENDOR_ID    0x31e
> +#define ANDES_VENDOR_ID                0x31e
>  #define SIFIVE_VENDOR_ID       0x489
>  #define THEAD_VENDOR_ID                0x5b7
>
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index 319a1da0358b..0128b161bfda 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -43,7 +43,7 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufact=
urer_info_t *cpu_mfr_info
>
>         switch (cpu_mfr_info->vendor_id) {
>  #ifdef CONFIG_ERRATA_ANDES
> -       case ANDESTECH_VENDOR_ID:
> +       case ANDES_VENDOR_ID:
>                 cpu_mfr_info->patch_func =3D andes_errata_patch_func;
>                 break;
>  #endif
> --
> 2.34.1
>
>

