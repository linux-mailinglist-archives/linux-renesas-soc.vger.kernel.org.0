Return-Path: <linux-renesas-soc+bounces-26352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13ACFE453
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 15:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 494D630B23AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EEB340DB1;
	Wed,  7 Jan 2026 14:19:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DE3326930
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795572; cv=none; b=l6OydzoXeNukGekcNr7hi3dsxM5fTe0Ym7REHdXruIPcNQ8ne0nUFYT7X97qM54ouPR1K2Im0uIEQp3DE3tkcAtYX28iN6Em+1BAI3VZK/dGpbsTCdv0PINiKFHZMNl4qt2ScohNpDUfWCHanO2HJWtTcVbS6b0HjwCz+DulMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795572; c=relaxed/simple;
	bh=FRXg7sG8lsjROMniNEltYNxRSN7jB6UHa+E5teGuZoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1n4a3CEY9cSXOixVDS/6UindW3lRUZkHEEJsCVy1M+88AcvPFVlEdN3pkj3vpmlvAfJelLkd314FL/HKazURG/AjAszih8f+/kCV4NFaNxwzrJvrVEtu/UMy+07/M3uxo+y2Nu0soKzzGUBsuwwQROhV2nhcjrg3sgb/uzu4/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-559748bcf99so1426784e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795570; x=1768400370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9ObBXDi5tfc8gx6dpzNjEt6gAEUaQj0PlEscHQbzxY=;
        b=TtgBEIdifNgoHC+tyfsS1G1VsWHy/1OSRnZc7K587POcsw7d5t0tfchECLKao7KAWg
         bAZojaOLPJKSfJ+jYeEC2fnP+YJU9q4ZHsYtKJbsboF/eHWwrjy/tVPoaVwx8FWvuUZx
         T8GizEaJWhISCY0cwwkxqCY0iDzMeq3LTL7nojayksZyc0LV8WNd8m+lLLEUG8BOOU0u
         c9gX4RJ/nTqYlpIGxOLN7MPcXpXE14mNiaDakDmPL0q+LcasUQkTzJ3FKhfMbFalJM35
         7+AehWIKBk1UtZYp/erDMwN8MB0ABuTZNNpaT2YwFcdZrcvSrfsy8C2JRrc6b5+EZyAF
         +ocw==
X-Forwarded-Encrypted: i=1; AJvYcCUeLlYqhTenYyDq+MAK3nsFK+wfUyUgPa6gi78rgkEllOX3erzeObEuUumA1X/a4eq+1GglX5W6TpaNFdwzJMOIpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmPPHtCwpj1hycINKEH0dZsqZ2MDY+8uEf6tDiZb21Vig+hWa
	W3wSvuhOOLyVFQEx+0kN1fgz8AT3qyk/6ktZR2BSXtQmiSQLkC/lvFBUgp24wkW4
X-Gm-Gg: AY/fxX63zx31+1GnXsmMUkJiGbQI1/2JirzrHP9EUgGEESviEwV7u1OrRgSUyWDjTAe
	s1NokH5CWjhMh/NxvK/7NlZgNp6a4uax1d6UVKsVtpYYTBz7r4g2mD+EL2Qg7R2weaczqGBaPqO
	dOjjZWm0NdxkJ6ymGoB9vk3zwABJLergEBu2e+dPKB/8pxarpvoboohyTwbaD7Y0Q8NWIoWduSk
	/2pZr2iIQZkmKoLDLmGAmb5otTjZQNWZnGLLjs8dMhPoux0AWu7fkGOgyDpdZYolmmyTxcy6DrT
	2+wpFb4FpTIeKt6Lo/6fpPKt8CplXVddpFloLjv//9NMyU5OrLFRCAsiLGlBATi6HDk9OydzMW1
	IB1/Yt/wpMrPJGlthdKBJOX4dU9SqlIuYjclWmyIQwremVzzI6QoyIZop2N8kqpq0WDN74sT+m2
	O6KFC6Cq3cNphfH0JbSVg23PU4yfT0qVWN6xCfS/Hkn6AL4WuQapTz
X-Google-Smtp-Source: AGHT+IEYq2ZH7xF0kgf40OwNRa6RL2cd283hLIgrOrCyRtSQ987k5fMigOAuHn+BY0GXrvAXs92Oug==
X-Received: by 2002:a05:6122:221d:b0:559:6b0c:1ca2 with SMTP id 71dfb90a1353d-56347ffa3a0mr968769e0c.16.1767795570120;
        Wed, 07 Jan 2026 06:19:30 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a2076bbsm3036787e0c.6.2026.01.07.06.19.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:19:29 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-559748bcf99so1426774e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 06:19:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqI2pM6GFAIbwV+8TD96zE1GmIGAhEZsB67XAr/pqJsgau4Y5REVIAn4YFPWvi65p0ykd1vV/UEQBn3vwuIS9ioQ==@vger.kernel.org
X-Received: by 2002:a05:6122:322b:b0:55b:305b:4e41 with SMTP id
 71dfb90a1353d-5634800fd9dmr995463e0c.18.1767795569488; Wed, 07 Jan 2026
 06:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:19:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUymUsH-SjwpwEyf=pX9-KSbGk1ZSt9WdwgUHaV79MGEA@mail.gmail.com>
X-Gm-Features: AQt7F2rnYYi11tOD3YvyO23uJExnpdeLT9PEMdnnytj40vDkgqchRlHVqHG1d68
Message-ID: <CAMuHMdUymUsH-SjwpwEyf=pX9-KSbGk1ZSt9WdwgUHaV79MGEA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77995: Add ZG and 3DGE support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sun, 4 Jan 2026 at 21:56, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] _=
_initconst =3D {
>         /* Core Clock Outputs */
>         DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
>         DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
> +       DEF_FIXED("zg",        R8A77995_CLK_ZG,    CLK_PLL0D3,     5, 1),

On R-Car D3 (and E3), the ZG parent and clock divider are not fixed, but
configurable through the FRQCRB.ZGFC register bit field.

>         DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
>         DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
>         DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),

The rest LGTM.

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

