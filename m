Return-Path: <linux-renesas-soc+bounces-10598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B99D2F32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39060B2E024
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED701D0F68;
	Tue, 19 Nov 2024 19:55:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DF1CF7B7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732046150; cv=none; b=rHdp0MQnpicjdD9ZfquH9M16CL8DYvweioE0Ds1kasbCJ9qa9ZKM4TloVziOgaax82UgqJsJ24MH5yRQsTUA4xgFK6Mn42pVn8+k1ZUzbXzIb1WIpofXNmubdHMK7/ZtItRf28EyM2nD0yQlX90JQl9tSV73DZRRhwRQCs0kCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732046150; c=relaxed/simple;
	bh=NG2rRXBIaMtEGXf5JAB9c42rp4PnYusJq1F6K1WGV6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NWYkx6GwvK3G2NmNabgOY9jhAijmWDjqbEWeX72+8Bkb7Cz4Xyb41rMiM+QBamK5SaZl7uQxVbZfzqtbFbGoxwdL0kjZMvsLHNQf5zmIFKDU4QBBDLhpU6rv/1caEmOM6Z3YdjguRBvBFcc70RJ6ap9KDANYbFQZmq9FjnSsVl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XtFbZ6tKVz4x4q7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 20:55:38 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:90:c2fd:9e4:224c])
	by xavier.telenet-ops.be with cmsmtp
	id ejvW2D0073aMPyX01jvW9F; Tue, 19 Nov 2024 20:55:30 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDUJu-007Z2L-5s;
	Tue, 19 Nov 2024 20:55:30 +0100
Date: Tue, 19 Nov 2024 20:55:30 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Wang <00107082@163.com>
cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
In-Reply-To: <20241108160717.9547-1-00107082@163.com>
Message-ID: <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
References: <20241108160717.9547-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi David,

On Sat, 9 Nov 2024, David Wang wrote:
> seq_printf() is costy, on a system with m interrupts and n CPUs, there
> would be m*n decimal values yield via seq_printf() when reading
> /proc/interrupts, the cost parsing format strings grows with number of
> CPU. Profiling on a x86 8-core system indicates seq_printf() takes ~47%
> samples of show_interrupts(), and replace seq_printf() with
> seq_put_decimal_ull_width() could have near 30% performance gain.
>
> The improvement has pratical significance, considering many monitoring
> tools would read /proc/interrupts periodically.
>
> Signed-off-by: David Wang <00107082@163.com>

Thanks for your patch, which is now commit f9ed1f7c2e26fcd1
("genirq/proc: Use seq_put_decimal_ull_width() for decimal values")
in irqchip/irq/core.

This removes a space after the last CPU column, causing the values in
this column to be concatenated to the values in the next column.

E.g. on Koelsch (R-Car M-W), the output changes from:

 	       CPU0       CPU1
      27:       1871       2017 GIC-0  27 Level     arch_timer
      29:        646          0 GIC-0 205 Level     e60b0000.i2c
      30:          0          0 GIC-0 174 Level     ffca0000.timer
      31:          0          0 GIC-0  36 Level     e6050000.gpio
      32:          0          0 GIC-0  37 Level     e6051000.gpio
      [...]

to

 	       CPU0       CPU1
      27:       1966       1900GIC-0  27 Level     arch_timer
      29:        580          0GIC-0 205 Level     e60b0000.i2c
      30:          0          0GIC-0 174 Level     ffca0000.timer
      31:          0          0GIC-0  36 Level     e6050000.gpio
      32:          0          0GIC-0  37 Level     e6051000.gpio
      [...]

making the output hard to read, and probably breaking scripts that parse
its contents.

Reverting the commit fixes the issue for me.

> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -494,9 +494,11 @@ int show_interrupts(struct seq_file *p, void *v)
> 	if (!desc->action || irq_desc_is_chained(desc) || !desc->kstat_irqs)
> 		goto outsparse;
>
> -	seq_printf(p, "%*d: ", prec, i);
> +	seq_printf(p, "%*d:", prec, i);
> 	for_each_online_cpu(j)
> -		seq_printf(p, "%10u ", desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, j) : 0);
> +		seq_put_decimal_ull_width(p, " ",
> +					  desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, j) : 0,
> +					  10);
>
> 	raw_spin_lock_irqsave(&desc->lock, flags);
> 	if (desc->irq_data.chip) {

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

