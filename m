Return-Path: <linux-renesas-soc+bounces-10817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946C9E1995
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4F916418E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27EB1E1C05;
	Tue,  3 Dec 2024 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TerEc3Hw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="//BX58zl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E61E25E4;
	Tue,  3 Dec 2024 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222447; cv=none; b=gQScVg7vCGFMS3FGvHc/QYEeTU/n127zDZIyDr4pvwiEG0BK782YajvYsPu6xBNufyWFCLhmZWgV3b+q8QbL11mJ56+tkCn0ZVUgRm2L/VOPuKw4zLYxLVV48cNPs31z8SSGn1teQNnVW37kmq2aoY04AwJtYEGM6OWjktJ0zkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222447; c=relaxed/simple;
	bh=CWol3+bqmxcrWbnkgkeQDQ9V+0DsDGef8IkWU+RQZiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kOrjOqRyvOgX3ukF3dnRKED025tVx0JGEft8A2E4ZEf9oSzEoeNdkNU1HsrXfPht1ckUa7REuHysaj2MoUix9S9/Ws5Z5xsufXpy8cZA2TUSQ+s3O6DjRQ+lnupAvwusA04KR+TqSmDkB6u15hjTuiid81b+d9g3y2zOMZgAaMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TerEc3Hw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=//BX58zl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733222444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGxaB5P5hbx9uBKqdiojD8CzlXW4xiS42lPQLahl6o8=;
	b=TerEc3HwlL9fnEfijhb5FO4ZN7YRzLEm9OqmgoV7t1PnTaMEluVOqQ0WJfsRcMwIT3kIiN
	Ay1olmkl1X0mnOgLqbkIImk26+jqQBYN03cyhbI1C7F19jQKwhN7L/u74C7Xtyw6G5c4PY
	5Vn4vv8FBBYcIthUY3QhHe12AYNEJ1WJwS/AISVcFr+YHa3lDvsOlyQ4i9WeprTcqWNY8J
	XQkz4bUW2RCoSfDcypQyaGH13yK4JVHXCVXaMR/Qa5AljXJYJhdYvxyaojC31V3E/2AXcv
	aK/oxmfYTHbnmeCln82lBr0r01bFsEZX5JNzfL11x76Jj2lfiwmOe0Rw3YGnbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733222444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGxaB5P5hbx9uBKqdiojD8CzlXW4xiS42lPQLahl6o8=;
	b=//BX58zl3zQvDalGbJISyx74TaVQ5OmhJlri8FPHlDm+fr7Wysl0082UVxwPfJxRYteyVr
	VXZ0q+iR8xllt8Aw==
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Wang <00107082@163.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] genirq/proc: Add missing space separator back
In-Reply-To: <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
 <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
Date: Tue, 03 Dec 2024 11:40:43 +0100
Message-ID: <87zfldt5g4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The recent conversion of show_interrupts() to seq_put_decimal_ull_width()
caused a formatting regression as it drops a previosuly existing space
separator.

Add it back by unconditionally inserting a space after the interrupt
counts and removing the extra leading space from the chip name prints.

Fixes: f9ed1f7c2e26 ("genirq/proc: Use seq_put_decimal_ull_width() for decimal values")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org
---
 kernel/irq/proc.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -501,17 +501,18 @@ int show_interrupts(struct seq_file *p,
 
 		seq_put_decimal_ull_width(p, " ", cnt, 10);
 	}
+	seq_putc(p, ' ');
 
 	raw_spin_lock_irqsave(&desc->lock, flags);
 	if (desc->irq_data.chip) {
 		if (desc->irq_data.chip->irq_print_chip)
 			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
 		else if (desc->irq_data.chip->name)
-			seq_printf(p, " %8s", desc->irq_data.chip->name);
+			seq_printf(p, "%8s", desc->irq_data.chip->name);
 		else
-			seq_printf(p, " %8s", "-");
+			seq_printf(p, "%8s", "-");
 	} else {
-		seq_printf(p, " %8s", "None");
+		seq_printf(p, "%8s", "None");
 	}
 	if (desc->irq_data.domain)
 		seq_printf(p, " %*lu", prec, desc->irq_data.hwirq);

