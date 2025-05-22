Return-Path: <linux-renesas-soc+bounces-17353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C08AC0853
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACCA4A6D69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADC91A705C;
	Thu, 22 May 2025 09:17:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833BEC2EF;
	Thu, 22 May 2025 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905440; cv=none; b=m3+kG9mcNtYYoiIfkLg4hgSVL0ripJWq9Bov/kfI7GsnaiA3zufvgLTmHcVD7IkQndmit6xPBUwPuhzOHqNetqxcpy8hjGPo7Z7L0D7VtzuUvSoFnNt+zaXVwpFwYUqwZURdNBhPgC2nKDaLyy09zpzcjUDYJ3Xu6IOoY7IEQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905440; c=relaxed/simple;
	bh=/IaErV1ORGjD3ONKZzULtWe/gL44qZjWPclTrGU2aFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3SBPgH7llhb1iPYpjhYiJg9qoh67hNeGEGdbz/delDV3CxLNzwddPiipPTl1MqcAnj0FD2LLvGzAH5HIGdFiJ3CFAijib+6i69NSmqh1FnpkKlu97m06lKoO2CrsHN6uodHco9401rFGhPuQBEGKt/G2ZZeJCTehmU/RpIRx8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-527a2b89a11so2600531e0c.2;
        Thu, 22 May 2025 02:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905438; x=1748510238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fcNucn9Gox2mPrRS9YWmXL8oFeGL0Ik6Z8xzROlEIw=;
        b=hxyqj1LCzTZ4hXtLOjfea/OskWcZD1zP/55jTB42Ox6C7MlbdUqeGV/6RbZtfEmRbh
         vqIDYCjYuCmaFaObqQ6kJCmpOVu+RFm5zkAPEE6GKOqDe0uQaT9Spc+ip6dMiB4tKuDU
         r6mRG+JjK+NgvJx1Lo/fFSpkJ10NYjybZ2nCByN9gjKejdxdlj9biES0br7chJ7CU+1J
         zlF2YQb6NZKPkc+0VQryEVBUhPF6nNEm5RUttUlrL/a4c1QocprRyjLKDezZGCOHc91I
         2TGjoA2qMWlRqVzYB/Qk9SUP8F9kmK77uD2/obpiuYjoy5zB5Q5eJcw/vksTFaHDRclt
         ph7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/J2QSmCTgD81VzMZOpuJrBdXbMpBb8DPZQ9uua3efeQ3EvBhpJPeHt9HBhJtoknG6arHGBkJp///cvcWI@vger.kernel.org, AJvYcCVMYhZn4uWExp2ukTo1gKSf3A/6GP7tsXA/CAtoZN0lLPZ93+tYhfBAOLVVKTmfSXCgpI5NsQv2H/hoMRm24Kr6Vw8=@vger.kernel.org, AJvYcCXSmirK0UwG6PtlCaPFWI63yzJXNEEeg5Dc2uIf0+rCpiltHz7AzaWeV3lMEXJ5ZbUalTmK6pzggplx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6T+gnBP8okPXrJDfQ5gnzyb/pUgZmG5FQ6N3Hdjpm56qOfta
	gv9Zud8NPlqJ2UwxqpgbwPlkrulGVmNZIO5hvSFDLFj/REKQ+P0RmtwHm+1Uvvro
X-Gm-Gg: ASbGncta0ja684bWQzrr30adj9kUzim/P4AjIWQqrAnGuxaJYCJEnB3IEVXRlKBxLPc
	erMU9nrldr/6tskwyKaLaWWf5yzgHv+qDDjwDZH5v0mgNIrAonhVlDwuSgne+GmWB6erDQX35M+
	jO5mCLkNBCLKS4PMMeDeDgsKrJSUcELLV4AwTMuo2+Q4zXcEYumSsQ/+HxYA4Ys+N9ER6vcEpdZ
	v0i46gggQiQoiGRgs7GEPQnVzO2dxfvfHul5azmFr+hK+XNwCJBrv8YfWIQ+wTD+VRF3879I3FI
	4mnMI8oS+Q2uupYe8EMN8esbAZlyqJuq5JutvusHoVutRiA0wiaF+8fLO8vw3VSbNjDhK3DFhqB
	hP+Q7YurubDYdb5fAZQ==
X-Google-Smtp-Source: AGHT+IFSgnYBfofmbARQI0J3nJcXrYmEJgQKHORx3qXrbCR+mYVNxOIGlU+Vipwu+g6LqYUN9Y/UOw==
X-Received: by 2002:a05:6122:8ca:b0:52a:cdda:f2a5 with SMTP id 71dfb90a1353d-52dba624be9mr20710043e0c.0.1747905437903;
        Thu, 22 May 2025 02:17:17 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6c0f1sm11457250e0c.41.2025.05.22.02.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:17:17 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52eec54acf4so1170261e0c.0;
        Thu, 22 May 2025 02:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSYTGpDoD4RoeQXeShpDPmqPanr2v5zk8ROakiWwBjmyhz25ymlBs9+aP4s/ePCGJ7pfLFyB0h2v1o@vger.kernel.org, AJvYcCXBetq9pWjsShB1AN9ojx2eDF8AmZRIyAJpeD2kTmRUWvDQTAaV3i0ZZSGjw0gnWR8EQkqrxphNs3FZSx2hOdcO21Y=@vger.kernel.org, AJvYcCXH8XpWpoihwVYl/VrCgcbzfKtpF9N9gSAEZSMJ5E6rKm6hmEEmMrpSRaJiv2F34iLIJYHw/lO0IQEQ7HZY@vger.kernel.org
X-Received: by 2002:a05:6102:3e13:b0:4b2:adfb:4f91 with SMTP id
 ada2fe7eead31-4dfa6c63e0bmr26157780137.21.1747905437439; Thu, 22 May 2025
 02:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 11:17:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg8+L9xVXRZMdwOY39mjTwubt0Mu4wPQ-Uav0aE-rgLQ@mail.gmail.com>
X-Gm-Features: AX0GCFtVjaT4lEw7_7bMSCXewBYoWGKxqCBk-F6k7GFcFDLAt3e9ess_G8haAUE
Message-ID: <CAMuHMdVg8+L9xVXRZMdwOY39mjTwubt0Mu4wPQ-Uav0aE-rgLQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] arm64: dts: renesas: r9a09g056: Add RIIC controllers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the nine RIIC controllers present on the Renesas RZ/V2N (R9A09G056)
> SoC to its DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

