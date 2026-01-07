Return-Path: <linux-renesas-soc+bounces-26356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E0CFFABB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 20:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6F4343F2AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 18:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A94D331A41;
	Wed,  7 Jan 2026 15:12:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABF3321A6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798759; cv=none; b=Ugdc5EPCOu1YTtBPcVH5WqFsz4MGaycyNSCQNyDhId5AQjdwTEDuLxhhTRbQuRhHs7B7AZHGq46Py6VMAShVn7SV56/3Lij7oOLyRLuL4Uixl7+FcxjzLft3jauaq6vCdOxaRniB1PcZm3gqFsOZkNsMdNR1VFjp2yV94U/YUfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798759; c=relaxed/simple;
	bh=lQH1FRm/rJzskVoeclFFS2ftwdSJglbw9Ah8hTk5DQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOyLJnpDgeHgR2wC88IciZi6IlgQRn/bSLUwx2fYNaujyOK0S13Lo/RXYRO0R9XwtFjAMwcW/2xcakfJy+/OrLgNxvfOqu+u8mAFT+Sz5I1y45GPVZshgsUeHlC4xYlnLUe5J2kKsoVu1MBAFDS6+TF4IzkFtejSQZF/B/tfNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so860785137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798757; x=1768403557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTnh7CkZFGGtUC43ryOTlC9N4pV7qcvjxYMPMpt68WY=;
        b=lrVijrYDhWQa2tka5yPQJbtzWCGCgulgMnb/FUdxXsPoJ73n26zREwbOV92CGF/+V7
         19Y40SHHHVm7gUOSDfKYxNeCtWgZPm4f5i5E3wb+5PY5HZ4k/2Uf2ySlp8XZGjwpOMan
         xP47xBaGiN63Uy2DmdJgdriBu7TzDqUrE90w/g1ZmLeHJcOCvpINPiG74CFM/31qKICD
         qhLho1+xkiBKd78+Wpo/DyRe9O0n/TwF107hizcaD8Vo7MGGKrVnwwM2zBF9f5m3nDzm
         jAfKDVSebrw1syg1B1Ua+Z2i9mb9goFi1mwGdgsx6Gx3w52XCbR/n6O8gsY+93BaFPo1
         pEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuN1KN7FQ5wdjHJua1AEff+XBrtISCMcaLvoBBeVwjv8L5ne5zf3s2Vlwzc7A1v1lcql4JxVlPouzJ7Lu4nNTMxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+2TbFekcmC1CqpxGzbKnB6BXL8JZa6ccz45sdxFTHZ0p5fYzO
	CVMU73l6Y4WhwgLnT3Sm79quy0jWkWGwjnIlVIeeeslsQZYHRtB7hcvWwOy78g7i
X-Gm-Gg: AY/fxX7kzQew96kULT98zQBJnkEc+2eMWrImruQa7A3vLLqcyEqJtPULb6/VBFsHOrI
	XXce/kKSaFvAiRTi5TxXyLxCa8OSZrJMcs021m2WL2/XUIyQO15iupUD1iJKA+0kWqrQJvjxR3Q
	RaCHdmObkEmfkcGa5ChTcVR+dMuVYb6hyX1gpFBkFArCK9KlsYKlFLtvWscT5F3SS4qQ5jjb1yT
	95jfR8AVMlic5B8JQ+XS4y/9zhfG64Xzd74V/0Ore5JxeEGnLCWsbzI0LDzb9IxadrFLsGszV7w
	0GeRB7khDsA0MJTzjWZ7fYIRp6X+3o/sz5UH7WAOmzyL1sTEN+Y+rkHOGiUyhpY7pC9lAs5zBgG
	jXrw2hPkW5xeBbuUhrSXM3kCbKH3KSwp6MclaS7O0DME3Mam1oSSTXRcH8yQZ4UBv+Evaez+hrI
	UGpcQ01jkKuGme5FbSw8ykoIj+Gk61kttYMub9ozWXtTOuLFUN
X-Google-Smtp-Source: AGHT+IGqjVukrznEG3FghaJjjoUkuhMV9nB9a5iCz4vC+CRSff96OAiKEGwvpDs4KFbm/Ktx2vXgZA==
X-Received: by 2002:a05:6102:334f:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5ecb688c1a6mr873262137.17.1767798757094;
        Wed, 07 Jan 2026 07:12:37 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm3162067137.11.2026.01.07.07.12.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:12:36 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so860764137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt37p2WTCmEM0ZhUYB93Kg1eG0slatEKljOKuAbYmhxLNycPrFTj2uBVmeTlEo521cxt1wwg2nunxYJT9c7Pq43g==@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5ecb688e212mr1021167137.18.1767798755697; Wed, 07 Jan 2026
 07:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9CnVBybm5ipadp5MeUZTfG0GrBXLNmV2A3sOq7s87VA@mail.gmail.com>
X-Gm-Features: AQt7F2oy55RsF88MDpvy-XJ8ZxqntDCnKvwZjjY1H7FzCraTsk4lAgUrlROdqFc
Message-ID: <CAMuHMdV9CnVBybm5ipadp5MeUZTfG0GrBXLNmV2A3sOq7s87VA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a09g077: Add CANFD clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a CANFD
> peripheral which has three input clocks PCLKM (peripheral clock),
> PCLKH (RAM clock) and PCLKCAN (CANFD clock).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -251,6 +261,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
>         DEF_MOD("adc1", 207, R9A09G077_CLK_PCLKH),
>         DEF_MOD("adc2", 225, R9A09G077_CLK_PCLKM),
>         DEF_MOD("tsu", 307, R9A09G077_CLK_PCLKL),
> +       DEF_MOD("canfd", 310, R9A09G077_CLK_PCLKM),

The documentation is a bit confusing (it states that PCLKCAN is the
peripheral module clock for CANFD), but after some more digging,
PCLKM seems to be correct here.

>         DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
>         DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
>         DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

