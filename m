Return-Path: <linux-renesas-soc+bounces-16815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA03AAFFFC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A8A189D741
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 16:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897E927CCEB;
	Thu,  8 May 2025 16:13:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B49221294;
	Thu,  8 May 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720809; cv=none; b=T0vE/dYP5n0DABQpGHMaVyICHfuZeShl2eeVGATqirUJEncxS9pAj514M4FyvgAWpXDWnHKeVIzFN9/HRC0MGwBAoqvJtg6Xmd5PMFp9CP1GMQJ9Z8MgFrK5pQuxuEEHb+eiNLSQYEcpqdLuyoXAxdm+mzGTtCQWnElSlQYbDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720809; c=relaxed/simple;
	bh=B415VopcbQycDdIAvjGAtTjcPX/n651n8B1aQFMapzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rghkFT2I49XpnQ8o0CJ2HtBw5+463jgiI8VyvmSS74LhcuO0dK1MoaFvNGN9UuhtiFTl5o62BGZTueSNeB+jRieSGuU3LKyMrnyHZaxfMtoLHLwSMJchLLALB1xI2HYsbcaCf84YUxfzGhc5J6RWv/F+BvRGIcbpdqnSs5DhJ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f53d1cb94eso11721776d6.2;
        Thu, 08 May 2025 09:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720805; x=1747325605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfjJ7OZ3vC5Vj4EupDAUdnMHjZyp/NxBVGY9su5/N8Q=;
        b=XHAq3jOY73lFql/nsMm7EpFd/A7fIGMSUWYlYukC4JFciFdgcAyNOajKaaY+9Ac4P1
         bqjMi9Ab2QrifDpciCmWdC4Dnkqe2qBnOUG/bPD8gbjDBb/3BaUfMUVWikMJxpIYdan5
         eomFa3BeW1uGSCHAsIEYAShQiXdV4JRVTBjYkeRhHt/mUvJGpUkcjmGCiL8IQnBLnfMG
         eXDx+MTa0OFXHPB6yd6xPXB6KIreS5M4eRl87n/Q37keR4L/q5Mh7y7Vfcb+DumHjDiA
         uqWR0B2j3+2td5BIOw6fKNK1vzKGJEvaSMCRyqv0i+gdwPr2/JMRBgSTTSBN6fs5wVrk
         e92Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdmrkV+48Cs8HgGrEghmlc1BGcVcYlzJY8EayR/gI1XWd6KMethNYD2Dtp4seIAlotsbvsyqS2UKoWiDqnC7Ksymg=@vger.kernel.org, AJvYcCV1MMQK2RblQzW41YRfe6U1NtsL7D6Or+ZEkI4C3zSpfVPfgqh0aR7LJXsDZYc4uHa9yAHuBnoz6r2MBOiM@vger.kernel.org, AJvYcCWNF/QzSWuKxEdmLw7Q0/5uB8f2kg8ulsXoOlbAgCr4sar37Aybzyj5ReO1yQRyPNMpJpogGVM6+yA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GeRSv4erkJooyc3SclLS2aQXqmkaGDKSMixCipt0vPeCTCUU
	hNc0c4fW9r829w+mNCLDEEJDzh+LFWOEe8ywv1zX3xqh/QGNRq6NETML3/Wy
X-Gm-Gg: ASbGncsYRx4n4XX8cXZ91PT1MvpthtkBiDToIiV2pwTkV9gPnSPPeZa8/GP6Rf2/NML
	jhLyBJ/KOCy4VwXsag2vVpZb+cimzMwzpPZdgLnDpmDM5VXLFGPZk2v0rar0S+NLXrOQIGnCoV+
	opV7tLbnTo2BSD8RtC+PPp22zFrOHX2/AjxXyQW2ZLJO8vIKUBM/xij2fOoEyOJRva4YrcfSN8V
	Z93YeE0hdVe5QZ0wYQirsbHGM1w8R/IVOG5ivP1qRx/x3CB8cPBcebOrsqpQh4b8hmQFSnQCcQ4
	dNN6l5RgM6boHo0HJ6B0IA8JeRH/wzli02KaNm0V0QvdEPQK/88oUyHa7h9/Wuhw+OuEeLTaaD9
	4M11BuEQ=
X-Google-Smtp-Source: AGHT+IFQe80dLtEhbFvq55l57QTidwbBa6cQnb3NvAj/3d9Qi9JZldltcrEK47MlmgTJVGZF1GFJvg==
X-Received: by 2002:a05:6214:240e:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f542a4c794mr111187436d6.13.1746720805137;
        Thu, 08 May 2025 09:13:25 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a53905sm1341076d6.112.2025.05.08.09.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:13:24 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5b2472969so121768585a.1;
        Thu, 08 May 2025 09:13:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0STC/ueZ3kiH/nlpT+qau2WWJADh+Fd8N2TMdCRQhzbWBNpPQcmbatHRurWd2HJUSp4a2nezB9A84UCWII3t4DMY=@vger.kernel.org, AJvYcCUQ6Jabea6I5I9CLmbWV1/YaDS6MW2B6kVyaJ52rqTYGxJ4tBbZpjO1040XFoXoLXk7EJ2K/towHwvptg1A@vger.kernel.org, AJvYcCXpkLq0JbN9QpNhwczQQnF9tVgbpNRQ3eV4nfEzQTRjsr28WwsSKhtYFs6QuQMUPh6a/HRtMoCBUK4=@vger.kernel.org
X-Received: by 2002:a05:620a:2552:b0:7c5:5edb:f4d5 with SMTP id
 af79cd13be357-7cd010ee99fmr29762785a.2.1746720804071; Thu, 08 May 2025
 09:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250428184152.428908-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 18:13:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com>
X-Gm-Features: AX0GCFvHkn5rIQsfMmyaSHlxpsNSpG52g0Gfy95n6DhXmYott5Vg4oFefhhzDxI
Message-ID: <CAMuHMdWUpJHB_NsBqdvyD6=dDnZXQMr-=0aOpW0OutN9hSA5=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GBETH instances. Include core clocks for
> PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> used as clock sources for the GBETH IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Used DEF_MOD_MUX_EXTERNAL() macro for external MUX clocks.
> - Renamed gbe0/1 external mux clock names

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] = {
>         {0, 0},
>  };
>
> +static const struct clk_div_table dtable_2_100[] = {
> +       {0, 2},
> +       {1, 10},
> +       {2, 100},
> +       {0, 0},
> +};
> +
> +/* Mux clock tables */
> +static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
> +static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
> +static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
> +static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
> +
>  static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         /* External Clock Inputs */
>         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),

This patch starts to LGTM.  The only outstanding issue is how the
et*_[rt]xclk will be provided.  I have read your comments on v2,
and am eagerly awaiting the full patch set (CPG binding update, PHY
updates, ...) to get this all to work.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

