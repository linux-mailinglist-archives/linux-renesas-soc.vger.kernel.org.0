Return-Path: <linux-renesas-soc+bounces-35062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7hjcNWcSUWol/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:40:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C948073C58B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:40:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E10A23004414
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71D742E8FE;
	Fri, 10 Jul 2026 15:39:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1615434400
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:39:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697986; cv=none; b=t2TINaiJGDZkb75LoNjq7vpjVqcVrcBxaFQ0NKfzKymuy3OM4ICRuRJwZw+aHNQKG1xRadcIutB0FHjyrLVmyBbQy8lqvgPJn5aBH3DtMEh7dMRUGa/VJ25f9LE+vTOlY1L/reM8Hl/tZNb+yIMrPB1WLTL9RDPP0DhvNhkIgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697986; c=relaxed/simple;
	bh=0GumBYdGvEGmWNIVyukyzbA8bnh4EvyrVFi/RBYDQv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKt17oM8bK2jnz2QfZclKNbnWO2KMAatAGPOsTgFRGgCnOMc/0gnobZSLrppyJNkRkgFxvKMtOzakDvvtspFvp9klyK7O9IzVWq4MIGgQAY/R4IcPzXv5Y9qyfjMn5qej4ZE2ly82l8FInMcS02Roct0leOKPgjlbiiqa5fSzj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so1746747e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697984; x=1784302784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUfdKlrcfziFncFCNGfjLhZP4//dSwnSq7iX3ryHglM=;
        b=Apor6zEMFtwtrveINfJPOLLLHhbGA4MpOsNu5BSkfmrrA8RwwmDl7RetxcbSoD4EaF
         +yDPaY2zY5fue4IpUi3l/LoKWr/ncGBw70b3KZtH68p5TgMImhgmgMZHwycZb1OqXz1H
         xDF4LQDis2loSuy/YgSS+dHNb1HBYlhTnUTWhSJDDmYHxXSF757VQ6OUHC3dlT6jy76T
         Hxhm0MDZlSAfyv1Yo+ZeDtTCKEi8U9n5suIc5YtFUiefuel99xrbH4WGVTS2IIGMtPJs
         9tpIq7SRW1sysCUtfs4VEXXGeaRrTYHPPgIuPc6yY5QUAmK3JNancdePwCy8mIKuhRVT
         nYiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6BcJGTLkEk9J6+tzFvhZE6eJI7pHqxr9i/0bNXxS29DiAiXBW8mZRLccaQWJyqxqDt+mIZjyVL3RbhJ62I1/x9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPtMfWqC2o3QRIHhfJh6VkJ/tt2PsYDyxCWXXMd5zmHY7ewVm6
	YSOwwtZ9K6FjrFhT1HuviOXj10k1kxwoGgqFKPUF05Xdq4UDKzjLXdRGjA9XBdlK
X-Gm-Gg: AfdE7cngv2L2lao0rb0UWH/0CsLa++Ysbdw6Yh7fz8yBNL2ATb/enGK5/0C0FjEXtBu
	T/94CM28Rkh6BAHmbM+jjAi3c1i1UMlHqf52W+/2ixZ+OAHVp2BVU7Wz6NhtYiB9DlfAezdXoQk
	l3sokhNPK7I/+yrPuSt6PPaRbICPzJApKs4CN48CoegtnhYDUQAd00TsxPQllbD0rWHjnRDo1+U
	ry4S4h+b+k0gG4MS9UCeoWSLIqEpPgrzcrGSdyEouizms+jzmBYTpuWkd/UgBwUyr54/8f/ib+M
	utuZtm9jFs6qsurb9oUCUggUf+jDemGCnRN+GFbD24WdWKoR1ekz61lMu2fGW1jHZF1rIWGOiDk
	fHEvkSsDplSfPdK8bYs3CyETLVI1uBazsXHUKrRyGs1C8kq0jL5MsTGSvoWt8/sc0YrFOSabHzT
	i/yScTvZXF6mdNWsvIOs4m39EviAHynNI3tEJZ+FeAhZrwyTh35A==
