Return-Path: <linux-renesas-soc+bounces-16817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B1AB01B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 19:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A949C189AF76
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 17:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F93B278E62;
	Thu,  8 May 2025 17:46:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516BC20D4E2;
	Thu,  8 May 2025 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726417; cv=none; b=nkRkpM7Sm9K6aHbfQLDhU7O6Ht7RPqFwB6G/Lrkr4nqwWFy+YAAFXaEo9H8u2wwwCDDW+VPnkee8FGUYLM/wTVhJtI1yrB7xOTx3Lu1gyqkS8atIaXIXV+XiKMibuDrOgJEZx1ILIzzbCAh0tWld9qTEMBJDf+iwM876t9Gb1lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726417; c=relaxed/simple;
	bh=ibt9cgcI3gUHQpKYRESmp2dJ0v63Yp1F/f9YybTZ07w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djQiaYJ4w1u0UNWS3s9X0qOKc951EJqdg2LSedg5XaOjZPIN1DxLMfpru5K/nCKNpt69hlbiL7DY4UhO7KeQmr7pT87Bxt7P0/uMw/3uAGpwJdPMslFZEW0q8ky3vgQ6/Jtj2u9RJ5Qwhyg4XA3z/WxOaBvERl0YpoxTJT/RwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c325981002so393627137.3;
        Thu, 08 May 2025 10:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726414; x=1747331214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOg0scEYoOI3j1E4IDMmsXecJxplyJsETeBH3Mlhh/Q=;
        b=e80e1EhmTGI3lJCB66UsDEnbc4Zx03mEJpJBQ7g/kq8EDyd5KnHsmQPV0AYE57qDKg
         SN1XvSTfoMO3Ty+7toj7TSxfp5UV/R1G2Le4zeaSeF08CcQjDxy3oyMrAV9AkC6f8TvI
         45tv7BhYsFQI7ZWUw9ciTSfuxi/sls1i3LWy9LpCPJ/cWD6B7OAIGcFtdKVyQ+WENs3M
         DyyD+bN86PstFC87LSjnNAKK7HCTRuxIoaJN0qIykHWWiJJsKWPFBV6RGQe/kBv+wT8I
         s7m5cPu+emgvNJVTdW0Nmc/qspoOmmE8CYG3Od4AfYLYiMF9aogIL5uSRaPoAMdLyxHI
         mryA==
X-Forwarded-Encrypted: i=1; AJvYcCXnEikggJKvpkxDjukwXcpveO86BywhWN2EyoDx6tfL+pI79qNmmtjNXiob57OD2EmLw/hxZzk8enqv@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTgSjER2aL+6RxBLU2Rbm2EauEf3YIKbmIxPEHi3NxlcuU5gC
	CgcbeFc2zuVRzg2KoLbahbd7jAAVjwh3+NQJk+gQ0+wumpENtR7mKB9flkXY
X-Gm-Gg: ASbGncsXoVPaOunaK1pgdKf856P0EqA+285Gh9zm77v4oJ3OCPlI/ITFtbDWVuzQ4Tj
	pPgjXIo/yliBdM6TK/lpRkV8irmx8zUWVulYKC/O9XUxa/oFMh+g7pLJYz+8GNpVKMBLQi4EWDY
	Tqfb8CVX0qqj6+UmnUcOYbbSton1GnGIuC7+Ep+ZLciZSSVoQj2PL7LCPItppHh1aurr5vKccpX
	dSBAhT3xhGG673cYNuvmFjQ7UtgDSki7W3d3t+XXBXQfllTThPzEBxgKfvchtefbh/QVdnb9uTh
	rPBj1yZiUfggiVd8mOXvHIQLwnfucnINNJIENpnfi9eyxdr5ZOCrMxXfe2N2O883tHzmVtKlCT9
	1yQQ=
X-Google-Smtp-Source: AGHT+IF9nwkXdf1jlPb4RMe/90c+difav5VZe0+HDzf/56wP+OQc/26qichsYt+TmP93iJ43QgxhvQ==
X-Received: by 2002:a05:6102:4a8c:b0:4db:154f:46c2 with SMTP id ada2fe7eead31-4deed30ce26mr348392137.1.1746726413773;
        Thu, 08 May 2025 10:46:53 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203a380sm147087137.26.2025.05.08.10.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:46:53 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so351086241.2;
        Thu, 08 May 2025 10:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBPE9OCu7Twp4jtcYMFwMaqFrXCgvb6ca4U5ijxIlEOQ2XgJK4n0JuXgr+UFSfKVZgQkrD21APU5Oq@vger.kernel.org
X-Received: by 2002:a05:6102:fa8:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4deed37048dmr300994137.15.1746726413329; Thu, 08 May 2025
 10:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425100129.11942-4-wsa+renesas@sang-engineering.com>
 <20250425100129.11942-6-wsa+renesas@sang-engineering.com> <CAMuHMdW2NHeatmSr4ePj6fPcbT5XNZJr967L3NJ_i6xYwgxaBA@mail.gmail.com>
 <aBkfHudni5WoJLtt@shikoro>
In-Reply-To: <aBkfHudni5WoJLtt@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 19:46:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVQ_Ph4_rr4fcC1POPX4t3acsz6RgTn1aU=9JrFCN1hw@mail.gmail.com>
X-Gm-Features: AX0GCFsEsbt0DMYoDK-JwE7JJMJkRF37Rgb2ICAMmY0f85yoj9u-ac6XmgYSrpE
Message-ID: <CAMuHMdXVQ_Ph4_rr4fcC1POPX4t3acsz6RgTn1aU=9JrFCN1hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable USB
 host port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 5 May 2025 at 22:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > According to Sections 10.6.5.1 (1) ("Meanings of USB_OCI and USB_PPON
> > Signals") and Table 10.131 ("OCI and PPON") of the RZ/N1D System Control
> > and Peripheral Manual, USB_PPON2 and USB_OC2 are only used when both
> > ports are configured for host mode.  When port 1 is configured for
> > function mode, port 2 uses USB_PPON1 and USB_OC1 instead, so you
> > shouldn't need pin control for USB_PPON2 and USB_OC2.
> > However, that does not match the schematics, which show that USB_PPON2
> > and USB_OC2 are wired to port 2's power switch.
> > Can you enlighten me?
>
> Both pins I enabled here are routed to the Config CPLD (check the DB
> datasheet, page 9). This handles the configuration and routes whatever
> is selected to the EB then. The pins on the EB are always named PPON2
> and OC2. Because these pins are always routed to the CPLD, I think it
> makes sense to have them described like this always. I didn't see
> another way to use them anyhow. It could be argued, though, that these
> pinmux properties belong to the DB, then. Maybe this makes more sense?

Oh, I totally missed that the markings "USB_{OC,PPON}[01]" next to
the "RZ_N1D_GPIO_1{19-22}" lines connected to the CPLD are merely
comments, and thus these lines are not physically connected to the
"USB_{OC,PPON}[01]" lines also connected to the CPLD.

So the CPLD takes care of the routing, based on the SETUP_SW<4>
setting. And I guess that setting should match the presence or absence
of a jumper on CN2, which controls OTG vs. Peri for USB1?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

