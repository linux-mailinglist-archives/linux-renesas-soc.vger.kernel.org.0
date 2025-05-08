Return-Path: <linux-renesas-soc+bounces-16806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5C5AAFB71
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909D04C7B5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 13:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031A1227B88;
	Thu,  8 May 2025 13:34:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30584D13;
	Thu,  8 May 2025 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711278; cv=none; b=jXy1afFdJhtNMyjY4wBKQC/paI6bRMFFBuQsxEPM5VhO5XmWBLnuYgOEFqdrFD6qwf/W1EpguhgVgKqkdM3l4f0I9AhFqdd0BrNr6s4TRTgdFIO5kt8rdFGOmxyOdnZRA2phy7fiG9PE1EquaWMzTq85higXXX9taQ94xmPrPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711278; c=relaxed/simple;
	bh=GtR5+zIYuAi6PMDto4gQZmBj4C9K8TBM0xO9m9kPJc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXPadPeATxk+RDV012XCu/SqdcxBhfbdwKpwKwi1A5a4PtS2hfhTduvtOQkQVhsLtjEUFOEJhssEia8//CybhPkYur12jCnswiCWxymZvNZ9phgI6xnuVOhp7ewhl7tqZxib/9kSkvI4h7Np8ljK6HIh3q3QTmCjHTeX7uta/j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4769b16d4fbso6252321cf.2;
        Thu, 08 May 2025 06:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711275; x=1747316075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f16kwiAgPBIOrztTr6URBTbdRlUMJ2PgP9gFbrLgwb0=;
        b=VSM+nWNJbx/jpzms94Ex5Kewa9OKwdjL17P0Wl+jNCJnbZiPgNf7dY2KQScQYh3kOM
         5Sy5HnYs506OrKMHpEZcvXqYUrJlXar/tNZ9BBoAp1AZSG/GWRNtzpnJuIViFT8lrhFS
         qRLaytKS1I5p3YgfROMGRetWzs1H/kzQAaEECfo63HFdIJAZbBP3M39nuLMxihpq4fBj
         1Aio5INLVWgoU94dsB7wDFWuT4aRiaWTd+EwbeFzdp4B5kfzXmBBehbyRLwE9jfDNoKd
         OD1L6JKifIadqMEMSeUMtvkgzxbyntixe8A5SpB++JlI5QCNoewS6DhbvyKVPI2qQzg3
         b+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWBrow36NZsCobYzPZjoZRaU2HDxwch8YjVbDqABWd0zDF9rp0wud0jMuRaacCvIyON0Nw6814h7SX2@vger.kernel.org, AJvYcCWUHTvluSLW9fuXM1XXJ8JBd0XiQ1k24iAxDioeIGdpRa860fkiqxpM8MgV7nzwqyloRIK/RSzTK1e6@vger.kernel.org, AJvYcCWse2WkLZSY3CegX/VvnhwcvvWgt9foWtLTVeyz4/i+qaePyuP8Ol/xPK1GjxQAGO4sTNRXCFk1FTK2MP7JOvdTorg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqA6e4kTwsAiGG/sA9Pd1owzxyRWSGfj26coAumJaTnZwoz6CY
	6PtTUxjmdkyp5feLI4Lak6alsNhTY/csTFKNxSqRa5eyc3mXmQHv+6TI8siL
X-Gm-Gg: ASbGnctG9hJMgAuFn8yPtzSy9t936CYHwIeLXPo+mfupQQ6/xHE+ZQTs2AzGb4V6NUq
	wlP925eeJwKiWAz1RJDUew4pwzr1OZw2ScfNWGqgQwN5lFUOl2sVErsXPGB6hH64IH1/3/cxAC8
	Zc7iUWB4IfU7whlMONyASIDmP0o8xj8ZZMb9oaxyd35EN6Bq2r+ztY9KxZAGFTcIWdZWNohyJDb
	HCQ/dKWMFS8JFhF6xTZ9cIm1ddRKy0UqyixQGmKBHyUWa27aace8fnnPXk3cLrwapR9ARfEkXMM
	0QqY4G4wB8npXcz/UlqGcb7z0pleCBWKYIT2ZjlubOxUz6LVgv5q1EYf9rU8y5wG2CWOHjmjoHN
	h0fLUufU=
X-Google-Smtp-Source: AGHT+IG5salLjGac1gYPjo/Nixx97+SV+X8ZMAm4W+daUxBTsv9DY8L6zIMtybhIntrHUyOzSyz/oQ==
X-Received: by 2002:a05:622a:15d1:b0:477:5d12:aa4d with SMTP id d75a77b69052e-49449623415mr54787111cf.39.1746711274633;
        Thu, 08 May 2025 06:34:34 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49222d9eaa5sm35376091cf.49.2025.05.08.06.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:34:34 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769f3e19a9so6925361cf.0;
        Thu, 08 May 2025 06:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2jKFTyUcNV+5CVgYHQjZ4oSpXsQk9Jlf0qCfh0tER3rWe9+r7yoeNL15BY7gaEotH0FSiLF/nie6G@vger.kernel.org, AJvYcCVQa2jId59lV6XXoLNKkd41n2QTxtQ3SEXAJfiV6TTLpZtPtNbQxHVOjyYVKOoMlFzfNJbjvySIiETU@vger.kernel.org, AJvYcCWvAwl3tVBWAF1YkQhyCRpXclT+aabhvm8lZUNd2ScNKn8ntVFGDb8qfsoAhxDpruz67WofofEiICYX1tcdb/VajkM=@vger.kernel.org
X-Received: by 2002:a05:620a:830f:b0:7cd:18:215b with SMTP id
 af79cd13be357-7cd001821c8mr83972885a.7.1746711273944; Thu, 08 May 2025
 06:34:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com> <20250424081400.135028-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424081400.135028-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 15:34:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhTirA+WYxNxHwAgaH6RDfWbhKaji22T_hhiJYUkFjKw@mail.gmail.com>
X-Gm-Features: AX0GCFvk4qmqvVPOAckX0SiGt-lj_andhK5dbzwQefaENsjESuakn5xyqYk_njk
Message-ID: <CAMuHMdWhTirA+WYxNxHwAgaH6RDfWbhKaji22T_hhiJYUkFjKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: renesas,r9a09g047-cpg: Add
 XSPI and GBETH PTP core clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 10:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add definitions for XSPI core clock and Gigabit Ethernet PTP reference
> core clocks in the R9A09G047 CPG DT bindings header file.
>
> The clk_spi is modelled as a fixed divider clock with parent clk_spix2 and
> factor two as both parent and child share same gating bit.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in the shared renesas-r9a09g047-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

