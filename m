Return-Path: <linux-renesas-soc+bounces-20239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E9B20A75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238E77AA3C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C312DCF6F;
	Mon, 11 Aug 2025 13:37:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510191E990E;
	Mon, 11 Aug 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919443; cv=none; b=WOl1Yy+pQAJ14QH93MypgNRi3+Qm8P4eQFQ8JAT6KU1szVbENFGFx8QewMEI3qfcPswVbH9DmWYLuWq0wnyom9YTrf+VJnE5XY+1sm8ixcCaN0KHLyJrUs+HclTA0e7UZVzVXe4vb7GC6o2J0OlEC2afAlCJ5ROkitt/5/QIGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919443; c=relaxed/simple;
	bh=yplPJ09NWTQRjPCjxjd/qxppswXCjsdYoDra/TRx6FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ll0s2UsJKNO918WYQ3Br79ff/sDh5jW3ASMv7SqXMktBuguyasUDZibrSn36ZwFFjK6rJNYTFEoaoiK85xXraMnTdCT0vyHBKvu896oC/iKcCNUViGzc7jTNIhy+cR1y/2UqV1Ehw7UK66rlGqcbSFQIeIWw1jW4HmjQXOOvEng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5392ba07940so3049938e0c.2;
        Mon, 11 Aug 2025 06:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919441; x=1755524241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwAoqceBHOCW8zc7TXGv0WQs4hEFmPde7F4BLd4b23w=;
        b=h0oC/Ib7pjyIQMnQkUAL0PAs8sUnMObxto8QMpusDxVdi54hMgZMl1Aqxpp0DD57vF
         bqDiembtemULO3z++YI2AJDoEWMIuBJPlyT4xG292GWKYEg8FNRzm36Q96ZoyufNs+4T
         JKkinDvqtpVgWkxjHC0vMKUY8zbbceLPgJTzGHXuK1XuEApr0zZJnTlsSA4Dth7iP94d
         /oWbl5yHR4Nmf1/1weGcE2zE6TJQasob3r5+C+yZEPpondMRCkMOiMEihNsTG5rS8m40
         cHkrEUwWrJ8C53UOsrq1bEk/BV6dKU2pO9X6q3IOWVjhiLLjNyQ33PSR56sIdis99gJC
         X4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI6ICeOgVXruVNSWyEpnjxt8915n0raOqm6JAJhSbdblg9Csf0/16/8ppzWdvLNp+xhA584YO8ZH0r@vger.kernel.org, AJvYcCVYHiIev+fcGmf6n6OwMYAx02+KutLFGlpoBbHE3rpWrQZdo7dSq6VoIgrzqfWL42C3hdiDgo+sGgmW@vger.kernel.org, AJvYcCVfeeLxSi+MZA5cs39Yy3C7X+gtkihRjRCg5odnK7nXZKpuykNk9En2jZMOPskTDxwgdAppwL6djjJLnolIuROUJPk=@vger.kernel.org, AJvYcCX90s0KTymaJ5c13p1Ui1J1APP8yLiHnxt2G9FQI+8uCOmuD/jEADFysTLjonbH7xmufMRxjrIiygT1/tKS@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLOH+6UL5DsTULeKjY9QMwIQnwtq8uV4E4dKRN4SzvjAdix1u
	kS9WTkGQ/nKLHUyykjVBktjfA6nHmGZezyB/rAP3YwKNm7JhmhLVNqjxB7Dc3Lkz
X-Gm-Gg: ASbGncuaLfbio9+FQVzfu3mmUnkrZAhlA4WnlL8rn0UN8JZRBpJJ2ZjECD/X303MTJh
	wLVYbk9E+Y3JxiKesRaPyGQOJJvBhcw5GD1H9LhHLKvEpUqqoyi9YEZSfrPTC5z84CREEjhnBHx
	lFGwgebvBPxikwXA1zdeCdl+/naXlMUg3pjtSAlNwMaLFx0XH/QNGH9zvhJV28xy/LmNZua5R5i
	m4YL8wSUPtGuv3tF5AQUpNzNw3YymzXS6Jg82wKabLwupHDVJzebCXo6s191+fhypq9Shg/TllS
	1TwsEz/MRituSexJgMRm5EOnisLIhN3pPmwVKvD5YUALK0TQojzMz4g4pKKc6V9PiPuyB0D9JyZ
	k/dp9w9s9FWckA3SUgI04X0VQzwKUD39vXp/Sp2THitrLfu7v3UQocHr3pmAG
X-Google-Smtp-Source: AGHT+IG8pddCAFC2xUjfZt3wG8PI+wF05z3jBVqjWT3Uor2fhR1pOlqb5OEq4N2y0TooeJss32zwIw==
X-Received: by 2002:a05:6122:1da2:b0:539:58c2:1e0a with SMTP id 71dfb90a1353d-53a52d9e73bmr4909058e0c.4.1754919440891;
        Mon, 11 Aug 2025 06:37:20 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0286c1fsm2643507e0c.17.2025.08.11.06.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 06:37:20 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88d89eaf08dso3547328241.1;
        Mon, 11 Aug 2025 06:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy1VSM810lc+9MOom/GiSUbVBIQJDBDeTkEhWOlVO15cEfzYEISGxH51si+uDmw7sCMvwb1WsyBZzQddJuc8wtYAY=@vger.kernel.org, AJvYcCVFndmOvC7U9qmCOcrcPkrXOTClP7ujpxc9yCvbIbAsI7uqlgU3dCLb9p0hOGlNOYCj0QKdd/leA5oF@vger.kernel.org, AJvYcCVuabiNFxfj2Vxg9Jj1mWx8pGMUl1GN9u7kIWdqVgE0Amh/JoGiKI93/jlJywvWmsxAsq41yfpJie0mxJaj@vger.kernel.org, AJvYcCW12+eLqa4lfIuv1ceMOOm+mTzSrrekS17QKf/bJODFqxT3B2IBiuLicgOq+pu+8QCy3B6niZ/sPnQF@vger.kernel.org
X-Received: by 2002:a05:6102:800e:b0:4e5:8eb6:e8dd with SMTP id
 ada2fe7eead31-5060cc8f40emr5137480137.5.1754919440230; Mon, 11 Aug 2025
 06:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250804202643.3967484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250804202643.3967484-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 15:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXztayOXvnRRLZYiz1NXwBLMdjRnz6ow3xB=BA-a7jc3g@mail.gmail.com>
X-Gm-Features: Ac12FXzqDD3Q1ZilHzmImgQmThqAClTDrBrak8VqqPgT90wTiT1sZVY2ihj58PY
Message-ID: <CAMuHMdXztayOXvnRRLZYiz1NXwBLMdjRnz6ow3xB=BA-a7jc3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add USB core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 22:27, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module and core clocks used by USB.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

