Return-Path: <linux-renesas-soc+bounces-18189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B9AD729F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 117902C0907
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BC5248888;
	Thu, 12 Jun 2025 13:48:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968C18FC91;
	Thu, 12 Jun 2025 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736084; cv=none; b=KVvOooLQfCExPhbzK7sTEcxpEAa8tF9XOnGSPx0L79SAb9XXjpliZGGzdy3nPOwKES9l20iY/AvgtcmldUtW0XajQOPiJeEcktpsUoj9UJbhr62GiN12ua99rQfuTd1xoP7Smu8mtZDTDergRrzW64/dMEluuzmIJCN4Po45ktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736084; c=relaxed/simple;
	bh=y8CFAn9qh3k/yLp5zOH+ernhDI9ZtahcNeN0S2G9P1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoEr/UTwd0yjYxFkLnt5kbbBk9BCHKiJkRPIocQgFmbatTQ5C6+zpm+3lvTV6FEBLpOv3sT8ftFPO9cKVbL40lH5PzloYqmiWhBKfbq/4HQC6EEkwxdQRSsfV2+/fKYba9sxkWZbr9dYMBCnQ5NSh7ky22p6zLDI8YKD4hBIYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ec5e1cd4aso286593241.0;
        Thu, 12 Jun 2025 06:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736081; x=1750340881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FQr7slkKxPbariVEmX9D6gn7HsHdpZpEVmZVDWtqF4=;
        b=ken/3lX1fPyfnUnYNt0jGkikxCWu/PNw9hhkbguKrgMNVkxDphhnjrLdarAsmViwyP
         a1myF9ecV+BkWCy3I5lTduUTFCiV+dh6AjE0mvKdHBqTY3fBsrWzA7MSClMVhuXapVlF
         Xaj9QdCAJZasmRnz6joziF9NqJ2JAQHYdA2UaOujVhcQVoDadGWJ04MK53Cg5wWsSGFh
         BkqvjBT+1HDaTFY5/AqFHoFjyHc35rktWRsMwMArDjfGdjN1IYUtc6zKFi2JhoEe/Evr
         LePunl6glEXM+3Rs0Q0CZVN93rqAwuy2WjI8Cz9LQEiRgB6IICmAilNlUdGPSNCjwr9v
         C+4g==
X-Forwarded-Encrypted: i=1; AJvYcCURTZcuOj1C4aFovqG+nyY/4QPlLsCrO0WNJQUB0c9zMZQvOm8zj7ezrRJEysuyUl0M9mYs0fSKBJTYzX1s@vger.kernel.org, AJvYcCVQK17dF55n7cXqR6vS1Q703UVU6z2oFpnge4HQHjcU/B85f4sZ4PGGYH1tzFcUWslRGhnoz2dWJ9M=@vger.kernel.org, AJvYcCXoy+9+e1Kkw4wUBQIVv5cyjg11sgtH4KYxqKbCrT685ikBKyGFkQg+Eljz+KW/KdvfZuIfVfgln9tapyTB6Lc426M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqoO9ZVPCaw71Ymn+S/uycz7otLUNfvsQSwYEQwFIRlAdjcy2
	u653dXLB9+9crlhHs1IdD6fA+tzXDr3E2v/v7QRoFjk0mU1ZBT3sZISCLiNnWuO9
X-Gm-Gg: ASbGncvwxMbxXj2mvAyiY7hgL+Oq69VyRpZ2UzcqrdCOlTyYJaQ5NMmLg1T1zF6Jtj5
	VFvO75x75ZQt1rTdVtwYkylSxb44nSowjrIcKoSPD5zX03Cr4lI4bEJRz+sz2ykCHGdL/BeF9aP
	8vt7WZqylLIaf2YmwsTe0TipmQmVBlIYWrXy2PTYLdfHCQS2q0Y849o/wWa5pQHp6Ev75rForP1
	CQbyVq4Cf2cv8CdTKVOaasJMFqPJldbW9udpGirbcXErX6Ci/Fs8eT6XesLttfW4Inpifp0TJJH
	W+gDb5ltrN/TgdwU77YKNYgzDLn3wK0asRVQHDAsW0oo5RdwmEkoO0KLiEABmpDznzLk2mh9SP+
	8Ud/J1nzMe6LDUHvavWjgpPKocHjFhHi/CZs=
X-Google-Smtp-Source: AGHT+IETRftRWQysl+wm+CZvPLOKPLG+qdHOy1bhzi/lsBCa1PgmSaK6GhG64LkitNiC01zQ6irD4Q==
X-Received: by 2002:a05:6102:94d:b0:4bb:eb4a:f9ef with SMTP id ada2fe7eead31-4e7ce7f841dmr2474911137.4.1749736081419;
        Thu, 12 Jun 2025 06:48:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f01243001sm297441241.5.2025.06.12.06.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:48:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ecba78750so321456241.1;
        Thu, 12 Jun 2025 06:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWE8cb5ltxP5tyaxtJ1hku4kA32dVNdNRuxU5XSjVnQ2R085Fhh4wUnVTMGfGAAvztR03V4+T88hdA=@vger.kernel.org, AJvYcCXF84Gbss+bU06Jj8XWWMT5QaZcOS8o7I3rEXv2ko/tw64smfNc3wCA540CDJ2lq3phF7zXz4R4kFYUlCYXyX8laJ0=@vger.kernel.org, AJvYcCXum6x9yUuz8Jt/HWwPD4DjniQuJH88vW8m4grI5gOMOXTSVTbtkeI7r80cbLzp8k/rk5Vzh/i8wZoGQwS7@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-4e7ce8ef245mr2321438137.15.1749736079868; Thu, 12 Jun 2025
 06:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609140341.235919-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609140341.235919-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:47:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5YyfQ6KwQyVaeZaEk7buNv56H_gPrWt_yb85SSF5aEQ@mail.gmail.com>
X-Gm-Features: AX0GCFsjFFOMl0FpwnFUdrbDnlL9gyxveYHGO9Mfv0X_27HN0AyCAO3jn5ITdyY
Message-ID: <CAMuHMdU5YyfQ6KwQyVaeZaEk7buNv56H_gPrWt_yb85SSF5aEQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Fix missing CLK_SET_RATE_PARENT
 flag for ddiv clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Jun 2025 at 16:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Commit bc4d25fdfadf ("clk: renesas: rzv2h: Add support for dynamic
> switching divider clocks") missed setting the `CLK_SET_RATE_PARENT`
> flag when registering ddiv clocks.
>
> Without this flag, rate changes to the divider clock do not propagate
> to its parent, potentially resulting in incorrect clock configurations.
>
> Fix this by setting `CLK_SET_RATE_PARENT` in the clock init data.
>
> Fixes: bc4d25fdfadfa ("clk: renesas: rzv2h: Add support for dynamic switching divider clocks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17, unless you think it deserves
to be fast-tracked as a fix (issue present since v6.12).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

