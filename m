Return-Path: <linux-renesas-soc+bounces-19017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E84AF0EC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E20B1C24875
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC73823B616;
	Wed,  2 Jul 2025 09:03:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6161C5D62;
	Wed,  2 Jul 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446999; cv=none; b=WQnqpdy4GKMibBoqhAC93EPFn0M7UNpzjQguxeoc2YwYzpvmANwKzzPluTUq628ZVIFp0Lb/t6vpNs870t4yf8yPzDsMVAdUX9mEYMegHsekNWgUuY4nrFeTN065x185k/1kicGgqgo8fgD4DjF8xVnlw70/9+zPubeF3cw7Noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446999; c=relaxed/simple;
	bh=WvCSPAdXA7YMAOl08dmb3AIBfa+EJ3tyacOjS7cxvrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL5r69JMFNTiF4trykeZdu4FIE4q05W4j0hqCMTzQHqH2oKTAY88mcHnYfgHaIkuAD5NdNfl5S3mZSXZrCc5EoiZgmWxzWwoD53BWWcBIR5yGulq6wdXuyFnFLmsPJlvjGS7U2nj/kKEb/IJ+Q31GDabQRAmS11a5Ypoqy9fdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53145c74e15so1925900e0c.0;
        Wed, 02 Jul 2025 02:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446994; x=1752051794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWkqrPH+Peqo0aIdz6HAaPwffu/WSJWGQUNNsg59/84=;
        b=XGecPL6Z+oTE0KbsCpPiCiuuEW8cEz9yW1hcohj4YOP0lwFG1VGeDRf39Un5uuBQO3
         zDdScwU4c+kT0DO0BPnbeQ7Yyl/9vynCVfi4HZZHkspkxIpHJc8j3Xt0MSIocyvCB6iH
         UzWWjpRH6toTzCE8Z3esifQKlrx3DZowErG4YDvhMual+3enkTj5LihfYcP/dJYEQJkL
         qcozGjNJzZUianajPU1c9F4WALlnwoGs2PN5Qlmuu4txjoXPe1jiVpb+az9VtnOatI2h
         Zu/AWppN+y+HrdzuNkbmrz86hUgJJL0aYgZmXK9HLmXEaXEtE8+qeGwJAnJjmQwSl1WS
         7HFg==
X-Forwarded-Encrypted: i=1; AJvYcCUPWnF82jbtjpqFCPZW81Qgd1lg2OLOS1lBe5a02MOsLIQliQV54D1JeBVP/zA0A+UHGwUXAse36+9z@vger.kernel.org, AJvYcCVf2bMVgsNLMFBmdP3TXBJnRkLEdhFKb4NyJd6DlHKPI4IEe+Gc1pdlRBcHm+Ley6W/Hy/iEZu0u8ZA@vger.kernel.org, AJvYcCW4wfVGFvmXgxRR4i+mcwPo706pDdoJiu+XEISUpkQiuEoAwNx2TpafRReJsBelVHoK/zZ8BC6zWWcDmHzR@vger.kernel.org, AJvYcCWR6iHUXX4GnwIf0VChUu1jBnbQpiPR0vkcRUoSst132HDmXsp7P2qUInYR+/ZzEzgqSTdsaR/2@vger.kernel.org, AJvYcCXxVOEARwUAgnlCLK5n8sltqCK8CxdgbU+e8aSowblPvTLS8z817927FUnnVKxekpf7eUimXFvZ2DgsZs8hsZ5Y5xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQ2fBHmPCAlGauA7x+SZKnqFBz3Ui0ypi3TpzZOBnMZpy3mlM
	K5SEndVnE26tNENQygj5dRQm7Gyr2ZUBYwLAp0LmLDnG0/EBddCesdJnZiRK3g2x
