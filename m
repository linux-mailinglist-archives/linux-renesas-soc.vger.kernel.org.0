Return-Path: <linux-renesas-soc+bounces-26009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80099CD66EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E90530184EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF823019A6;
	Mon, 22 Dec 2025 14:52:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655C2FC00D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415170; cv=none; b=kB0xIGkjL1usBwnKR6pG0VY3XGrN1GIo+tXNBACdi9h2PwDdgeSsEyJzgObfuvdup/HnvKxvMAVdHMXRkWlzlhZwX3rXcUIBAZ601/yKHML+ImvzxX+VaPtVBSwsQfqh++ht4fyIRNJPLCF6q9UlgC/LA5xejpVUEEeJ732ZQLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415170; c=relaxed/simple;
	bh=r8vXFdNw344kZAqQkVG3TwDFifA5ML7Go2yVV4yCefA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEcuQIcQkduSM4WIrYaib+RVpsAgqV4vwEId9OqHLFjUsl/sCyI5YXJeP77f4zG8AlsVJ4aCYyEdnEkFs5URVsK+pVHSWeV4A82UEB0UbxDvD3fqUw51JifCa+60NAb0YgOLhZs/k6UwOq6bQgd85fDphe6v01ko+qNLmsNnBtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94124140e02so2615238241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415166; x=1767019966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGCklX6nhk27ftO3qYq6hWy6cA35KSKoGjf3nv6Hh2Q=;
        b=m9M+iKldG+jWOtiyp87mynLuJbAFx8PGcNWos+qgyYf9KBz3TkYHXzv8N9HE/EH85p
         Ek0CUr61H6CuzQd/nkdco6g5Wp1KCIDsNBxg2AFEhwteimJJdylIkECHuy+Zw6TcOC4T
         25u/JDZgdUf2HyruMp9C21YP3C0UhJxx1l8ko36e4U1hyxx0urDOQtoWqYpUTPUpDDXA
         jRPOKqY5tn7CIiCyrlsqN233jXLjNNG/JzP4RWXC3hKxjKRgfzdKdewBN5Amcam8yTQ3
         13jOz3BBVMLcXfKb8twPwKpKwKTsSdA2tRihbcU6fduBj9s4wbk5FbDlq4p7oMt91gJ3
         Lofg==
X-Forwarded-Encrypted: i=1; AJvYcCWJEU/suvum6RIOogidkTdgdyhEFNmQ6D1Bf068N3/j3Ys1ai+PFhhdZXHl0mNUi7UOJ9cwMnAMP1fe3et/zm3S3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HcRYxnGyB8NyjEN3APp9ewvmHlDmKa1fBQihKYpi6dvP6y7v
	InTCcP3fdUQQ0qOr8WRl+GLMkmhrDHW5NFZNWj1UbQx9hpzq3V37zHiVooi7oy2b
X-Gm-Gg: AY/fxX7e7wUvTR5KtZ2S8UXvLLBMktRYltqyaKEGhLT4WZQaiIKPrd5VxyYG25zk/5C
	BeaXcIhy55pR1z9vOlMKgiOOTx6bDx0sRleMG9Sh3hhbfll2rUXU3/u2gpFM0JrB8D2QX0lm8RE
	wIn3zA2RbrPQbJvWfMsgl6aTD5g19CXpyZdv6sb66OK1iR4fdeqRvEsFkBo1JiYqJSivgOk5brT
	HWZt6FpR/0ezauvNAedSHUctdufUBPIUHIxpXL7XYAnZGLtaiKu83O44Y2gawtrJ5HqWLjDTu2x
	b8v2MkkWpXXwH7KYVZEpvFtO1rVcAkPGlpiCAGuMYGCC/3Jmm5X3tw97XZbrcbo9m5IGqwenZCq
	8Sa57hn4bUdyWkjkzc2H40isdSNcs7f5ZnIVNM1V71oRXQ0Ar01EZAKkl2Mbei/QnVKWd8PwLhi
	kz6Ym5UZOBe6SDGDih4CGx5YNfu8628AGByzOFL9KGwiTMyIu8
X-Google-Smtp-Source: AGHT+IG9xRjrFTYo2bzQs5LKNqvcr1+CYLbOjSt97UVgNF/dKtxTu7t7eya/gp2YbUO0vymtO2z0DA==
X-Received: by 2002:a67:e70d:0:b0:5db:eeb6:812e with SMTP id ada2fe7eead31-5eb1a680b94mr3848501137.18.1766415165792;
        Mon, 22 Dec 2025 06:52:45 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94341797300sm2856639241.13.2025.12.22.06.52.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:52:45 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd1421182so3259497137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:52:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWb9f4IaTB+NMvLULRJ+7i2ysRaJxFKapdOfT7rslKT+6eWeNYaZLCj9b3i1kVbxRsawBQoEY7PhwMaCn07uc9HzA==@vger.kernel.org
X-Received: by 2002:a05:6102:5e94:b0:5db:e2c2:81a1 with SMTP id
 ada2fe7eead31-5eb1a680ed5mr3966383137.14.1766415164900; Mon, 22 Dec 2025
 06:52:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com> <20251129185203.380002-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129185203.380002-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 15:52:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQza6zqvkwB5YNe=aQXVn-EmVzTMoZN2+sry6pBKB=tw@mail.gmail.com>
X-Gm-Features: AQt7F2pKMpdMjUiZR04D73IrP2c0AaqXRibSGSZwR5IkFpPnDOUz7u7qRlrurXc
Message-ID: <CAMuHMdXQza6zqvkwB5YNe=aQXVn-EmVzTMoZN2+sry6pBKB=tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r9a09g047: Add RSCI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Nov 2025 at 19:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add RSCI nodes to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the compatible from r9a09g047-rscif->r9a09g047-rsci.
>  * Renamed clk from bus->pclk
>  * Rearranged tclk{4,16,64} clks.
>  * Added missing irqs aed and bfd.
>  * Used hexadecimal numbers for module clocks and resets, for
>    easier matching with the documentation.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

