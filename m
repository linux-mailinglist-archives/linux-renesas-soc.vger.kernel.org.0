Return-Path: <linux-renesas-soc+bounces-13462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73BA3F841
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8594213C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 15:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9929C20E02D;
	Fri, 21 Feb 2025 15:18:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA712FF69;
	Fri, 21 Feb 2025 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151099; cv=none; b=W9ONOhJ81CBw+bnzTAlkfAX6T3u4Cwr+o/RCqomY1CmsOMBxG5ZdyM56vSg6XdxSD41a6dXQ+r2+kw2vEKOEmtXGZGqmPR4vCoAWLpNF/T/MUWfrZKR8U7YM+V7nj4s6uJa6U1aOC+0RezPBEtM+quLFkwu98vV5uefGmtgfjsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151099; c=relaxed/simple;
	bh=Wi/4Tm7SYWtQApgO8168hUvAybQS82pN5RyWgJrPIQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rdgmm1m724HKJuwB9rfLjcgqmuPeJAPbmaF/6a7OKvw22mzjcKqaxOD5LrrLgkhMLZEkOq6hlE/8QXKzmJELdY/cNMxLRLm5xdwlVHgTVElOTkZRRO57qV5AG7Iba0kTFlv3XOEey7qNwSlNLqUZZ2f/wnliCfiJ90f8PD8gUIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-866e8ca2e07so545180241.2;
        Fri, 21 Feb 2025 07:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151093; x=1740755893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+7vmZY6vs1S3igG09rHfZGLTtWVY3qpcTDCQuafT8A=;
        b=SntEluMSePlG2DTTZYhlIWu5f5U2rkAe1wfx97t2jabIp33Krkj5MVxKGgh8c4DHAX
         s4LTUtKipdP6iPX5iiFg1Gmi6BS3BCU8DZrdvGbRFdgKmW+clnyt46r2qW53PXVGc/0x
         Nh9BpgVmOOQw32ud0N9xS49+fEczFSGytjJrh5y52ZCtKVAt6tHe+8F69WcrxHLjwFhx
         SKw0mnVKod7FDpjzxx4MsPFaWXaD3lNnjmCJqFev+gOXnXtRAmg36DGccJ9TZPodRw1+
         c+deN46RgFoCLMWinwGmwzqEaV4XRPLDyty70v4cxe2foNsSbxKtkWo0/39sfF2aBh5O
         qa4A==
X-Forwarded-Encrypted: i=1; AJvYcCUpOWPYSDLE/SDL+/92QNCrYjnyaKQyB++WuL/wDhMPjTR8gr+K9CkEPq6Ql1oYmpW+KM+u++VujKJ+@vger.kernel.org, AJvYcCWR3sXvfl+BTjclcIjNatWmzJRRf1yWYKBcslyORGkXvShxe2Se6PVy3yhr5knUGVJsXxO/j0mRmZNLQWpceaMM8TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbD6R8sB3E1P/e6u7gFbGci3gxibG7YzDGdTX5Cae0cYqOW2r
	l7mhCXPushtsrsfdpzgdIwMXfnnbrv+0j5Ls9CM7kPbfiVa268Tl/7V1x4uZ
X-Gm-Gg: ASbGncs/aXUsi7TNJ/1JkirTmSr2xvGqlp4gL+fMLe/WouJom8bgrfZ5D6AVX0mhFqT
	P3a2Owk86v2+EjZgY5dgDxkooddtqxjQ0dmwGWtC6J1EiiHPEulXcM6GzvAoW0lE0zSe7NreTNG
	Wolus5OH6v5PnTBWJ92kTGzGiVMo1m7+Flk3MnI2v7PYY1778mzebGFKwD/g7UXNMHFnWfG3EMp
	Bdor65dKKTiFHWKAGz+It+rvRz1m4ZobjhaQfMnmZVs+uSlf/MUhVaKglgJwHkMZQ0+eer5zICZ
	sbqwRb/IJwIk6Kykp4BoNQxzk+fexn8yGj9FM6NdFaSitUdurh6O5BWipuS+PC1K
X-Google-Smtp-Source: AGHT+IFJZpUMy8PqagM4r5nRen6FMigkkPbuR+BGR2PeMjQJmIQ/N/eplf5Hihpq1u9miEQ5sIXlbg==
X-Received: by 2002:a05:6122:1812:b0:520:652b:cdf9 with SMTP id 71dfb90a1353d-521ee2a7d7dmr1992988e0c.5.1740151093407;
        Fri, 21 Feb 2025 07:18:13 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520a91fcd22sm2846236e0c.19.2025.02.21.07.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 07:18:13 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4be625c5365so703538137.2;
        Fri, 21 Feb 2025 07:18:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSuqJKm/sfMoLGuCHc216DiJkP/c0Yp3I3qgCtvPftdNqclY84bdUBrt9b+pMYPxQu76En4lril/sXYFi7k312bpE=@vger.kernel.org, AJvYcCXRbFA7kdkhTG4tmtn+AV8qQu0nQXN1OoyN4RiwTuLo62Z961jOyrH1D/83XMczn7+n65Gq52wyCePz@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:4be:68fe:e698 with SMTP id
 ada2fe7eead31-4bfc00568c1mr2458703137.10.1740151092496; Fri, 21 Feb 2025
 07:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com>
 <20250207113653.21641-13-biju.das.jz@bp.renesas.com> <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
In-Reply-To: <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 16:18:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3B_c7G3gJfCR_xNnawkm3i=N3PHQwPKKwqbPBjDhvuw@mail.gmail.com>
X-Gm-Features: AWEUYZlDsHUerR6H2xzwwbgf-lDgLkmULVQ96AX5vzICsvOk_TtrHXhbIKXhnMY
Message-ID: <CAMuHMdV3B_c7G3gJfCR_xNnawkm3i=N3PHQwPKKwqbPBjDhvuw@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] arm64: dts: renesas: r9a09g047: Add icu node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 14:30, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Add interrupt control node to RZ/G3E ("R9A09G047") SoC DTSI
> > and add icu as interrupt-parent of pincontrol.
> >
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v3->v4:
> >  * Dropped RZG3E_* macros.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.

Dropped again, and postponed (to v6.16?), as Biju reported that this
breaks RZ/G3E without the ICU driver patches adding support for it.
The ICU serves as interrupt-parent for pinctrl, hence the latter is
deferred indefinitely if the former is not probed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