X-Gm-Gg: ASbGncsKvYxn5Kr8QbJNx19B9FEwOuz2SwBIbR63nUMenM+aqidlWI4wpLdHbcJ7teV
	LKb80paDRV95JWZwiGSZL8V95kB9SDEUUfujDERx57iBQgvgdVvyKuyAHVM0IhsCT66VnwSPEX2
	JEoKQsSDy/dovL9lkcgnV3ClFxYPzwLuHGqKzirImi60yjjJCAqD5JrJcS/tFECQtnx4M7n2D5A
	J7RmSktAU2G9jfP5mjq81DFPSonaCK0XTeGBiiQYgVFa5l37wHyrwnf58elQY8yQSs7YemdBa/D
	5mOVvjTnP8cGO8TAUcXWJrMFQrdZwCXfdKRRPDavsbZI804a+D7+2BxHATFBwm0W31agJBskLXZ
	3FApooyLg85ewh0mRK6nFF5gb
X-Google-Smtp-Source: AGHT+IGCHzlWZAjVbeSdUuhmcP0DTrGFm7as/qlrZIjC+w1VciHkZP9Xg119GdeyNys0FAwG97jScw==
X-Received: by 2002:a05:6122:80b2:b0:531:4041:c4c7 with SMTP id 71dfb90a1353d-53458353a95mr1339612e0c.7.1751446993964;
        Wed, 02 Jul 2025 02:03:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090c46b5sm2042205e0c.20.2025.07.02.02.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:03:13 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e8110ac0f5so1744649137.0;
        Wed, 02 Jul 2025 02:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0ksvN7lKj5idj7MfkhNPD/VnUOZOvatBgvhMgGyASMeH1ubvub5ms7aoU7ihzQTD6Ph47mM/DIDogKhRbou9Mebg=@vger.kernel.org, AJvYcCVT+j2FT7z1WN63LzBeMApsOpYiVAuQFdnW4USDIruNgJd1uvo24T+JytkkzjoYWL+UIzMbgFog68Pq@vger.kernel.org, AJvYcCVa8z/9OGBMQhZAjR34wSmVEzPBNAL9bOKzxD0dfuqRMhsMMIU06nqFlHMzYpIMhIpWVJ9dVFZFgKf6@vger.kernel.org, AJvYcCWQt91Y0PuKsNESdV0rkDaUWHvPTdOJKBK4dWYTfTjOGbf9KikP2P3fcT+HyUfJqMhjHHEp84g9C85OLkek@vger.kernel.org, AJvYcCXK3MeguY+2q6W0GURYo/d9jHy0y4VUPhPhNHPoa7b6bnLX34Vxu51bRQrAXB2/C+0g6vvG/mMf@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:4e2:a235:2483 with SMTP id
 ada2fe7eead31-4f1612aa178mr748536137.19.1751446993429; Wed, 02 Jul 2025
 02:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com> <20250702005706.1200059-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250702005706.1200059-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 11:03:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzGLQwmGep9L0A9bzp5mYybA00W=S2cZnGH0tbMJvzEw@mail.gmail.com>
X-Gm-Features: Ac12FXwiA2_DO3vhH2MiiQxz-3dxHaqMTUJ7xX0QMzU3J14CqHlagpboID9b-mo
Message-ID: <CAMuHMdWzGLQwmGep9L0A9bzp5mYybA00W=S2cZnGH0tbMJvzEw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SMARC EVK
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> v4:
>  - Update pinmux to add OEN support
>  - Drops Tb and Rb tags initially collected

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
>  &pinctrl {
> +       eth0_pins: eth0 {
> +               clk0 {

No need for the 0 ...

> +                       pinmux = <RZG3E_PORT_PINMUX(B, 1, 1)>; /* TXC */
> +                       output-enable;
> +               };
> +
> +               ctrl0 {

... suffixes...

> +       eth1_pins: eth1 {
> +               clk1 {

... or the 1...

> +                       pinmux = <RZG3E_PORT_PINMUX(E, 1, 1)>; /* TXC */
> +                       output-enable;
> +               };
> +
> +               ctrl1 {

... suffixes.


Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

