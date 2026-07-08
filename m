Return-Path: <linux-renesas-soc+bounces-34846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rid0JfEcTmrhDQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:48:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E3723DDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 11:48:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50BD030156F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 09:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955FE2EDD70;
	Wed,  8 Jul 2026 09:48:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593022A80D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 09:48:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504104; cv=none; b=jwNi8tF+ZlpjODdMVm7kJbqbINi+j2ZuNOl1ZYaLqR7eeXkgphtD0DSlEs8qYwkAVBr6gzI99S0x3MGqoLmBawSP6sMwO5xw00SmAPuJExBcCDOSndCdtriLbeKXJkgQC5TH/B9fU33yTnbbXPi8TGvXCyl+5CS5aswBTfBIRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504104; c=relaxed/simple;
	bh=Ab+JgtklIuaTwIzIlejccK/nbnujg/TLM57r4nffUVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlnsWGZpIyNFHyBPLM4vA+MJL9sW9sReiXDZtfTVnjNQsW9gbcEiWrvZiIIEqmErrQtFWmT4wSesR/a07of5VLS9zqKprhg24dGzxcWAxA5io4Wxl4MItl/lFzw3sas2EnEfnf6H7vuOiRK1g5ZAYImcobRcARSES7LE7CCBmys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-725cf9a923aso386804137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 02:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504101; x=1784108901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrsRMl5x0fGauko67pdxw6xjCe9Z/et8Wfkv+xqCWRE=;
        b=Vm7RAYOPHaEdfkL+Y+tsQimyVwyijbyTVe7nlcEamKrHgEKsB0BveDSxdimvTZkMYN
         7e7Hrrg5sed5mybqtx3w67gCJKwCItlbHvFlok8l7uVzzgNIYh6fPtJsbI8mzUYywk9G
         BK/Jdybn4V9BqSHAGjnBKYbPtnlbJmvHbMiW7H+3vZHybcI4FMm6smGzIjWVzRn9V6PK
         N5X8CYwRSeZSQkjMdE++QhipX6lDB1iVjWICm7gwyFsEB1q7unY4nxLT2KdLYn7/RDLf
         CMI5MQYsvbaRMfjzrpNuY2D7gUIJ1HilqwhCDgFh9TZMHHln6c1zhWqBUxTBA+xhi95y
         7jPg==
X-Forwarded-Encrypted: i=1; AHgh+Row7D6YtyOfyu+2kjUdDCBl7X34828NvnFoffoq0U/4Ab/49daOqOXKTKrVIW4Jexsow2IFPdesmRckFrGn4RteWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzd8o4LWBEaVgEUd4uspuFUAkSGzEkoQCxDAuvzy/HwuDzWeT
	9GPFOe8B5K0Hsso8O5FdYWpNYc5TXaVgBMfvPxbxXd8SvplQIrkTntOG43QrwZQ72/0=
X-Gm-Gg: AfdE7ckun8hLsQ4v6oHxl41oh8VADoOjFyWTQvhM6GazhljM+mACKxFVYQpa8EUA98P
	d0Bq87YLeyJBwjM+SUCUl5sWvIvfS/9yf1LNYepfqKslA48LO+CZN68Af2ZTX9j2qAuQF7VqOJo
	ZltI7WjTpGDN8dSx3y6UIRGoX2JmXtefJ4EviBT82HLQVSCLCY5NEr6923wJB+2fJipCO2sQ0wV
	H5vRNDy9lHvRYd6Y3sTm5q0rnfiEDZuLb/xHNQWixPDwfd2jEOTas5H/3r/YpGasBgB162MyVA5
	TUoSw5pQKHHBgRCqdMDdWN26C73r9sD1SEH/djN1mc9Hz/hYlEeNoQlhNnJBpUv81C+mgNc89I0
	rMOVYHUGgfwLixSim8N+AivT0vBVOXlBWd0McgYd3HxKDMsO1Bc+uCKtPkgfiA+JOxLXzVSF46b
	lbVZZT+nYXSjo3zpGGWatWD/CfVetjdsrP+yGwJTtO/rB7/HLYYfky1g==
X-Received: by 2002:a05:6102:3ed4:b0:738:ff1b:940 with SMTP id ada2fe7eead31-744dfd069c7mr833884137.4.1783504101009;
        Wed, 08 Jul 2026 02:48:21 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed5d4d40esm948073241.9.2026.07.08.02.48.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:48:20 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so389989e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 02:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Row/5387Dg5lj4GH+Ak0zSNd6MiVffKBUA35dj4JEn4wN0VVSHlrGY9/w4Nel1L/LNsyOo1bGil/L+R+KS8wWdO1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-744dfd09748mr963351137.2.1783504100001; Wed, 08 Jul 2026
 02:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <874ii9svk6.ffs@fw13> <20260708093849.501946-1-fffsqian@163.com>
In-Reply-To: <20260708093849.501946-1-fffsqian@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jul 2026 11:48:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
X-Gm-Features: AVVi8CdKTsFskqZXwoy_LhkkJH2OBDPdyjuPRc0TcUMEZ0agBTkTWrpb0UcysZ8
Message-ID: <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/renesas-irqc: fix generic interrupt chip leak
 on remove
To: Qingshuang Fu <fffsqian@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Magnus Damm <damm+renesas@opensource.se>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34846-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:fffsqian@163.com,m:tglx@linutronix.de,m:damm+renesas@opensource.se,m:maz@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:fuqingshuang@kylinos.cn,m:damm@opensource.se,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE3E3723DDE

Hi Qingshuang,

On Wed, 8 Jul 2026 at 11:39, Qingshuang Fu <fffsqian@163.com> wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>
> The driver allocates domain generic chips using
> irq_alloc_domain_generic_chips() during probe. However, on driver
> remove, the generic chips are not automatically freed when the interrupt
> domain is removed because the domain flags do not include
> IRQ_DOMAIN_FLAG_DESTROY_GC.
>
> This causes both the domain generic chips structure and the associated
> generic chips to be leaked. Additionally, the generic chips remain on
> the global gc_list and may later be visited by generic interrupt chip
> suspend, resume, or shutdown callbacks after the driver has been removed,
> potentially resulting in a use-after-free and kernel crash.
>
> Fix the resource leak by setting IRQ_DOMAIN_FLAG_DESTROY_GC on the
> interrupt domain; this lets the interrupt domain core automatically
> release all generic chips when irq_domain_remove() is called, removing
> the need for manual cleanup calls in error paths and remove callback.
>
> Fixes: 99c221df33fbfa1b ("irqchip/renesas-irqc: Move over to nested generic chip")

Thanks for the update!
No changelog?

> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please do not retain Rb-tags when completely changing a patch.

> --- a/drivers/irqchip/irq-renesas-irqc.c
> +++ b/drivers/irqchip/irq-renesas-irqc.c
> @@ -194,6 +194,9 @@ static int irqc_probe(struct platform_device *pdev)
>         p->gc->chip_types[0].chip.irq_set_wake  = irqc_irq_set_wake;
>         p->gc->chip_types[0].chip.flags = IRQCHIP_MASK_ON_SUSPEND;
>
> +       /* Automatically free generic chips when interrupt domain is destroyed */

I am not sure you need the comment.

> +       p->irq_domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
> +

LGTM, but you may want to do this right after creating p->irq_domain,
like is done in pdc_intc_probe().

>         irq_domain_set_pm_device(p->irq_domain, dev);
>
>         /* request interrupts one by one */
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

