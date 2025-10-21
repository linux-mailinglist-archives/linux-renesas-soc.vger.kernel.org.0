Return-Path: <linux-renesas-soc+bounces-23386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D747BF6D25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB826189052E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928533370EB;
	Tue, 21 Oct 2025 13:37:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3E33345C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053821; cv=none; b=tTGOR+R31BxryOXqnPLK/2d9GzqqKu1NUb8H/Y6GzkEoNsACqykR7KV0sJg5c40QCoNeuATP1mrv6fWG8hbCVm83ie+Ft/WhDcfCpeF4RdB/ftOVHaPz1VSQi4ak44D70A5GXiPLQVoRBCWSfaw5noylRb0BLpQQBGsUe+GLGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053821; c=relaxed/simple;
	bh=rFDpMMd/J7LmBoOgvX90w3JvXvtchMw0C13OGNdvG04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7+fU13g2u5r3DO+GH5Zam7KDkhxIrg/p4HbPkkeqz2CC/Fv6TuSwnd7aGaAzXDP2vRquqWom/DEkGi3F3fbS49bj74h1HpigELE802O+Jc51UHQZo9FYlYej1PYFW7wE+ty+Zzlk0QO+fnHn61Y5d7gptxbrNfgeu/Qr30NX5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-58de3ab1831so4221583137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053819; x=1761658619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b78/bqYwVh1ldrSw5qZkZyL5FOTBO1IYeO3ztxHSC8M=;
        b=ipwipQ+sIitjJBt01Yc0ZxSWr+wlV8qg5vap4l60ADRKxN7FWrCh6WgjkYWvqNpa9H
         gjLNXUghsdw+I3bpgi+DsFwHrlfsqqzkmxPeEgwxcEqDCdHAUKKriJJ1mtrYw1qFAul8
         6anPJeSsG72zESCP+/ybouL4AzoN4FM0YYkiL65PjfjjX1jl4F2Yp6uUg0Fwg6QmQQUN
         PiNmA8W6fjbKxZQ69oQk/nLiX7lb36UhYwI+YgIKTmZpwd4sQ8r820sUlTn9xxz/DF92
         o1Q+2Geb0fwvTWwRJZiah2zzCvVFsZPTnDUimPFpMrs4NLednoTOWXnCEtLTn4SJOuqA
         otZw==
X-Forwarded-Encrypted: i=1; AJvYcCV/aglCkOpLYFbhmjDKGJfZSLMFXioQEkvXlfjIvqMD/Psu/NbbgVeKbnvtVCfQs8gOA2E22ksZi0fiLAePYY6HzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZ7+02xo06PXpzGc8PRfbBl9AKEq5t812HficNpNh1PZ5xviK
	/8QjxLx1JgnwkXbPizhzk7udwWYctAHnpI6s+Pk6tbv7bJRaSjbIcY00ZpaKAS/q
X-Gm-Gg: ASbGncu2LQSdRS5yBAt13D7xvmnAS9r1QPgV9VH60tzboHd8Ij6fS8V1N3lWNFukkBE
	o7CPYrpi8gLDcbAUd/nv41FgjYH4Snt22dZGk+LTkowhssnMDrU2goxgFhY8uicrwDcjOObg7XB
	oGz7iSnjErO7rBFdrP7kiefAokW2kGIq4WSF36hZ3ajgsx62kfvbiT1Vg7wasryXOL0MeJ1rVjC
	y+ErKcBU0eAo1MMNIWbhg7RAzU2PfwSys65lxXBLczroZC9wMC+/hHo7DUznitq3IgZWZp/4qhx
	NjHxtWU4kaTMVFwM1hNYiwfsle2ZOmMTsR2Pdj/6OwSXdJgylivjCi52ay6AkVDwBMtXpW9lG4h
	LQIMiC/qTKoWwIdMXOHoBVrEAh2By5stNa1DFa2IC/p24NAV4Om5Wb33K4h97DL9tAe9GAZZdr4
	1mbwni4p9Lxktsk8m7JczKv8SqIE/fiC6WqEsz7jzcfhjK+3e7
X-Google-Smtp-Source: AGHT+IEBhv1igqCfawziJqbQjvkm6btJmmMtDdwpQEZgWOplq/gkDZKjduIfGnGN3wEz3nxkmkfTnQ==
X-Received: by 2002:a05:6102:c8f:b0:5d5:f6ae:38f2 with SMTP id ada2fe7eead31-5d7dd62d72dmr5188142137.41.1761053818637;
        Tue, 21 Oct 2025 06:36:58 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96be9a783sm3656802137.0.2025.10.21.06.36.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:36:56 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-930c4cd6ccbso3500421241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaGnZw/SGNqPyYKNHytkgBAZDEWDmfabgx1qVaODtmBjYO6+0kwP8/O8X0pF33GU7omRGg+smhF4AiwbRcbvEq8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:441d:b0:519:534a:6c4f with SMTP id
 ada2fe7eead31-5d7dd5ee60fmr6017748137.33.1761053815204; Tue, 21 Oct 2025
 06:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com> <20251020143107.13974-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251020143107.13974-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNq-DFG4_i9CN+Rb2RSgO1Sxph7HO7SNhnr0d1=LoW0g@mail.gmail.com>
X-Gm-Features: AS18NWBYsMSpOo4y4kMiKki8g1BkhV5Ulk8TYURDjYYjSArsxY_VVDXQMAlwt_w
Message-ID: <CAMuHMdWNq-DFG4_i9CN+Rb2RSgO1Sxph7HO7SNhnr0d1=LoW0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g057: Add clock and reset
 entries for TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Oct 2025 at 16:31, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the TSU0 and TSU1 blocks on the
> Renesas RZ/V2H (R9A09G057) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

