Return-Path: <linux-renesas-soc+bounces-15945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3FA88AD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 20:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144D51898BFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CA8289361;
	Mon, 14 Apr 2025 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVWmRj+l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D328A1F8;
	Mon, 14 Apr 2025 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654512; cv=none; b=t3fqkgM6R0pnEDg4focQ79+p70XrrMttlbhSXtpTJgwD8/HFh3V/ovtIFyZsgFbSHPidAN5+UHIaYhRvB77BEbxlwhfJr5w6maC6g339jCGCdvpps7znHGuq70zpsjozjIQIBxV+KPAgBdEr1uGoPcOsFyRJ10rTcgGfhaNn7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654512; c=relaxed/simple;
	bh=rmXZAeN5cvrjRxtoREAiX6XfkQ7H1MIir/U2vqGrGMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGggLaP8zClRIQ0V08gAn7XJiDUl8pgpCrmwjfX2ks3pNAOJqVNHXfm5JcI+gzF9QFQJjhw+GDqHXp7Cs0iRV3wQQpC/5uxtI1Q+bHA+saAMq7aG8nvLQwkHn2RmvHZtwqrFIxUlG/dfy/aY9p2nWNUnpLpP+5W0I/0DKCwaiaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVWmRj+l; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d69774081so1974636241.0;
        Mon, 14 Apr 2025 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744654509; x=1745259309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
        b=fVWmRj+lX5hOcXvhQz8mu2E+LDcLHAC3SSbTgNSTtrsDTZ02mw3XrijhTWJn06ZPWx
         WpL+orzD0Fwb4qRrSP0VvykFk3YbyBfo0rH93uzMhhhQy+Qs6wNyzyejkz63QK4lBxD2
         vuZ9nnfHzaWQJPvp5i7q/Wg77WvqiwOlfyFzdiLHY7xY8U9Fm2PW087wndSmMgIOeiEH
         U7Tw7herLkVAffpPQSwbLZAUNxKK+VH8DeUqjRsls3GcVEsU9Pa0vGNTBdPsOrh7URQr
         py60AryeQhpyhKe2CotQwLvyvyndfUA0k7DckXYz2Wc3coS5m1cFlCtVoJvz3z7Dxs1r
         KDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654509; x=1745259309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
        b=usI0ngoZnhByBFOq1hVkykWt+oWjH7rsGhd/o+NHjFgDlIqskExljn/BcGUJt3oIvG
         JRWfut1zzEhotW79DtjR1jQ8hM29cB31q0vyu3rKmOcqlFr9fwj2atf8662IAeRA1qx3
         g3nVyMf2FvPk44ubklw5sn3GYBxLSD9070zlDOkyf3/69PMaH0kc2t0lwaOegv3OvI0v
         dFZVpkEsEqYG87/DcMSrNJGhLxa0IETwLqRVGPmofslcUn+EwNNjJmwAIiRSCtLWiXg4
         +bc0NcjvFsIwgsyg5ctPg0jg2TZYPCtqCKQApcoFdXrUKcrAduhWeV3Wc5x5ILjcZSpJ
         +qpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5P0F9WX9Ft2lr8ghbNP9wvXODZ8f+5Z7GdgkFAhVVst/z/lgjVXulFqUDjcjLMXfmfdKTv3GidTUMbK7+aAlkihU=@vger.kernel.org, AJvYcCU8HX5ykrD+BdqEnE7yMsPuiC6gnhJK0nhr431UHrcLpIsbpFQg1DgsywtBBohxm3xM7mTml+hqkzae+PTC@vger.kernel.org, AJvYcCV8bBSkX6MaspKcq08t2dyXgU9trMkMmkdxrxYTdJZ8g9lqufJaDfguSceRDz/9tGbRqBkd+3rV@vger.kernel.org, AJvYcCXPBSpT2YVn6NjcdmHSkqAezYKKiefb81VBcIwHVF1Aa16lnsmM/zMjccSK9+eqf97jCWzp/7/Nfwyr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8tbtAQJ7ozucxzXsB37S9YbEMnza3fUoZSvBomhoAwvDgDitk
	fuUZB8ySaRJeD7JIwHZZqiZ7gadt8nYanvYsRwEUY87Q4qcOylbPTtxSwGFdRk8OAP68DXuBg5I
	kfqcd1qZYtn7MNhfkSxGAzvBtqHk=
X-Gm-Gg: ASbGnctYJy127u4JhxOvTMH3xLI04U+MsStEbJQ1VbozCvsAaB8/DHzBH4SvQuXNyZd
	XE+UyF4pUfQElXB5n1HiAhWDb+iZ61+u1sue39v66xfI+rqlAc9dtHED2rr64Kbp8V9wMVTiy8O
	bg61ic6hV5/wYN5e9CeQTDOhr2dhSs/KqQpX5Irqv+kKTXiarnKpYNMA==
X-Google-Smtp-Source: AGHT+IGQY2h60f8WJYp88UGsGy+zjKZoZ77MuV/wdekbtzAvVIiA03PukMvok77iK0iUI19EfMYr3Th7THvYja4ZcDE=
X-Received: by 2002:a05:6122:7d0:b0:527:67db:9cb2 with SMTP id
 71dfb90a1353d-527c34d1d3cmr9206320e0c.4.1744654508673; Mon, 14 Apr 2025
 11:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
In-Reply-To: <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 19:14:42 +0100
X-Gm-Features: ATxdqUEl2MkISqtCUulKnIjkTEEvAI8jUFwXWbR4ZrlJPw4rcSyDREbiYNsOOl0
Message-ID: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, Apr 14, 2025 at 5:57=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > +     gbeth->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(gbeth->rstc))
> > +             return PTR_ERR(gbeth->rstc);
> > +
> > +     gbeth->dev =3D dev;
> > +     gbeth->regs =3D stmmac_res.addr;
> > +     gbeth->plat_dat =3D plat_dat;
> > +     plat_dat->bsp_priv =3D gbeth;
> > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
> > +     plat_dat->clks_config =3D renesas_gbeth_clks_config;
> > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > +                        STMMAC_FLAG_SPH_DISABLE;
> > +
> > +     err =3D renesas_gbeth_clks_config(gbeth, true);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > +     if (err)
> > +             renesas_gbeth_clks_config(gbeth, false);
> > +
> > +     return err;
> > +}
> > +
> > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > +{
> > +     stmmac_dvr_remove(&pdev->dev);
> > +
> > +     renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), false)=
;
> > +}
>
> Would calling renesas_gbeth_clks_config() in the suspend/resume paths
> cause problems?
>
> If not, please consider using plat_dat->init() and plat_dat->exit()
> to control these clocks, and then use devm_stmmac_pltfr_probe()
> which will call the ->init and ->exit functions around the probe
> as necessary and at removal time (and you won't need the remove
> method.)
>
I'll test this on the platform which can support suspend/resume and
update accordingly.

Cheers,
Prabhakar

