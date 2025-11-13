Return-Path: <linux-renesas-soc+bounces-24564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 100DBC57EA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80AE14E9532
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA2C283FF9;
	Thu, 13 Nov 2025 14:18:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310727EC80
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043533; cv=none; b=OeA4KFzv1oQOJK5svXGHhufDU3YDOiDPK+O2Yc/d26T+bR9yP0IRsbPLF+DhLqAcrT7Z2qVguxXwD8JBK/HK8DX8Meek4/uOuSW2k3S422fLEOwI2wa8yDylLPL513Jyiy92OMBQ+LIePsTIKwwfrKlzy1mz6/Y1pw+qmDaSyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043533; c=relaxed/simple;
	bh=SglwgdJjdXgtbcGuhBd+z1SY8I+c9+nx3fEEJ4chWEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk4zJCgUgjFDdFWgzleHCMLVsVBdPEGmcoW0Q5OjBx4LYxGz5Mk9TogS3M+wM89Xd/63rsqg9SIClvRf3XxJ2kwdM0fvwlkQGBVtL0xzQ1Te4LgoFeJEGN+0VyL/v4wHYk0YkSKamkhfFLE26iYo/TmuE2DQeKXGKfI4X1Ravbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1501398137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043531; x=1763648331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lsBSIAEUPRTn5OJ+c8R/u4+S4nJOhGwxwcKm3MB6tI=;
        b=mPEtuX1ISN/q7KKWI5uHnr0FyMsy2CM2xWFXW3CDLSY6d0+DPWQDKn4CcJZOWPd/xe
         r59FTH48+altgsp+mbA2GcNtS/Hb0czFMfKOBlh9NOY6ZzHvIeAua2thu5I92yQJbgE9
         fgn/oTJ9mVWJX5GzinzujHjug8B9M1TjP0X+EBi25yEctA3DroHKhHuNdb7e43gxMrsI
         IQ04/3IJ5hImzURk0fZfXbNWJhkOIAMC8BKTIfMBPqjEHAL074f+L83uzycCRYYR4iNY
         0bPSbUWb1aNtJXf+Q/iMkdtIGPZBBODMvDfXc18yX5NbEkowmI1IjrMAk2nHeC6dZy21
         SjQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJzhHe+eUcQ+SWtI88rtG5QyW62gBvOhlP+Hdsj4qmcUPVbR3uJNEx8LFkU/QaTdbrprV2vFLw/sCSusbzrgPHLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb2/M4fXZhlxDkkfDLejYlG6rZscDKJczlZXy2z8pUGhRSEHVK
	oPdQOhSZQAQlSA5rQXv9wX7yXRDrkceYdYGSozO6/brZDI9zL9fU50uwKdMbCERNOt4=
X-Gm-Gg: ASbGnct7CG1GJol4Z5EXzPe/kYzly4dSXVzKtVF9y4ppoQp2/A84Kkw0q2r6e8t7y15
	A9WNZqzkLo9IpBjKw/CD+Zz1gCxZ9NRavaecj3TFcQED63yS8UptRg0Fillqg37xwqOYpRetaNz
	LGpC9v4eHI/eUUXHd+ErRTBrU2Nwg7v2dwsBieFnsA+hSrj2tT0A31BigGKWhMGC1hW1VUy2Zr7
	XVVDIM491a3LO1sWttoAaZ4qv6nW4Di1NJkfc4J14HoLDcQiYr6FnkYNcRfzibeago+B6LCJySF
	QPAFsXxq6sdBmc3nvXNOKthXG0HRBgFWf0wDc37xf0rIiutjrx56nqAjpHrM3w1RM4GOKxzJhwU
	9SrGOdKejDq0UIO72d+JRbCz04xPbYe9+KbWSGFMHGgC4MlPl2ERBbDnUKWT1uK+39W+eL6UsNs
	xCHDnX0Z6xLrSBauzvxn7uuZabpVvev6eftywEcHNItA==
X-Google-Smtp-Source: AGHT+IHvI25pV1UIQU6a68dw4LiCZB8T3JaM4wF98HPpbkl1w5Wd3hI1JL4AuX9LKUJIM5amNPcMoQ==
X-Received: by 2002:a05:6102:1621:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5dfb406b273mr1452065137.2.1763043530795;
        Thu, 13 Nov 2025 06:18:50 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937611bfdfesm612719241.13.2025.11.13.06.18.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:18:50 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559d8717d80so540715e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzmgAeP01/Cp/KXo7FGNDNBPDI2MLtJK7JVPgb7MyNBUo67hcfyTbmRX//uIbZpEpALBtP1ITG97rqq/9yIRcXow==@vger.kernel.org
X-Received: by 2002:a05:6102:b0b:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5dfb41e3b61mr1262190137.12.1763043529716; Thu, 13 Nov 2025
 06:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com> <20251107210706.45044-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251107210706.45044-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:18:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXr+pdZuYM0b1p+hZAjFMR25t3FV8cGWSbqRnTk118TPw@mail.gmail.com>
X-Gm-Features: AWmQ_blZmrYQK7IiX68T9lKCtdQnRgn565V-vW-eTn9Sd-DrKbAs0Z8Z3RjSLgE
Message-ID: <CAMuHMdXr+pdZuYM0b1p+hZAjFMR25t3FV8cGWSbqRnTk118TPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a09g057: Add RTC node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 22:07, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add RTC node to Renesas RZ/V2H ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

