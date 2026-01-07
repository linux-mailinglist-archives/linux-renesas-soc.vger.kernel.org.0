Return-Path: <linux-renesas-soc+bounces-26371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE3CCFF468
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 19:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 829C834EE691
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC28388078;
	Wed,  7 Jan 2026 16:37:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91003A9D8D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803872; cv=none; b=fG+eRrDhy1Vg2db/QfC9qnU+ixaJ85gR/vBTZ9fOSxRysmNkcSCRnn32Gu3+OqzrzL1eCzunXE+3fn4lf/ZYGk8TYM7ynGebAnahMrsXquUE1hcW4d9J3XqefCQ7JWfWHpMyvQy2mY2fQuyWrV9MV53w7dAIP45STde6PPBKsU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803872; c=relaxed/simple;
	bh=lUkjukYyPvno8s3BJtqS71STl5+uBWJ649WSJU0Z1ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2NhyUdmEd6yQqI1PORM/F/s6T1qlw4UzFwZyl9cDrRIrYVLkzmrpFB2wzyV/helXDrjZM8lLrZfovmKHUmDxoCLudd5967NjPyYbPG/j90MVxqdYuDLCf2Zuea2bW/EqJT+LcxoSubzoiaw8n1lVde2hVzMOoIwltMyprSi/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93f69720a7cso1407805241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803864; x=1768408664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UosJZ8iJR6qWLllsBRVQrPIUMjEsIPO/Cc8wz2jLzzw=;
        b=jnkilq/8Ma46NGBUbT5cY9YP9LHBeMWjt76RjKki5ohpIYaiQjVNNQi1ZyjCYWMJtX
         dNnGWLFuAcsM8ZNpxKFU1/7nxUexPPdq+n51md83JS4//ovCtHXjhxAKfAqMCOyOww0D
         EpS/PSPrzw2VRyHJSGy5uGmsm0wUtaKrWphduSo/55sA1zfdvLAeRLHkDKAR1bFVqK3X
         sYUrS0SeTPXoNW/rm1Eg+TD1/+fzQ1ClAYTrLXDNTLh7iKq2CDxRAGx6ktmpzSZVEILH
         cnkzJV/vmL4H00npmshDQwHgCertllCgnKnkWmXFz1wTTAazzR/Gy4xGOG9aDO/UZG6c
         SAaw==
X-Forwarded-Encrypted: i=1; AJvYcCUqe3h5f9G/DHiQaDZVG8ODDtTkMSw1Pz76+jmtZ9VspbAXsalVVeBpj/d+QYdbHMEcU/VFW8aA4SyeR6IXxLycEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qRjU9jADlp8FYTAScoJHg3hNOMr6TJ0jODaE1zlZd0jDbUas
	OLRy22i1ZXD7SlF1I56fz2uRoIceuzbCGm3nVxLoYZ6yVNqC704GgweWHMRF/aOt
X-Gm-Gg: AY/fxX7NJISsXHKcOSxEwzMLMd8th4AsmLtMk2R7D6FFKyKqtvSEuQdhyl2t0y2axeb
	l5wdS2p0r2BVuA0cJfZukduHvUlwloBGLFjWZ5/8qBpewcNc8VBbgKJ+p13AVf40krqnXLgqYeR
	eGCwChA4aFzuN4wQ/5NhHTPxXsANIF5Yb0Laq2sfW/h3pzpKPUzZ1XEnu+88MT1O3w13WpOgbih
	TngV+khnKaFib9hCfUggTP4CQAgESysJUZTmJZniIqtSUbRyQtyciHs42pB5N8abyuvO3yP8/jN
	6z6qbPdsD7nZwIP3IKdpDA8rNfpQ1ouXEEHKPAaBIaDJT9PKyLpOJc0X6Hk60TsIseYJ7/wQ0I0
	Irxo9LiC/VmrZkrDKpRMkYXNOeatlI48ZAbRN2S7zkEjmMKUnefZLl7BLma2TS3asHF17AT3Ya/
	Y6nKPzq1453xlPmVQZBeTqxPHcM3OOIrOvOOOHRfZx7RzKEG1l
X-Google-Smtp-Source: AGHT+IHY1RHkq2SNsrEp4qyFlYcY8FP41bC0iNc8T9SMD0h8HGPgGLGK5O9th1XmkLz8GKZLcaBwdA==
X-Received: by 2002:a05:6102:9d7:b0:5db:ebb4:fded with SMTP id ada2fe7eead31-5ecb68dbab3mr1167117137.25.1767803864221;
        Wed, 07 Jan 2026 08:37:44 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c452asm3254526241.13.2026.01.07.08.37.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:37:43 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfd380cd9eso1417733137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLYic30u9+B1kixvpSudjzUflWNv+iL4o9kh6yz81Ziwdg3lVC/K2sM3KdragPEanswCEKNZV/GIqgraXZYiRZ5A==@vger.kernel.org
X-Received: by 2002:a05:6102:9d4:b0:5dd:b2ee:4423 with SMTP id
 ada2fe7eead31-5ecb1e904bamr1400550137.11.1767803863532; Wed, 07 Jan 2026
 08:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 17:37:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
X-Gm-Features: AQt7F2p4l0yE7BHZfa9XEcOswGFhJAJZ7XFevRuwZFhhiVQ4xn01o825gjpFphg
Message-ID: <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: rcar_canfd: Add RZ/T2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but differs in
> the AFLPN and CFTML bits and supports two channels with eight interrupts.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, compared to other SoCs, CFDCnNCFG.NSJW[6:0] has:

    0x00: Setting prohibited

Perhaps this is a documentation issue, as the same limitation was
dropped in RZ/V2H Hardware User Manual Rev.1.30?
Linux also has no can_bittiming_const.sjw_min field.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

