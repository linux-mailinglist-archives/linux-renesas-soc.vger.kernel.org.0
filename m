Return-Path: <linux-renesas-soc+bounces-10713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF79D9CBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 18:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DA09B22E5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 17:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9471D6DA1;
	Tue, 26 Nov 2024 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cWkskz1Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LxakA44t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67C1CEE9B;
	Tue, 26 Nov 2024 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732642833; cv=none; b=HEok6JdSMkJGk7WBek1hqc0nRu4NGjGiYyKIHeUPyBQ498ybTxgUok4qHZCWsuFTeX2WsrXTmJbzlO8dTOtgcgAFtYHMIH6828wyJb8l2sVbxq62Y852Cno6A8Bk+U+0y8oLFfktFA370XENUuPlM5Kx5gUqQZcbL4RLii4lkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732642833; c=relaxed/simple;
	bh=qt3lSk1Z0sFvkcccN2T638/oOpezlfEGW01kL5PatzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tATRdBWAl0z2JH1JimjDMbL1rwtp5ZQsO459GK4Pa65RkeBep9To2hnJZ4Hl7Kxpg8lvFNImlls+Jd3xIB7XerL5xTUgmbs/+xrQdERhYV4IDI3CgCsc9u4quXQxHjTprkWok0JiWuCr8IJUsaDfhUT02HEFRJh1sH/3iHQGRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cWkskz1Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LxakA44t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732642830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f8nVuLKwPdVsdciR71/j+DZiHZoBHMBIVygTw9pRkQU=;
	b=cWkskz1Zmh1KcTMZwKU29z5enJOPM/LtE1d8dnQg07MPeTWopJ5xmOxGDsS+jc7puWhuQw
	RtShBvu+JFPUxmfF0Qprwx3rkAAA2GxrFkg2is4khcYkuk3zRhhnkcb3VLo1Yytdn92H5R
	98jtlNSxbW9Z3VYLyiy/1++GW/ag8TnUncatSSbp4hrBMl9HNe6KGI4BpcJsEijwxSjr6A
	Dr5kj1SWtuBOOr2c1vDc81CTFunOWkKqIFz9+CIyddppy3GoXEQGkM9V7BaJoq9Tuy+RU2
	rIunM2psdQC5eDJuFJlq8Ye7s1dxNgxXexiNl5QTXwRxpgG2peueoJBXyYpUrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732642830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f8nVuLKwPdVsdciR71/j+DZiHZoBHMBIVygTw9pRkQU=;
	b=LxakA44t7rtVvjFdlqslyEWAqHPE0AMMVDMqsY/qhdD1OFzx2YQwmQLVLAkvm/GIr7SWq1
	+xSYId5+5pP+AjAg==
To: David Wang <00107082@163.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
In-Reply-To: <25ddb2c9.4b0e.19347d04c05.Coremail.00107082@163.com>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
 <25ddb2c9.4b0e.19347d04c05.Coremail.00107082@163.com>
Date: Tue, 26 Nov 2024 18:40:29 +0100
Message-ID: <875xo9zyeq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 20 2024 at 12:24, David Wang wrote:
> At 2024-11-20 09:20:59, "Thomas Gleixner" <tglx@linutronix.de> wrote:
>>diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
>>index f36c33bd2da4..9b715ce8cf2e 100644
>>--- a/kernel/irq/proc.c
>>+++ b/kernel/irq/proc.c
>>@@ -501,6 +501,7 @@ int show_interrupts(struct seq_file *p, void *v)
>> 
>> 		seq_put_decimal_ull_width(p, " ", cnt, 10);
>> 	}
>>+	seq_putc(p, ' ');
>> 
>> 	raw_spin_lock_irqsave(&desc->lock, flags);
>> 	if (desc->irq_data.chip) {
>
> On second thought,   considering other paths have already had a leading space, 
> maybe it is more clean to just add a leading space before irq_print_chip:
>
>         raw_spin_lock_irqsave(&desc->lock, flags);
>         if (desc->irq_data.chip) {
> -               if (desc->irq_data.chip->irq_print_chip)
> +               if (desc->irq_data.chip->irq_print_chip) {
> +                       seq_putc(p, ' ');
>                         desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
> -               else if (desc->irq_data.chip->name)
> +               } else if (desc->irq_data.chip->name)
>                         seq_printf(p, " %8s", desc->irq_data.chip->name);
>                 else
>                         seq_printf(p, " %8s", "-");

I rather keep the seq_putc() and remove the trailing space from the
other prints.

