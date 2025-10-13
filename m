Return-Path: <linux-renesas-soc+bounces-22952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980DBD45B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 17:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADB31882C72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 15:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBB62E9721;
	Mon, 13 Oct 2025 15:24:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA83112C1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369049; cv=none; b=CQtJB8FyJ4e+JOp4J9viWU1HUHZLJJgAUJCjqImayL4xMongcc8ckyhxJhPCQtF5/CWK8TQULqyw0hqmdkgWBipwPZnGQ7S8K4E9HIyrDyjirOhNSRCCoJGQeKrNhmJIfeNdoPzXDu6TIjjQ8nUDFdv2bbeb4FHmSUTcG/fsd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369049; c=relaxed/simple;
	bh=DENqB/OcotsKyuHcXI2b7+iyagtKWeW19rqjF9NIRV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScLR5fk5BUncqgB9yH1pKhJcW8UfG1/T2OErfr40MQQxARpkQQg+qOaPzd4j7+4jBGAbQc2GgY4GEuJ4Y+ZuKIJkIdSjMpEPmaCbuHlR+RxWU60MuH7HnAKCJ4wGZJCYAyVe/w0wx+g59QMYAY/QgPR3VDYhA52Fx5nYq2z1QQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5d61f261ebfso535748137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369046; x=1760973846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsy0eDfhPBdpuoZPurTAe13rVL2skD/L1Ou2tlGLMy8=;
        b=AP9uiQadDrAgEwZ50yziV/GKl72bDTPUxb7Lo2PzxCOYIuj9eg74MZR9WlUyLA1qP0
         QeFOlTZyOJ32ykyeK5UV02PBgMADn1PFPIq1H5iYZZqDdMXiU/XA73kJMROXxFi32N1g
         fwVfbGwWNLMveHjFFCIO5mS66fx2Jz1K+Ndiag0VIAYpB73HltUeic4nFUxttsaKEjd4
         xqE/jKEqsFyfYdOW44EuFKx8aewQvK+L/ZUEDqPFfmCs1g3+W0dLVLto3SvQWrXnxBk8
         CnvD1dPSPgn4vopZ5nF5zQq3lgKESGQ/6Ghc8Yzmy7q8ZKkaU1nMBPilJ+JFrDgCSdiu
         rkaw==
X-Forwarded-Encrypted: i=1; AJvYcCWt1BFLmE3f3ZQAo0kG+AKhDXa3y/6N3geBQ2oYEssSqXmo3t/4WSy8jSB/wXDf65OVuvWawHXq2E4FoMW5XE24NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUff//38E9riFRq26wt8AozRMH2162FJ0lDNU2t+ebYyDKVFIW
	YmGSauWnlVI8DeECv8OaqeysRYEF7V1o7sdejSgb4X4JB3aoXVYye1ZI91mFfepU
X-Gm-Gg: ASbGnct7lJQsCKXjodEqc9zHKskNufuqMHIF2Zv0mHSd8EWtSqYlLtRPf3vdS1jBrSE
	7f9zkxsbaeGiohOkQIesKoKLD6n62iL/r2cOUt+JO283ddw/4yQwfQrnRGmPq7NtbmBLjqT+Hme
	DRA/4TGbGWH4pmzuKn9GeJK5EmgjhpeCLIdYRHOcUH9SK88qdwaYoWzrCCwX8nR5FJHlizYzeiU
	/AE5HGdBMyX8gp5VPsAI0jOiXAifsokozHBjj1t+9NfP/R/UUj0QgcgEiDljXr6tc3JzHtqNUrq
	6TaJMBjhaRLEUxsKfSZ8Dq47B6ODqxkIVRy1nGCuE/oUEBS3U2pKcINAbui8EoZsjUk9mx3jled
	GNyI/K41l8jSRYvVUYcaMOp+f0G61HCN/XkiFlltKiTyhSqyJ4eUvEfNG4xUFsGQO/gv3RQt3sk
	ugAGo=
X-Google-Smtp-Source: AGHT+IFdy0/MIRQw+umK79ojHEQrn3zWtB0v3/D6lMKzzxZpm4H4EWaj6qhEvRBbUpzWlu1o7Z4IKA==
X-Received: by 2002:a05:6102:4491:b0:5d5:f6ae:38c4 with SMTP id ada2fe7eead31-5d5f6ae3caemr4794064137.45.1760369045811;
        Mon, 13 Oct 2025 08:24:05 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc927cf3sm3530620137.15.2025.10.13.08.24.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:24:05 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso1980821137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:24:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmVXLCmqLTrdUpzNWppTxK0F13D4Z1VhdmXx6/nIa2mbnRlLJ2Jfo7MyNrm/FDJdsmfjdbQpbwdE8lqMHzZSWohg==@vger.kernel.org
X-Received: by 2002:a05:6102:5987:b0:52a:1ff2:da15 with SMTP id
 ada2fe7eead31-5d5e22a274cmr6461301137.15.1760369045394; Mon, 13 Oct 2025
 08:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
In-Reply-To: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 17:23:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
X-Gm-Features: AS18NWA9Hs19mkJEa6IfJo5fXRfqr6oSpD-LjSgVL2758b3dOA-smMQy-fpnLbQ
Message-ID: <CAMuHMdXYsHFi3LSLLPtTZ8xrZsLsXUMG693C3KE=wShhObnkCQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	fabrizio.castro.jz@renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 10 Oct 2025 at 11:43, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add entries detailing the clocks and resets for the ISP in the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> - Dropped the dt-bindings patches since the macros weren't needed
> - Squashed the separate patches adding clock and reset definitions
>   into a single patch
> - Link to v1: https://lore.kernel.org/r/20250506121252.557170-1-dan.scally@ideasonboard.com

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19, with the below fixed...

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -64,6 +64,7 @@ enum clk_ids {
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
>         CLK_PLLGPU_GEAR,
> +       CLK_PLLVDO_ISP,

... moving up, with the other CLK_PLLVDO_* entries...

>
>         /* Module Clocks */
>         MOD_CLK_BASE,
> @@ -170,6 +171,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
>
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
> +       DEF_DDIV(".pllvdo_isp", CLK_PLLVDO_ISP, CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),

... moving up, with the other CLK_PLLVDO_* entries.

>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

