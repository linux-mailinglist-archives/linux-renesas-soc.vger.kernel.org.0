Return-Path: <linux-renesas-soc+bounces-18545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54CAE09D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD1871896285
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9F928C01D;
	Thu, 19 Jun 2025 15:02:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD48D278753;
	Thu, 19 Jun 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345378; cv=none; b=hGjbMy9+IlX8XUVG/dcSMvD+bCBgiAN5ot+sDzAii6m663qUmwYY6JoQ1d+LpVSTFkgGfAfc+9iyajgWI76VDO4ojgv7Lg4hSUkzu1vUYTH2zlkvz9Kz2a5Z9gGcdfkD3ArA9ZUR9437f/Vr+TysoDD8qwnKvCVz8Cmr6HpmM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345378; c=relaxed/simple;
	bh=RZdKmwAYY7imBmJLWF8MjcK717lFHy84D0us65hNstE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZP7W6yKQ39VyTegwkS7qqIJUyg0nyc4cooVfDmcHbHHp3CTzDcSDi/BvUVmb92qMGP0IaNjADk5JttaLCz5NDCW/ZjQ5ebBcE5ZYBPH2WDYXwslJQNWJHxcHvet7KGPXJjJjew9rNMFP+YcVqcVp3lODUrjLUP00GK3YnPWtcmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60ef850d590so255230eaf.3;
        Thu, 19 Jun 2025 08:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345374; x=1750950174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByHQ0wiDuVRQubGbA2MNNyAZoR6I8YWpoU2tjedftN4=;
        b=S6f5w8puuUEB3YllptFtrPpv88HdADX9gV3orExYFf35pM/MenWyy3PWcqA2ddRHWi
         qXXHdDUkHrt5XQfmFqfkUk2xRXsgKbpK9moBc/s0Qi7WaXqeps2TNDHuCpe+GaJ5R6D+
         gEfnsfQOOh2b3NPBm5aAU1aJAzvsgaW0DIpPTI/p1x/DC9I85paQcq7ZyZgj6ae1tfch
         +3tOtdjSS19DnV+ZknlxjGC1VVdSndU3mNxm/ecQhbTWZJMBfZYMorIX/N6MDVy08npy
         zXig+0CAdzM8ZJAkeRln6sCM2DxatVfPlnExSb7ko85r3bVoeMiFPzMY0sbNg93kmypb
         izSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEKly9Aik1mFDWI0zjrmFL6b7ShNOO3PNN/kZD49JISE+y/dBHpg4BMx9hQsZVzf/A2jt/J4OSJYtkCH7E@vger.kernel.org, AJvYcCURYdNIMrXhj1T/0jfVgO50IRaTM0M4GwHVnJbeArPhRKX5jQMvMzMzPCN2bfKR1PGVDPuX878QD3BhMmOjoPP4yps=@vger.kernel.org, AJvYcCVfYrCNfxXM+mdImr0Q/K5wOKwQH3HOdQTzFcBtqfmnDhyPrSo6P5j0XepKz3qaN3IT6BSd/vv8fLNt@vger.kernel.org, AJvYcCVywjevPxN/WShtCP7SVO51F5MKFkRBSzzmYWHlgNjqXTUKzGLIk6Xl2jeM4OLMuqOpEh1YlLgbY2c4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyIYnBF8uRnzr6b4Wv0MghxzXAFOqueNcOgjXWK26zmY0uMN5
	w1SnoYXECiQ5QfpD2urAzDSiJvQsKoDgZdoh4a60rXNmA4GerPnL0STTXZwS7fPD
X-Gm-Gg: ASbGnctaFof2HPt7zn7xpkXn/RC+mGMPGsFpDCCHy+H/rwvhIP0X79iSNFOTzm1taO6
	FZnGw+42fr1eWqakTxwD33NhvUFAP2ncyCERLwBM7zlDavIsccnnH5Z6EIdjVyEi++hQC6miTGp
	wr1I4BkGusVnv5nSj9ziKLGaXp318vXGwnOC+yCqJk7XwVjnRWk25CZFo9zX4DDCrim2ACwwSoS
	lIX7IGfst8MFyEzVegfi78kgQ1bUejiXkKQw2wIAaduFdSZ2u1RCVUKN/F/uOvVEh9JYZH0rXKs
	/L3VDR9wmhMHXGAJZk8zoYaYHheXE/hw5UYOaEGxGUO6MIMpWcsMJjtoJRthpLuG426z3jEvol9
	xRE/uINplWgK8LLLcnimZ3uYg9xPB
X-Google-Smtp-Source: AGHT+IGIysmLC0gzqGgfmiPedVwpeGxYO0PmKUEoaOjpK/uVEBZUZ+lJXBrYz1xJ5gptez7r1wirCw==
X-Received: by 2002:a05:6870:8998:b0:2d6:6677:f311 with SMTP id 586e51a60fabf-2eaf0467d8dmr14038351fac.3.1750345374006;
        Thu, 19 Jun 2025 08:02:54 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba5c11f38sm376454fac.4.2025.06.19.08.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:02:52 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-404a5f4cdedso213147b6e.0;
        Thu, 19 Jun 2025 08:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3ruHxaxnCPkXr0yXHQRRqn8IEr/jC1StFesUZA7X7U7KeNx0wMNGhVH21t0L2IHNDGXEXejozEqux@vger.kernel.org, AJvYcCVgtsdTcHZJYItT3VabW576EtfICZxa+f3AuXaIUhbNMHudOmDai7uR467GgwLAp1V8nt8ru7vQ+36jiGWh@vger.kernel.org, AJvYcCXbVmghsCcCE7JUOnfcnwVmrXKpTbuSvVqTMXqLxWlLEWDXDTgG7zBuW+TRCNFa5QPCCTVgUhl2CvItQRmYczOpWZA=@vger.kernel.org, AJvYcCXmDZlzpJUjGkZatC06TyDcPeSOynUJiF99RSICrbDjlXPTNIJaeJ/GRKkhDn6h/kAcwZLtZDtK36KI@vger.kernel.org
X-Received: by 2002:a05:6808:17aa:b0:3f9:aeb6:6eac with SMTP id
 5614622812f47-40a7c18b1e6mr14229987b6e.30.1750345370914; Thu, 19 Jun 2025
 08:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617155757.149597-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617155757.149597-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:02:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7SQ6ghJtYXX2_HWUeZN_5jsPEE+jWPJ2VGnf0-zb95Q@mail.gmail.com>
X-Gm-Features: Ac12FXx7qbIwmeeY9zLWZFjRAmYWBFwIf7BIOBd1kCwXxWbq0owKxIduJ-3y02M
Message-ID: <CAMuHMdV7SQ6ghJtYXX2_HWUeZN_5jsPEE+jWPJ2VGnf0-zb95Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-mssr: Document
 RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the Clock Generator, Module Standby and Software
> Reset found on the Renesas RZ/N2H (R9A09G087) SoC. This hardware block
> is similar to the one found on the RZ/T2H SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v1->v2:
> - Updated commit message
> - Added Acked-by tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

