Return-Path: <linux-renesas-soc+bounces-26907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBFD2EABA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B504309B91E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 09:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386323164B6;
	Fri, 16 Jan 2026 09:19:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3622578D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555150; cv=none; b=qDm7Q23W9lKt9etaVN4PBUOCBxQJzK6DagYTmY7RMfNEZKI+ty+ThJHUh9w64aGVa2u8zb8uOj4dYMvygYcM3JdqVzOcRYVxH2W2ao+k2vtLqvDw+6nr+hlVA7f32ANbTM1YNFarW4OIwEz9a14B6dzNMDt1wFwFOlitVgDV45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555150; c=relaxed/simple;
	bh=adQ7kRR/hOR8vS5q2nkrEXnEC+zF11Zil7OX1SmuyTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQV539FNJCIEnyVEMnUN61rBUSW+f9oO/d4kpl2KzmYlKpCGZv0O6sjM64xtVt/20k0ke2D0cMflfuYAvegCSZf3irsyKQkNUIproJPCOOFWfcMe/CowwlG1QH+MPOLvqXDXU9lImkbFTv8dAwMy9uoGON3/uX51fUca92lfecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so432888766b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555147; x=1769159947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fAWD8ppvWG1L3aS+Ni46WWzgwRQSiQawC+eewqOXMM=;
        b=ko+75VN7Bwgtj84jrn1/OG5wdGmk9VfqQLSEcInRjW1pRYBmTfwaLCS0PG6aIM3VQE
         uBi6e3Rwe604Rr9bGxvDESa4kH8+qj0jCDYp+eg7dOgiYCXHOxRuK/BKQLgaC47YYDGe
         o1hZ61onyMOkMo7/bsh5hVPqLN+LckL3Fnxe9tofP8oh2RZyGn7Od3kxF1CcCapK/YhS
         KG6KZCNkh891gZou073yGQ08hy+k7u8D1sMwqY+3RCfWf1kAlAttqIVeNpo/wHjUp5Uw
         4+hEsKccK6h+aMeqY8opOv69BWIhwvZgdPUYuW0u4PlgSq8HVtS936qvs1pnG6y+eKk5
         jLWg==
X-Forwarded-Encrypted: i=1; AJvYcCUhIEVUhAEnEPZCUbIDFXHuGaPvfonZFdzwvZzuH9+fEzAIRiENl4p6EP3ji4BJ4Nh7/rYQNxH6L4XplCsJ7MTAsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXncMT47eLeT5sjFLgGWVmU1YdM+CpMNGSxXJzirWzNHqhKyxG
	a6a89cxpQcY5g6Un7Ahw9LQWv797sUUb/vjcChK9BcCq2JUABsnCFc9Dsn3RZimS81g=
X-Gm-Gg: AY/fxX7S6qhw6SQ0dF1pDE7yXkWv3zUdHtkiNy7JRc5XI0+fTllBffIPjsqKBm6JAPL
	bKT8yblvqM9i9KgtJ903qXhUOSpidufa5gtJqK2okyDt0LDS/npIe+oJThyaPZZAjJBj+XVX1DA
	A8hoODSRfo1RfL6gPEnul5J+5InV8EYLYg6vximysvvYy9R05VfsNX/N8DgkgOdEvQm1zB51sQu
	6SUKabxkMbvkNZCXOp2Xc4RskGA26VHibvO5Ziszjj2j3PZOPNA5ca3+SNjqxnrvSODkAiMh9UD
	jlApqE7OzFkM7I1irhjZI0VlYvT8FgegmIgl4XyDbEQR0SLNrbsxfhDN7Eky2RXjNMGtSDTGBpY
	hilFjkU2mPAdJjziZHtHFc4fkeQlU/zDie752OaG9BnUIN9U/0A+vsyqJTCg6lD5/HK0IZq3aHA
	uOeRUUA3YBzUbiny4jlUnwlbtfHf9dJaTMRfikpPICUoIwEPxs2JBtsJaHW28=
X-Received: by 2002:a17:907:3e8a:b0:b87:6d6b:1366 with SMTP id a640c23a62f3a-b87930169c0mr210067766b.41.1768555146513;
        Fri, 16 Jan 2026 01:19:06 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm178375866b.54.2026.01.16.01.19.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:19:05 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so3584949a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTe32SvBiN4IyztZyFxYkAuSHJcVrJg3xpaG/IGxrBG7onK+tUyj9EzIHzAGyJvvFFK28lf0tdrYBJpfB2ZUo3hg==@vger.kernel.org
X-Received: by 2002:a17:907:9454:b0:b73:8b79:a31a with SMTP id
 a640c23a62f3a-b8792ddad96mr210546566b.16.1768555145608; Fri, 16 Jan 2026
 01:19:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com> <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 10:18:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
X-Gm-Features: AZwV_QjnMR0z1U9X8PF-mj2vaxUL5fQhBMQoJnoEgWxMLhhMV_w20Nq1yc7r5Cw
Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -556,17 +579,114 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +/*
> + * VCO-->[POSTDIV1,2]--FOUTPOSTDIV--------------->|
> + *                          |                     |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
> + *                          |-->[1/2]--FOUT1PH0-->|
> + *                          |
> + *                          |------->[1/16]--------------------------------> hsclk (MIPI-PHY)
> + */
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
> -       unsigned long foutpostdiv_rate, foutvco_rate;
> +       const u32 extal_hz = EXTAL_FREQ_IN_MEGA_HZ * MEGA;
> +       unsigned long foutpostdiv_rate;
> +       unsigned int a, b, odd;
> +       unsigned long hsclk;
> +       u8 dsi_div_ab_calc;
> +       u64 foutvco_rate;

As foutvco_rate is changed to u64...

> +clk_valid:
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
                                             (params->pl5_intin << 24)
+ params->pl5_fracin),
                                 params->pl5_refdiv) >> 24;
          foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
                                               params->pl5_postdiv1 *
params->pl5_postdiv2);

... this division needs to be updated to DIV_U64_ROUND_CLOSEST,
to fix build failures on 32-bit, as reported by the kernel test robot.
I will fold in the fix.

          return foutpostdiv_rate;

   }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