X-Received: by 2002:a05:6122:1d45:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5bfa4dfe0bdmr2164019e0c.0.1783697978609;
        Fri, 10 Jul 2026 08:39:38 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm5665206e0c.8.2026.07.10.08.39.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:39:37 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73a8ac9cd52so675900137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkU0tM7Dqy7lMt766q6ZQM+5WMIo0mm4YZvoIOKHfLJgxOfTR8PdaVrWPW3J/DD5m88gLNhfnaQ92vAfXw6nUKsA==@vger.kernel.org
X-Received: by 2002:a67:fb41:0:b0:744:e453:b1fb with SMTP id
 ada2fe7eead31-7450c76cb13mr1818734137.9.1783697977379; Fri, 10 Jul 2026
 08:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:39:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWyhy7_isRVuo7uG57nzJhb9un-sZFJjybOf1=o7LRKg@mail.gmail.com>
X-Gm-Features: AUfX_mwLuvYVM9CdKe09_2xXtumkNQOGuw6sG_1PbbUsmu5lgeQmBDnCMrQP6Ts
Message-ID: <CAMuHMdWWyhy7_isRVuo7uG57nzJhb9un-sZFJjybOf1=o7LRKg@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35062-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C948073C58B

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new fractional PLL clock type (CLK_TYPE_G3L_PLLDSI) for the RZ/G3L
> SoC's PLL7, which drives the DSI interface and requires a dedicated
> parameter calculation and programming sequence distinct from other PLLs i=
n
> the RZ/G2L family.
>
> PLL7 output frequency is determined by the formula:
>
>   Ffdco =3D (NIR + NFR / 4096) * (Fosc / MR)
>   Ffout =3D Ffdco / (1 << PR)
>
> where:
>   - Fosc =3D 24 MHz (oscillator input)
>   - PR in [0, 4]   (post divider, power-of-two)
>   - MR in [1, 12]  (input pre-divider)
>   - NIR in [56, 375], NFR in [0, 4095] (integer and fractional parts)
>
> The FDCO must fall within one of two valid ranges: 900=E2=80=932000 MHz
> (rangesel=3D0) or 2000=E2=80=933000 MHz (rangesel=3D1).
>
> The parameter search in rzg3l_dsi_get_pll_parameters_values() iterates
> over all valid (MR, PR) combinations, filtering by the required FPFD rang=
e
> of 8=E2=80=9316 MHz, then delegates to rzg3l_dsi_compute_pll_parameters()=
 to find
> the NIR/NFR pair that best approximates the requested rate. An exact matc=
h
> returns immediately; otherwise the combination with the smallest absolute
> frequency error is used.
>
> Computed parameters are cached in pll7_dsi_params within pll_clk to
> avoid redundant recalculation in determine_rate() when the requested
> rate has not changed.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!


> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -67,6 +67,10 @@
>  #define CPG_PLL_MON_OFFSET(x)          (CPG_PLL_STBY_OFFSET(x) + 0xc)
>  #define CPG_PLL_MON_LOCK               BIT(4)
>  #define CPG_PLL_MON_RESETB             BIT(0)
> +#define CPG_PLL_CLK1_VAL(p, m, ni, nf, sel)    (FIELD_PREP(GENMASK(28, 2=
6), p)  | \
> +                                                FIELD_PREP(GENMASK(25, 2=
2), m)  | \
> +                                                FIELD_PREP(GENMASK(21, 1=
3), ni) | \
> +                                                FIELD_PREP(GENMASK(12, 1=
), nf)  | (sel))

What about dropping CPG_PLL_CLK1_VAL(), defining

    #define CPG_PLL_CLK1_DIV_NF    GENMASK(12, 1)
    #define CPG_PLL_CLK1_DIV_NI    GENMASK(21, 13)
    ...

and using FIELD_PREP(CPG_PLL_CLK1_DIV_NF, ...) | ..." at all callsites?

>
>  #define RZG3L_SDIV_DIV_DSI_A_WEN       BIT(16)
>  #define RZG3L_SDIV_DIV_DSI_B_WEN       BIT(20)
> @@ -96,6 +100,26 @@
>  #define PLL5_HSCLK_MIN         10000000
>  #define PLL5_HSCLK_MAX         187500000
>
> +#define RZG3L_OSC_CLK                  (24 * MEGA)

This is the clock rate of the external crystal.
As this must be 24 MHz on RZ/G3L, I guess it is OK to use a define for that=
.

