Return-Path: <linux-renesas-soc+bounces-20751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E9B2D94C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 11:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810163AC058
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D472DA77D;
	Wed, 20 Aug 2025 09:46:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64B281369;
	Wed, 20 Aug 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683204; cv=none; b=BvlY6tDmwOHdtXMTqXXJj6mAl+d5fmNvLyicUqoNH0Y6639XCGuaob3ye1/jLip/s8CpdBnKhea4xKEH6oZ3KU7d4kyozTTWCf1Hw8aTeIU/Z+mVxfAm5hTHwZ8sUvC5tKeiGpTak/QlutWawhT1zP05zNPLYlfr0i50sjGAl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683204; c=relaxed/simple;
	bh=Bogmh45luZk7f/wrceWZr0qQGxKbiHRk57vTOqKBceE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI93spWaPri/pYZ10Jt4E9haPBsVTwum/yf3mtEDIGNSt5oKCXw9taxQh9stDyZRJMPG9xBanfx5+yPzTYpWKZi3RuJzCNuFsxbFBlPLXItceCqbfsjGxI+CjT94NPtj/qriBKi4/N59wTymz6pC76+OpBwiHLh1rF/JCuH37pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-50f861e18cbso2305833137.0;
        Wed, 20 Aug 2025 02:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683201; x=1756288001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcEaRArYv/BgkTzE+foRpuqvMlKly3EO/m8jwQreMS8=;
        b=BMlrDqBP7gbw3v2Li3+1FSTTaD7dm2CLFIv5Sf+v3MPiVcBIAmg7mroks2CwhB3cx6
         6bTN2uuPpoQsk0mE2SNuyQFZ/a7rxX+j9WLpeNc7nl6pB+JeIqsa6x7/SFK8+tVHVst6
         C0PTrUlh+wC8Ub4YVvLl30rY7rRDmbho3nAXPR3abfujunHxINIP+2KBzPtfpuNrf96n
         dvSgcVj/IMYvBhuI0KS1UIjTeByBn4Mj42G4Sj7WgK/c8+KFUVwkYmsxKWyBMv6sjgF3
         FnKIDkdKPdXKgeRX0zdx8CoPER4M7tqWMGabJnCrt7FLLpVmGhZvhQ6gHzD+MUgUgetO
         7NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUstYFSFxxz5/NHK/mk9vGMACZ5yRPIrDSWLwmN18VGwrVn5u8qp93cjgXiGvkaigYwpRHQquXa0q9CBrW3@vger.kernel.org, AJvYcCVPVSRdqiGs9VbHkbsIZiKpxmDCu1VnltU/oQuORWpNwLxhL+NGEAwNpXGB0btvS0O8XpolJncsrCG6iwGH64ObYZo=@vger.kernel.org, AJvYcCVlIku3Y2Bzcez3cHrWELvz7JY0Kewi7R+rjypcq6vhFGT631C+z5aLolaw0JbJCU1n1ttYzdS1Zblh@vger.kernel.org, AJvYcCWmq46pIu0K6lkWG7gocdf/BIU2uo/248L7f8oke3HiwcuTVe5T+kVS4AsAAxmZYTGlqg7lV8YMvsLr@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmOhH+P/8PUjFeYZHb37TQUT2v7hFZ+cZeUow3zqU0MjMc+Mg
	b//E3rQXU5G0EhmMwACDIwEkTC/amlxCOVMLu9NWdgqOLHASYrGKBkaB6UW/oZ+b
X-Gm-Gg: ASbGncvukJsf+2s2WA5H4Kmce9lyOf+kLC8f0VhUD+IoJAZtfvUyNQoGCD0p4flFijo
	qEWjX1Xjo4eEXWxStXJ/tdS3nniKVuHaEm2l3H591ZSdTx2VhsOinH2aDltshZdaBOjuk0I+0Q0
	6wG/ar1+6PwI2eZCBCwnNP8iKlVGM5+dVQtWxJIAxztjCoLQL2KP0WQdjEqVi7ZJI3mVfzFIAl0
	TyxlpIn/j+fYRkspOLt9I6rQsXIwjPk0xAomBif2ivp82mZ7OLuL/6Jz3b6SCYX18h5i86fdMJH
	a/H1K46GOpYPUnG+t/IF04PouV5XeRiu/1EUC/8sxaRPQot+TL8YuOpzJt2YnubVxLLtpTcQwdu
	YP2O2DQv/E6CjBGXxoNH2hx8wGvByZJ1SuKAisYhmxz91VWaw6CSfB39XU2aI
X-Google-Smtp-Source: AGHT+IEUWdEl4cvCVZtLVNt3hgdnh1m2MwjQWB13nr0brxsvrNiApHpVMx5muIfOMfPIEyaXDT1sJQ==
X-Received: by 2002:a05:6102:83da:10b0:4e9:c7c8:5e24 with SMTP id ada2fe7eead31-51a511a2c1emr436012137.25.1755683200740;
        Wed, 20 Aug 2025 02:46:40 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127d4dc422sm3182591137.6.2025.08.20.02.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 02:46:40 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018ec3597so3674682241.0;
        Wed, 20 Aug 2025 02:46:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQIGV259oEWLf4P2luW+0c/93547M5EGR/bwnWDmpSIxZd7u1dc3OqUsFex97+S7F5ChVg3vN4+219JC8E@vger.kernel.org, AJvYcCUVB2P5J0BMP3BcaqTUF54J6gOgA3Xj4LlMZ58ovSGsAmZ5KsNJ8TlLkeVQK4y5bkOebcExL8gfq4kc@vger.kernel.org, AJvYcCUqLAtODGe+EKOJYal4R2WPkIrOlaSyGDtSHEwE/7OPTfEGSfHzn9bzRqi7Bwi5scYpgNTDSwAh9aJA6LMsIMbFsk0=@vger.kernel.org, AJvYcCXgLfihgIoGYC2Qd+GIw5O7PVW8PZRr6AXan6FDtzYldS9/gtjPbnQO0pmL5DQzRe4Y+LPsQdjrTf+i@vger.kernel.org
X-Received: by 2002:a05:6102:b14:b0:4fd:30aa:e6cb with SMTP id
 ada2fe7eead31-51a50c82849mr589032137.21.1755683200318; Wed, 20 Aug 2025
 02:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com> <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 11:46:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWipx5FRthdfveqw7i+33RXf5ATY=xJFZQNV7O7GzLVkg@mail.gmail.com>
X-Gm-Features: Ac12FXzZK3tq6JNAyNlFgqE2SjUH5ykPbRt43RvSnkuEMQ4S62djLNI-OkYseQs
Message-ID: <CAMuHMdWipx5FRthdfveqw7i+33RXf5ATY=xJFZQNV7O7GzLVkg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add RZ/G3E GPT clocks and resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 17:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> I think you are overcomplicating: according to the clock system diagram
> and clock list sheets, gpt_[01]_pclk_sfr and gpt_[01]_clks_gpt_sfr

s/gpt_[01]_clks_gpt_sfr/gpt_[01]_clks_gpt/

> are really the same clocks (the same is true for rsci_[0-9]_pclk and
> rsci_[0-9]_pclk_sfr).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

