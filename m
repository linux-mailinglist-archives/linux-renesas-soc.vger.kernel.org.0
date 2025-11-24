Return-Path: <linux-renesas-soc+bounces-25082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A00C81595
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA053A1180
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 15:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46483315D41;
	Mon, 24 Nov 2025 15:29:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1746313E3D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998140; cv=none; b=JSV1sTKODKdI4YCDu6eNVyM2gnSPSeun/LXQGYmqx8RsCZpBdv7/SzmksvYsgofv9IHmeerIFIdvygeQokMtSG5zaK/mCeEenRsrpQXPOM/5CW2ifhyahKxa5ivBhjczaAqPezYTefMATYmq4ZgF7wHQfWqEiWaM4lsfmtRVtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998140; c=relaxed/simple;
	bh=dtyn+c3wkvuOdu7AMLNrDVzOrUOL5mnb4P5swNzpLio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UH6ojnoWliVyko5bW5Ff6LmXu1mey3GHFuYiJcNDEoBj1Jbr1BrlVgBpm3cS8w/nJVj3CFtHjc2Yj1a7Ndlj2rMuzJMFbICe5kvs831fu1UCfz9Lb+pxoDo+7djt/11fQVWsKLKRmYcoP5qQmNL/XCALF/BTOgMnfxFPvM/ZJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5e186858102so1601057137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 07:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998137; x=1764602937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ/nWHkQ3xxW6LNbuBTA1ySl2vV3DXFG1vo3GMeeO2A=;
        b=sndLB+BCMNJ58QQMlogDpBWy1El2b6jeR8VcHhJe97ZCadsIsVWvZTHMpoK9bU4Hso
         TRI75+/gR74dPhcqwf0edSDrpwc/2eXOYrxSLBhO4HRtT9gf8nsf9AE7rhD8WglxlOb+
         oo5PvkqMz8bSIrP8YxrTX27KO9mnWdsHxjAFcYNcaG4RGve1nBh+PQbUAHFFAOfpFOem
         OwrLJIywFIOiONlNKkdKoCbObOZsK+V6kkQM50KyQFpikULBJ5pQpxLevyVCNgwhuqNX
         +4BH3MK59VLS0GchMAYwvJhCO8o2vPyLy0WLDyTg9ZqK4+laELk956PQpjmzVmaMIZzi
         +WNg==
X-Forwarded-Encrypted: i=1; AJvYcCU5FYNOcEQg4rba4NvAZDhw9QQ+J/RhobSV8TiYFyg0jmsxDLRbx3K4JKa0NRZY0q/AAjQFlbPrKsn69AvABK77uA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4w5ZPijAqmYccIAbIUFuYkfTvrHSCGuCLd8sWrlQCZSZVWVhV
	voiF9bI70CrFSHRjtTIWSvzEfSNblXHiR2MboyZcGv2F4rehaABGMTBYEWe4hgeH05s=
X-Gm-Gg: ASbGncsDw/K7RJrvS/DZgu7h/k/lPoeb7qAHyz4DfYQQlKYJjwhnlD1H9glZ3inZrq/
	nj8o/j/HtkE+n9PQaKu7ZzPVfPQf5hq4MtwLL7AllmhFpxZA2Rd9avF3K1STy6WVpPamMrlNR87
	LDDusrigNnZUqMqQKLYY9/B+XK1UmEg5xcJcn8NljqMxLiV3TSrnWDgZuasxQT3gF710NDuIms1
	X8nsOjNKKYcKRxpAUTUBZQTA0T/7O5IPzHIAcAMdmAyJI0T612dZURxZumf42Wz8NX1n1Bozj6U
	vIg8MBDi/uWk3NJMS8/O406xDOwDgVUyiCjvVc6XkVcug3yn9lwWwp6HIucgeWNygXExsaSkUxe
	cykwhL2BS/iVi5Eue9RQB9xtnvcuV8TEpt9P1xKxJtuEvMIqeUpbwYHTXjBBsltlEMdI1Bm/woB
	nhcPwxn/wBiowXbJJgp76ZjIFPorSj+VCNlkldGXr+jWfBN5WoR9QU
X-Google-Smtp-Source: AGHT+IFGrtZsxRvkgEsVg13D5WEPXjxYEXNYXbcmA9K9Zf19pHWxlMeBRv2heHqLxgpcpA+ijV2YRA==
X-Received: by 2002:a05:6102:c0a:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-5e1de1965a8mr3015035137.10.1763998137433;
        Mon, 24 Nov 2025 07:28:57 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd27f74sm5618286137.10.2025.11.24.07.28.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 07:28:57 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55b0af02ddeso499083e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 07:28:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+AufbaNKKjGuXItHgh9yNA9oTUD7NqwHhxRim5zsk4Tei8PJ3segpeU6Bia2V2/5l39Cn3dQcFpqudoTm0K2gNA==@vger.kernel.org
X-Received: by 2002:a05:6122:2011:b0:559:6e2a:953d with SMTP id
 71dfb90a1353d-55b8ef8f5afmr3242357e0c.8.1763998136876; Mon, 24 Nov 2025
 07:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 16:28:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZznFdttha8L_r7O6rHYqrcumvJU8Fb7DaTCv6_SCnKg@mail.gmail.com>
X-Gm-Features: AWmQ_bntAR9TDV9XVvD8fDuaotBQeMQAeiwIa_R_PrLfAuKtTZ9RvX2YFOQkYCE
Message-ID: <CAMuHMdVZznFdttha8L_r7O6rHYqrcumvJU8Fb7DaTCv6_SCnKg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Propagate rate changes through
 mux parents
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 10:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable CLK_SET_RATE_PARENT for mux clocks so that rate changes can properly
> propagate to their parent clocks. Several clocks in the R9A09G077 CPG tree
> depend on upstream PLL or divider outputs being recalculated when a child
> requests a new frequency. Without this flag, rate adjustments stop at the
> mux layer, leaving parent rates unchanged and preventing the clock tree
> from converging on the intended values.
>
> Set the flag in DEF_MUX to ensure that parent clocks participate in rate
> negotiation, which is required for correct operation of the display and
> peripheral related clocks being added for RZ/T2H support.
>
> Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

