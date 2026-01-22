Return-Path: <linux-renesas-soc+bounces-27308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBxQFtVZcmkpiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:09:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE35D6ADA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9460F30268AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A7836F419;
	Thu, 22 Jan 2026 16:32:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E628E0F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099528; cv=none; b=b+L0IhI8czj8b+qWfUPrlDyhCwUPeup6r85pv6faaJVZQG9HGEEC8yPkbxF0tEi5ljopMNww65sLMeJvweqUqxncKqycIWa/14nwuqhniMs7Lfcw1iHT8Ii52NdH/tvq8TPoPGI70f38PsdDK4YEr4yb08aAImTyyicDpx+Sel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099528; c=relaxed/simple;
	bh=yjVvYWruYiurilUZGx3YmchtTkWBm32mvE2sRniBUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLYcH6E9j5iNL2ESFXoHhDuy32cMW08yJLwAfjf72XHYt+NIvKTl+NZC5TmgYlGut+Hzvlu4Ox5fpm75IvuCT+Vdtz4vR6ZvebYmoMhhR1xj6UlzS6blcP1B6TL83snh/WBqjA30RvWKQA+S+NVonSevcBgJcSVx4zCB4if9690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5efa6d5dbf5so347200137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 08:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099519; x=1769704319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RivxhFW3aLIuA4wf02xkjYz2Qc8LREwOTlCZIGLK+7s=;
        b=Ksud6G42hFD3XFXw010hiRs4atz70j4K6H6m+vog0WasnqZYDrQH24nV0hpNBdqRiG
         F/lEMMGmJ8r49vWkRz49sLSdudmbuTs03A1kQEO5vSgiVDfER3oucTqOG/TBQmli493A
         8F6Mog7Rw918+VG+2cH2DjGgo9Cp4EMDztA3lNfzAHfg7fB9f7EwY+hu9jwenxNutP/8
         fvJ+BztE4yK8+LiojAC5fnRlT5Shz+h2Gidplmx2u+YMuV6t/BT58IGU0ympoV8Xnv8a
         vfgtCaiP3EbjeQuu+RnhR41laWKT7niM3+7VXOqO2OZcPvEsab0qte0sXkguR0W2GetI
         uWdw==
X-Forwarded-Encrypted: i=1; AJvYcCXq70M10853DO3enNbeJD1UJF+aSG4Vz4toet4m1LMZraIe/5bP+i2cJ6FU1KAcmxo+7Vq+FVKl9t3aZx8Xak1D/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeLsABEjiVBn/NuzaKOOVmoewcMiapzQ2i8AZ411DGo/ygqEC
	TXAS21nRrsm4NUnZ2lZX04QrFj995kLNjPKRk8U/afL1LPLtOfMPg17HOh5IpOC+
X-Gm-Gg: AZuq6aLmxgc/uM98Hk5AYPfnMdDkt0Kc7Vt9HATf26D7UF2Xn/VLjUTWhvv4PGHNvwC
	rUMZ/lGdnEYl0H5ce+HWsgf/RYI8P6a75UYdkpjTFJ70pJyjlpP9ySquXQCgou8y9VdEnJAugmp
	D3xw9+E5H1vfGOis0kyyaKj2+V+iZZCoV+lzFeZKbrFxxuXuF3ucxbXT/5xuVP5rkrtApTE76XV
	BmyNwsZmBMUSYJj4tezv3UT3D4RvwjxczvYlr0J6IvZvhuYaXUDtgPuxPT/Icks2SmSt1C9nsFp
	/DoETln9xv/iQqpzlSj9YT4IslQfKXGezfWyZx4u7xF+Id9ZnSg+9JtxvcdkGktG/oS/MBwgXch
	89cjfZNWdZmPjD8vqZlhW1rCfDWuU8CzDd8ngqEZIV2DvsIwwlMoMN3ovggkDtYdDyTcN7Hw2yh
	7d+K0uMFdXXpeUT6gkjdby+oBVhU5KWqCbNnaWLRtNMRLB7pOmrBWg
X-Received: by 2002:a05:6102:292c:b0:5f5:266a:d8ac with SMTP id ada2fe7eead31-5f54bd5abb5mr82637137.45.1769099518577;
        Thu, 22 Jan 2026 08:31:58 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm5701473137.3.2026.01.22.08.31.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 08:31:56 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-566360cab07so164410e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 08:31:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnA2VkzGV3tc/GtDCkeX+lQhMAvjOIkiIW/MgNavH1f8BxGhYBriFnHA6JnBI0+4feY26Jm4cgWF+yLy3NmdrmTQ==@vger.kernel.org
X-Received: by 2002:a05:6122:8c1e:b0:563:4d66:359c with SMTP id
 71dfb90a1353d-5663e92322amr105461e0c.0.1769099515330; Thu, 22 Jan 2026
 08:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org> <20260122162206.9wrHkrTZ@linutronix.de>
In-Reply-To: <20260122162206.9wrHkrTZ@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 17:31:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
X-Gm-Features: AZwV_Qhrjqav4P9LaAmfkNarIMkgQPtcyvVLyM7bNci-hkGtkEP1lpbMFk1IY3o
Message-ID: <CAMuHMdVs_ODx3eByHkU03vopUuLuY7=uRnfTKuai65jNr+xMhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27308-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE35D6ADA5
X-Rspamd-Action: no action

Hi Sebastian,

On Thu, 22 Jan 2026 at 17:22, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2026-01-22 00:23:47 [+0100], Marek Vasut wrote:
> > @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
> >  DEFINE_LOCK_GUARD_1(disable_irq, int,
> >                   disable_irq(*_T->lock), enable_irq(*_T->lock))
> >
> > +static inline void disable_valid_irq(unsigned int irq)
> > +{
> > +     if (irq > 0)
> > +             disable_irq(irq);
> > +}
>
> | $ grep " 0:" /proc/interrupts
> |    0:         43          0          IO-APIC  2-edge      timer
>
> in other words, interrupt 0 is valid.

AFAIK, the x86 legacy timer interrupt is the sole remaining valid user
of interrupt number zero.
Nowadays lots of code assumes valid interrupt numbers are non-zero
positive numbers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

