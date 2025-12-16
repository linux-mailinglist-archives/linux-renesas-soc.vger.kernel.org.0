Return-Path: <linux-renesas-soc+bounces-25790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802CCC287E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8573230F9EE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AA63502A8;
	Tue, 16 Dec 2025 11:48:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B303350297
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885691; cv=none; b=r5Feha4T815wKYg8xvxZaQI4Polt9/kVy8JeeTdiiAHz8A+wN93zE2qiACKAZiUJQBNwuxRDsmWkwbDDmU74QaZlxVNRH7zazQNYhO+dzVeiFFCR/jb2M7g3CLfSAaftAeK7OMX8bQoQcY9WT/7QU17K7urvPM6NWDDzvHR0cag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885691; c=relaxed/simple;
	bh=Q64M6yTlY/4csK3Tn1gXsYntWJ0EMfk2HD87lk8BPX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6heRPhmfsjaf2G/TLzygY7VAaXuMUHD82rfyJEL2oVEqNUEEIZDx9MDrFuquIQdL/yEXOLlZVvUnDmjNiNINAXilKQOmR4fq2CcqyjyR5ZyeS7lsMQpCa16rrLnsWZwxX830lveZX+/LiJxQeLH4Ey5zKZcpkIsprUFqMNXJ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1570597137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 03:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765885688; x=1766490488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXQyigt3jbZ06RFmtuZpK+cBrkyIX4s9E7WO3JpZ47U=;
        b=Gwj8iB3bJ22dvpdQGYoHJbD0UrjgNOOpOxKJQnJgtl9MedTLtg+w8RWCj7EQLcNiwG
         wod5gpOYfPLDZw83ORDtBMPK4pBnwFvdhaYgbgnOWxmh7jzYTs8qhDeVjibqzXdv+mU+
         8Ffve+ykInQ3ACWyEreqp2lrGrX2NGvCvHGtUfoQdEols3BaYB8B1w7BI5bOHcRlSF/i
         vHQd/qjinXmB+0WDAhJOIq1IObPTjCONdr8uBdBqnPzCOyikkS/kLE1ARvzffzqpQo4u
         0GCsCxxXlKoOMDyfyoPcGHoJJP8+ByLpnrm4NpZv570opyfB2pev80mm3EYWWW7vkHw5
         HnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg9+NP1tGTLZGM9gOq1t+8/V0/3Jz7GOFBnxSHF+fX/C+9UJsYVNWs7hcG600fwHon/sklRrYAjxd2XczNI8qZiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7KkDUOIHcLI+HaKdRX/HA+fqfgqk7mbwpJzk4TJcoJjkGPao
	lfPzSCtwVfWJ/OQ9bwnZQHx9Opz+cx8MHp3qhKMV4DCiQlLOLezejv0v/06fr4if
X-Gm-Gg: AY/fxX41MrXfiofVv7OphhwFUbkRs7cjlD15cRp0Q01+/2LSsPRD19aNOBukObVKY2D
	FyyJhVHcpLi+FPzYl0IaLu8p3QRaUIkQdijt2CGQgp2Sx+uY+Irtb34vy31gMKTYa3vtiV/z7Rn
	9iG20eTgBi1kNIR2rs6mHUIPdbulb8h+7Y64d4YPm60LI0W4CzvrX/WalQ967sVw/OvKpn4EV78
	geDDF4yqwcCi0wUvKrXvlB37pDLJXem9zkt2nqSzOsgumP3sJ5q8aWSr//5HIyC5MFi8ezRwosc
	eM+CfPoAZ/C/lLumtFn8m3K+ms3fvNN9mOK7AEpMwXQhuph0E6zCvBXLuYUSVi1sGyhYDJMfs4u
	uAkMjobnyM001dlmT2/JQW/P/xog1HmWK7FfHxB12gr7MCOx8xR46SQs3qTTbIlv9VwVY0wzFGt
	rC7Z6CMyTBtvgXpP112p08yhSAFDhKRxaDMRduTngncIRk4pir
X-Google-Smtp-Source: AGHT+IFte1tLwY7S15okgZieFuUDmJrl6tqACknGPAUnBWPpXSkqvXve82lRt/jDd/SLsgik3ZDXUQ==
X-Received: by 2002:a05:6102:6b0a:b0:5df:b4a8:fbaf with SMTP id ada2fe7eead31-5e82780a8demr4493247137.31.1765885688437;
        Tue, 16 Dec 2025 03:48:08 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f5aefe6d9sm5813640241.13.2025.12.16.03.48.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 03:48:07 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94240659ceaso274043241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Dec 2025 03:48:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX13SugF5HA6COJ5/sJHECn1uJ6+mh+ZVReGEOFus7oWI7/r31Nb9RsO9AL0Bvb41BnHYa52uabqz3XXQ5HvsM4Q==@vger.kernel.org
X-Received: by 2002:a05:6102:5e8c:b0:5df:b085:835a with SMTP id
 ada2fe7eead31-5e82780a8b6mr4764738137.30.1765885687047; Tue, 16 Dec 2025
 03:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201112933.488801-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201112933.488801-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Dec 2025 12:47:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWY7QLfag8szj24Oo8ghfZn84msRHREAvrB_A2inA7WrA@mail.gmail.com>
X-Gm-Features: AQt7F2qJx2KIAwNW4AUKTYzXnNB8ZFWGeQMqIrBInpr7vZ80jygJQc6gJtqLNTs
Message-ID: <CAMuHMdWY7QLfag8szj24Oo8ghfZn84msRHREAvrB_A2inA7WrA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 12:30, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> an Interrupt Controller (ICU) that supports interrupts from external
> pins IRQ0 to IRQ15, and SEI, and software-triggered interrupts INTCPU0
> to INTCPU15.
>
> INTCPU0 to INTCPU13, IRQ0 to IRQ13 are non-safety interrupts, while
> INTCPU14, INTCPU15, IRQ14, IRQ15 and SEI are safety interrupts, and are
> exposed via a separate register space.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch, which is now commit 13e7b3305b647cf5
("irqchip: Add RZ/{T2H,N2H} Interrupt Controller (ICU) driver")
in irqchip/irq/drivers.

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -423,6 +423,7 @@ config ARCH_R9A09G057
>  config ARCH_R9A09G077
>         bool "ARM64 Platform support for R9A09G077 (RZ/T2H)"
>         default y if ARCH_RENESAS
> +       select RENESAS_RZT2H_ICU
>         help
>           This enables support for the Renesas RZ/T2H SoC variants.
>

This change should have been a separate patch, to be routed through the
renesas-devel tree.  In addition, you forgot to add the same select to the
ARCH_R9A09G087 entry below.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

