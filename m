Return-Path: <linux-renesas-soc+bounces-21606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9BB4A437
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 09:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8FEC3A6EAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 07:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73D222A7E4;
	Tue,  9 Sep 2025 07:51:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD550522F;
	Tue,  9 Sep 2025 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404286; cv=none; b=JWBg9I4jc14l48m5vgayNGGM75XiCYwd7vB0Dqlr53KPZ8wHcWA2TwQ2B7sYhoFatAuak92bPzsycZ5f8jB/gfAlQylhACo8SlCUvL6WgujZvdRgkBnR+ocM1+Cw493YhWluCcfU+R/7F/RQNbEWzGVc16wZVIo3fL8mZp2R0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404286; c=relaxed/simple;
	bh=LbdVI6Slt38Ir7cYm0efEYzLuDhlztlQKtA9nVk/uWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXAPgZyuOot+bUOeDtLAB91wCDzFJAj4tNy5yILEhbXRYmtRqK+GriBkZvsiJHW71prwjl13NFfS51L4TnItVvx5rVlg2QyBSEq+8s2JMJaKEL8f1aIy0CTcblBLWRYhcw8F5fVfjjXeVQSm2wAyKl95KYc65TR/bM0+i5nzyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89607b19f71so1640644241.1;
        Tue, 09 Sep 2025 00:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404284; x=1758009084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JIrSDKvo9ZR7TqGGDnw5XTvCh2zdcwH8+YMgz0j0MA=;
        b=XK2l3XgoawbRNT94xuxyQq/O5IAa/DNp7HXDgdKI/IDbaeLK5a0Ww/v+C1ADyyYqrv
         NaYhb9TP5pSADVma52CDKX9sTYDUcSntgBsEi6Hg6yQ2mJQ8+S1AZHf9Nwj8VBeJY3Gd
         gDMuU17sO6LqvD5CaOaPq9TOMmpS6wgzY5x6gtZbtUvxhDaLK8+OKTndxBGo4UmGiOaG
         uUBtXVBreLVjMWSSka/95IuEZcH+3X8N2xVsWAeijKi0TX+iRTFphuUgDKtZ7FRo2agz
         bnX4KMD3qI+iFq6ll+9hXoj8u6qnpZzQ9DcgkVUlFvU1YCLHhrA/zhhuR+G8cjsB/5D3
         rfyA==
X-Forwarded-Encrypted: i=1; AJvYcCWakJJdkhyUTRC3hLsT1MO/cvTtR+L70WdHyUwjvnn3WqTrqv2cD6j0QinsQv7llupeR2959MGcgZ15TvKvbpWVjz8=@vger.kernel.org, AJvYcCWj9P8KDh2GuRIuQH7M5iLAYvgE+oO1BBI2aztF+7n+nXeYGoTM3Akzt/eQiWbmPoPC/yPzAgpH88SS@vger.kernel.org
X-Gm-Message-State: AOJu0YxzY6ssA9Os0oBxOU+eKRVrju7934PI2c9rieU+YtGBt4pNIqET
	BODqAYqTqQLxOF/+IEvUX4c4uVxKrrBqOSFfIrSdVWm7j/nbC3LzsLefsBSJFhAq
X-Gm-Gg: ASbGncu6Pqu+vcG6+bT+MqOUutkqBOYDnD7ZebfR85S5E74AIP7GYCZknCjozJ7ocpb
	/17v9lYw5sSZWSmrmhU0lmAuFCdHwNcsmJuR1s+ukOz/aU7ZpXy6LyDWeNR2JwBPZr7hBjMf5TD
	hsg4D5GLUu/ZhnY8fPMVdo39Bd7yWz/Xf/wnaU/CUd4lwmmCJa0IdKdhv0Ff9DeNKKFfk8npV/a
	94jajSC/l1rTgudrmj1ZWEcj0icUbMKHC9Zd/uznaFKK3QVBh7eGL6ra+RXmjotfWCR9w+Ekq/m
	3uaixrVwk7QnLZ2L76FUcWjspBpaRYqNJu3VGaAVvZy8a3alLgiPYFh5T8m0XrTCtlaxSB958Aw
	oUMFEfNs7vxQz1cXO0IZFBM8xd3yFH6O9jpn23v02K0ALUYz8Rt2jWYC/TlVrztGsNUk/S/9lMN
	Q=
X-Google-Smtp-Source: AGHT+IG6wKIhY9a6rNEKRWSk8In1Tbtr/DkzSsSfHfWIv5Hv1BEE4hgGndKiBaT5v0e4P0jKy3xdlA==
X-Received: by 2002:a05:6102:d88:b0:52a:b8b:f0cd with SMTP id ada2fe7eead31-53d231f904cmr2799153137.29.1757404283588;
        Tue, 09 Sep 2025 00:51:23 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-899d7986b82sm6381046241.17.2025.09.09.00.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:51:22 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-544c796daa1so1923193e0c.1;
        Tue, 09 Sep 2025 00:51:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2n6qHoCwHXv1avXXOQEG2zbKr2KH3i/U1kgZc4/NTyo/BZgQIUudkFjMfauJjPc7CAESq7EVrWGlb3NsdnAFW2Xk=@vger.kernel.org, AJvYcCWUO6cpBa1Xl0e3NDEyc9EC21H7bMwWhWTII2u4IefGhfg8XT5EIYiwYVIouB5C2Pty8inwDpypEFRR@vger.kernel.org
X-Received: by 2002:a05:6122:a1d:b0:543:a319:7394 with SMTP id
 71dfb90a1353d-5473803d00fmr3100624e0c.16.1757404282613; Tue, 09 Sep 2025
 00:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com> <20250909-woodlouse-of-authentic-fertility-1cea2c@kuoka>
In-Reply-To: <20250909-woodlouse-of-authentic-fertility-1cea2c@kuoka>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Sep 2025 09:51:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd6yhi2SBHBvq+0LF4kBnjm3igVb21TYaKoWSvjPGcEg@mail.gmail.com>
X-Gm-Features: AS18NWCqrYWMcqkCjrtTcTjJES8TRBWo_VLUGDGC4w91TdcQouLAXKvc2ETcjyo
Message-ID: <CAMuHMdXd6yhi2SBHBvq+0LF4kBnjm3igVb21TYaKoWSvjPGcEg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your quick review!

On Tue, 9 Sept 2025 at 09:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Sep 09, 2025 at 01:45:09AM +0000, Kuninori Morimoto wrote:

> > +     extal_clk: extal {
>
> Use some sane prefix.
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
>
> > +             compatible = "fixed-clock";
> > +             #clock-cells = <0>;
> > +             /* This value must be overridden by the board */
> > +             clock-frequency = <0>;
>
> Drop instead

clock-frequency is a required property?

>
> > +     };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

