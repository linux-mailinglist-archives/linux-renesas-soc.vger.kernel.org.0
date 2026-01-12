Return-Path: <linux-renesas-soc+bounces-26601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4975FD12E10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 14:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84A993001613
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EE35B15A;
	Mon, 12 Jan 2026 13:45:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70835B128
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225524; cv=none; b=T2sRMyRPtQ5yVPqzofIYFxPkIn37wALgUmTJMK67eGQc/jSmPJ1YTkT5H+FPgGbbEmQjmHVcR6tR/7h1M/RMS0QnS5zXW3hkzsRYcPlc9O9v/aWZ5VIWhWCaDXvaO6W1wtSGq5TXU3J+MU+gU3b0hJqqbR5OScDhGU4wyozF1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225524; c=relaxed/simple;
	bh=wQiVbguMyGjKSMqL9UFVXXfC2kZ11shLrO1Zg6cSg3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qp+qr71zOc5faim5bUebItvCi2mKN/PvR7/eZ+aNFWTBuGmiuuaBhWzEPrAwI5LDqFfCTEwQ+aggPBBwOp4H/DRHEHZUlRMdkJlqXPwz/iargKryIcf/MOYG4MMeB3cJwoXjKByAnIr0r7Tg5vIp3Ztdlt0JPLTYkMsgyMLSOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5636784883bso2438021e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 05:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225521; x=1768830321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO/WjXr3wzVpti8iWB/GBgohXEwzSHUfz2xAcjYWVKI=;
        b=Q5s5j5ipgD0gaumXPeOeMoI1cI0zwuXZz5gSVvtJwcpPCYzTMVgWTGzjiG0379+qZV
         QwCK+Wqamzl/7peBjLLeaQWdiSIuryq8HyFQZz5KVV/6dJYIE7B/7IAFohyvz7bNIXZg
         eq4LCp2BGEYO6mudy2nG73ogQB0zX6jCQqAkT00uqrswHnXgMDPfUC6mq0Q/ZuQ3nIJO
         BmfqZthI5vZMqVo/JAqA5dEHsDMpESOWBDA2TZ3FaS8gvy8OdQ/omUjN4MpQSIRspKEX
         K3CmtypCN5S5tBR9cIDNmCIlWKaa1dlHmZAxJWMshdwtXTXoOUO0suWhsEGjQQkZVok4
         hgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5QYq8H1a5yfzmokCTnyb8I3uiq9ZYW1a+mXudZ7W46cl9oTSnxPm6zZYfT4CYIMUNlKtIt6dmhPeBnWDbg/KGZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQ/KxqwF7U2hA+moys8BExbOSxFBkntM9/5AWDDnuub6EGbR5
	ujQeh9T72XFNcLzoSNsKoL1BiX4dlvqXKKBOD2OYEN4zu3dwK+CtZRKIJoLbraxD
X-Gm-Gg: AY/fxX5JicUWVvXxCMIDwqxcQOU92h6gwpA8xl9xjoDMXFK4tskeqvWh02ytqtSVHe2
	/jb9T+t3M8VJitrY3l1WNc+hi9VB4TbIO3MdOUuLVFgKiuKMOZ7QRubiUXjtfgPTSLfmtAnYPbJ
	cgP0UfanVSm8MEbcCpIDS87Gw6wdWtZiddR46tuJih///qrBxjpgJeVBvW9qsc0DH9q4NOLGddY
	T+lBH8vWSXINP9QgCb6pMsTO1O3ST4QBPRxLBkmIax1tegd4XJmr6mDtQTnw380qiU4o/yMETDT
	80Qpw/xmL23xVG/56a4qpzHFbRfVcbwdiJFurO1azrppWkCIxF+FELXTfle6eFWSI5bBzV44UE8
	jbNz/r+yzuYtVb2mgnJ5DhBbSjYLHLkS2rJVOYuy/A0YhsQcC5c8nMrTqHyKzX8DzDSR+vFqRwe
	LwD2DQVTAqKzx0Kbw/3IUBMaHaXq+pBrmfgf9Hnn11rlJikGcb
X-Google-Smtp-Source: AGHT+IGjm2f0aHPdoI8DnEAZRWC5xad79c/YVeHAKujO3kcQWT7DsJk0udrnMpJ3BvZyAmaBGBKw9g==
X-Received: by 2002:a05:6122:1d4d:b0:55f:c4a6:c584 with SMTP id 71dfb90a1353d-56347d3a0eamr6789464e0c.1.1768225521328;
        Mon, 12 Jan 2026 05:45:21 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636dc36a20sm8110663e0c.13.2026.01.12.05.45.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:45:20 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5eb8f9be588so5926549137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 05:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXivNn8rrwhiXUAZYi3PlzlrVMBsJZ275BSH8PaUQskGR0RNnnkFRfMgTCGGVvTdfWUmtPQEKlMkiaE8cWyiXd77A==@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:5ef:a6bd:c8af with SMTP id
 ada2fe7eead31-5efa6bdca83mr3722114137.39.1768225520792; Mon, 12 Jan 2026
 05:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:45:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwzQSTk2ns2c_uXnER-jHXym2ep=u8t7yA1LuM+uwYZA@mail.gmail.com>
X-Gm-Features: AZwV_QiPdXqTPfQwR6lIzBF4dtqc8FQL3DhvJdOHFP7aTpgdTsrHRXEboogPJLg
Message-ID: <CAMuHMdUwzQSTk2ns2c_uXnER-jHXym2ep=u8t7yA1LuM+uwYZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 15:40, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * adjust comment describing the source of truth for the data inside
>    rzt2h_gpio_irq_map
>  * check if interrupt-controller property is present before populating
>    GPIO's IRQ chip
>  * move rzt2h_pinctrl_suspend_noirq() above rzt2h_pinctrl_pm_ops

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

