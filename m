Return-Path: <linux-renesas-soc+bounces-18540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A909AE0808
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4EDA4A5727
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1D727E067;
	Thu, 19 Jun 2025 13:53:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE5C184F;
	Thu, 19 Jun 2025 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341233; cv=none; b=NMCSZS43AYl0HHGJn/DK8iN6us/4dWgtQ5uh1vuaWjalObHV61yzexBi9sLk+EiD7iEWVRnK+jtQs9mxNKq4N2n/bYhX57MfD3MqRWo2VZmiSLv0zclG6HYzcOGlVXSA/TtXqBEbjQxPpJ7EWSAxCosz1ktA2EMSK6RkoiAJqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341233; c=relaxed/simple;
	bh=jbuVcEQNcpWsySlTNzCfRCPoLDuhcy4k1y3UpuSk3zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zid5La+37tvuJG/8QEM3otlRlsBFqaYpxequ/GM82dWmpckzqlJuWdSoOKI1ClMUqH2O27mTPsJ9VZmYvc+6cGgok9z+fw7oxL4C/iX2nln5a9+310Qb2mFnf0StoUUL1spTqvZRGB5MZ7EfDz/0wiBZ71BFmW6bK+E7NYRi5pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7feaae0e1so612351137.2;
        Thu, 19 Jun 2025 06:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341230; x=1750946030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoPSVoobirA1Jie2WgJhd5VaFqdO4CfR1E2iehiwxA8=;
        b=AbIS9204khZ6GHGZhGLCJ5AU+pAqz5jUuHez4/FrD8pauRCS+SsolV7l1Dfb2nQ5bX
         31uAsarHr8apja/VBf1PazvLN2QriPvl1IrD1V3uP47C3kjmYmJ4hNczV9kJU8Qx+KGm
         nFBTiC3t5PHxQMQ82d6foQmmwWl4W0Jgu2V2sH6Be65FOvNw9Wi5X7dXZP7DuGwSgPxE
         9kktiWhaFDmMFR88gwJC11ZofSp11YKjuh095RGblOUfgpNkIIjFummiegm3gw3omzNb
         L9dDZwaTtIydsph1sLZPDcdRCy+tpmYXP+C3VE1zQ6URl3lVi+wFNnWDvhVNHkbOuR2U
         EO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUke4WD2k1Zkw56MDev3SCpNAr541KiofPfxUjr/gQdyaGT/41RsEkjjs4ZewNFGig1TPl/KIgjPrDWkarK@vger.kernel.org, AJvYcCVfw63d3b252Xi95l/ci4OCuS8SSYMGoyKzFrAaFGGDFzAK9VrPEOPoIryfY/pw+OkcxcP2XFW1ebgGV/78Bq3Xmqo=@vger.kernel.org, AJvYcCWXrU0EJn+2qL8psacQYStiWX/dkVk7oq7pj0A88NAzyPqAMyQ4ZSRdITQvsq1pY4K/+N4+qW7WUYlj@vger.kernel.org, AJvYcCXBOLupczT/lHfz6pyROrKFez/4JyKgc3aRyIv7NuOwpuXrV4AJMfchHewdAjOppCGwXoTy1mwnVrbR@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYcgOeuywLosR5o6lqyfbbLw0RF1bLPHbIkHcvfmXH+jEz1BM
	VlAyOdc3//pJV9grazjFruWWkSOTF201TT8VlvFgyCwRCxLSY7DbvbUVcep+Z13p
X-Gm-Gg: ASbGncsCQ7tuumLCnDgoAMmkw1/oZZa9NAvIM9HySzYZwI+XSFPLuA9x+U8Fb3JDqIU
	GPjDFj3iutT2+11HzNuuE6cruHWcRh8EnlEogWeZtvnqLJXtp/QwfOS3q/x3A3ab1PgGfQoD4CB
	0a0YceHRXl3AI6K8yHcTA4R5IvtEqVchPHmaxlQMx9ymuqimH+j5F1Ugmbb+sCL5KElIK4AkiB2
	d7l70K9FHSQDM8wCBNs0k0w5TbccUroUr6ryx5GGtDStV+ylE9T9O8TF7/AHlqM8+ofCZgnLmuF
	IcWOm71EAbWR5HIYZS9OhI+1yOMmGpcdmz6SxpRqCTqWoQ50dQmetTF71vICDGbBdJGbeKL0oy7
	/1KNvLUyxWaA3y6eL+ekvDP0t
X-Google-Smtp-Source: AGHT+IGWdKM89yu3kE4tT3SjGn20Z4EBuQJz4kGfhBK8mn4HqHBXTaOjulTY/vDUXTYGzPBK90T0cQ==
X-Received: by 2002:a05:6102:50a1:b0:4e6:d7af:a7b1 with SMTP id ada2fe7eead31-4e7f6163427mr14694112137.10.1750341229857;
        Thu, 19 Jun 2025 06:53:49 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f23915d10sm1724859241.7.2025.06.19.06.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:53:49 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e9a7b4a412so753182137.0;
        Thu, 19 Jun 2025 06:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdg9rjo4rdyw/7+SshZw14MNpXtG7PFmMKuUEGahpBwzYuIVenDZ+Ol2gcHiuhZT3gjz8hc/vahZlbFTZVzOHN79c=@vger.kernel.org, AJvYcCW6lkJR4V+o/teFww+PdUKEir26QeQZuxEQqoxVFSznIod+3o+pgasMjnALDiUT9XuowtpgdGe0Y+80fJLq@vger.kernel.org, AJvYcCWYbkawcV+rtx7dlj8W6VpJP7zYvIPxq+VZBeA0lEf3O2Jao7twNZfnMmEWughGleVCywFiU1EZRA7Y@vger.kernel.org, AJvYcCWhV4+h04Z3wl4r+NAuWLFl+p+2c5oeN+QyPm2L9b+xodhY6Kx6R40lKgGUVpeApy1BoC+7CwXmfj9R@vger.kernel.org
X-Received: by 2002:a05:6102:4bcd:b0:4e4:5df7:a10a with SMTP id
 ada2fe7eead31-4e7f6207960mr14871581137.16.1750341227938; Thu, 19 Jun 2025
 06:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617164914.158091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 15:53:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmL9pg8x7pgL8snX785t=6TjWEb8Uf=HBZrNd7ja9kvw@mail.gmail.com>
X-Gm-Features: Ac12FXzJ3ul_7CaAThumFqH4rNWfG9mp9Nr35_ms6nH3U3z0tjEM4hn8sQS6LlE
Message-ID: <CAMuHMdVmL9pg8x7pgL8snX785t=6TjWEb8Uf=HBZrNd7ja9kvw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 18:49, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback since
> the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> allowing reuse of the existing driver without modifications.
>
> Update the binding schema to reflect differences: unlike RZ/V2H(P),
> RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> two clocks instead of four.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added the high speed clock to the clocks list.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

