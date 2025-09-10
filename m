Return-Path: <linux-renesas-soc+bounces-21696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 099FCB51255
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB96486BE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC00E30CD92;
	Wed, 10 Sep 2025 09:22:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FBB31282E;
	Wed, 10 Sep 2025 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496131; cv=none; b=DGfmnSCMruhoF8rk6NApnlCJaXRHaSfBkr/YT5bP705kIjqLohMSDzwgJr/FmrW46ZxGP1/194hg8UgB5ymquP4fWp8WF1HKb8HPaf3ulBTpVJjXCxLaVvwX8AQ7CDdVFkxPVhwrPfGQfpfeS4wpkatWx4HC5CI5ojIXFTj4PWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496131; c=relaxed/simple;
	bh=aLBtft3nb1mHRome/fNDnKelJ4Q4H3eUSCOHarIkQ28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ae/xnh56L+HQ4mZ4IM6mFI0hTatI/00N75Jw6iTpl43wSSldJ5Dw/wD35eTLUgT3Z1sUgBWNpmSLRzmrjGym2psyKuupkQDEc7CNROkZnyStTAWeQN7jTU9qW+Bttk+80F1ZWlrsmCqnHyEK6VR4QbSeDqpXZ5Fz7Ul8HZ5m6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-53042807be7so4767694137.3;
        Wed, 10 Sep 2025 02:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757496129; x=1758100929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWd8aTSzhIVY2SS70w0vRDCJ6L07k4Gyd67aBJ2nksw=;
        b=e51gaMI6s2lPXTxoj3oxLK71Pex9qQelNMNaLAiWsGZadGGYGd1aTcAzeAedJQYicz
         fsBMuBMHTesEEtL8Au6D6ksHa4UVP9pMqg+NMMDHam8kfkHfpue+YfYUHqIjDf3q6Dmt
         r0ni2+Sp7CimNBX3uW/jIpDqNr5ZHC6qdju0EpergnAqqnUBNeEXktzC0xTUGEQddrSA
         DsDdvNEy4WlIyDOitzemKdQ9zs1XCM4BPpmMsixzOlduWIShWWNRrjRk+FQ+mVBRC2Wm
         c+GoxnHC6xP3J6yzcjeS4a80NOEcewVqeS2eChI7r4zO0xiwpPqree93MfQ15+ndkZpb
         WO8g==
X-Forwarded-Encrypted: i=1; AJvYcCVMDUYDHqQzTAoKSAfIwpiepmR3/tYUDmprpPnB/MVBv18pVDF9PGVNZ7WuJIPOuxv6fpnOpN0VV7I=@vger.kernel.org, AJvYcCVWiDRTvPgqKDj6ipkC26dTboIWVF0NPMNtPbnlzjVlBmuJq5pPeVw8RW5DVvqIvarMOU05BAZ2k7feZm+c@vger.kernel.org, AJvYcCXCpXQuJxIafYQjhTPPcdZO3IeSvh+k9D/XlrDfd1fUNOVelPGVClrJDN1T2lAbWWA6N4W23n9Kwi4d43S1TKO/ScE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWtW+hmnFAqvsyb1w9jVW8HfuqgXMAc4tq5qpc3zzCztHP1V2
	YmbkQH6UUwoc8U2BVY+aUY6eDKTeOQt5yvrSDJadYiItsRwmjdtL88b0ri1zVSSW
X-Gm-Gg: ASbGncv80Um114YTQsrKs0KjGhg5aj10QfFHp44o+d6dAEpVFueOrq9e0LGgFt+XIQq
	bvyk6ed2iBiJzzh5cB6nJgRpvR6n9x2+RMVaOPF6CB4X6TQAf4CJ/4UGRdFByYEM8CXB1kxZwGQ
	M3NLTbr+yL+79iULNtQnh7/GskhvYrYSTtpQ9pRG9clkuJnwcLTQZvQdhRuBnprT4w/E4+uyRui
	wldxZ849qRLhRj7/8UwyJd620P/qo+gVbBHu12ecFu5kNPLsbGsViLvaLKt+M/EhiiB0hxzAA/Q
	CCk++bFfkHTpVfKvqov+ZslLIM4/ZuTTLz7ZpkL8w1LiOUmzoT4I/4ymwkGXNhHi3G+2CDnE7PO
	VdEugVbevVc2SNbhuSf7xPeP0YHftbCA7vGAhdsCgGSSkenYeoTDF1fWjC6AT
X-Google-Smtp-Source: AGHT+IGXgjYEm5rNvrVqAQIzIndV96caPJ/PHX/8Yn3uBYxZ91mkiMqH2XOH8YBDTH0jRRMppuqcYg==
X-Received: by 2002:a05:6102:41a6:b0:529:b446:1749 with SMTP id ada2fe7eead31-53d1d61d3d7mr5119777137.15.1757496128766;
        Wed, 10 Sep 2025 02:22:08 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19158a6sm12081027137.9.2025.09.10.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:22:08 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8a00c77a62dso3847912241.1;
        Wed, 10 Sep 2025 02:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUctoS29Ip8XOIPQJsU90PVBWA1lOyoVKw1RL+ShOKa5NXo7FNTmd+RhjO7qXcL+Dki+Cuz/F7b8K0=@vger.kernel.org, AJvYcCUg+beSFGGMdKm/kfHX31VtJe4iKRwzNrn/5S7K2NxSyXypwvaYLpsb1QSn7CojcI6PT6Qnu3+YCsmrosMWdX/otro=@vger.kernel.org, AJvYcCUgf8C4lFaGPWGt6be7aBnNwa1kdVKqKeeSxXZX1Jbf/mPCoemhSgjnZmmQ26673BE7kcolV2WVILiN+U53@vger.kernel.org
X-Received: by 2002:a05:6102:f0d:b0:51e:609d:316c with SMTP id
 ada2fe7eead31-53d1afa353fmr5383012137.4.1757496128055; Wed, 10 Sep 2025
 02:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com> <20250909180803.140939-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909180803.140939-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 11:21:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRAceaMNA7TF-f_5h5pNp5MpRiT5TvGrtiXdKonsE7Mg@mail.gmail.com>
X-Gm-Features: AS18NWAsSTwaBlUrVRtpkH73EWN5q6lWhnf36My0Xdk0Ltzh8k7o-7vM5TwUg9s
Message-ID: <CAMuHMdWRAceaMNA7TF-f_5h5pNp5MpRiT5TvGrtiXdKonsE7Mg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 20:08, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced usb30->usb3_0 for clocks and resets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

