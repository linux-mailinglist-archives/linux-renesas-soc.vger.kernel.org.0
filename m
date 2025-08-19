Return-Path: <linux-renesas-soc+bounces-20716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A84B2C82A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 17:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C523A3970
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A43B27FB32;
	Tue, 19 Aug 2025 15:11:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E027E074;
	Tue, 19 Aug 2025 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755616260; cv=none; b=uxHqzqym3kbVkaJN6kKQ9I52+0kLqI+b5kpFRl3DMli/tpLam0ntbY0yjA4xAsLnwMg0yXpfypbgVwGkftH2pnXDLgV9gXuMIEc6U+wtVDrXyKj5DcoVFoOjze6i3uz+Q802UyLjTj201zDjICwwJvPw+bsT9uHpxNo4X0FWd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755616260; c=relaxed/simple;
	bh=OZMEdhP+NHwht6AbKMmHkMK0vMbV6WrxDlng36BQY7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmpDZ1oZWFBn9TBIMtY1GQsevF9mSAT5Y8dTNzwHbaIULfnkVN8OF6Vw2MxP96txjC7xbNHNJHLbVw05kgMiu9YZpKUnPMw6bKaPB4dzBwemc4fU7mieG/bpqlPdPp+sR6yU7IpAI7CDP2ch13sdZadbtzf8/VvjrRtG6fbRzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53b173aa4a9so3567944e0c.1;
        Tue, 19 Aug 2025 08:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755616257; x=1756221057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3NQNV5+BMzTrUVoePYKb9VKcFqO0DuhTEn/Kg6ptTk=;
        b=ZdiJDAE7QTN7QgoOPD+LoZLchKKeCPwnqmyKMWkP7GmIYUh1mue5HddWVlUXCuIB8X
         PTYyN4+3ratMKm7tgKEuGJSVpJKxnYutCDSINJnlhKkOsPx+rI9YssYotWr9jsGamUWV
         kuN++yFzn4C+Y1tXNobwyvr980aAswv3v0GKD9g5sB31wOhNNfEg24Es5zX9bQ0uTjhw
         UI3RTiU/5RrMDEW9TzufFPfSGpmoDCmJDs3Cdr7GpWe548ifvxbUK6IpWpwSmjZESLKC
         6ox1Je79WLJRHH91IjDgDGVgaqhM+llQTox8RUNDtjF5QR02+N+jX7+vWH7WtAQLNNHY
         WfmA==
X-Forwarded-Encrypted: i=1; AJvYcCU4rUM2W7aNWK8Ys5tG8nl6KlLzfEvweAKlrzPJ1Nal/cwLl/xZmd0b6eh+a4H9CA5EEkx/IB+qEPFC@vger.kernel.org, AJvYcCUVHKj3aZcMPHjPjSbFtIfHb5GhAsn8eMHz+SjPugYm4oeb8uSquYrOvwvKiAIOMBUyu75p6KZiNSAgQI++xPrFxNg=@vger.kernel.org, AJvYcCXIGmJHrySdRLJv8cFKXKu4TQ00P3cWBy5j70/njmCUIeP2bv9lsIk+ZyV7v3iYcu4Hm/3MfS/go0Jq1iw6@vger.kernel.org, AJvYcCXK8z9Q1n8mUkYJ7kVWV072BuspKjTpJzylfqiMM5THnFcGy2uWdkzsrsCeitYiKW9ZenTpa+P3Zzlv@vger.kernel.org
X-Gm-Message-State: AOJu0YwpftwN0PVuP+9Pdz/Q46PzEAbp5rmOH9dbm49iNV4/qVvC1BdQ
	8a8K++WzTgJ5gM9DrBrXZGdwVb8k+gLSIW+GfrwsyHBAsIWajJtEhVnd21nMv4Qt