> +#define RZG3L_PLL7_FDCO_RANGE_0_MIN    (900 * MEGA)
> +#define RZG3L_PLL7_FDCO_RANGE_0_MAX    (2000 * MEGA)
> +#define RZG3L_PLL7_FDCO_RANGE_1_MIN    (2000 * MEGA)
> +#define RZG3L_PLL7_FDCO_RANGE_1_MAX    (3000ULL * MEGA)

I didn't check the ranges yet.
Do you need the 87 MHz upper limit of LVDS somewhere?

> +#define RZG3L_PLL7_PR_MIN              (0)
> +#define RZG3L_PLL7_PR_MAX              (4)
> +#define RZG3L_PLL7_MR_MIN              (0)
> +#define RZG3L_PLL7_MR_MAX              (11)
> +#define RZG3L_PLL7_NIR_MIN             (55)
> +#define RZG3L_PLL7_NIR_MAX             (374)
> +#define RZG3L_PLL7_NFR_MIN             (0)
> +#define RZG3L_PLL7_NFR_MAX             (4095)
> +#define RZG3L_PLL7_NR_MIN              (56250)  /* Multiplied value 56.2=
5 * 1000 */
> +#define RZG3L_PLL7_NR_MAX              (375000) /* Multiplied value 375 =
* 1000 */
> +#define RZG3L_PLL7_MULT_MIN            (293)    /* Multiplied value 0.29=
3 * 1000 */
> +#define RZG3L_PLL7_MULT_MAX            (375000) /* Multiplied value 375 =
* 1000 */
> +#define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
> +#define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw

