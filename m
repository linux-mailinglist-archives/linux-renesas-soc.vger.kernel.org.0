Return-Path: <linux-renesas-soc+bounces-18977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2EAEF8F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5AD189AE99
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B3F2749F0;
	Tue,  1 Jul 2025 12:40:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407BD273D9F;
	Tue,  1 Jul 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373653; cv=none; b=OBS32hyuqSjW4BjQZvpm5HY9tmn86kISrNlh6Irg9pg5diiWcQ0iYLN5QHXD8pjOfwPGnd+iEZLY059ylb0nk/blLwD8ofKmXmHzCyqmtNY7JbrwRokhwPfgMCXesIayo1yudbwDJ/ndLdwCmRfX3L9liAKs5XLQJ6dGwHhFupk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373653; c=relaxed/simple;
	bh=PUaUR5VhASDTSHhsAGTsCZjK/DENkgX8RBFVeiaQnpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW+ZxsPF7y4kqpjTObUKndbBSqIAhDNzftc433XMTkZla56y5MkYasck62YpK5rcKryyXqXRmUeFsnbPqbim2fUzp6nfOKoZH/2MBn2aoxDFFmgOA+kivKBJaPh29CxEkgRN93j31ZG8QQBObKCL6s1bE1GtC0JyEoGf8PxLH20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f36c458afso1858744241.1;
        Tue, 01 Jul 2025 05:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373650; x=1751978450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xToFNIqcKKBMs9b5WUvNuETxtnHIgtEdP5ltqHAQkD8=;
        b=GW0jkcN2mDMtiarl4nYLreJ4h8XwUxsVDTKm1bV0MBKc9l/sTqi/I1dwAhFzgWpHK+
         YYx+LbOBHY3TcPS7LDhD5FM8h/pchSiMYIcdx77aSRF0KWd/U+Tzt33W+4fyvGg96mEB
         yInoLvlMaz5KCq4lS77QpGq+rV0jC2arKd6J7qKIK8okd9wGX1CN3u2HzvI0UgPn2RBJ
         mNGy1St2gj8ksOW5t/KMeCXe4mzavuUcr202gTeOyfsdaMXtiT5Nq7ycmXCQdkR83Apo
         bZh6YklJJLHKZzFPC6B0+0elbRMXSxtqfa6KspoIRxC+5fOEOECiEopWkzTl273L3uVA
         4N4A==
X-Forwarded-Encrypted: i=1; AJvYcCUoF/md5D3KwpJgBz8ZVpa/9jW+yDk2qRLDXy+U15LkFLxN5p3ltfRyQ4oseLu31ycRGa8maN9Nq27d@vger.kernel.org, AJvYcCUyKRbpLrW/zprU1lk53T+GZtDY0If2qwDHDFIfnUPx1MOV5LTEPLuQm6fgR7yyLBNsn3gOnMcWaIup3YrB522R+n4=@vger.kernel.org, AJvYcCWDIdkfNK76Vi/mIDxKERm84Fhv1YRRCWVXTlWY7JnUQeQVTWhjIODZK5SDgR/h3QnsMBrs7n3OQCjak0/X@vger.kernel.org, AJvYcCWL94nn1/LW5b+BZpRHpOMxgXKzfBNrpYVPzuxqskHpLzg+qQBXESy1y8Rt+yJhVb/yrkycqQ3fKWJq@vger.kernel.org
X-Gm-Message-State: AOJu0YzjB9SvtqazgVhX56qcGGVRZYn8rFJLanXI+oGGOOWH9dFxfmn6
	yrAF6JvCuM9Gc8nTqXV6yL8uvLH/61ZLly3u5Jh35l8tcHZ7rQQJpOerdsa7pHI0
X-Gm-Gg: ASbGncs5j7fR7tiP4L72b8RMoZQ+cfkpXV8HtbRPrOjF3CKV1Z0dzD4GXu6Nst8yl6A
	LlsT/N0GJFQ2eBpuuU3Xr3v+N8zBTPeETJzxPyTS44IAJ1U0E71yPGbXPYD4YuUPOLvoVy+e2gL
	5svu6xx0gITK7NBklXTsw6QVy1yzWmwTD3Cs+cuDukXZ5H2bEA+U6GE48mdirz1bPoTLNfCKlzN
	oZtabdum4sNfWcQqAEZNde/teYRXuaVzVVBnHsJTdC7p4lHMbwujWoECDxj/5ukDkfmUI99+QD7
	HmR/TC5WWf6w2VrZz1BKc9gcmTZBl4vJjMG8QNE9LKiIvxC/hWdtUBwZPzs41YKr7x6hUfrU/OE
	GtF2Y80087hM8pI11l5KhPkYz5478vgPEQRk=
X-Google-Smtp-Source: AGHT+IGVwHG0zEqXyxp4G33Wn0D8WzlIOazTNPCr09brMJQD1A909n0MRLK3vhky3M5ty4YqeOKdYg==
X-Received: by 2002:a05:6102:c06:b0:4e7:bc41:a9ab with SMTP id ada2fe7eead31-4ee4fa0bfcfmr11804447137.23.1751373650230;
        Tue, 01 Jul 2025 05:40:50 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c7f1db3sm1455841137.12.2025.07.01.05.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:40:49 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-88131f0badcso1934148241.2;
        Tue, 01 Jul 2025 05:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1upFnpYuslEEmILiCyUU2iGh2mojdeUhP7OSRbriqhrK/2Kf4zNxNeJysvJzNGoGaPahf9O72xoBl@vger.kernel.org, AJvYcCX22acY9oF6xgcgR0AGUvsTUfeUUe6o63dSy+goDnd/SvTtS7cHSAkZAuNlA3o8fCXg/VeRmWu3orUXMeJrr28tK7w=@vger.kernel.org, AJvYcCXedUypgR8k1azVFADSG2LwDUT6IqXCQ6Jbh7P8oLjFg/4V5UD0zzshq1LaPTeizZZe9nwHXo01yE7n@vger.kernel.org, AJvYcCXhK+I79p1rhg8H+eowSSsuIfV60np0JCnYA+fMkfOevvqcoE/0z+0TQqmUCliCWx9HQMCZrTUEsH4KOne3@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:4e9:c7c8:5e24 with SMTP id
 ada2fe7eead31-4ee4fa172fcmr10924302137.25.1751373649356; Tue, 01 Jul 2025
 05:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:40:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU81rszWHZ+coxKVxVuTMdY25bdgzFysNX=65SGOefe_g@mail.gmail.com>
X-Gm-Features: Ac12FXxjs3aVuElRRynwax_nXKbGzGHFoBCj2ZBCriMFMV9-D8p09N6OYehYvPI
Message-ID: <CAMuHMdU81rszWHZ+coxKVxVuTMdY25bdgzFysNX=65SGOefe_g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] clk: renesas: r9a09g057: Add XSPI clock/reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the XSPI interface on the R9A09G057 SoC.
>
> While at it, rename CLK_PLLCM33_DIV4_PLLCM33 to CLK_PLLCM33_GEAR to align
> with the terminology used in the hardware manual.
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