X-Gm-Gg: ASbGnctrySPouzu1dzuyK54rkSbgIzRE9ACjxsPz6mIxSCO/vDk2bSd2u7g6T6qz6hD
	WfRNnL/AkqETwpXQydjV1K+7/XWdSJol51rKqmiROoNzV3LBQmUfrNTrA2dkhI5RherRE/Pp1Bz
	1aMUVQUZBid96JrwGv0LEOpx2Rg+RoF0II7R9TrUWR/UdYP2BAR5KaoHPG0S+Mp5ZayzsgEIBMz
	MvjZhv+G7hYedaewCugatooZf76Lqs4XwfTA21LxxZCHNLtjg3reGPhcGK+tBoF/lbP7Hz4SUWk
	B+tkfGWN1scIQRApa3dQjXwGDJF1GtCWo1wiur3PJgy2v1/Of2EjLTc+YuYfI48o3438GErxvCJ
	TJWaCRW5fqAeWCd5NSvNrysOVrhpKawSYgYbHIRjGRKjFRIgR2csISOV7pAPQ
X-Google-Smtp-Source: AGHT+IHUoo9cSISYwOuuyZmvYYMRuchWW3BeH+/e6cj4dWGomJWE3w/OzpMKdjaM5zaysBxqzCoNFA==
X-Received: by 2002:a05:6122:7ca:b0:534:765a:8c3c with SMTP id 71dfb90a1353d-53b5d1acd20mr1265971e0c.5.1755616256687;
        Tue, 19 Aug 2025 08:10:56 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2beff365sm2637617e0c.23.2025.08.19.08.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 08:10:56 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f8b14cdb8so4266483137.2;
        Tue, 19 Aug 2025 08:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc4O+wg1wJNcmlzoShdfNTXNPkgf/DPjtgyzXgTBsBxnm26QDiHI8lVD2CUkAMs6tXdVBjvTuvm7t7rM9UxY7or0k=@vger.kernel.org, AJvYcCVPORkK3ecW3gI4R8WdQQhQ1tzFJjluzooJ6kYGcmX0igUm+rCAOEkxvFna3aF2VGJAddlGUrs2fAN0@vger.kernel.org, AJvYcCWrXWWHIOHDZS4LZL016BdjB7GY4EirAOReQ3X4N6KhAQ4HH3xcCdr49Q2oELQgqvS/bt940/tkhlQu@vger.kernel.org, AJvYcCX+s0XQPehBnAXoW3+F1NbgeB8a2srzRZhhA2QeaW+E8HzkbxMwx9zxa42gnyvPtZehb7srt63Weyd1jdh4@vger.kernel.org
X-Received: by 2002:a05:6102:5f04:b0:4fb:fc47:e8c2 with SMTP id
 ada2fe7eead31-519228111f3mr1000386137.9.1755616255726; Tue, 19 Aug 2025
 08:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 17:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
X-Gm-Features: Ac12FXztSIbRfGM6ft2_clmtiqn-w5zb7j5z52Ilgtf_wXQ8foyw6kTPUGThxEs
Message-ID: <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add RZ/G3E GPT clocks and resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 14 Aug 2025 at 14:48, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3E GPT IP has multiple clocks and resets. It has bus and core
> clocks. The bus clock is module clock and core clock is sourced from
> the bus clock. So add support for module clock as parent reusing the
> existing rzv2h_cpg_fixed_mod_status_clk_register().

Thanks for your series!

> Biju Das (4):
>   clk: renesas: rzv2h: Refactor
>     rzv2h_cpg_fixed_mod_status_clk_register()
>   clk: renesas: rzv2h: Add support for parent mod clocks
>   dt-bindings: clock: renesas,r9a09g047-cpg: Add GPT core clocks
>   clk: renesas: r9a09g047: Add GPT clocks and resets

I think you are overcomplicating: according to the clock system diagram
and clock list sheets, gpt_[01]_pclk_sfr and gpt_[01]_clks_gpt_sfr
are really the same clocks (the same is true for rsci_[0-9]_pclk and
rsci_[0-9]_pclk_sfr).
So you can just describe gpt_[01]_pclk_sfr as normal module clocks,
and use them for both the core and bus blocks in DT, e.g.

    clocks = <&cpg CPG_MOD 0x31>, <&cpg CPG_MOD 0x31>;
    clock-names = "core", "bus";

Do you agree?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

