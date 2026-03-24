Return-Path: <linux-renesas-soc+bounces-30188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMa+FNPfwmmPnAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:02:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB631B28A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 20:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F446300D376
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 19:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8BF2EDD6C;
	Tue, 24 Mar 2026 19:02:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13F239085
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378961; cv=none; b=D7WIeh9vOxnxpsBJ+ijrY/Jm2gcFXyAU+V8cCZo0FrJPl1vz2ZFPIepA0g+uxd8t+mrhS46oNlOZU20UBHOT43o4BVLeSLaWRnEnOFpj4EJo8Fp524QQShGADrd2VddsyKAK5niVMeeGMvRVIMQyTxaAA1qprvCb8rvcNVSHmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378961; c=relaxed/simple;
	bh=XtILQYDdYGVla3kuxxj9oHklvJA5Nt5DcfDTiFQGJms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpLFVozijINVquB2LaQNN/l6X+hBfaczPVhYKDQQIELpu/kTHx6iGqFXcQY4WNa07vuuC0MuWbLUxHBmEeVeZfoE7TzHf6jUfPzFj9y/MbIMLQbwB0V/BJeUYc0Y2oNkFYb7Z5wicXtJbq8r52LSKGIJuC7efqrSLaBxVA5uQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b7043c97eso1838401e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 12:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774378959; x=1774983759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dbHXfVGTJeEVtwUyV2Kwn2mr9r+3wa8Eh7jq40UVSI=;
        b=ixKiTSZiNHBrgRBckj7kyeMarbIEuXpEDY3V7wW+qupNSekl8ySyvYgxIu2RDZ+PNr
         JcxrsAOnJuBc1Gm0LiW1veuyG1YA76qUWJT5ugKXXC6iGeabdWPppgWV/1CrfTNhSU9R
         gpLy/UyOKELAZxiq1kBVV5O2SwbI13FFhbI6YlYnzXBWoMPdTebT8MI0gz4olkK7AUOL
         J1AEuUn3XogXsq8sOiAnHOYUnTNulny7RwQHYEycp8ibzBBOFAz2HF0TSENf2x5Oy3uT
         YDwbnu0dUqdOuqbzfzeremY0wqmYt5nuy6kJGcHuUGKaVqPN957g0X8wJ/Hgk00LXrUJ
         W3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUOSopVlXDcf8LkVNscgMlO+v3S4mGr7MT4zT3HWams3vLVoByKxfHMElIyxFerDiBCy5oUAIrYZs3v58qOtU1T4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlakW1mMlvamNB+UE26wANKgUTI0vilp4+gfhfwJmT5b2Zf6q
	j6xosS+sBF5Sn0NKe5pY4U2hqtVE1FXLPpUO5OaLIIKzeGDxTNnuV00gJ1ftePEWBVc=
X-Gm-Gg: ATEYQzxx1IifB0Mw6DHBaRGGvnCoD5NBMcK2PkyAOlZmAUB8+XhWedgFBq2sgpm9tYN
	LTrltoq/AIo16/x9u2XrWrIiuWRb39EeUM1+hyV9I/6OTWcrnFPsuKDk8wvmm7Rth3iHNO9Nslp
	ubjaVSYttPUnagpOaMzqGsWlWw7FoAT7zEYwWhwg+EFeG/W0SRAACjcCJ52zcnPW0IgiR8fZL/H
	Gsjq03nV42WGFN3zQl7CKErdsHqxiluR0deKpTgrt7VNq8JGBLYega687adZOzXNEOpQYs1RT3T
	0d+3ICnGUpmcbX3cJlZUmG28MWrFHuRvGbOa/59i8Aaa13fCn7hYFtA5yjSGoWVLW176iD2UU/P
	QhgBxH63YybbmWBYLpDPljiDV6keZQfHT5DT4bfoOOQJwByPLE/NbUAaQxqlxPy2JT66AAxxuS+
	3sioofjvNtQh7Flv0iGEQZ9PDMU98dvJvKiilRweUx5KBn6bHaf//28GSEBA2dvUTZ
