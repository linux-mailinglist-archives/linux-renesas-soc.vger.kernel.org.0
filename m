Return-Path: <linux-renesas-soc+bounces-5658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F01D8D3A53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97C8D1F264D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0FC17BB33;
	Wed, 29 May 2024 15:09:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3226AEC;
	Wed, 29 May 2024 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995364; cv=none; b=har6xiWLWnuIxOwhSoPWUtzJqePRT5JGYJawbvmf5JmIJXCDv+L5AjdTrmRQ8/rdq4kkDHvh3aGC9JgVOYqY6nqEH1gtOSmDuhCrJVtSm7LbS9+Eqy+0ozGwAxCglJIQdQJx9CZ8FS272bRJVDerLT8pOIzrFaZejWRQIF8Srx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995364; c=relaxed/simple;
	bh=RTBxcYgQ7rjOc6Gkhe/RRGCrftwwUT7bJHg2aGCCz9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMq9eNGMt2M6gBxUs9L3jYnknOYS5k2fFIBAL7nxNN2KVf4h+EMHS2GWtpWfQWiNjJ8Va6fX0inXtvnWoYwk4Aph5aawB7/uYkAmFEdclEgwc7x/35tVxHM8lxi0435D0ephvYUF6Jh1tTl/9mzZKeyDdWCHjgaLGaRDYFm7pWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a083d7ee9so18722817b3.2;
        Wed, 29 May 2024 08:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995362; x=1717600162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jngc6cgYFS7KbKyVHuiIwWDll1sHitECLO7PKngIt4k=;
        b=J+C0SZ0dDr+gzt9sYf5TYbe8Um8/VolLpz5Rooqj2XIGAxu4+fqjUWMWT0ePpeyqCw
         3p9xqqinHNicm+FsJzli5ssIgUp9KR75sjx2pB/E/jWHQokVsDqKWkkd3FGc0fcRKBCZ
         3wNuw2k1mllVYoTAcLGROyLLFDMayoKSf6jIy+HN56CNQhC/nJMeYA9WcFHnDs5awFtH
         Z9HqqEq3w/reKVlvKqA+3aMuSIXH50qCZRc6ul+VCiu31KK5ad2ArSWrypvOX2tzu//M
         wOx3KbT8OD06FBlGVacoRR3ynNKjmVOhEqRkjE7Z3cc1unr1wIYXGwRlqJ/VO2DwbSTS
         jdIw==
X-Forwarded-Encrypted: i=1; AJvYcCVp5oUcu/NhxceFdfdqqvsqrPm2alpmrvWERmzW+vX9pGfjpZ9PB4EOzIdNtunfemitZs70H+4P3vp0cljVQ5KeiA2021fBZiFM
X-Gm-Message-State: AOJu0Yydaqz8a0rvzFtanKcZiM7QXH3PkuLxVjwIe51RGsDYJjDvLUqp
	/NQvEhkZDJqv2S6dvIIW/Og2SiKOI1hEYYgoibKFORvrWgvRO51TbTnBwuXq
X-Google-Smtp-Source: AGHT+IH/dbYsGlrq9F68ckYyb6Sj7DMlMm0c1LHsSsHP+pRK4FthlvHidEI+/WvBm+HDAiFH4JNLuA==
X-Received: by 2002:a0d:df86:0:b0:61e:a3b:e473 with SMTP id 00721157ae682-62a08dccc77mr211136417b3.7.1716995361934;
        Wed, 29 May 2024 08:09:21 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56fbe9sm24294247b3.143.2024.05.29.08.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:09:21 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-628c1f09f5cso20920997b3.1;
        Wed, 29 May 2024 08:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURT5UM/vNp/ywIrSJ5C+9Vx6yQ928ZvOJuVfmeNjSweVT5gbm7gvfcdQr5WxUa8KOtyHWDOwcAkxDgQlM23Uf4aNFUr9nXSosv
X-Received: by 2002:a25:83c4:0:b0:de6:1a66:3e4d with SMTP id
 3f1490d57ef6-df7722638bfmr17508639276.59.1716995361401; Wed, 29 May 2024
 08:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se> <20240527131541.1676525-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527131541.1676525-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 17:09:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaXhLruaPWBGbpzQds0y03t9UJ-NxEtvtKma-5-WwooQ@mail.gmail.com>
Message-ID: <CAMuHMdVaXhLruaPWBGbpzQds0y03t9UJ-NxEtvtKma-5-WwooQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a779h0: Add CSI-2 clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 27, 2024 at 3:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the CSI40 and CSI41 module clocks, which are used by the CSI-2
> interfaces on the Renesas R-Car V4M (R8A779H0) SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -176,6 +176,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
=3D {
>         DEF_MOD("avb0:rgmii0",  211,    R8A779H0_CLK_S0D8_HSC),
>         DEF_MOD("avb1:rgmii1",  212,    R8A779H0_CLK_S0D8_HSC),
>         DEF_MOD("avb2:rgmii2",  213,    R8A779H0_CLK_S0D8_HSC),
> +       DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> +       DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),

According to the documentation for the Module Stop Control Registers
3 and 4, these are called "csitop[01]".

>         DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
>         DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

