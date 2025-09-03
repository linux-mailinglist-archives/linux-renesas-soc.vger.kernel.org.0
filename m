Return-Path: <linux-renesas-soc+bounces-21261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D285B41D9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3423C54717F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D4D2FD1DC;
	Wed,  3 Sep 2025 11:48:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77582FD1CA;
	Wed,  3 Sep 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900139; cv=none; b=EMbrkAq/SrkOEgAy51JuyR4sTlk9+Eg1QvcBphPjw7NcSPyE0qVdnZDEbcEgO7d315guzsdmg28zM02RN7E3nk8WXr5z88mkdkWhuN7n6au6cSkleJ24QbOD4/Bn53LSrpsPwMLnY4VqS3tgQj0Cw44STrnIM9+Pn2J9+b9vVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900139; c=relaxed/simple;
	bh=55/5j4UazxOwveGXPaLNO1GxUji6YgGwUjx7lsM72SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ce7EBGJlrW5lyO94fuWTmk5cHL3VFdCQ2a1vy4ZfBsJEuWvAL5r+V4YjvKVD026dXmzw+IUuYBOsgMq/e6aAcQ8heizrZ5RhwNakvHEGoY0zqG08mXhu7zrOrIB53cMMGhOcC2XmzYXo34SkReyejdXp5LRTvukB8Rrpl15DNHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso4524235e0c.2;
        Wed, 03 Sep 2025 04:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900137; x=1757504937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whShWYRu1M3qYjMIPjqnGMutmWvE7cOhkH/kIfpHkfc=;
        b=Iu3SGjKpmLeqj+Gfh2kpI+9EnyoFsaHnWTirVk5M92Efk5wXmBSUdy6PnxvRhttEOR
         wZaoqFwLUpj9mzpNcYUcDjDJBMb9Dx3SWfnBqJ3RU+O2dEDsp0iYhAkI5KMAb3DZG29B
         XtzXp52ii3q9seJdEqAQu4nfmJooYmilSTF3PNkXwZRDur46QgVsIZtBbr9Sj72LBaIx
         +I1bMMnlDNe5meuuP6PzeCtAVpNp/d7BH4z5j0h/Aa22OKFcMGynMz0NHL918lCSvDHu
         nnJUD3oMwkgEXtNt3B6UjJPrGRzoPZ66zBg3i/1FF5AXvnvdUHq5bo1rslI/qmAJfIEm
         g4fA==
X-Forwarded-Encrypted: i=1; AJvYcCU3WIoGkb0Dh4pt7dM1NjGX5ohRHyCPY/Mss6sLrUW/6lLXx8c0hQFXJ98CijZGfYNdsYL9pvOb2PNizsSV5GOEgP0=@vger.kernel.org, AJvYcCUnGjYFze8kw+uNmfDV8VHWma7c/dHLLw8h+cFIvauyHPwElDuwYMY/SkoTmXJc1j12v1KxQxawKReC@vger.kernel.org, AJvYcCXii5DMkZ+PZTa0Lry8oFj2mvBtrSohUBYBjooVKqWLt3rL4Oxc3kYo2hiXMvnT7HbR/tVLjhkeAs7tVrB+@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmScWPeNkJOgmZIH1+A2wc7gMzSOH/gSthhy2ROHvWwm7l3Im
	T3xEm5+O6R8QCSBypoW8KTy59je5tek0/QNiHSdJq9jOx692Z1vNcLa4GhqDaDmR
X-Gm-Gg: ASbGncsbW2Wxwnovu7RsHsdeIBR+lqjYzzsta/+wvi6A9QAjUSujavui1JZHB45fW5p
	K0urkEEu2Omu8vH/45yEN0BhEbhr19fNq7E/6o0cr9IKEQ6wIFhZILglNPmvCJlzV0sps5mfEpj
	yrmn26w+GMJINsYGHdLik9ZPrVsTxP0VsNEKC1fc+mXBuOuBvt54Q1SNcq9f63j3YMRPHUjK6e0
	I0uLIiwQ/4BaRND4eVpJYEOLPGDuKXocPeJ6tlPrD62tL1RMnPkq07LP24f9joTa/TlxR3GM+vz
	5/1nKKNLe6LK9kKWTS6pqASxY5mF2sXVWzOd+xkvftzU8SVB5bFeJGBg9gcN/tNWeuz3B7bPXwy
	dr9aAPT9Ai0mt3ujGxX/vCEuhNesU2dxEF5tHX6jKJLz9znq5C3S0eGLnRHgJUI+KyrWMB38=
X-Google-Smtp-Source: AGHT+IGX7qDcF8mCQ+SXSSzs8UGcNqlJHxoLgCJ8IRFSr8DhHDfLkNSivF0+N7Yun4GByfMS6Af3Aw==
X-Received: by 2002:a05:6122:8d2:b0:540:30e6:f943 with SMTP id 71dfb90a1353d-544a020b091mr4194101e0c.7.1756900136723;
        Wed, 03 Sep 2025 04:48:56 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c6d3bsm6775866e0c.6.2025.09.03.04.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:48:56 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89018e9f902so4121174241.0;
        Wed, 03 Sep 2025 04:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb3bjw4jcp7+BhQjUc0m/+Y1LBpwkHzTqBm/hKiMBgQeGtTWwhNzKsjyg66hE6437leRT6FNIgqH1g@vger.kernel.org, AJvYcCV9eU4NomT7fGo/jX6cGpTp1tpPvBX7RalvSikr8zyMvmvJ4nwV9Lhs5f2DjBJsz1QNmrXu7E2nVFIGMhgW@vger.kernel.org, AJvYcCXyenMrJbeqEREXt+GyKlpaPWrXIlO9PMSZN474PnBNgStrqSOdovPN9IXXNIiGRWcLCmBWRKr6dvXd2ekStYIz9es=@vger.kernel.org
X-Received: by 2002:a05:6102:6d0:b0:527:4938:9e32 with SMTP id
 ada2fe7eead31-52b1a375c96mr4918347137.13.1756900135894; Wed, 03 Sep 2025
 04:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:48:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOrGd8zoQwjEuZ80hMDf0ovUfK8PYFww7J_Ws2Lq4P5Q@mail.gmail.com>
X-Gm-Features: Ac12FXz6cJ_9Jm0qNmZOdAij6DgiX-eaO6YxPED6FtlcjziX388o-vLNPus97lU
Message-ID: <CAMuHMdVOrGd8zoQwjEuZ80hMDf0ovUfK8PYFww7J_Ws2Lq4P5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add
 user LEDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USER LED3-LED11, which are available on RZ/N2H EVK.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit message
> - Changed led node names
> - Added color/function/function-enumerator properties
> - Replaced GPIO_ACTIVE_LOW with GPIO_ACTIVE_HIGH
> - Updated switch settings for led-9

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

