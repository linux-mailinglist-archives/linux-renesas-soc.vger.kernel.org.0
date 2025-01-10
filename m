Return-Path: <linux-renesas-soc+bounces-12032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41695A08B89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 10:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E623AAEC8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 09:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4218220A5F9;
	Fri, 10 Jan 2025 09:19:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DC209F5B;
	Fri, 10 Jan 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500781; cv=none; b=sywPoKOXRAtTu+yfPe3kTqSEppymvhss2Kiec3YDGsaJMuuuiIY7I9kVlHxrd5UWccSZgwprJo3y0fg2AnOy6eA1nw2e282cv6wyg6+my2D6nJDvP0C61/co5VXG+upYHJ0oxBMmK3PjJ+7H54HoVkrZlozVynzzfXnHhV91h4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500781; c=relaxed/simple;
	bh=JMLJNmjrpVNhSyYor3WfZtZoG1a1M6ftc+6NOLiXkGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw7xQjWogtLV1VwM7JWtPws34qDzCMdCHBnI+NM3fQ4NDZR+Zuhc4kCK+av9qfFL+W8wcqgaTpSoSihsmnvTP38JfMFsJss6/wLKjBtk6AEPNvwwqT7+gU2IK71VvcDElZh7mabLoLjGCf1Lz0dJRIMwQ/yVcZsbqTAVpjAS+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so546595e0c.1;
        Fri, 10 Jan 2025 01:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736500777; x=1737105577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxSh8575ZUBFw1IXV0jSdJrky3vPKB7mOTEQ7sqZRH4=;
        b=Wnd3CBg9yUi46Ky499+EnhGElj4Fp6Q1NawOKHuqXRRMHCvR5rKoi1IYwbZfPSQFvs
         MXpKiVxlktbhIM+Kytj5R9kPprluFyOkvzxpUV7YOAHe6oCr5WPd670K2j5i3BaLS3rW
         1u8ndQ1PLSmAoEr98OghXqYHlu59tJjXcziVsSMoc98D2jPru/J3TKna5W8at6318LpE
         UWFlcas+kNDkWcxDobGerELA4Ol/yE1eWKJ1wLPzuAWkT3XXlj5PDKs5mMRvTd90CZak
         x3ML21TzL2SX1IY9lASGKHP8t/bsdywpe3GjKw5tJNvKmIFQKrn3u+y6GtPB+o2jncEz
         7+8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB082dgMLuVLbJE51+ix4QAnu1KmHxWX9/nSuEe/P8MrEMbv6BdmpfPw7o89HYJ/wsu8WKk0F9RkIGAW/LRqCjMK4=@vger.kernel.org, AJvYcCVkhbdhw6Jm8NP3tbSDy6XWccIhShTR/lrn1LaY6SnBdsoZ8aDoYeIOy54yjzwgSSkE0T+UHLcSWnI=@vger.kernel.org, AJvYcCXZmwrOZSvMbqG7jbrCDdpyYvWDxPUJkuQQtFcn8BOj7DPix0IliPYVBgvjHRdR5KYf0p60P2cpR82WnsXE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjcc4fX1PVBXVLJlyjmwjruxebvQOQcPqW2ADoTeW7N5J5D89+
	rg20D1tUNHyqzgRZpXq7wv8PC6Iq2o5DZvNLY1A8G9t8BU7hJRhl/WmjjoFk
X-Gm-Gg: ASbGncvRjTApmoTjlvJRXpOykZAYp1Ab4zSb+Y8djpgi1WFX9KnOwAr+E40dEinm3MC
	YYSS/MqEgJJOjsL3EHlLtHyKdbqKcIkKzRONFxSL21dyOYDCaj6/Nd4iB97CPIiUCO1N9Ck8T4e
	KFQ1Fi8huSm83kuVY7McdIcRf/eCf2OqnfFH4MAseB4JzZS00jtK7OXY+p8m8YzfCggrRLLbttz
	nI++2RB+clLH4ZdY+OFpS5uBVdFJvlqU1jKYOcNPCpIkRylCWO3qxrCttUzokqdjjujv/QB2vSF
	gCLydn4YOdnIi6QhnqM=
X-Google-Smtp-Source: AGHT+IHzShoLgNc/il6C5X+CpAglybljXHPMQNAaE13BC+k+n9FKhKUU/BS/puxOhyUielVIn8EkEQ==
X-Received: by 2002:a05:6122:1788:b0:517:4fca:86e2 with SMTP id 71dfb90a1353d-51c6c535bdamr7635318e0c.10.1736500777239;
        Fri, 10 Jan 2025 01:19:37 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fcfd614sm1846091e0c.36.2025.01.10.01.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:19:35 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so529815241.1;
        Fri, 10 Jan 2025 01:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwKh6ZhxsSUsoOEqLSOwLuvvf7uhNcHUY2xVG+CmykFULd1CCUEOEwYkNuMuXBPd5hifAMfOc0s5gQnFYD@vger.kernel.org, AJvYcCVWgcZMQRJVI27R8V8zmqSDcQZHw+7v6Nk/ouzEfrMDQALblalT7vsKWhTVka6zSuY40qh0MSIc3GE=@vger.kernel.org, AJvYcCVZCKHLbv5kVcH3E40qS9/A9pfzq8Sq17r3NnVqN7bxKPca5B5W0URJm4soxkuLVzRd+p1PW98cYN1te81HDbPmBj4=@vger.kernel.org
X-Received: by 2002:a05:6102:2b85:b0:4b2:9f20:51d3 with SMTP id
 ada2fe7eead31-4b3d0e0b114mr9457902137.0.1736500775162; Fri, 10 Jan 2025
 01:19:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 10:19:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeU9o7PN62gK9ks4SSeVP2KH-a_mf2+xB+fS-jDqtCxQ@mail.gmail.com>
X-Gm-Features: AbW1kvY9TyrtgHNKZuzZdhq64uRtlEl-82G9RWtD1jR7YafWrvuuljLYvEmz6FM
Message-ID: <CAMuHMdXeU9o7PN62gK9ks4SSeVP2KH-a_mf2+xB+fS-jDqtCxQ@mail.gmail.com>
Subject: Re: [PATCH v5] i2c: riic: Introduce a separate variable for IRQ
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 10:12=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the IRQ handling in riic_i2c_probe by introducing a local variab=
le
> `irq` to store IRQ numbers instead of assigning them to `ret`. This chang=
e
> improves code readability and clarity.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, this patch is part of series [0], as requested by Andi, sending
> only patch 1/9 from series [0].
>
> [0] https://lore.kernel.org/all/20250103091900.428729-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
>
> v4->v5
> - validate return value of platform_get_irq()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

