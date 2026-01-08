Return-Path: <linux-renesas-soc+bounces-26444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D7D05290
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 18:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DF29319B788
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 16:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC252E2299;
	Thu,  8 Jan 2026 16:51:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457D2DEA86
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891079; cv=none; b=FKOF7pJevR+JGBGydS9a3QfFybOUdDhkz1NhXGDtdJTjq7i2sXI/QNF2gox/xW8qjj4n7nRZ+6D3oddsMAsqkUZJPuqiHY5pvdK6GMYquta1xpN6R890yDG5bM2gDxAraBd6PdG01BOqCJOIRhO2qvTcMEaE8477jje1DpShyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891079; c=relaxed/simple;
	bh=ubwXu+btsiX1PB4I4N5BYmf0b7pajCdwdkJ9TDT2OtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGOBPelrfqKrb/2LN/vMqs7C5ol/Uey2RqtA+SnmSGHJiQztEjKrnANdXVSB25oN/ruDQXeRs1ux64l+2/HJDCyY5BUWL0u194GtkBn5B3EcQeu0+s+iVxXRgnvZz8IryOqy7KTI6t0xyvOHB/MIMsrxdNVga9qlLfx1cLQ3968=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94124140e02so2105073241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 08:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891074; x=1768495874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C875+rgiQSif2Oc/xF4OEYxzU+NtNWW3c7tGrI4duZo=;
        b=eLpW1EQU4CGQwfXPcYaPXqrjnA9EPZIsbn0f5wAApHCN2uSf6/WyGLKL5faBSOzXrj
         PAR2D5Y/k5q+w31aFUryjQHJCar1bWsbchnFvhJkiu6oGA2WwtiAgoJWtaIM4PFnPmGd
         kKkeBGorwNyiLHFkw1/Z8v0Hxtu9IomtBo6yHGSlrgZ1o3zJ5gWlEMtN8SY9Z4nFt86X
         eNm/TErpztmTA0w+SThtSTrZ7kkPOcp7+P+wZewUfapWyVN2y11IqXYN9MOrQOmNt3Jh
         cr/qkgah12zmdr75VAqrUR8rVKbaSVz71R1xfk8b+kGnqAG1Op3TvFE5S15kVKkeb+30
         BkCw==
X-Forwarded-Encrypted: i=1; AJvYcCWTx0fW9ngBxaYae1T3881bbTJBxKEqifyLKAQAM3Qz4v2IRiGwRkvtP9T0mXBHghotnjsvwD6xGUa9saXYGzIW7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8wBGWpGESUxg5KE0RxzjOmICXJkQWRJ1pfH0p6U+p1QfNbHKz
	LTd3uD3en/kpRRntMa+WNjwNFq+8y/9IAt5lfzLAjM9HGHh/zkaO+wqwGfGDn8z9
X-Gm-Gg: AY/fxX7n5wZH7ZNMtv6TmCdtZeYVJRomMK8R3IO3SlRnZ9B2xGbD2nLwFD/7Qv+vrfG
	q26Fk63qm3M6OkNTrW+XYjAcjN5LtIHAP4IopqtE2gfD4tnQt0dTjoeyL26bZ25vzE51x8k2oA9
	fOkn76tX5b9GjnUuboM/OqwA5Ov5qL/mI0rhUYxIoeeNBFQQfx3xrXkVlPhWXYIO3xzqm2BR/A0
	hJdt/gviA2gOxP33kvF13ffzk/pVfSpi/ii9hD3E1s/qfXWtur3kv+uYsiVtuPV6LcQxWJROVFt
	rYjTCf+ie7AeapNrtu0BUb03JNzA0USUnvGI7Rx/kUGpodnpKIIc5QhgYZLDoA009fJW9Yww54g
	l8EB06krb1v6MMgQNGDGr7KyBqqXHt5IVK0RAnsEapFiSAk3Om+nOqek/CZKclTvQB+IpE7x8F8
	pSYn1lPUvWwVz6882c61tdJQO6xQiPON+cVACA+XydV+z2aolEHviUCxflyEM=
X-Google-Smtp-Source: AGHT+IFfWgDMibcDBdPoli5Mbpw/vGCb/WgWhUuqf3sm2enSaZvi/tPHPxTwtxJ9dbLsCBpTuBbw4A==
X-Received: by 2002:a05:6102:2ac7:b0:5db:ef7e:8dc9 with SMTP id ada2fe7eead31-5ecb68d5a92mr2834938137.22.1767891074280;
        Thu, 08 Jan 2026 08:51:14 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772af325sm6872892137.10.2026.01.08.08.51.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:51:13 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5eeaae0289bso83699137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 08:51:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXG5tcGjGTgwmiriN69/q9rURZd66uTeFG7+tr2bwYx5069Z6MKu81W9jQ7bI1AH2hxocMQ02VOZ7BvzxX3EGmK4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:5db:fce3:af72 with SMTP id
 ada2fe7eead31-5ecb1eadbd9mr3013232137.11.1767891072901; Thu, 08 Jan 2026
 08:51:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 17:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV4uOMnz_FBMW4brWx+6snQ-WOQck5b_YXAxzHhjJgXA@mail.gmail.com>
X-Gm-Features: AQt7F2pQ9Vlmf7HToBPagR5k-XQIvskfUPMsiSefk36sh5QQiJyR2JQPpu4Zals
Message-ID: <CAMuHMdWV4uOMnz_FBMW4brWx+6snQ-WOQck5b_YXAxzHhjJgXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: renesas: rzt2h: allow .get_direction()
 for IRQ function GPIOs
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Setting up an IRQ would normally be done in the .activate() and
> .deactivate() ops of the IRQ domain, but for hierarchical IRQ domains
> the .activate() and .deactivate() ops are overridden in the
> gpiochip_hierarchy_setup_domain_ops() function.
>
> As such, activating and deactivating need to be done in the .translate()
> and .free() ops of the IRQ domain.
>
> For RZ/T2H and RZ/N2H, interrupts go through the pin controller, into
> the ICU, which level-translates them and forwards them to the GIC.
>
> To use a GPIO as an interrupt it needs to be put into peripheral
> function mode 0, which will connect it to the IRQ lines of the ICU.
>
> The IRQ chip .child_to_parent_hwirq() callback is called as part of the
> IRQ fwspec parsing logic (as part of irq_create_of_mapping()) which
> happens before the IRQ is requested (as part of gpiochip_lock_as_irq()).
>
> gpiochip_lock_as_irq() calls gpiod_get_direction() if the
> .get_direction() callback is provided to ensure that the GPIO line is
> set up as input.
>
> In our case, IRQ function is separate from GPIO, and both cannot be true
> at the same time.
>
> Return GPIO_LINE_DIRECTION_IN even if pin is in IRQ function to allow
> this setup to work.
>
> Hold the spinlock to ensure atomicity between reading the PMC register
> (which determines whether the pin is in GPIO mode or not) and reading
> the function of the pin when it is not in GPIO mode.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

