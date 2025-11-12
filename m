Return-Path: <linux-renesas-soc+bounces-24491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E91C51344
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 09:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF963B10E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 08:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0BF2FD7A0;
	Wed, 12 Nov 2025 08:49:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B822F616C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937383; cv=none; b=N1ti1ou622zjtglVYJCA4gtSxfB6O2P2/3JowPVMA84yNYKNvXq+Ers9+LUoXJM00o0i/K5fkgjxBBdeTpN/lvHUeKaf1P0JeEP7ifFe2pEozyPvHUIgycyFVcrJgznt1DFh00K4ynybCw9yGQpolWCuteuZ9jx8iXG+Wr/U01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937383; c=relaxed/simple;
	bh=GEPcxScTlNQXWLN1NkRTChaD1+/VaqI0xZxACdHRNZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mszJxgVrKxOt9nxTFRpqeiGoXrUTKdqfObvA/eb7kI988UPKaj03qjjEJziyd++lNgb2QxJP23JoF0ijIS8LHA7IkxFwMJ/AJfTb3nv5/2WlxhjPXJ+ZcmZxLPmiX+NkpdJshEPLl288NWeEP6FVLQ4dDbd3ZgXhj7b1Wec80gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93526e2842dso176471241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937380; x=1763542180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRuYUt97/AAYUOVBqnw5NKTwDWHex1IdJ959zTzv1gA=;
        b=iPJ4FNIM6cWUaqVB2qnY7D3lzwPMbuY4+h7FEw++KV44FAfzJ0BRlE4vZixd8oZY5t
         6kQmRF46L4gVdHXususbzslHMu0Ja/w9GPhLLVPr7Vr4XZMYPiJJO8el+1dK4FTsW8tO
         k+5nFePMQvcGMXk+Vid2SZSv4hN7TZJ4cyoPyvLBCXJMKDTlaJXft2Gaa2nxfdKvzNwj
         dxqhRDNlFruaphKp5fpChum3ziw75grX9iIBnos1/9PqhQ/ZcwfDzeMZ5GamdyZpuYau
         mMty9NtlkjTWsu8qpIIXdFuqseEt1nVX1lFvMCp0IB8jze0vapSvW4uwVSNn9sAboHRy
         rSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU12swdnr0aTQtDF8UbMnEcgqb23jnKOwTsjG+ANTrPNOMHA4jCdJfiCIQkuI5q4cb+hdYw/TAQCGx5r8qEgKfYeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCM1KOjwOmQnUucg+Qm2Ze7bqGaWbuWFS9xffnJ82Grm2R+S1
	IGFScVUk8iTCklWXlR5aIUFor2m4M1s8Ow70OD/2+DmjLLcMmviNin9wRtVa4qrk
X-Gm-Gg: ASbGncuURG1mfW+w2dqODW8Xy0Alud9byQ9uvu9lIkgDyS9T9p805A9t8tylDCo2C6W
	ekPscGSOFvCXjnrE66TVbgc1IK5dfTRPqholaNkHUef+E0/qM34Zd2iPQnQKlxXMNH7hgdzMQan
	CfVYHs99f1M1JEWeMOhhW5/A/tBzu/gq0jyvbDSGQIq2ElW3bC6aTHrowN0AlqFapEGELJ7E8F0
	O8XGf4UVJzHStDIOFqmC02AInmwk/evO4iO6itvY+Wvo7jBOkCcaBeIZyGG5NpScDBFIA+MDigG
	NgFPwlBzFzbxE/42SMggnDa9DIowRlW2gWSl1DxwzP17I7sE5SkaIpeYSCCevq02gaPK9wqkaET
	HaqgkyPzCoFN/cykYj0RDnjhWlUitVDGjavd49ciEaxCzbMuHffdkwb4SQtLFrKijcnv4ywbhcu
	KvYHaWCa13QvJf5NCRzi/ydGlt7HcbetUjmsjYa0TxeDdlxZjk
X-Google-Smtp-Source: AGHT+IEkX0S4iIVfue80aP1GeZ7TRUu2MIwDBFqDhnA1ztUQ6ppkYn446HONoQswR6G+erNa2pxwEQ==
X-Received: by 2002:a05:6102:390e:b0:5db:e338:ba18 with SMTP id ada2fe7eead31-5de07ebae69mr520276137.37.1762937379583;
        Wed, 12 Nov 2025 00:49:39 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55995863b6dsm9717472e0c.22.2025.11.12.00.49.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 00:49:39 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93526e2842dso176462241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:49:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVESi238z33tK6XCBxlA66CUXY3Vz1p3HSFKUNzQmAldo222mRSg1KuwLg3FdTY0KV5m45R9GrSzkPdNwJ2BduHQw==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0a:b0:5d7:bb3c:d5dc with SMTP id
 ada2fe7eead31-5de07f16d04mr501696137.41.1762937378500; Wed, 12 Nov 2025
 00:49:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Nov 2025 09:49:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUv7tOc-QC8N_ie7739t07Y5A_6HQPMVR9fxW-jo_d9Ng@mail.gmail.com>
X-Gm-Features: AWmQ_bnWiYGIV8O5vMXPYGxK5G9F49mp_eGvUmhrBRrD8EAR2kAYVwJHFvxANG8
Message-ID: <CAMuHMdUv7tOc-QC8N_ie7739t07Y5A_6HQPMVR9fxW-jo_d9Ng@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 11 Nov 2025 at 10:11, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Unify the probe implementations of the VSC85xx PHY family into a single
> vsc85xx_probe_common() helper. The existing probe functions for the
> vsc85xx, vsc8514, vsc8574, and vsc8584 variants contained almost
> identical initialization logic, differing only in configuration
> parameters such as the number of LEDs, supported LED modes, hardware
> statistics, and PTP support.
>
> Introduce a vsc85xx_probe_config structure to describe the per-variant
> parameters, and move all common setup code into the shared helper. Each
> variant's probe function now defines a constant configuration instance
> and calls vsc85xx_probe_common().
>
> Also mark the default LED mode array parameter as const to match its
> usage.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Grouped check_rate_magic check

Thanks for your patch!

> --- a/drivers/net/phy/mscc/mscc_main.c
> +++ b/drivers/net/phy/mscc/mscc_main.c
> @@ -22,6 +22,24 @@
>  #include "mscc_serdes.h"
>  #include "mscc.h"
>
> +struct vsc85xx_probe_config {
> +       const struct vsc85xx_hw_stat *hw_stats;
> +       u8 nleds;
> +       u16 supp_led_modes;
> +       size_t nstats;
> +       bool use_package;
> +       size_t shared_size;
> +       bool has_ptp;
> +       bool check_rate_magic;
> +};

Please sort by decreasing size, to reduce holes:
  1. pointer and size_t,
  2. u16,
  3. u8 and bool.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

