Return-Path: <linux-renesas-soc+bounces-17029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D940AB4D94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAE73A47A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 08:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037C51F2B83;
	Tue, 13 May 2025 08:03:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7301F2380;
	Tue, 13 May 2025 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123419; cv=none; b=J7/njgRHcNALkyH0OAkHQyN/rII8bkhFPW7BRfGgEfDqvnUo5jzmmjSX5ZPF0NOL/aN2LP7HSLkHkSpJCVzJuNeWXgKrVAcpaRqQVGph9rIR5NuM54PYokGaN9VXwWkf5hQoniaU91yuy/tkUaObMYiELCWDgDhieLoWqDEXCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123419; c=relaxed/simple;
	bh=7/l4vir/P9AZjiJvJ5q2xPEauWibTAtd//wlAj/p4PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+E7DW51NUUfbuCHL86H3naXBVfkhPGLTEDqx2vo67KpqJOWZx+ZpIo7U8nVZwa47FqcziMcK1cbXh+I5UlTQuPjHPFpLb3tPBTl5fDsDYouLB/aFvXXEyCmy7F7NAlK+W/+g6m7hpf147nw7IX9uTK05fK0A69ypHpy3CKYw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1760713e0c.0;
        Tue, 13 May 2025 01:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123415; x=1747728215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3/bVBaR+L+xj2Kbd2HtIywTo2LieSgJ5slkAiRz/EQ=;
        b=lmCU1+NaZ73ZTbVX3XeBIBSHVqarDhbiMaN/OQyRQ/6hM1EsVp5LyRtJzfRbsC5ZwK
         A3f8d1KFQuxHoRXJG2WwG5CmtYslJKj/11Bp5nrfu6M7jtwYsZB3+hlQvTM8dDa9Qngm
         sh91KqIVPQTLjl8H5h5LcpHwivHku3U1rmRoEL+rWnJk8jS2Wkmy1MEmOMKKB7xUYt+T
         wtcLpGcBJOgzZvJ2B2B0TAv+KXaQbyxhpZFgXRQHK+3fEiBXxn+BXrl0EIREZs0w7Rtp
         sBk13M39PVSvbSUzy3PIUgfiE+Uj/ElSvNZnCoPmXOu59hifuRtKBPyNuIp9nFEAP+ov
         t98g==
X-Forwarded-Encrypted: i=1; AJvYcCUd8gJG3wTz+ql5qAWRzpcyU/Q9ndlvM/e7jFDquyIB+I4YumH65lTTg8ln9BQNYq7QmMM2Ak8MwFk=@vger.kernel.org, AJvYcCVYxplCOHqmouSCRX3UUyar1tZQIArcN18tou3bi3GUCD+EKAd68Ire8DeFCzDppKlv5K+psoNcmISegAyE@vger.kernel.org, AJvYcCXhA+mqJbtdhtFIrhxcq7xDJn+fw7eJ3N8IKfSR1m87fnVsq1N9URkJQ3k+DgkNk2muYilaJ7Iyo5fmP//ZBFHg90E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+Jq//DbkVAE5SyNFBopNVGl88wo0XMm+SsEtcZcHIeZCZaRI
	oGZ2an3ui0vFnGGIpTuADavXpQPSKZHSnDaAjugnmLrt5b8u3NWUaWw4P+sL
X-Gm-Gg: ASbGncv7elbamIlZgiBWFZBcWP2Bjr3p/sX9jpILD048MbDJwau0JptsXUbw+h7j43i
	U5x8uxpEP3pI6tzk8+390xTEN6IHkxKaq5ZUudKYxxnzjqmc9NEaH/PQKTV24gjwKDcUkjsPoeJ
	zcDW4nUZUSm3v+IW8PTqGuaOkacTFG/romkMmXgvtS0sy3S09ZZo5/dllWQrNLGA6pYuZOh2ZoX
	rAEHiZK1eHIGUyA0ynj+fjHdEOFLpONI/9cYBfSyU+mYQUzhjcdM2ls6QWPu37wudCJRB9fJHdw
	tcfNedleIqVAcpP2xhhkcd4DHQ5szRjmgR1N8Z5fX1H8tVpjs7hjejtXbhHPLIPI8/cM2r1y4ON
	1SpoI46Yf3gTKzTblt2/uxzJj
