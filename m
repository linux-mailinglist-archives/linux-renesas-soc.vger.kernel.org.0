Return-Path: <linux-renesas-soc+bounces-16019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20501A8A146
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4753BC044
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B0C296D06;
	Tue, 15 Apr 2025 14:36:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B42951A3;
	Tue, 15 Apr 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727809; cv=none; b=d/M71ZUtWukqETd0/OYkBox/JHGT1OIFF+JFuJVbxsS7cV3rZCdUQ4MNq0D/DuMfQKeGrOGF5KFcehrwXmUV6V1HKuV0KoY5RTh7/s54391qH2txBEGLfKwZetY3Ujz1qZOybC29TbV3JlGMg3pDCILm3x4umnmfagKujw1Bcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727809; c=relaxed/simple;
	bh=qgb2fy84oWVViAYfZhu4OkYw2QBHh+XKxmUMcd2kOU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXPWCGexU7wiiToJH9lgyYyPbj9YL+QO69Q5SHES9qcGCR7NDYyAV2RSEBNE5nBULOB3b/cCoVEoSQBxzcM3gFDCuUZyBMJV5O7bfEiGTny0W9y6iToD8d8M4rlHKNRLw/LSXIMuRxK3CXIxBbQ8EL8cdpsTAMY+czFgsxuDvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so3117831b6e.3;
        Tue, 15 Apr 2025 07:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727806; x=1745332606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SP6gcbjk8o+TVjvRfnAMPei1BEYHo12AKJJ4XxEZr8=;
        b=eFwXRyVsEpisra6R+SNDz//lnlDbm8YChU+EMqJGJ8JurQHMvB+CTEHC2L/JTQlQag
         ffBJtp5gDyH/kLcqX1olQxvCkkd3lEZQKqNy3t+RRQTta//M1B7zrMB3nzR1QkNwJvDR
         nDBCo6Xg/c9Y3nwgy43JNBO72LJsOU1LpyRg+8/gVEhg9leecaIWAQLJ9AkzxHGb1UYs
         PfKhJGeMvtw8snPj1Tg2v+29oTRlfVGhzzz1AGTFzwA7f+4g5BkeKw4NRw4Ouq4vndz3
         kMsPplvJ5GIBOCPE5YB8QfwjS0sJcU3P2b6RaKBppBFUlBWwkE07CaEPEOQOJeW+0fIP
         6bIw==
X-Forwarded-Encrypted: i=1; AJvYcCVLCyREx0l+4Ltch58XpUqkQzmnCMW5gbSvMGxSROAp0meHchlyQEJV3W1Nz1fd55iS6Vv1Es7+1hXfYvrE@vger.kernel.org, AJvYcCVWIBG0dWVwEQoB1kl6esarb1WR88Bvu4xvsxZ8qQpViahUoP3OKy/dD6p3+5dLc5iiA0j6/i5NTWN8pGyMxo+xQQw=@vger.kernel.org, AJvYcCWKcOvuh1RBUsKVlwMAj3HfuOhlXl5m8KkFjGYiOr8o8U1i3fiFHAUuuxAhmjUEAMVLST0zW//1bcQD@vger.kernel.org, AJvYcCXcla6PxZUudpNAMDyEp3cOiOYfIX9XShmUmN5zmwHyv9sQfeRWow74PjZm7RYdPoNC4f30wOBX59Is@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7K4/n4wEI3SCdPvpce1HAymzeWxx5mHsT7qBmeuxamFWBOLlN
	TqlDevm7I88R19e+dcHTdRzk242ay9rcyqOz8UWb8c70U5abKH3CbWA4XNuS
X-Gm-Gg: ASbGncthnuC9WPu52ShjAMrZYJ04l+rfeXshmJufhO7LCPpr5oUauw245hYEKEdZWwA
	BSx7jZ/JtkubkrJwHXb7J+QCZ4zor8WeqEF21OAt+N2IMOypYUviEXjOjBQN2Gwvbn+r178iw3y
	WmOuv2LEYROf8hCTwqoqvuUonF1lUE1X9JU8/RVf74T+u00NncXEeIFP8r/doxl7C9E1PRzR+/O
	RyHmRVYPDUYZJAn+vo2idQ4ECa1OgnDwTOQztGgCB9B+D9EMnlhYnQVDlVjhXE1q/fWO/tv6ZgG
	0X7yly69NFAg3XKz6xTrbKBW7fWav91MNC8kdJuTN4ZPS9q+paFt1q2Vc/nAfcPh0BbPVJrgbsf
	b0gxbCPo=
X-Google-Smtp-Source: AGHT+IFq5Ax88Q+zLKP0KZRnfQvuYjNmjeh3AGeRBulIjcHXSghvJWJzNdc/JlPU8XRjg6FZoSrIog==
X-Received: by 2002:a05:6808:3a17:b0:3fa:53b5:6f87 with SMTP id 5614622812f47-400850fd8b6mr10496175b6e.34.1744727805894;
        Tue, 15 Apr 2025 07:36:45 -0700 (PDT)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400762829f0sm2308561b6e.8.2025.04.15.07.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:36:45 -0700 (PDT)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3fa6c54cc1aso3324910b6e.1;
        Tue, 15 Apr 2025 07:36:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBuKHNQoZU4IFEZDRq/y3fMuqmtecvTwMzj7R+Esou6B+TJQjUkxJTDchLthKYqh3fHLtWA77CNdUHPepiPRcVvnc=@vger.kernel.org, AJvYcCVBh8YBNRkvq/tVeWJEdJ0Bd6+jrXxLjJHINsl3JLYuVpJgiTwB5eH5xCeLjswOZY/1mjzJoGM6aChaQLTi@vger.kernel.org, AJvYcCVnwOxPtylmnSj2qN1vfhB3ptDqdMwIsD2uyxFrNXRuafv7cCfpONRjWC+5V6+LONLlwqaK84I3JniP@vger.kernel.org, AJvYcCXeYCIT9B8b7OJs+Xl4O+tSzSFX74nFb2frOPSCxkhe9eFAKzBJBKv1iTWZ5GkvfSimo1RpXAoxzc3w@vger.kernel.org
X-Received: by 2002:a05:6808:3028:b0:3f8:498c:9ef4 with SMTP id
 5614622812f47-400850dc1e4mr9993469b6e.24.1744727805011; Tue, 15 Apr 2025
 07:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:36:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULcNHH95MyhHRS+ES4V2L+d4ZV+qd050XmmxCZmRBLxg@mail.gmail.com>
X-Gm-Features: ATxdqUGnhNZltAa34QDqWV9GkJ1R0HqyMUZhpoT4CXrhKCtk0-uxt0dvZbTOC_c
Message-ID: <CAMuHMdULcNHH95MyhHRS+ES4V2L+d4ZV+qd050XmmxCZmRBLxg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: clock: renesas,r9a09g057-cpg: Add
 USB2 PHY and GBETH PTP core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add definitions for USB2 PHY core clocks and Gigabit Ethernet PTP
> reference core clocks in the R9A09G057 CPG bindings header file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-devel and renesas-clk
for v6.16.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

