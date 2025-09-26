Return-Path: <linux-renesas-soc+bounces-22401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B47BA2F60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 10:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100D818983BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 08:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31406286D46;
	Fri, 26 Sep 2025 08:34:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764897404E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758875644; cv=none; b=EWl+FfUJvwWG2uPythUPO2E10PeCdbbsxO7sBZCei9s98G/taPQJW6C86U7PieRgUOv7VFweojycH/1SJyd2I0YvVRk2a+fnbgo5v5fplhAzLOCpdRnSVhRfEn4joJalyGCBiu5/xowarfv0bUfBOQrIN2SArmm2S2LlxsC3Y7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758875644; c=relaxed/simple;
	bh=RGx4pgV29eGmYzmpi2nvGiyOHKStR3tP8Jcqk4BZwYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVZOOSl131UAiEZcXjn0iY2UVtMbNWrZ3lUb0C4pObq59FRvk5jEFFLjQmfL7hGSPysdsAm3CB7wecWNLID+O113bd8qpRo/G5/mT1RPjmU+A9FAdZ4w6pBA4sLFLrlXo9atTC+j2uv/je6U6db+52x/xhqGE9b02NeLdtBuo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so635899241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875641; x=1759480441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY1rhcUMmAwK/dbcMND+DzQQ6f9robrwHJqphz6/mqQ=;
        b=HMi1DpIpGaMwtXPNo3oHEo9MPDO9nR8YFFh82ArOTri1Uw2jjdgVTWfYSAxOzcWjDv
         W+9XBmq/HBSWJEPrsrvZkt6uChymn5SezbGKgxhBj6FlbKWBa2T516kl/tqJs55BEMIl
         CTY+LezzVXgX8lWtkzIEW425ebKyHapBzenMFWct7VEP9k3ucDGirgxr6Hxo9LJkNGGv
         8I3yY3MXiVzq1xKHPpmjKZgroqwWsV9CFL0im9kFDoEh9iyFx/uiCoLarF8NvIAM6DuE
         bwKCGs2sHMZ+7VW1fz5tdKLIzM2oz8YR+KiabXELR2MEt08zVfuywKzlcNcSK+pYha8x
         DWJg==
X-Forwarded-Encrypted: i=1; AJvYcCUraz/ijjGuz+J+lSVbIsOGy6mE0qhom0gr5/NlZTKxVw9CAgokY+0rAymvBul3C7wDa2rAc9Hj3GICy9CW8o3TJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKcvqraOFTXmf/tCprzKcXItZAab65Qs/aZwjDohsyjMr3Q4gP
	S/f5CLvQKpzsubBjmQhh0fhszuAWF2CUyc9pDL8mZEmZllLRNn7N3NEdqgN2/dhS
X-Gm-Gg: ASbGncsjzwvTvvZlRxOImfcpACzvVCNo30mHp9l766+wBPPPifZIazAjzSq6f5d2+15
	2nA4b4IqVFaOH9weq1RTbkdQy4JEIXXxQTTMWD1u3lpqBJkyHRaux1xLc+DrW920R0ve1fcgoq5
	ROYHfvoo9ysKW+l+tJmC0a7onw6Ni/ZE651zzkdyeJueUZuqZJJNSr5P0OKVUTuIo65lLHId0ud
	BHkcQgcIWxPYIUGFzHjF7ClemtcImBDoGCvbZMiifcdnBIVbc0cUXhtC7T2VZ6dnCtdtDwr5fmU
	+48XwkqVjbRWSif9rwgOLMcVb45xMjKRMl56YTPdK40qMZBfKxx3AZx8zcZKDBuBcV4dL5Bv2lF
	4lbgcepXa+ZaKxAiocZa3bij/zVhtyeftvsD/Pm05nvBZmn2Wds1hrilHXFaw
X-Google-Smtp-Source: AGHT+IFeEBz37oRQR2GFw4gibM0aW9JAOoAiNEIzmYSBxHrcWOSBM/RPTBtSYd03vLg+nfxgZp0W9Q==
X-Received: by 2002:a05:6102:370a:b0:59d:458d:b629 with SMTP id ada2fe7eead31-5acd2c14108mr2376130137.30.1758875640932;
        Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae389da765sm1123217137.11.2025.09.26.01.34.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-89018ea5625so821090241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgFY+PbQN3+5zs7rYBEyrabVop0+74mxPnCetO0zV0MctiRRJ8/5vgjyeEga+9pJUuiv61AIDgoElgClgqiRxNgQ==@vger.kernel.org
X-Received: by 2002:a05:6102:50a0:b0:520:a44f:3dd6 with SMTP id
 ada2fe7eead31-5acc83f7509mr2683165137.8.1758875640159; Fri, 26 Sep 2025
 01:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:33:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyWVU9Tzanq9OY2OZP92AMgYnZtYQZ8y=WsEiRxp6TjQ@mail.gmail.com>
X-Gm-Features: AS18NWCMHBoPzEWPgJF_9P05kxRIgT7Wocv9e9QW467a4AnZ2UK94rlvm-_zDZU
Message-ID: <CAMuHMdWyWVU9Tzanq9OY2OZP92AMgYnZtYQZ8y=WsEiRxp6TjQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind RPi Display 2, both 5" and 7" variant, on
> Retronix R-Car V4H Sparrow Hawk board. All of display output, the
> touch controller, and backlight control have been tested.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Build also the plain DTBO for each DTO. Each new DTO entry in the
>     Makefile has three lines, the DTBO, combined and DTB targets. This
>     is easy to miss, so note this down for myself.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

