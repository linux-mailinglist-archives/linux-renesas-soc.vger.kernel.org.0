Return-Path: <linux-renesas-soc+bounces-14085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44106A54E10
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987661885055
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E230417799F;
	Thu,  6 Mar 2025 14:44:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A674059;
	Thu,  6 Mar 2025 14:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272262; cv=none; b=kLPs/wHQevBxAFaqEcwjl1DD5ns9u/TGmIOGrAGyFdLGkEqspMQEbOHeZ6S96cl4gzopGXJAgp453rq981/tfgNYqYMh85iIB923kARV7F0VqfjUXRuSj6IeYiZ2A8uNc23+iKkmxlGOvP7Jl8C+tKNT2N4MFh6cVzwOeUm3srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272262; c=relaxed/simple;
	bh=1I6vLfdtxaGJIXvx++ATG0mvb6UtdNlhF8b32gWF0pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvNjT3cXkVv69ElLxx26OljZS2BYSUeVi0+WuDjbMOGcP0Nozs0z3hMI3qPVZ90buwPng3Z1b7UYQqexLzBtYw9fA6MNRte/I16zsyg3j78JrTCFDLf2u6yKcS42n40m5HFvrZO9Dip714qc8YxWqGNRHDfCzxiLMJ6HYGyHYCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso767408e0c.1;
        Thu, 06 Mar 2025 06:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272260; x=1741877060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuP9xwthdogS6nkkgxPKen4G3Hlo5Jw8Nr1FiijMZqg=;
        b=TcdJ1azykqKO9CMwmK1PPGbmZrwjP53v3GdOD14nfah7Lrttb+fu0y4kP2dJ9oTyou
         Tf+Nj37hnZOazPOaYQ5g/GkGcvWIrpovRzzZYDrFh3m1kFWaUQldsSGFjj0pN3UAE7HZ
         VaFwD/RcpeXIoPWXFjET64S/r+xesYKvwHtV409tczaTnVj3k5Qv2vpuPsHP7s58q5tk
         J4zOjfjF370HMap9EvKT6Td7vNUxokoNl/AspxxtF/C6T/l32vN+e01Rb9dL7ImFRUt3
         qywhp6QwaTgah2hV0yO4uGcYJeUz+s8tmT3HXpVHJtIr5mQ99D/ovuoc4JMuHWZXPfki
         aobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIDvdJN88nipEVrcuJYLG2c8DYyp8D3UVyCTr6Y7E9hPiCaNUOIC5xD9VhnQSMUgMFVKH1FJ29PLw=@vger.kernel.org, AJvYcCXdDup6/O9zFVXGs4wtHnW02+Q5AyQJk4TrCBBAVbTCg0g51Eja/ZcUK4m6RrGtzZNazijiwLGvBU07oT7E2lEiQ7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzkIZ0MQs7IgNqgFRgDb8A7OX9FzekL31T26tlgU4p0BPQtbP
	9vmw0eFtjvgn5c4YUAlkO8OPMzxGcDvbirluKwlOl/KrJMh0vZM21esXFG4V/0A=
X-Gm-Gg: ASbGnctR7egsEIZ4NqODTugPVC+/LkO+ngcwYqjFQPjB28qvtjyQPpDMaKb20jcvFqx
	LNFWmbvNj0H2FGgvVCxgFz7Y0B/cuxsiLjPPACNd6B/zzEnTJdUB4Pk11NLZ1kSikldGf3B3OVU
	Cggeu+3rKd69GhdUheeh7Hi+3kT93hfIsiELtC2sbE6WtckomQe0diiVeHHOQ3ZEPXQg3L62T6+
	kYWCD2lyX7sIeOypatJCcRBoCTlCvO8pik4bl5OQ5zXrRE2SeCtZLKZiVP7TsglEi9Oquriko/u
	XLaFzRbolL+LrW4G+bjQ8CK3up0NCgXB3LBzOS9Nur3EUUqDRnKyr0POF+tkmReT2trH8s+VX8N
	Vzw7oUeg=
X-Google-Smtp-Source: AGHT+IFxQnllTRHwGByrqx1g2YVn4J2qkbYVUu3panFmbn3SLpU90yHSQnXHyM2TE1JgFCTaLkO1bA==
X-Received: by 2002:a05:6122:179b:b0:523:91e8:324c with SMTP id 71dfb90a1353d-523c6286259mr3849004e0c.8.1741272259670;
        Thu, 06 Mar 2025 06:44:19 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8a84f79sm196031e0c.7.2025.03.06.06.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:44:19 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so574318241.2;
        Thu, 06 Mar 2025 06:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWasBU7XTpf9zcII/vz431/uxMZOJNvCVTIAkzHMpXyqO1mfEa3neOivdWxN9FoKn6kkOoRFvqgyiZsBg+85YqWdwk=@vger.kernel.org, AJvYcCWiaShqBgMnijJcxSWvM3KHSyehe/+C+NoCEx29HgS/B1Vm8zbEYv2JM9fX5omKsTYNVhmybK8jGok=@vger.kernel.org
X-Received: by 2002:a05:6102:c8e:b0:4c1:7be4:eb61 with SMTP id
 ada2fe7eead31-4c2e2971c5fmr4743310137.25.1741272259334; Thu, 06 Mar 2025
 06:44:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com> <20250303110433.76576-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250303110433.76576-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:44:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWof-HMkNjLM-a3VsToUQk5aBULLQBkdkMXq3djoBct+w@mail.gmail.com>
X-Gm-Features: AQ5f1JrWE1EtOoQp9PfqXLrqZPKVXDFb5iyjEMeH-quZA9EHfx3pqPewY05jvPg
Message-ID: <CAMuHMdWof-HMkNjLM-a3VsToUQk5aBULLQBkdkMXq3djoBct+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g047: Add XSPI clock/reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 3 Mar 2025 at 12:04, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Add XSPI clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -68,6 +68,7 @@ struct smuxed {
>  #define CPG_CDDIV4             (0x410)
>  #define CPG_CSDIV0             (0x500)
>
> +#define CDDIV0_DIVCTL1 DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
>  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
>  #define CDDIV1_DIVCTL0 DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
>  #define CDDIV1_DIVCTL1 DDIV_PACK(CPG_CDDIV1, 4, 2, 5)

This hunk is already queued as part of commit 4d6952981244d1e4
("clk: renesas: r9a09g057: Add entries for the DMACs") in
renesas-clk-for-v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