X-Google-Smtp-Source: AGHT+IF80rnuW6wjm2yLjFfhd2F3GwgeUcVfd21dzCineQyLiU9lW1qnqqN2nH2l2LqfTdMTbSiyCg==
X-Received: by 2002:a05:6122:3d0d:b0:50a:c70b:9453 with SMTP id 71dfb90a1353d-52c53d41ec3mr9221283e0c.10.1747123414769;
        Tue, 13 May 2025 01:03:34 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5375f70fsm7083435e0c.26.2025.05.13.01.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:03:34 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8783a6b9d6eso1401547241.1;
        Tue, 13 May 2025 01:03:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjACcsAZ1hIRt+EJ5lhDdUy7D0N7HRPfki9y5XQ4AOafMzfe2bEW775dYRZI+tpMrNY9BFfnWMsxlO7U4XhFhpw5I=@vger.kernel.org, AJvYcCUyfvzdbvxE+Vz+C3mGMsRLTnCxN9UtReskB+2XK/ujrHNiUuoot5oa9QeYoU2AJ96wkkHN6ycrJyo=@vger.kernel.org, AJvYcCXr3lrgMPkb7geGHJw/lSsAAL4fcagXzz1vhhBj0nQ+WuXMHPJE7IZ19KRBE2L0DeexajOhisUTLGt4yKS2@vger.kernel.org
X-Received: by 2002:a05:6102:8006:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4deed33f448mr12794670137.7.1747123413808; Tue, 13 May 2025
 01:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250509160121.331073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250509160121.331073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 10:03:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX18eBo6HhAqxxga35NFTVt_0oBJzTU=dFUjcCCnPZvHg@mail.gmail.com>
X-Gm-Features: AX0GCFujI-MSsC0rbQDc_BUSshHa-hBtswA33Hyjif-MqCWRAToEOMhwvyTfl_Q
Message-ID: <CAMuHMdX18eBo6HhAqxxga35NFTVt_0oBJzTU=dFUjcCCnPZvHg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 9 May 2025 at 18:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GBETH instances. Include core clocks for
> PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> used as clock sources for the GBETH IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped adding CPG_SSEL1 and CPG_CSDIV0 macros in rzv2h-cpg.h
>   as they were already added by XSPI clocks patch

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -93,6 +93,7 @@ struct smuxed {
>                 .width = (_width), \
>         })
>
> +#define CPG_SSEL0              (0x300)
>  #define CPG_SSEL1              (0x304)
>  #define CPG_CDDIV0             (0x400)
>  #define CPG_CDDIV1             (0x404)
> @@ -118,6 +119,14 @@ struct smuxed {
>  #define SSEL1_SELCTL2  SMUX_PACK(CPG_SSEL1, 8, 1)
>  #define SSEL1_SELCTL3  SMUX_PACK(CPG_SSEL1, 12, 1)
>
> +#define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
> +#define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> +

Moving these above the existing CSDIV0_DIVCTL3...

> +#define SSEL0_SELCTL2  SMUX_PACK(CPG_SSEL0, 8, 1)
> +#define SSEL0_SELCTL3  SMUX_PACK(CPG_SSEL0, 12, 1)
> +#define SSEL1_SELCTL0  SMUX_PACK(CPG_SSEL1, 0, 1)
> +#define SSEL1_SELCTL1  SMUX_PACK(CPG_SSEL1, 4, 1)
> +

Moving these above the existing SSEL1_SELCTL*...

>  #define BUS_MSTOP_IDX_MASK     GENMASK(31, 16)
>  #define BUS_MSTOP_BITS_MASK    GENMASK(15, 0)
>  #define BUS_MSTOP(idx, mask)   (FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
> --
> 2.49.0
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17 with the above changes.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

