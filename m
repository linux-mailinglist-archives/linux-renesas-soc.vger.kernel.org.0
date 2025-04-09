Return-Path: <linux-renesas-soc+bounces-15663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D510A8248C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA2B17424E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BD925E465;
	Wed,  9 Apr 2025 12:22:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000325F7AE;
	Wed,  9 Apr 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201351; cv=none; b=Kpxl7CtKOX5lPc+uAhasNculkBJ1ir4KKoB9lVgHLIPoLMz0u2xQtxgCic6v5vgf31nOSfhVSO7cXUBmL8V7A0ol2jtOt0jM6qP7rBYO+OKs/vC/6/ZNTVFcDQR5iKGjMjGVd7Z1BBLhlrnio7Mub3GmJwBtifuZayTkICX6IgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201351; c=relaxed/simple;
	bh=LE+y//3PoHrlrUwskk7lkzy167MR2m8QvyNq8JW+NeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/77GKpzxXjvslbucwlmnd/4RS4WN6SG01s/0pOVygAJ0ehOhBPKVn2IK8pG5MQ8qNfUwlRVuWr1NZ/2uM826iNRpHlmBKMvsx75id4DGDusW4ocKjV7jeoEaKwn+AmOfjvzFIQGDVQz7oK6KPh3L3yOfSEGsrCWFAycm18Boj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so3131346241.2;
        Wed, 09 Apr 2025 05:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201345; x=1744806145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJL1/IMECgroxe4ixu4JwJZG4/o4g+ajZJq3/oMKTKk=;
        b=WxcOzuj8JyRkZtR3DK03te3742ldxiZPq7WDuq+O5bCy6Rca3RK5riDaaubRaw/z4Z
         5E0Workdw8wT+YOlPS6BcLyM7OiJCq2Q4b9aRnuzajWx6EAIhLFukSY5cC54DkSA8B2j
         Rtx1lSlHc1Jk0WgB0Wq+IRX6J3y2Ly37LI9VObk4JpyccEQgAIyGpKYdqLDxdQc6/gX1
         1nrCoquWPxpZLyJtGJbZOyqVrH+fCZK+9dbwJM4cr68irYxNqlbAKWYaRbox8V3kVRva
         /gNTHP/u5iOedl+g/EB/DKrrJvf9O0Y7u3IhD354qmbIb+j35jDk5wdER90HR3vs/ulS
         O9xA==
X-Forwarded-Encrypted: i=1; AJvYcCVst504BPQ9olDDPeh34q7aI1+jIhadw/bXszEVquD0EQ40onZ0qoaX3VBBZKEWNkDum3Q0ICZh/T0bxMsoTwSZAEA=@vger.kernel.org, AJvYcCXnwaZrPQ1z2WNuEPnivSjBxb59Edn/tPAgPDgcmFdWlkBqLCDheedHND/wV9H44JzeP/1tyN0afST1fVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNxg0gXbmqTiTEYu4YRsF3IPrvFoH/ByTHuMWx3MgAAMtNlxZk
	UmN4lWDy9FWAwYWaSOJlBrN7B4Ky6YouXQCh+QfHAuFazhszNS0Khpz6h0SnVLE=
X-Gm-Gg: ASbGnctrSXOdvBL5xtZvgG6MqqJUMr5DAJrHS5s1S7XAmMB9JvLMtiBveWbaX9KYvBe
	QhydCa/Z4gwgzpQV4epeypLAwCJ4dQh4yFnByRq+9nuZbC7DmMatyYTpVGvSDc21Udjdw+eixnX
	MT+p6j3k//SqkdZDUT6xUTK0wqt3Qukalgxy/pEKhWonXvcIy1S6HrdkWMHzz88Ys5gt5fdF3N1
	+SirZI0fJH67zTN3Vw3YYtCePs7hYzg6rhkX5sqsiNDqhO24jghG/ekkbXEIok9aNUyifFar1eV
	xA9FNq+fB548oUcbI7Pl0c1T1kBxmrX2EDXg6Ql8uMVAv4KTJEyQqot6HJbmhVndNX1DgoJpMHE
	EWoY=
X-Google-Smtp-Source: AGHT+IHgHLQu4g156S9rnKAS1tI3x64i/vIebdeKOkMW/WKDgtKpLuOwPFeyCiNBsdoemdVdVy6hJw==
X-Received: by 2002:a05:6102:334a:b0:4c3:6393:843f with SMTP id ada2fe7eead31-4c9c415fd02mr1987753137.5.1744201345387;
        Wed, 09 Apr 2025 05:22:25 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875571373f6sm205045241.9.2025.04.09.05.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:22:24 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d3907524cso2849299241.0;
        Wed, 09 Apr 2025 05:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTXTUGcQW84BN4J8ORfvXjrVizxNvDr+5ARoWRginlxTBwp9hB7/WWRWsfx2OHKdBx6qQNfvQfYPmGcHfhnqPW61w=@vger.kernel.org, AJvYcCXlLrtN/Wc5k3kGjAbqfBk2cK7fbVesoOA93EtIoKZ9czv0ysCmy8UEr6EjZee2A/y6TzdiiS5kmJ4Gl9k=@vger.kernel.org
X-Received: by 2002:a05:6102:f8f:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4c9c4160c95mr2421085137.2.1744201344054; Wed, 09 Apr 2025
 05:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxoLOsAi8qtARhq6Z-ju7pytBonAQKC5Q8XKvb_YRPTw@mail.gmail.com>
X-Gm-Features: ATxdqUEiBvOMzWpw7V5yFKH5RLWLxl2HUDIyxt7xDP5_uWVS4Ux4gJsD7QM6m9g
Message-ID: <CAMuHMdXxoLOsAi8qtARhq6Z-ju7pytBonAQKC5Q8XKvb_YRPTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] soc: renesas: Kconfig: Enable SoCs by default when
 ARCH_RENESAS is set
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> Adding default y if ARCH_RENESAS to the relevant configurations removes
> the need to manually enable individual SoCs in defconfig files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

