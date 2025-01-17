Return-Path: <linux-renesas-soc+bounces-12224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14643A15465
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35303A7DA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7281A08A8;
	Fri, 17 Jan 2025 16:30:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDA1A3AB1;
	Fri, 17 Jan 2025 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131441; cv=none; b=o3p7tslo5JDIsCGSGYHCDVuxArCMqdoN3JxUImj2za9xgHmJJXzUE8RO6meCWNq1Qzeyv1AWUJrBXcHCq0EIKwhe2brsgZXmpD3oe+n/EldlFyZGTXN0cTvulPIPqTHxI0O62RQytAfbAhQZqGu5shk+JIfcSPZtUqXrnKO5Woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131441; c=relaxed/simple;
	bh=tBqTv1glb/HlqmYIwp9jr/plXpzlgAIxXdeqqXZtdk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXRLYhJSSSywuh8ebGKulELI+MMJMlsRW2xhdD6lRH8UFRd39lDskVSOZ3IOn3bG2cE3zrgS7ZzW1fm4HlcgA9GIKDz3H2EoSJlmdhTwKY/VhOoVx+Y5qBjH1HLtyqTyfQo7C+0DZLZFNX2AsRUD9Lxy2/GoC/MvImssHcQSAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51cd05384aaso698527e0c.0;
        Fri, 17 Jan 2025 08:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131438; x=1737736238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f34cNTE0tlWt/UOMQUx+CYVw7ax8Gn1jqsYTt3RkXjE=;
        b=ESF8Ob4kiiKXT/JC3PCpK7V4Lv+qQi8jmT8h/NtWffMU8pD7ylLp9qTt67XShMQIic
         OobnrX3MhcEYy1Agn8zNv2e7WIuPR5W/XxFXhNDZKHI+Z8aIHkx1C+DxwWVRQIZqvMJo
         pDOekCVN3hz2bdFRHhXsGqTRHHTK7c3mTRNdcq0jzZGVL6jRNIVAa3TPEvYuVUyfEiOK
         oBRCLSL/BD4/9hi/O+1AI8Ps6vJe5OHZpWFvgLsjmEqrxuGkHHHyZESTR5GgpK8hFNCO
         TjAn0ak0KhZRPKjIizPdLoBL6JlKldDQIJXM3Gh8EiEFx59WXrYaXEtKFwHoU3w5Jm3Y
         dCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0zKFPoar/BLw3xzPkaoGnNVFxo44bysG+8ozQpeD20bdGMH2OnXYGTzxsFE3iHrB/1W3opWaE7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISVV0lWcGdQJL+b57GGhwcYbRUKhJbrdxeOba0AHw0nYvG8Y3
	t8rdhhRFqbJmObgN423lEznnfCbLcJqnp0Hv4gcAAmPaYpQ1bUKpSdnfIJzY
X-Gm-Gg: ASbGncuMrGE7CaJKZpP/ZgKfBUR2Ea70CNRg1SSh5m88qiVKJj/HGxA4yhVme5Cw/wy
	NKutr7QCfiVC/Pnyc7qtXEgcBqe1PhH8USg0QermRSUwRX7Sa2zzv1+RcVpDv34Ah/K+Ww1T/r2
	sXI361QQjW9OuS8MDjMAjMra/4FT/KO91P8YfzcTFGj6jkCHYDSFJRhzM3xaYDLjV6N4TMkUXKp
	IynHgLTR8CYY4GjNLD9Tsoy3sitTh6QF1tNRHtc/+vexfJKuz3NYkjQWKuf8jpsMKq+sp3sxDD0
	tNw3hppitFp9UcENTjE=
X-Google-Smtp-Source: AGHT+IE0j1/a7qkPyl7jgILrKc6vHn0H0D96oMujbqYi4StxtxA848gJLDYQfvO9XLuY+aIxSfeXbQ==
X-Received: by 2002:a05:6122:3d46:b0:518:a261:adca with SMTP id 71dfb90a1353d-51d5b301146mr2956778e0c.8.1737131438154;
        Fri, 17 Jan 2025 08:30:38 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf55cb1fcsm407926e0c.26.2025.01.17.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:30:37 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4b24d969db1so410896137.0;
        Fri, 17 Jan 2025 08:30:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgQKqnqLMZ2rRIF9T2GKjuTzVioITHwXEtt3YyvCMiG4FbG+78j9GKh7cK3MULq4Uvvi4hUlFEgvg=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:4b2:5ccb:1596 with SMTP id
 ada2fe7eead31-4b690cbd949mr3216837137.24.1737131437677; Fri, 17 Jan 2025
 08:30:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se> <20250115175927.3714357-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250115175927.3714357-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:30:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfnVDDwaJ-C4QYHAxy2cuaYywtpeT18gzzsuf=i2Vkqg@mail.gmail.com>
X-Gm-Features: AbW1kvb0JaKPhSJVNiqLjeKtNZDui7RFqoEXrK_zZllXQeVVELT7NEkEz4XFvSo
Message-ID: <CAMuHMdXfnVDDwaJ-C4QYHAxy2cuaYywtpeT18gzzsuf=i2Vkqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779h0: Add VSPX clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, Jan 15, 2025 at 6:59=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VSPX modules clock for Renesas R-Car V4M.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -239,6 +239,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] =
__initconst =3D {
>         DEF_MOD("pfc1",         916,    R8A779H0_CLK_CP),
>         DEF_MOD("pfc2",         917,    R8A779H0_CLK_CP),
>         DEF_MOD("tsc2:tsc1",    919,    R8A779H0_CLK_CL16M),
> +       DEF_MOD("vspx0",        1028,   R8A779H0_CLK_S0D4_VIO),

Any specific reason you are not using S0D1, like on R-Car V4H?
I can update this while applying.

>         DEF_MOD("fcpvx0",       1100,   R8A779H0_CLK_S0D4_VIO),
>         DEF_MOD("ssiu",         2926,   R8A779H0_CLK_S0D6_PER),
>         DEF_MOD("ssi",          2927,   R8A779H0_CLK_S0D6_PER),

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

