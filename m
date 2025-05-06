Return-Path: <linux-renesas-soc+bounces-16719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ACAAAC489
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78B15082FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C730B27FB28;
	Tue,  6 May 2025 12:50:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA9266B46;
	Tue,  6 May 2025 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535812; cv=none; b=Yq9fPED9p9Lu3tE/Bjz2D8u9WUO8tUmzvBdiawMJGqMmzkFUpiNVhVnzkonFIc4KePy9mVX+EdZVE4kUhvJv5KarQPibnke+zQ20rhDR3/3JhOkPtucweeSU4FDuKqZQbn6l4n24Ee0pQ5KVC1XbQ17vdemFIfpQIHl0Li4wCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535812; c=relaxed/simple;
	bh=gZPKHu3de39xnOaBWrciTA9P8WQ95TdpqCBYRonCb9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Je0NhOJpo94cUyzSbvo8BxoAJRRv3OR0piu7wzCvT3OxLtR4BCvUO67DbLoKtI2GdV3poFDhOTnmMuGwbE9mvRfvfF7LG6zYAtWQYl/6cVf2k9gQv95W/zeRFqFARoNM9IE/yRM774g4LgUgYkOnHJ9u/ZIt96+5v+Np7noH5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523dc190f95so1976192e0c.1;
        Tue, 06 May 2025 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535809; x=1747140609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dR5SLyEuVXCgzfFmFtCWiF+tB6qj8RmfZjai3JkMnSo=;
        b=NKymZdQF+X0MyTVh5BK9ADyi8/v0DItG/bMeA8RkbTcvjmumlKrQ7cz7kS35qUlDjO
         1mfFb4btEECb1NyLk6RBMEUDE21gXREC8tWg7lDZhH8vMiuZ/QcbMO39XWnG4mCHhSJz
         AlL2xV7OMxCIIGgcASOA3dW7X2pI/Bakpsuw1aXMkZEYvf1PuP1F/w+VZzGcc8T9troM
         fYU38zQu9viMqo49VTvCykIuqETfFV/aOg4bNCcPNOLzBUccGLR0kfe48kdzqvI7FbBM
         tZXEMCkhU2meYzTbiwXUNKTENSja4FgXUh7TAJh3nJDzETXGJhvCx3fPe1MjntI5MAc+
         n44w==
X-Forwarded-Encrypted: i=1; AJvYcCUHQdpzX8zkfGzyqK+NtO+vmNI4Naak/ggAo2EBstHTbvooSXHtjOSeNZ9MvtvtpVEIbvLMes1picz2vJ7SkxoLH6Y=@vger.kernel.org, AJvYcCXU9wp4kvgjiR9b6eNQ4YnIerny3e9cQvUHyGhdv0MqI7xP/qIdJr3y4UTb8ZuJAl9/d/sT8Gz+guJoBxlg@vger.kernel.org, AJvYcCXW/hHWk23xnvzC1f+5H50NrE8CEK14cBSlhcEEtLRWGpOGsM/aiPUV+C9PeH6ez99WIE8xLqM466cK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+tqhIJLbEUriCz46HYHpm5Sc6fN1Pk7K2uJIa62nzjmrFlc+
	hIKPsVt1OrGhlB5+7nxE0osr2PZCi60TiQJE8JJv0b1oCmPbJi0paQFjg9pN
X-Gm-Gg: ASbGnctU83e9iMm4KlzgCRYif4/bq9N9b30Mmg/ICZKXpW/HVHpAhXJl2hltbaRysn7
	d3p2K/ccoVbB1tTwY+DP3/Y5xUZri9T8mPigwKiMr3FknrzzBc0/pI0AK+b3QtAEIMnyM045Xlw
	fIYQtewydTbTP1UlFpTFeDfZp+uzAypXZwMqJzle4dLQgB1/D2eGAETnM2aAO0jdihm8beHFdC5
	kzAED05QZ3oPXqOrLX4iU5WCvNSFIe95GmMyd212F7eVb2p70x5NCOxdn8OTfJAy/iN0gUrMsJv
	xdtzJzm+LmymjYgZssGpRIApxsTzL1BJ+8z64y9HjEDf0Ty3RsoYIWeMmP37qCCtUDXij6+s8EC
	5Thg=
X-Google-Smtp-Source: AGHT+IECORAsJK5HvLlJTaOdwp7I0foTM1+mbT8X2l+6rUCgGE5LQYJWmc0WnSYxP89YzvMtamuCRg==
X-Received: by 2002:a05:6122:d99:b0:520:42d3:91b7 with SMTP id 71dfb90a1353d-52b2790458fmr1306031e0c.1.1746535809099;
        Tue, 06 May 2025 05:50:09 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae41f3ed2sm1900053e0c.48.2025.05.06.05.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:50:08 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c32d6ddd50so1603746137.0;
        Tue, 06 May 2025 05:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMStV/iZ3wIB3mqUvbeMF6ldoouNlwdy3boGRz/3RBD+B27KGHhkjC4IsfYv7n9Ha3GY70SQn3p6Jcj5xe@vger.kernel.org, AJvYcCW+28Pfy/9b+8yGD+a5sFyaRdANVT/6lOahTgBwi0out2hbPtdYGLK7Mbx+5J/4B3W1x4lJSVXb0e8o@vger.kernel.org, AJvYcCXeegIiCirwNaE8M1VgEbFrASZMylxZTFzo4QEaWPDASiuJfDVnhTdo3R1VvfiUtQpQQIml9BSV3WTAayOAx+7YxdM=@vger.kernel.org
X-Received: by 2002:a05:6102:330c:b0:4bb:dba6:99cd with SMTP id
 ada2fe7eead31-4dc64fe3d40mr1513226137.8.1746535808032; Tue, 06 May 2025
 05:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 14:49:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
X-Gm-Features: ATxdqUGlzOJWAzAM_swPtywTszF9Wt5U6k2_C5syW23x2Dms_5uimTdgJSqV7NE
Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 12:32, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Previously, the OSTM driver's platform probe path was only enabled for
> selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
> SoCs, which encountered IRQ conflicts like:
>
>     /soc/timer@e803b000: used for clock events
>     genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
>     Failed to request irq 16 for /soc/timer@e803c000
>     renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16
>
> These issues have since been resolved by commit 37385c0772a4
> ("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
> probe"), which prevents reprobe on successfully initialized early timers.
>
> With this fix in place, there is no longer a need to restrict platform
> probing based on SoC-specific configs. This change unconditionally enables
> reprobe support for all SoCs, simplifying the logic and avoiding the need
> to update the configuration for every new Renesas SoC with OSTM.
>
> RZ/A1 and RZ/A2 remain unaffected with this change.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped config check and unconditionally enabled reprobe support for all
>   SoCs.
> - Dropped Reviewed-by tag from Geert

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Boots fine on RSK+RZA1 and RZA2MEVB.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

