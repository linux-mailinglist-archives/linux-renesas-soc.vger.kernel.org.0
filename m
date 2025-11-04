Return-Path: <linux-renesas-soc+bounces-24058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A699C302D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 10:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EAA1881753
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 09:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1586C2BCF41;
	Tue,  4 Nov 2025 09:04:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4820572605
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247055; cv=none; b=YCZ5uyhWelh90UDhCqtMdeYguR4HxN/rbzzBpdFGuFWnK639SN6KptQtzCyE3BEVKDwCqAyggDEhC6Jn6pIL9VhRjNWTvFMJ3ZZyNW6y3a+i75pZtwWQImeo28CF4kfMpe8MvIWdJoGp8VNF9nJvdgZAIdYfyGkA2GYFBpP7lMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247055; c=relaxed/simple;
	bh=UdNn3B8bC7IQAA1c9AUrLXpfm+Der+/vToVpbZchveM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cN3vML7FGcXcCMztSPBBiMib86F9BCRwGyoNV65WLfOhTHI9tBFBv0AyEimz7Rk7Yt11CxFPBJ1rEGBsCRj/J0jPVrJn4sqZEKh9GTcPtMBNss1PMuUUhsffumctzPr+rmNYnz4o0f/M9oRhhB6et/TSCKwbgX5OAZz8uaaY0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-932f654eaaeso4508740241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247051; x=1762851851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO6dE6UElPiJpkG1mq8m4CRYqFTl9ZYqxqWs3yM4h1o=;
        b=LZvb16c5vDhgIGoMbvHPqHXx+x/ZBxVoHDj9EKGbj/KiDiC2z3oS0zioqPJR7FX0tk
         i5DvnFXus12J2HmkYmfRHrC8XvGrmmWSa7XguZpEwheRW4s91GOoXRbtGulLQwiCOhsd
         qJgNzc6GbjbUaWN1DLodVKCeArYbcztMW5i0Aiffd+bn+WEfYNE8rv98HNRJtTGjncEp
         4me+tdJ0lyHtxIZSEpqMRmQLrSb5z4yIQtVIMpUVrJYHE8V0oEQ8A7vTn+wTYaxq27zN
         mZNJFJy4DUHVt3GN6uhAKYywRh+ZNaY7TVywtw/YT7GRUqg6N6kAxQbICz1OPGM+Xenl
         s0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVblDzxpUCRS4kN3htmzWYFPKmnZkNIsdp1tnON9JpZon8CLk1W4sgiY/WmWtGKDtNNpq2fGdyhVIuN0ERAQMP2IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaQ/J9csJPdq+hLrJydbhHLXk8SDe66K88pYuZhLcYSGlaz63
	nug334dAOMQkDEaWfSd0hq0IROrlvjdh8quiCLiyUQzODiXMTO50GCK1drf5WrpK
X-Gm-Gg: ASbGnctGbZBYt6gzvvlxAPMIU7Y6BnlJiDMuvtkGMoLic16GMwGXKQWYNBjW46uv4BH
	6Gc+YMbkxsd82lwrBaG871EuoL0COhuxKrWrTa17JKUMS/CQu95Mb8PTuzpNrA8l07pSqnpfz7g
	w2twsY1Y8Dj4FlQTW1tn6I3pQUebbN4qhX8l7iUakHE6KcCvys26XHjoLT63bOJHAU45sepmdiC
	wcKbkbZ/qocXTopjXC5xsHKVxMjYr7THpXOYPiypZMjUDZ3rkN2th9xcxa9bGigjdSTmuKVsr/o
	7nr1cxaCIhuaFtoKhtP19k3ff+O6vl6T1yE2MTsScipZPKG8ABMeLMJxMsQCD4PBqQF/ivST8c1
	iAOLADdeJC0bgE9gB/NS/Fs29V65sdrvCkGcEWsT45tHy1w5k/4AMLzK+1SDWTGBcMcIuP1qihF
	foZaB9f0A1rQVIup0jahY5ptBzMC+FSq4VE1qu86VYLQ==
X-Google-Smtp-Source: AGHT+IFcPlG9fYqH3GPrCP1RjYzogW3j4oBTUjk5IjknbWwzv4AOPjL8b1GE2M/qlGmbqU8I42KMrg==
X-Received: by 2002:a05:6102:164e:b0:5db:c9a7:bdef with SMTP id ada2fe7eead31-5dbc9a7d8a1mr1901059137.14.1762247050806;
        Tue, 04 Nov 2025 01:04:10 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbf330792asm913226137.11.2025.11.04.01.04.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:04:09 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5596b9e46a2so1112235e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWz9/aEf5ddh7Zbbm50e6l0kgcMGKC/vf4DQSgQGU4mfmGZXacYXtc2l12wLedYLCJlrU8qu73fBjyQJDqXSHNuNQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dcc:b0:5db:ecde:5ae7 with SMTP id
 ada2fe7eead31-5dbecde6663mr1599267137.32.1762247049753; Tue, 04 Nov 2025
 01:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org> <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmlcpVQIRAtDzcmHfsASxj-kOO0XENw5qhpcWFOCPThzyKdxDz-JN4eLYI
Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 21:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
To be queued in renesas-devel for v6.19, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

