Return-Path: <linux-renesas-soc+bounces-24629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CCC5C356
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFCB734213B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4E22E719E;
	Fri, 14 Nov 2025 09:12:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F702F4A1B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763111536; cv=none; b=M3qxqVg1wL9i4E9GGomZKb+ERJfPUYhX4ay5AFQQzWkneRX72zJvDVMd/+U/2VoTh/cF/eXZLX0kEJ7835L3iI4DtHQPy5/TksR6uwch8+bbqrBr6XUkOqlf9e9joCi4lMcAIP30Lf/lI8o9ihr0IQQqeDK/SuAHsc3IUi0SS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763111536; c=relaxed/simple;
	bh=6lZcA5s325b3JaYAV6k1Lpy8uNvHDPn6vlQjTmP5MHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqWy9/inlJIxALT074HytKHFMSG+Jx0mDuyRqWVB3apzItMdvDCD2DMXMaBGaJQthHp/yQBoPS3wnijH4EpZyE5PZe/dw2CQr9fXQpTpa0FUv0TDqt+Hkf9ahak6vDLhuBG5GGkm6Fb4amtgQrQFnm7hufmotgXoCuSFQEfln7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5599688d574so523976e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763111533; x=1763716333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv3Uev07oiPCCagTwkGrE74OxJVh/RcOn9HWVQLzIzM=;
        b=p5/zIsqo49CZ6qTQ8qr09vZoVircndSKYnR5iPAplvSePS46kKdjFPJXdzkfNkPTLB
         dwln9st9egvd1RNqmSSLrg095poNQYxYgnjzj1a1pvbP64M/xtrKGVIUiCJ9o1DOCF7E
         AgWtC1+nm9ZglIlp21rsE+RjPjFOx0isLaRNzjgRwkYaEQpwYmEh2IvuHV4W2ncI7UeA
         Up2SWUNNeHHcAq/xQ0eW4qjRm3ojDU3ZsWmR60Aovgy7yCTrtAadtCxr+pF3c64Fb83a
         HA6afRVhzmdQJ2YXmZwkY7pGpLchh/3cULObkC0WTWBNCm6BR+aF2gyYZmKbU0p7YpL4
         HIFw==
X-Forwarded-Encrypted: i=1; AJvYcCVsewCCRr52S288Vx+dhhjrag9tl3cqKZ2LHdoaQywUae084m6gK7LiiVWnkAnDEfNPcBcNiFvRGOSQjLz0lponkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWySRAc49kbPZMtaytBYJgw5ZWrKWFxiHoHdagPE/yg7jhiibE
	UWbPOO6e/bc08NMGhu0OczReEvs3t72K+MG5gQuQz5qvADczmcQThduHE6wnDcLE
X-Gm-Gg: ASbGncsbpJA0LDfLhk67YsZ5q/PV8VbwrJ6aEZXrR7fJ5wMOD+m5Fxx9cFu3dakBaFI
	4o3PdiYPTo7o7HUGQ5DOzllUqPxBawwvm85JU1uv/luxi7u0KTqR73wH9h11Rc2ljmr8qb7BuR8
	rPV4UoEhtuPhN/xNQl61xfxhbjmszJDJEITEQ9CzGOaJ/YLTmE4UwrdYLarJPCVdThcJ61kUCp3
	3WYzu/w316U2A9ceapcLzlZA4ZqoBNlK5cK727FQ6/O3wykkgf0zgORgyc0oQd/EvOQP2TFB/FW
	lqwiU8c8LXASa8CpsXl9psWJtBL2BZN/lfCY2aTrWULkaJ3s+XbMFFmcfn7Va5Lw/Rd/vVuLbEo
	XWsLP1I334rcv88OMug7cgf3TOWKGs/QYGp95g1vytuSiqgc+8VPsPmg1BohNVZeiMbSWBRbw+k
	Txz8t3gwtdRb8nMjWCFgQOztPL4PKNFaZ8D5j+8UKCKcomiss260CnUjck
X-Google-Smtp-Source: AGHT+IGKINJZoNA/hbVn6W8YwtdKivi8A2hFJTsTNwdICNaDD8E15sDlQABb2dOXDrlKQTViswyL0Q==
X-Received: by 2002:a05:6122:168f:b0:559:6e78:a43a with SMTP id 71dfb90a1353d-55b1bea51acmr950554e0c.9.1763111533471;
        Fri, 14 Nov 2025 01:12:13 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f44268fsm1491289e0c.15.2025.11.14.01.12.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:12:12 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55ae07cf627so554564e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUELM4bDZe0Y5cgN6eTrqUZ63K9ZaodZhbbrt2vOJl4qhlnG8j+4bNrRa88E+j5Sf6+LdSic2EwGd9L8ZWE6Sy1lg==@vger.kernel.org
X-Received: by 2002:a05:6102:2b8c:b0:5db:27b9:c20b with SMTP id
 ada2fe7eead31-5dfc5b6dee9mr1034309137.34.1763111532050; Fri, 14 Nov 2025
 01:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-7-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-7-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:12:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOC1mRU161697uzeyQhGGoSUJ78RwUQx0sux0b32e8tw@mail.gmail.com>
X-Gm-Features: AWmQ_bnE7cyD8HOjUEBb9GnZU2_7AmUXi8_jlBj6QbgjeCbjQVJHA15hzW0yJVo
Message-ID: <CAMuHMdXOC1mRU161697uzeyQhGGoSUJ78RwUQx0sux0b32e8tw@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

