Return-Path: <linux-renesas-soc+bounces-23580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930EC0585C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 413A85038DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D457830E0CD;
	Fri, 24 Oct 2025 10:10:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E54230EF62
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761300607; cv=none; b=jPqtae366+uGL7OqyxbsP0gN7fmMD7YVnKl/gz8Kd7ZaZF9sldGJuR+bmSHf8cU+hmplYboe02kvFyOoVTBwlAoHZsb18DS+WsPbZRCI/BClif6pWw3VKIkoKwombM0j4/2kzuQzRsNKFEo4sRDe8VgArpM/PjDsxgmNnxq+h7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761300607; c=relaxed/simple;
	bh=6MpM/czxf/6Hh1L0dLLUemfAUkQnQOxKAeYfzG6IdBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcLJEwPzXN20otn7aGfUoWYAyHxsvwxGQEW3qrFwdP8b6rBX9rjLZXI+D3Il2KjyoaZQoqORhIuY2H7IkGulrVHolHggzLf8gq9fel28z2L5UsWipgm8aWFqsTNg5bb32sl+XFrRNBl3hEFYs1j+OTv9W8WWEwh0cXhceDmlDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5db2dc4e42dso1800772137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761300605; x=1761905405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UT8Wdcyo2x3pLAZUDoU//zKTO9XrNWcZhxUqd4p60Fk=;
        b=ENNEWeCG+yqxGXMt6QYsW5B/nfFz9Qb2tHe0kSPThBZtS+9pnF+GBPSdm//SCphooy
         qLwDR8bGjNFGVECPDZCAPBUeXEL3jMHqefKKLpoBI1VOZY1L6RFz2KjEl2vTOwhZBxgW
         SadIuRI3pe+Nki3i/pmsXdcSW5TsuxpoenfQu1HGn861zCTNYjv9OjAbuY3UBFqXI3Au
         ySFeHUg8m5U6CoqzRgz6gvuHSiFOyyiiGfHK1vL6M7pXNnld12OqU1BxWHTtB7iHPar9
         mPGuSltSjjN4U4HcajoFnwMxJJjAOwbdK+DNwkxexMqLos67GaFAWzfd+ezaL7LwmdXe
         dF6w==
X-Forwarded-Encrypted: i=1; AJvYcCV9hIgGhRqPr9IZ3NrkhTTKhz6UKlXQR3cjEnDVBqi0XkVD+k++pM+Dn+HiSa/22jmFNM9xssC33rg66XijC3OHbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdZ0fGYFtajiGCFCbr9g7l/8baw1UjpOTHfOS4FPZFvQCsdLK
	bN3k1hy01LBnuT09PvMEPAP2rhfwYqzFM9jTu72He2XysjGClwyb8FrD2VkAjGgc
X-Gm-Gg: ASbGncu1EVlxDOnuD0ekMFOmfj7W4e+vnar+O2611FIdRAI6pPdC/bErsi+jJAS2Vzd
	ORjMQ/soPXAfVRayfSAh22LM/qvuoL/24KMErzARPZsUPNGxBe1ERCmyxMidIEaPxGmndBz1BTP
	AG6wVJv/9U4g7YT3hhL6rG5LgNoabxJ2eLt7Bi60NMCfCXtXuIMekyAMHt36rI5pSHOC6+hQobP
	HLZq6g8sT4I9gO0FVValj5nSnO/pWVCJm49nb2Dr46sizJ2tdO0sYDaGtPYaUNcGHnYpIthol6X
	H6QuJfzH8RL9eMPly2DDiXcPuzD5GTjYniPK7ATgqsu/k+vvvsvc60Ahx86sv4MkgD63YTFxEZT
	X7xzpyn41iuuXbfQAwRuh4BvdEfOrJBgwwdugbR/vG7iCNgX8HCTMt2l6I/1N6pYYOF7gr3flV4
	dem+flE5+28te25pILVdqyKwxuC4soTB5wOBXJwAEqrYwdWG+R
X-Google-Smtp-Source: AGHT+IER6GppCfRsB0jT2F7uuexilMtR00Fk/sQqqmJ5SAT6o1kBQ/K9E8n/0/vwjc2ty6/IgB/neg==
X-Received: by 2002:a05:6102:688a:b0:5a0:a095:9a2f with SMTP id ada2fe7eead31-5db3e0c8dddmr727334137.3.1761300604841;
        Fri, 24 Oct 2025 03:10:04 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934abbd2740sm1878316241.16.2025.10.24.03.10.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:10:03 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so1848672241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3WPpjOURAMUV/jox5Ot3IbCbKFImg14+yftxk/lfDvll1PwdBzc2iFZLvC+MBNblAmIeMD+yqNw+7xs3UGA64mw==@vger.kernel.org
X-Received: by 2002:a05:6102:54a3:b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5db3e20ccfdmr599456137.13.1761300602852; Fri, 24 Oct 2025
 03:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014151325.160062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:09:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=e3rj77BV0eb++KniTqHSTmDpX-1O5AFBODxOf+s7ZA@mail.gmail.com>
X-Gm-Features: AS18NWBX708mbwXNFoDh6ZLkVdZtZB1QvklxJwBzxdLMFKS22IAaBo88zTThT5I
Message-ID: <CAMuHMdV=e3rj77BV0eb++KniTqHSTmDpX-1O5AFBODxOf+s7ZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock definitions for XSPI0/1 to both R9A09G077 and R9A09G087 SoCs.
> These definitions are required for describing XSPI devices in DT
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-devel and renesas-clk once
the issues around PATCH 2/2 are resolved.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

