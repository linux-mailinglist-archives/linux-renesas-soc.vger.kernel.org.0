Return-Path: <linux-renesas-soc+bounces-28713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOEIKvHopmlWZgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:58:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D831F0DF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A67B304EEE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DA135BDB8;
	Tue,  3 Mar 2026 13:50:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370FA36D503
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545817; cv=none; b=DOo6fDWSfXHmHWIEFz94vfflDFd8R4X3r3WJV+ZQr2HY0uhK0sYgmarFAXbFvBkmrZi9sIW1y5plic1KhIVt0mxoMAIpSbtZptZUKmMlddbLvfc5q39oMlxkM+OrSzZPrnpESWoqp+dKwiNAHJbz1tjWVCE1py/LhRjiUbCP0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545817; c=relaxed/simple;
	bh=RDYgonMLZZgBvRizzxm+UNJ3z8Y0vv51l3EtJhZlR0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrFZKMTrx3l+/vW2tSdTkErPXuvJctqoAlKaDbZZWOU+zpLCaZ/mVpYFLF3TBF10Dc9UoW1Wlg1pz0ghbDD3uufSRr5duu7n0BfpDWKK+2+yrcuX7rc4bqjknWF600u1T7URXpjJzyA8kmR6yl+1XYkvee/yTDLKAFG2U4B3HyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5688c221fd3so2475735e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545812; x=1773150612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4n4UKmZ6iVKu4X1jPmC0GNiXXYHBrOv1cdLwQZ4FC0=;
        b=AP2HYqaDe+P9/plK6sfKPXHGD+x6VgynA7Yt0f9+ztEOuiCIrUYDjGlkCq+qkuGPXo
         YE3jH7+xCM5watt2C5GHoDpEJkOZOhO4mHN3dfJy2LmaCEwyjUTVVXKcI2GzuQqSeE0K
         0vaBTtRriJ3sqGUWhdXJwZ85/CHNGXTlzqUTcGktCgbbWfHh7Hx20bo9z3PTCSI15pvi
         lDMrOW6gJ7aBT6z/8ian7kvfpkSSVsBbkY2s/yskW1ZogrML6dG8RtMX5U3jfCpW/LE1
         2m6GLA8p+sHouVCGcea/YK2XEkEiUNUDuaYiH5zbE6HqQLSud8hICf1UkX6IdlYfNDdr
         uFqw==
X-Forwarded-Encrypted: i=1; AJvYcCVF8+bm7U4wxu0V/238SyJFGij2nS0hl+kuV7yq6/UUIUHaHHm+HHtVZbGHnf4NTFAtDk6AXLmOMZ/Q4i0Nu6BqzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGR1k7Aoltul1l8jjoqU//bbNuCS6ElbplCePxjo8WstZEoTX
	2CeckmUbrTKhQGUgoVlCCTXqCkCtyOWRgQnafzPwpnIkYJQzkOu3vFQV52BsOvru
X-Gm-Gg: ATEYQzwzL3O2r+G2NxmJX7SqAIyGGA5IdPK9vU6ZBSbWbBDN8HtL2cbAnPljGBM4Eha
	gYYvxeArjRX30TJ6g87YEtqk6h2XXds85DEj2LgNAmsUaUB9tm6hf36USIyYLinj2IQPHCmckCe
	3CtYEibLxM8pGFFWpPfyuGJtzHqH0Njfi9axgJb1QQnJl8f2aHIT+8yc9NRE0PSMQ/i4sXz1S0F
	2Q14rmYyVuzCJ210zu/yuQFpVW/APGvhGGVtbYe8sksZJ5yFuzVV60wt/Dw39DKVVoD79EIwq7l
	ZVy9p0K8rm1DFxbAVmCEe3FEo3r8mBT2YGC43cMmdszC+5NZkahkVurmzqI78gOOux6rviXGOiL
	Bx1V30w1OQn9uwcyZIb495yoZdfofASdtOO2CZz7oQNi+Bv3aLH4LK8cHtF7Op2jMC2QfYgWFJt
	EdY55sAIs1psVE8DNTpXy+JmHLxe3gGhiD9wF4+y03+m70RoKo0b9WFfTNs/RUGmZd
X-Received: by 2002:a05:6122:1684:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-56aa09edea9mr6259916e0c.6.1772545811970;
        Tue, 03 Mar 2026 05:50:11 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bbd85csm19651090e0c.7.2026.03.03.05.50.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:50:10 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674d8be45eso2313010e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:50:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwlD6UEOC3MRfgAjNp+Sws+Yhe0PCAU6T5KA6yZsCBRwpHsuUtJ9xoP416ZOmP0sevRd5kdTgsobZ/bfKi5clIDg==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:5f5:2ab7:cef4 with SMTP id
 ada2fe7eead31-5ff323530c3mr5306088137.12.1772545810046; Tue, 03 Mar 2026
 05:50:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:49:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe2EXW7j7_Z9KSb1tYFbsEfC63HSvDBycdCYH4us2MDQ@mail.gmail.com>
X-Gm-Features: AaiRm5373kqYXoPI1qibK4QKFV_2fpSfHkF0McTh9iV8GZ-ZNcR_4rReTQoXHNw
Message-ID: <CAMuHMdXe2EXW7j7_Z9KSb1tYFbsEfC63HSvDBycdCYH4us2MDQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 92D831F0DF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28713-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.797];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Feb 2026 at 11:40, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The rzt2h_gpio_get_direction() function is called from
> gpiod_get_direction(), which ends up being used within the __setup_irq()
> call stack when requesting an interrupt.
>
> __setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
> an atomic context. spinlock_t cannot be used within atomic context
> when PREEMPT_RT is enabled, since it may become a sleeping lock.
>
> An "[ BUG: Invalid wait context ]" splat is observed when running with
> CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned call
> stack.
>
> __setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
> serialize access against a concurrent hard interrupt.
>
> Switch to raw_spinlock_t to fix this.
>
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * reword commit message to better describe why
>    rzt2h_gpio_get_direction() needs to use raw_spinlock_t

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