> @@ -1368,6 +1402,196 @@ static const struct clk_ops rzg3l_cpg_pll_ops =3D=
 {
>         .recalc_rate =3D rzg3s_cpg_pll_clk_recalc_rate,
>  };
>
> +static inline bool
> +rzg3l_dsi_compute_pll_parameters(struct rzg3l_plldsi_parameters *pars,
> +                                struct rzg3l_plldsi_parameters *p,
> +                                struct rzg3l_plldsi_parameters *best,
> +                                u64 freq_millihz, u32 fpfd, u32 pr)
> +{
> +       for (p->nir =3D RZG3L_PLL7_NIR_MIN; p->nir <=3D RZG3L_PLL7_NIR_MA=
X; p->nir++) {
> +               u64 output_nir, output_nfr_range;
> +               s64 nfr, output_nfr;
> +               u64 fdco, output;
> +               u64 nr_div_mr_pr;
> +
> +               /*
> +                * The frequency generated by the PLL is calculated as fo=
llows:
> +                *
> +                * With:
> +                * Freq =3D Ffout =3D Ffdco / pr
> +                * input frequency(fstd) =3D 24MHz
> +                * fpfd =3D fstd / mr
> +                * nr =3D nir + nfr / 4096
> +                * Ffdco =3D nr * fpfd
> +                * Ffdco =3D (nir + (nfr / 4096)) * fpfd
> +                *
> +                * Freq can also be rewritten as:
> +                * Freq =3D Ffdco / pr
> +                *      =3D (nir * fpfd) / pr + ((nfr / 4096) * fpfd) / p=
r
> +                *      =3D output_nir + output_nfr
> +                *
> +                * Every parameter has been determined at this point, but=
 nfr.
> +                * Considering that:
> +                * 0 <=3D nfr <=3D 4095
> +                * Then:
> +                * 0 <=3D (nfr / 4096) < 1
> +                * Therefore:
> +                * 0 <=3D output_nfr < fpfd / pr
> +                */
> +
> +               /* Compute output nir component (in mHz) */
> +               output_nir =3D DIV_ROUND_CLOSEST_ULL((p->nir + 1) * 1ULL =
* fpfd * MILLI, pr);

The multiplication with 1ULL to force 64-bit looks a bit odd.
As p->nir is small, perhaps mul_u32_u32((p->nir + 1) * MILLI, fpfd)?

> +               /* Compute range for output nfr (in mHz) */
> +               output_nfr_range =3D DIV_ROUND_CLOSEST_ULL(fpfd * 1ULL * =
MILLI, pr);

mul_u32_u32(fpfd, MILLI)

> +               /* No point in continuing if we can't achieve the desired=
 frequency */
> +               if (freq_millihz < output_nir  || freq_millihz >=3D (outp=
ut_nir + output_nfr_range))
> +                       continue;
> +
> +               /*
> +                * Compute the nfr component
> +                *
> +                * Since:
> +                * Freq =3D output_nir + output_nfr
> +                * Then:
> +                * output_nfr =3D Freq - output_nir
> +                *            =3D ((nfr / 4096) * fpfd) / pr
> +                * Therefore:
> +                * nfr =3D (output_nfr * 4096 * pr) / fpfd
> +                */
> +               output_nfr =3D freq_millihz - output_nir;
> +               nfr =3D div64_s64(output_nfr * 4096ULL * pr, fpfd);

No need for the ULL
fpfd is u32, so div_s64 is overkill, and div_s64 is sufficient.

> +               nfr =3D DIV_S64_ROUND_CLOSEST(nfr, 1000);
> +
> +               /* Validate nfr value within allowed limits */
> +               if (nfr < RZG3L_PLL7_NFR_MIN || nfr > RZG3L_PLL7_NFR_MAX)
> +                       continue;
> +
> +               p->nfr =3D nfr;
> +
> +               /* Compute (Ffdco * 4096) */
> +               fdco =3D (((p->nir + 1) * 4096ULL) + p->nfr) * fpfd;

mul_u32_u32(p->nir + 1, 4096)

> +               if (fdco < (RZG3L_PLL7_FDCO_RANGE_0_MIN * 4096ULL) ||
> +                   fdco > (RZG3L_PLL7_FDCO_RANGE_1_MAX * 4096ULL))
> +                       continue;
> +
> +               if (fdco <=3D (RZG3L_PLL7_FDCO_RANGE_0_MAX * 4096ULL))
> +                       p->rangesel =3D 0;
> +               else
> +                       p->rangesel =3D 1;
> +
> +               /* compute the nr and magnify by 1000 */
> +               output =3D mul_u32_u32((p->nir + 1), 4096);

Please move this up, and use it in the calculation of fdco above.

> +               output +=3D p->nfr;
> +               output *=3D 1000;
> +               nr_div_mr_pr =3D output / 4096;

Open-coded 64-by-32 division, please use div_u64() instead.
Or >> 12.

mul_u64_add_u64_div_u64 (multiply, add, and divide) and
mul_u64_u32_shr (multiply and shift) might also be handy, somewhere...

> +               if (nr_div_mr_pr < RZG3L_PLL7_NR_MIN || nr_div_mr_pr > RZ=
G3L_PLL7_NR_MAX)
> +                       continue;
> +
> +               /* compute the magnified multipier =3D nr(magnified)/(mr =
*pr)  */
> +               nr_div_mr_pr /=3D (p->mr + 1) * pr;

Open-coded 64-by-32 division, please use div_u64() instead.

> +               if (nr_div_mr_pr < RZG3L_PLL7_MULT_MIN || nr_div_mr_pr > =
RZG3L_PLL7_MULT_MAX)
> +                       continue;
> +
> +               output *=3D RZG3L_OSC_CLK;
> +               output /=3D (p->mr + 1) * pr * 4096;

Open-coded 64-by-32 division. Or perhaps even 64-by-64?

> +
> +               p->error_millihz =3D freq_millihz - output;
> +               p->freq_millihz =3D output;
> +
> +               /* If an exact match is found, return immediately */
> +               if (p->error_millihz =3D=3D 0) {
> +                       *pars =3D *p;
> +                       return true;
> +               }
> +
> +               /* Update best match if error is smaller */
> +               if (abs(p->error_millihz) < abs(best->error_millihz))
> +                       *best =3D *p;
> +       }
> +
> +       return false;
> +}
> +

> +static const struct clk_ops rzg3l_cpg_plldsi_ops =3D {
> +       .recalc_rate =3D rzg3s_cpg_pll_clk_recalc_rate,
> +       .determine_rate =3D rzg3l_cpg_plldsi_determine_rate,
> +       .set_rate =3D rzg3l_cpg_plldsi_set_rate,
> +       .is_enabled =3D rzg3l_cpg_pll_clk_is_enabled,
> +       .enable =3D rzg3l_cpg_pll_clk_enable,
> +};

Basically this is rzg3l_cpg_pll_ops with .determine_rate() and
.set_rate() added.  Why can't you just add them to the existing
rzg3l_cpg_pll_ops, and use that for all PLLs? PLL7 doesn't seem that
different to me.

> +
>  static struct clk
>  *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>                                void *data)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