X-Received: by 2002:a05:6122:8289:b0:56c:ca38:ebeb with SMTP id 71dfb90a1353d-56d21f2375dmr583720e0c.2.1774378959067;
        Tue, 24 Mar 2026 12:02:39 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bbff63sm13408729241.5.2026.03.24.12.02.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 12:02:36 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b7043c97eso1838339e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 12:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDo6tKsWkag8naNtYUfxmKPwYNMmBgVg1JKkCkjvhuM3um5jQFeBnnRZoZSkNl852ET2yv871svu0I8/y+RGdOaA==@vger.kernel.org
X-Received: by 2002:a05:6122:6611:b0:56b:814e:d35a with SMTP id
 71dfb90a1353d-56d21f7bb81mr678189e0c.8.1774378956312; Tue, 24 Mar 2026
 12:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
 <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev> <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
In-Reply-To: <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 20:02:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=xus0aOBM9cCbVL1zV+zuGs_aXTkwcU7bkPKSVAKHxw@mail.gmail.com>
X-Gm-Features: AQROBzAflFR2kLKiheLNO3g3ErEb6Minavn-LOgpXMijxbEeoPeqXnj9bMzdxAI
Message-ID: <CAMuHMdV=xus0aOBM9cCbVL1zV+zuGs_aXTkwcU7bkPKSVAKHxw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30188-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,tuxon.dev:email]
X-Rspamd-Queue-Id: E0AB631B28A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 18:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 11:19, claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
> > On 3/13/26 15:15, Geert Uytterhoeven wrote:
> > > On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> Add GPIO set_config to allow setting GPIO specific functionalities.
> > >>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > >> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > >> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> This change breaks pin control and GPIO on RZ/Five:
>
>     -pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
>     +gpio gpiochip0: (11030000.pinctrl): setup of own GPIO can0_stb failed
>     +requesting hog GPIO can0_stb (chip 11030000.pinctrl, offset 18) failed, -95
>     +gpiochip_add_data_with_key: GPIOs 512..743 (11030000.pinctrl)
> failed to register, -95
>     +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add
> GPIO controller
>     +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add GPIO chip
>     +pinctrl-rzg2l 11030000.pinctrl: probe with driver pinctrl-rzg2l
> failed with error -95

And apart from also breaking mmc0 (probably due to gpio hogs not
working), it causes spurious interrupts on the Ethernet PHY:

     Microchip KSZ9131 Gigabit PHY 11c30000.ethernet-ffffffff:07:
attached PHY driver (mii_bus:phy_addr=11c30000.ethernet-ffffffff:07,
irq=38)
     [...]
    +irq 38: nobody cared (try booting with the "irqpoll" option)
    +CPU: 0 UID: 0 PID: 63 Comm: irq/38-11c30000 Not tainted
7.0.0-rc5-rzfive-07159-g46ccdb62e0e4 #488 PREEMPT
    +Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    +Call Trace:
    +[<ffffffff80010c84>] dump_backtrace+0x1c/0x24
    +[<ffffffff80001226>] show_stack+0x2a/0x34
    +[<ffffffff8000c338>] dump_stack_lvl+0x32/0x4a
    +[<ffffffff8000c364>] dump_stack+0x14/0x1c
    +[<ffffffff80002588>] __report_bad_irq+0x30/0xc0
    +[<ffffffff80060034>] note_interrupt+0x12c/0x1d2
    +[<ffffffff8005dbf0>] handle_irq_event_percpu+0x30/0x3e
    +[<ffffffff8005dc36>] handle_irq_event+0x38/0x66
    +[<ffffffff80060fac>] handle_fasteoi_irq+0xa0/0xf6
    +[<ffffffff8005d574>] handle_irq_desc+0x2c/0x3a
    +[<ffffffff8005d5d4>] generic_handle_domain_irq+0x12/0x1a
    +[<ffffffff8039c61e>] plic_handle_irq+0x8a/0xb4
    +[<ffffffff8005d574>] handle_irq_desc+0x2c/0x3a
    +[<ffffffff8005d5d4>] generic_handle_domain_irq+0x12/0x1a
    +[<ffffffff80399dfe>] riscv_intc_irq+0x24/0x5c
    +[<ffffffff806bb730>] handle_riscv_irq+0x34/0x4c
    +[<ffffffff806c2bf4>] call_on_irq_stack+0x1c/0x28
    +handlers:
    +[<00000000be751d25>] irq_default_primary_handler threaded
[<000000000ed82730>] phy_interrupt
    +Disabling IRQ #38

NFS root does work.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

