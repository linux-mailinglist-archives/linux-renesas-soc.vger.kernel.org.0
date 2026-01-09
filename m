Return-Path: <linux-renesas-soc+bounces-26535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF30D0AF7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61ECB301C365
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF1B313276;
	Fri,  9 Jan 2026 15:35:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78830AAD8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972936; cv=none; b=O+QMOs5KEbo/OcVaPE7bctX4bu/C/y920umatuvy+8ul2t/FEGOHvv3qZP75VcR/+XYoWeiCW/nQg7oe1SrAurP5Xmsp5dq8NQVeX4E5XT5V5ZGp9/WHEknp23Mu9nlc6m0PGZ6UztB0FAWOX0/N3nCLQufDHxOxfimdhFwv2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972936; c=relaxed/simple;
	bh=IKLiyThDVylL/sA6NxTppXnRpnJSbncfjBx2QZbB8BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZkrM9VtPBVcYhuKC2p3J4UQBLs1ZIhm9zdtpM11dasiSIQCikbaECcmpaispAb0SetuH1eP5OHn7OG6UHM8lPUq3M75IClchT/xUJ5fKqA/+nwOCL/p/yPLRdcbTzVJCi921GosiQuVDX4CSA8od89vl3jTy8q745N1qLA015c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ed0bccd0easo2139527137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972934; x=1768577734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JpAkEBWTyz52MdMJvMUmBuHfFZ5rrOLCtTdutIe51A=;
        b=DRNPJSJHvB8uIS+IO/TM13KP+R41a82uMnlpb2RBEyObSmgiZ/qgDOYPpAgV4Yackh
         LTAbVPIe9OhxqTIV6fFQXrQ0WNmE5/pK4M0k8ByeUedtnsRUmsMli1NNRX0BRDjQwya1
         o7FYTD7KE6gZ+fHLchJgky5emu7yawvdOf0GTBIHgrCrP1N6g6BXsD3z7JZLBR19r2XX
         oYQQsbb6+vFd8FLBEhAKa/RiwXoOlBh0AMnpf/DOV5HzaTAKdrN95PMMKM9HKbf4CDm0
         qP3JrVYszr2Wf0K0wPC39TfYww4wPJvyhJRztkxytyvwleZtfHAZJQHkjtDSYqw6B8fV
         /73w==
X-Forwarded-Encrypted: i=1; AJvYcCXhGVStmM02ltIhtCtWjizmY50BUOb2JJGf9WJu70kKUb2D0nRXP9f9uI5HmSyXDnFOKUVFp4EkruZeitwBM0U6uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTTyNRKkAh2RIiYGbgdikeK9pd3prdnQJdi7/SwixDilouA1b
	GKo8NGDkzy5EQrPcg44JPVxMNqw3cF+adN5T9fznTuYC04UNvhR6ranLm2dLDWDu
X-Gm-Gg: AY/fxX7yntc2UQ7j88j2khR1W2LGe1XVs4fXN6k8GDHNJbNtjOzrHFBujFt9rz1oX7Z
	uRKk1nMWRICSMAHwTtgwxLLxzGVF2/OvkZ+YINiDwZ29xGS6ZQvE8+4ccjr/zi8qDWTbM4kd0Vt
	P+VYt9GYZj4XWzwYLiUWPeVfx6BGpUIYUguRypeaNrtNAw/osCAJa1WzuY2fjKl5d9Ja/KyYoNR
	iYKQAgffTz+HHgvR3D3Id/zxkOBSgtJT+k5BkvkPCDlk1kEgbYjZdgSB56C1bqDy5Cte37b4l8a
	rLmoyHze/pAd5Hh9uNmgZqlhs1BGH6qLgiJk1S0O1tF5nHd+Hkv0ItVFA5YAGcUwA7uP7TD7yWa
	KxtusfBaL24O+rVBlgaL/XknocxFG7JX4sgOyzQGdSMu44e6IT2fhdk0nzfo/BZFPAHOuoFq6C3
	zs30G3xi6FGVqDCB711Cp+GAt4ydA1AG32iADxhj+zY0BZO7bbiJgWEXLOT1Q=
X-Google-Smtp-Source: AGHT+IHp0FfryRNsLNFavS0e3pnQgoVmMXhxNVDwGhBtq+1BYWJCmCVjjIzJa/agxTABX4EX1leMwA==
X-Received: by 2002:a05:6102:cc8:b0:5db:242e:71d with SMTP id ada2fe7eead31-5ecb690235fmr3916355137.37.1767972933886;
        Fri, 09 Jan 2026 07:35:33 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122ae554sm9198462241.2.2026.01.09.07.35.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:35:33 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f500ee7b8so2113187241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 07:35:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSBakL7WUiZne/AzZxdIxsCS77OKFK3hRcNAA/ZzD1ptBy5UlRjF/XsbHh7H1znbnnVsMsp7S/GEOYeaIUBFYytQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26cb:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5ecb6900d02mr4160020137.31.1767972933433; Fri, 09 Jan 2026
 07:35:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-1-robh@kernel.org>
In-Reply-To: <20251212203226.458694-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 16:35:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUyGqR4S++7cBzGCTOChuTDGOzPvpsGFWHoxjfoJnQFA@mail.gmail.com>
X-Gm-Features: AZwV_QiW6idvXU9i4mLU08p6fWeZyRwR1gX4pjwq6g3KXSy5jIx18YOVbB4UJmk
Message-ID: <CAMuHMdXUyGqR4S++7cBzGCTOChuTDGOzPvpsGFWHoxjfoJnQFA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: renesas: Drop unused .dtsi
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 at 21:32, Rob Herring (Arm) <robh@kernel.org> wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Let's just bite the bullet...
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

