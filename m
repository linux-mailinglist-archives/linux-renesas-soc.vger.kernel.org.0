Return-Path: <linux-renesas-soc+bounces-17347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B1AC07AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC1A9169EE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C68C22333D;
	Thu, 22 May 2025 08:50:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF31E3DD3;
	Thu, 22 May 2025 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903804; cv=none; b=ELtcFq8Qb0lHWmcQRsWYRkr1G8OmKYI2PZH3mCyaeOBJunNqmEgAAErcgTNSfd7geUgcSQozmvFvFZ2qttDOdKD/d8o/5OnbSoITIYiBqfqX65g9er7413cJO9T/S/qYg8281Qi4QFw4wPBRUtp5LUrKoDfZipwTvo0Im6qENyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903804; c=relaxed/simple;
	bh=ZPGq9s88e8ozDu4D/dO2TdnmVNeJvp7G0ZxiixvM568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clIr9QgCAWh9/7HOemfYpS1jMufp1+UaNPKU7Mx/yr5AFsw8/vE+u+XbtJ2DUcSTuhgMPPcgaj8LZiP4Xu2dZCejitQPWPHY4bkAFPh5vX7ijldDjuk29PJ54/hD4zE5qJWGL+caVDxYhpWonvtq7yu0JxvLxCxug0u8OdEHjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5240a432462so4981752e0c.1;
        Thu, 22 May 2025 01:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903801; x=1748508601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xSC3iZaQofluvdoCfGbW3jq3wAu9TRQTjApFJLHZuY=;
        b=NsRpDjV4oqFJVGO+Kksmjrw2ZO2ItmEUjFCaQvzlI4bieoGh/CoqsfDiX+AZ2onSlF
         l1/aH0Tpevf5pb4jtKjgfNhenYU7Y7HYe5tcejGQHPshsOT4a58RoVHe0t4LlwdIRL+X
         MLTPGOlwjpqjZGRY1ukqss1LQlwFzi7MCSGPPl4wfpLijAxU3YZZ82e/Ra+zpy9EnVLP
         YuOq5Kwx1a5lQw0cP98LKWEF2tpszf5+bHCZjV7ZNTng33+b6x9ZN64dYN84e4vw1Og6
         usVvaz6Jn+wtDY/9HJQQwh+TqjZe5PejSJYK6TugLTQC4upjN3s6h4FN8JXGR8eoe2MP
         WrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpBtByf41bm4xZJEXV+DM8dLGGrVe8lzzi14xK+IsTgV3a1iXqTAKk9KhtwWfIVSgZs/PyuMrw43U=@vger.kernel.org, AJvYcCXOAqT3sovoS/0qgIQTkJUXMEO3od6/U6eDAfZfvEn4+33bBSEdoyXATVfLD40Fs7EzGE6CNPZcq8tw7GWsybotq7o=@vger.kernel.org, AJvYcCXU2vIHzgMLSQjfpfYbNEdtLOZwATT80J+B6qMIWsPTbcz68cJF7Wi8Quh5VvVSqby0AnWYUGZmb6FMQb0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vnmUB6xgfyoLu3zWMJ9SNB6UwqFOL9SK8a3n1+ulFrlqAZ2X
	MS/meTV3l6ovT+bPjoHdyiRWaqdQmxcqDO2qfXOWN9Lahz9i6ZDvk3HirarA9GIV
X-Gm-Gg: ASbGnctSnrgehp+wWCVxCcba7Y/egfSbwv946r8IJuvh1b8jbRno8/OewwCF587Tzek
	+qs8B3wrDcsgxHPhFRS+8BtrFhJZ5bPiTdXCQcAciRKFthuSwpUeH6mNDKqse7Wh8vKPqlVoh4q
	jqychCpezOlAg06PLnSgGvUh4KT5/ct3DwUBHWnQfvxjZNO29VAwy3qGPG0HSvYgSUdoNcCJ3x6
	KvH1ZX0FKPjNEfeXnWm4z7oJApqxKQhRh+JuYbcE3lYq/FyYKKpeizEkLvuUTNW0IxLp30y3BLz
	u8wUu2PSNVd+LHlHCLXrgFU7myoImXtn7l836IwzwzeP7ALxKy4VoGSTzG5h1QNbQsC9ofP1l0D
	hkKnIyvP+8z6fvw==
X-Google-Smtp-Source: AGHT+IHeGrJ0VLdrTO58Z3hp8Qkvr5v91l95S2124E1dop0P/nBrhCUYTLt3uW9cEG9hIjce6xa7Ug==
X-Received: by 2002:a05:6122:4595:b0:52d:d14a:1f0a with SMTP id 71dfb90a1353d-52dd14a1ff3mr14478526e0c.7.1747903800844;
        Thu, 22 May 2025 01:50:00 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba91076esm11500951e0c.3.2025.05.22.01.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:50:00 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e2adabc828so1660537137.0;
        Thu, 22 May 2025 01:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURuPXbvbdvQk0dlT9B5KKo3RZYj+kygh9u2UeROjBZGxzQIiSTmU5yPBynsooRYO94K5TLcrj2fLca0gn6xpsaC/Q=@vger.kernel.org, AJvYcCUYgL/tg/lANKYcIxbpka69mPd62L0RkMOHvPpSbpCncixSrh5brUr34HRFFiDYtGtv3KAGqH+SaZItphXj@vger.kernel.org, AJvYcCWyoUvNKaHz9Z/LidPy13myHMQOILIVUDhlgftCG8+RkIp7wJZwMW8fUmNaFlBYG9UUlKZyvJfvsuo=@vger.kernel.org
X-Received: by 2002:a05:6102:3052:b0:4e1:ec70:536 with SMTP id
 ada2fe7eead31-4e1ec700665mr14106528137.4.1747903800213; Thu, 22 May 2025
 01:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513154635.273664-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513154635.273664-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 10:49:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0F=miMNjViJrJu_UmfCp_Oz=aAXqQf9T2VX=j9KL8xA@mail.gmail.com>
X-Gm-Features: AX0GCFtSb_Qwt3tm-s9APmVSt_337zSqXemaEo8FX_qiLx80Dpjx3tddBCFJ9yE
Message-ID: <CAMuHMdX0F=miMNjViJrJu_UmfCp_Oz=aAXqQf9T2VX=j9KL8xA@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a09g056-cpg: Add clock and reset
 entries for OSTM instances
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a new fixed divider .pllcln_div16 which is sourced from PLLCLN
> and add PCLK module clocks gtm_0_pclk through gtm_7_pclk for OSTM0-7. Add
> corresponding reset lines GTM_0_PRESETZ through GTM_7_PRESETZ to control
> the OSTM instances.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

