Return-Path: <linux-renesas-soc+bounces-22438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEFBA9024
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99A13AEE1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C2F2FFFB3;
	Mon, 29 Sep 2025 11:27:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886DE824BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145264; cv=none; b=CYpbPLErrzVN6DESLFn72dP3i/4PHK1Tuy/iKjhO7VgH9bK0F+0ZWrI6Tosv6hMlTyvKolbavjzXMVaskoaUwEUvj1d14L+bxZFIyJAJpgtVqUQlitehR7LA+cuamwGuD0p/S6qXvt4d/jH0COcn7yE2Zhl2E+Cc0RCe5F8R2fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145264; c=relaxed/simple;
	bh=rmWlDx8/WnTcn1dhj2ug2PQJyxzNzRBfLIGobT30KUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lp4hnopJyUDoLOmA22ph5pWcXyqQPokYjVxpv0xC9Jrv+mKakA6WK9aXtUXGCRP236dcxmSu46WxWVi9GALVqI2pItlqizXHBl8eQcc4qTwEeRcKZySKGw1P129Ua/3Znqb1wrg6JqoYXhJxe2gI2HOo1aKC0m7pGsGKxXwe8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so635551241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145261; x=1759750061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3p5ZyLrRZH5goQlwa/vwelLSKRvjTSePuKZhRKGtt3c=;
        b=j4okEQcTc0+ztbOeCz+0uHjOhPjy258vhF+Q/WmJvf/SAEOvEkdyOfkI3E8TEn+aQ9
         I9O0aff9qzhhB+4tQ2DsBbkKMNw8Wh15/mHNc1FAX7y6VX8w7cQDR4VvlybmHLW8APAX
         TmxxohZHkqP6jn72IEwBD9B/cvPBqtb+Ru8nIFPJVrxnf2JYFCQcRTf7kbcGq+lF1wlo
         zYpA30XvMQj7gCsqLM/Y4Pg0CF+FIcITrcM6DYKNUtKebLJPyLtbcMU63dgbO1smdUUd
         syphhiHiwCljB6ZltUcJKRiqnY69n9Rqyr//Ba5LFfEQHeB5e0piR97Lq+TVojOHUPvo
         INhw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4CgFkVLaVWAcPd5xwZLxlM0LJr3Fjd4I2wli1H5QlWlBS+jsOCRvQJVNC1kWN07pgHJZASLJlNWOE6NAiSglzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZq9Cg4q2d8iZyIQJCYeBnZBI8BlDm4yZFlFvIiiPTpJMwH/u
	+FxeFVyPifcGiGH1BjrD0BT9midjtFmz+qFfVBjIwrPMHJRk0JJXII4R5Fc8gXLM
X-Gm-Gg: ASbGncutHUv+ThekuI4U8i7kDOJiqPJXx4Hd0QiaQYGJ8ToWu99hIE8MGwG5UUZ5Hyy
	yyxNMsDcbsUCys2/EQp5oghqPI/ntrWwUrnODI3SBXGt80Za8zL6tL5n0FXlWpc9TTEquM7HYM0
	IRQM53I93egDjkCcETaD3UoO3mpXH8pt6FG4TW9YhNACLSAJYcvTaAwuMw9amtU4xUGCVWoxumO
	zWQNxOX+3U359breuM42ZzTM+EI3YshteF0zOawJPa4ZCri0CbdYkOq5bgQ3XvohiIqDFgh/y2f
	pE0J0l61CS20nKmmSr1bVeAAZiLFbNvqYAyV5eay6ASiplCExCNTJdHxQxkjtusocNDMdUmIA/A
	PNX11DHOjhse7oAFEAdCNOHF76BX9BKErXYH05k8r16XR0AtkeMp9DETHUfZH
X-Google-Smtp-Source: AGHT+IH8hYfNyBadfFgXVcLVqpkKGmC3BdZ4K3PI3C+CONXJznYoVYe38CvSu4BIXBc8jbHpFrNwfg==
X-Received: by 2002:a05:6102:f08:b0:529:bded:377f with SMTP id ada2fe7eead31-5acc47306b5mr6271463137.1.1759145261145;
        Mon, 29 Sep 2025 04:27:41 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916cff04becsm2408751241.1.2025.09.29.04.27.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:27:40 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018e97232so870201241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:27:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6I99bJ3VNbWaFx+yGgDJFbLF08KA7p+Ni+KvvfVHjkV8qLsovl7bcWmz7210Keyc8csR+G1UCnmmRrSUwXjbdVg==@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:521:7afa:3b95 with SMTP id
 ada2fe7eead31-5acd046d9damr5432533137.30.1759145260742; Mon, 29 Sep 2025
 04:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925224013.2146983-1-cosmin-gabriel.tanislav.xa@renesas.com> <20250925224013.2146983-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250925224013.2146983-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:27:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUytaS3P9UrK-bpFSP-z8ys4w37d0BWCJ6c5idnM4iNTg@mail.gmail.com>
X-Gm-Features: AS18NWB5KjkQR6-4iBJ8hPH8oU_cNUXGPtBKbJx7p1IFxsy7u1OLZLpvVydcc3k
Message-ID: <CAMuHMdUytaS3P9UrK-bpFSP-z8ys4w37d0BWCJ6c5idnM4iNTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 00:41, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Document the A/D 12-Bit successive approximation converters found in the
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

