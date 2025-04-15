Return-Path: <linux-renesas-soc+bounces-16007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE9A89F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48D827A7562
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A8E297A42;
	Tue, 15 Apr 2025 13:13:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7E2820B0;
	Tue, 15 Apr 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722779; cv=none; b=Tvqzvwbh+iHeKgsPVVyH8GLRjLg6LrJ9uOgXco1nEFJOqxwa7ccLyspTaGgTkqOpQaTGp93Id5HUFTVR5fKrmEB2nj6LYtzVskNYETMHgNWPulCgqBcxyhHEyP2dCbM7sve6f8mfplZn6PzKhpwhIlrIkqY6Qm/+etVwtslMCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722779; c=relaxed/simple;
	bh=II8WfqWmBa0u/1Ud+4A6+S3+jfYeVrIHrFaibEYV3WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6Sx5wRZaAZpPqz33ug/IkSw3Yzh1OzfJMtqL0xe07wchxGlN0dj2BCTobElQ36DG5hRlqqntX1wWOPa3jj+kDEHmvitXjm1I3IsOAQURCOoKdnrJoCRlej+F8gHZLiZGCHmmg7ULHI+RSaZsV/2pq5VynEtY3IPpf/HIig4CwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c59e7039eeso772681985a.2;
        Tue, 15 Apr 2025 06:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722776; x=1745327576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6O/BJeErtsOvgZOv8LjuIOrFRcKVVensh0XWZV1Eoo=;
        b=QsCqxN/iJmypdaRloWlEsDE4mLeN+0/aTyY+ura3HzB92xJ2v/Z97vkiYJz1M7LRGg
         rW20Poe+QltopwOZ86vfao2PUYcOoOTPJS828mhoVMfsfwyBn4BXl3jYfOMedfv/qhSc
         6Ii2SQkxMwZ5K1ZKcNn8gMEBwUIMLAbg6+i7Gfa92vPAcEOYacpWAwUeH0cXfAR5SmSA
         t+TJqhXq6P1LXhkApwo/RfcmnsQKsTypMav5ugJ0hqB0z9UVAsDq1+8vYlxMmzft7sd3
         ATY8Ga1ofEN+OGZ3275HzGEM3t8wpYvyvwsYokNYEuDy9TacJJM1OO50aPYZU1IbDwgW
         r42A==
X-Forwarded-Encrypted: i=1; AJvYcCUPMv+oaYgL3umTQYIx1hNxhIfllxYgH2SqqRa5bB9xbljXfJxsrqLdxs7EzRx6+F5kii6N5ghdbOF0hm01@vger.kernel.org, AJvYcCUjjP6rRB7ciPJDCvS0t6pjJ32b3lxynPZ3w106Q1JNhhfd6+wmIbwZEqc/4gKMlvl+G8R/lSOgDTUB@vger.kernel.org, AJvYcCUzGUvJKQ5Zkbe4ejg1ScSyqoUUJz2g8cbw3l4jiBomVt2IrciJx4cLYJkc7oodXTkKEHucq1wtxWVI@vger.kernel.org, AJvYcCV/oNmG7FnkRaoQxS4028BtkVoOwTtN/AIxk1pTufLXDgHwVFZMXRKAnzqkGxvMPcmbsdXHSqBGYuoCJJ+EB6/+DZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMvA6L06btrQpcm6JojQ3CmZdDDunOAchKCSH3idIsEspOyhA
	0hF4bNbbdQIIuBhicf4bEWJcu9CJnn5JeNvx0W9Jq6qg3cYjgRc2xblCWWWM
X-Gm-Gg: ASbGncvbXZMHL24vGOoR4SdoBzOSWhr3UKxr1MFfQrY1Rma8AUOHoPGJmf+d14x86fP
	NuVs9T1uvPanNtdOjP+P2gw4Vc0/ZCMX6Kix4o08WujftUQX0GQHtThvev7qOKeEpEVnoSwUbSt
	CMHy2kKW29zY96NVteaAV+98IU2bLF2o+sAtRTUH9xAg6jnIeuSp2gNUamiFdedoqZiHuZYk14P
	u6vCegScZitR10DGbnMnMvpBe5u+KKjcvHYuhwg5RVv6iMgliE1vRa177A3vQosxtZ9HhYJuN5u
	dDqaRMrXz57ic9YBJcEf+8MlAwdxz2Dmsl0Fvkutjuquw62751XPYU3Wm075WKn0omjMKd3vMM7
	K05CXZ00=
X-Google-Smtp-Source: AGHT+IFvEbtlcTy7OAGj3TbDr6+RilAwJ+Rkk6nifb8AOWeiki61CW7bB2Rywi+TF5zZVT1bTRYkVA==
X-Received: by 2002:a05:620a:d93:b0:7c5:674c:eecc with SMTP id af79cd13be357-7c7af12dc43mr2364564485a.32.1744722775802;
        Tue, 15 Apr 2025 06:12:55 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dc9fsm906115285a.96.2025.04.15.06.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:12:55 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c081915cf3so693192485a.1;
        Tue, 15 Apr 2025 06:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPOfXtL+tD03krDWy5tjwhIfEVsKAjtcadpDcZ9/SsBpuEVRkLpnnytJFlhJIwSqb4rfdut+pNE03l@vger.kernel.org, AJvYcCVUI2HKfYJKRwUyVn2OF/Sz6qtSG0mElOjYhZHHkKfsb5cbh97g0iwDw3egj7Kui5GLWCcCm5Ut+ai2WjkQ@vger.kernel.org, AJvYcCWaxDWIwDMWiXMTAFZBYMlRWoUflIm1OjA1RhLFW0AWOOuYXAILGKoMGt4rTZTySh13NLITFmoN7K0Na2P4SdwFayo=@vger.kernel.org, AJvYcCXz7m9upCdlzuvtWp0xmWI60bxWtSvCLP6mNt0wsAakxmnmoNfNVGzgWFZyk0Fe/JRANtAoZuhW00ig@vger.kernel.org
X-Received: by 2002:a05:620a:f0b:b0:7c7:5ad8:aece with SMTP id
 af79cd13be357-7c7af126989mr2643432285a.25.1744722775107; Tue, 15 Apr 2025
 06:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 15:12:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr76BBXJJ-EHf3rCEAknsDCesn0AhnRcSHHSzpLk-6Ng@mail.gmail.com>
X-Gm-Features: ATxdqUH9HUes13_WK517nkwq-HYNdrkhCnl7W9u-lJtD6AwpRvVE_3bTSo20vsk
Message-ID: <CAMuHMdXr76BBXJJ-EHf3rCEAknsDCesn0AhnRcSHHSzpLk-6Ng@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] clk: renesas: rzv2h-cpg: Use str_on_off() helper
 in rzv2h_mod_clock_endisable()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace hard-coded "ON"/"OFF" strings with the `str_on_off()` helper in
> `rzv2h_mod_clock_endisable()`.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

