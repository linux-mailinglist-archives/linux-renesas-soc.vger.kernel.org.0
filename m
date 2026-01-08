Return-Path: <linux-renesas-soc+bounces-26409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC5D03D95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 16:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9EFF930325EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21851492F2D;
	Thu,  8 Jan 2026 11:04:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C154A48709F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870266; cv=none; b=AMeo22+PoDLYdcKd0YaoPL1QhGiUuQQGrbe8igLZfHDQ7be+H3vVb6YAEjQYCHLJ56qebdBtTBEcRA4tZQJgkRQWpn9SiA6dfQ0k2YyKgRgJNYX47xQzX7Kkm2iEMXXQRkxIe35BaLj4RzN2PE27J2QxzUmAUmsuOb3BB1ca414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870266; c=relaxed/simple;
	bh=WEbcSDKRoD7gEYd8A4zr9VrjAC7zseRyDUt9oh0Ypyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzunfFS6hw/8/vLsCYh0RAmwNBr3fYcdrgATSBiqwzzSEQlM3uu5PWCjt1tQRYLyz9PA0JVB0zUFbYbyAryk/21MpPY+cp+aNNYiwN51OXiSV82b6LQ1yrsPIvkiqS19OaAMJIC/ogKaToYaYT4+yGFPcOg/loYLHe5qzdkkpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56021f047d6so954902e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870252; x=1768475052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW4lJEvDKNBIOHHbQXCpFFteJtHtm1h9+jTivayDcjE=;
        b=oUKLAfePG4uZEayEAFurwUfg3XOtyiLfjYIAoOLkqyhK6xQH5vXRtaMgY4kBOy63Tn
         RLBtd5KNA1J1Ixd68Du+tutsVWu00KsafqS+KAHiIOZj+hM0fcOxMn7pRTgLIQR1DZqq
         UMPUWMkytbLresgfI4PV4wryjdEtNSyKst2MzrDo6RtjqaRj+sYiQCCqA/3ez/wFEulj
         AIUbA2CgRg9wk1WE/iJhEflk1Lc0tQufJ1z1aNVrXYcq8DKSzPe6JunFcw2SpXfzxMRF
         AYhJXcvsyhuNPOVqZ3dP/LWkJwPutJHZSb53u8JOMBav0LErP2iG4lKFRxZ44h/i/LMA
         aEDw==
X-Forwarded-Encrypted: i=1; AJvYcCV/duV2pv6ONaXjyNXlNz/9xJYf8CgOBLWiS7BJ+tChks2B3SV/ifARD56gawDUsLyLuMjBrZ3YgRaLbS9ADIVjHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWX1H6IEwRXm/wIaCaIxhW91aZPA1/C2Aw8eafB48DodY5stw
	UCvB/lcaExOI/NYQ7AQDSTRiIYnZ0f7shX6sFNl3C0ZuDbk/n8I0MxY8vNrurtkm
X-Gm-Gg: AY/fxX5P1kDnYsfohiETNHQqneIGF1cEp7BJDmeOZ8DnsfiOFqWyUkzOitVOdzZEHro
	4w3zlEvO6co7Pm+rjBDxFn+/7iJwappZMX/oh3rx1o57zxk4U64Xt1hA/hwKu6MoNgAp46i6k1l
	vLzVK+evIzQ2H1dO0in0uvmK7KtkYyg++n83MskiWJjN6GBo/QtcgpizEZVKCyTrwChaTZQsDaL
	MEqN5Jis4v68EZb+U+hNNsW55CR1LBgBun2Zp6ordiDaw2drwW+/+0gKV7C8HipV16BGFVpruPa
	StlclVX0pPgRYaTQzvWHDT6uA7qfxUnszG7p9NLWbd8+sQp1NFFF5fF7GjS0ozFaZIWidmuEeYW
	3lDtFwoin9DeS5eY8MxaytZovmcAy9337nnYcw+ZYDffNMgZEJKge4ynsmA8QW67FsVCQaPCPfH
	y6lJrBrQ03G+gErYwvsZ1l4lKDcraRAkrS7zUD0+2Suho7BaCZ
X-Google-Smtp-Source: AGHT+IExlzyD+4n7wonXCRz2SJ4v1HiY0qRGPC1cc5XjxGR9sfwIY8guNN38edUasOrDprKkYg8aag==
X-Received: by 2002:a05:6122:208a:b0:559:65d6:1674 with SMTP id 71dfb90a1353d-56347fecf57mr1641291e0c.14.1767870247625;
        Thu, 08 Jan 2026 03:04:07 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a43fe52sm5789557e0c.20.2026.01.08.03.04.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 03:04:07 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so1239398137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:04:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTPuPx9FLT1g0Lce9am6jZrArmRc6AH2AGxK6VjrHqpJLXbrzMw1nyu9CTQx+0qrEWf7zgBUFk16E7W4MEVrz5pQ==@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5ecb5ccec15mr1808296137.5.1767870246533; Thu, 08 Jan 2026
 03:04:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 12:03:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXmVJduzBCRSMLuA90TtAce+jMnYieLXVwkzpTp9vbvA@mail.gmail.com>
X-Gm-Features: AQt7F2rdcNlBmaOOLqeBvIEmgJRLxP2EPdkJ2jL-Gk3cLQUHkNjiaxvGH7nIx84
Message-ID: <CAMuHMdUXmVJduzBCRSMLuA90TtAce+jMnYieLXVwkzpTp9vbvA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable CANFD channel 1, which is available on the CN35 connector.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

