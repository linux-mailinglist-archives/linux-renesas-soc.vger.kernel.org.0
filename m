Return-Path: <linux-renesas-soc+bounces-10609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D301A9D31DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 02:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97FC928278B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 01:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076DC168DA;
	Wed, 20 Nov 2024 01:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i/MucsA+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YomFSEje"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFDA920;
	Wed, 20 Nov 2024 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065667; cv=none; b=lu2paCaslgug0zSDCX5DG4VZoB7JQlUAw4eU1RyO8S7WNo8KumsONbwwIjr9l0izqPMnHBmmevgx+IKqVjZ55aQsivqRi9BYHqJ2VZ1ANBFxCZu34VJMWw5GBNZpD3775LFrBucRn2bow2/wt6twOK4PH4T7B/IUQ1zGkNUOs0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065667; c=relaxed/simple;
	bh=bbYZ2mME8c1HJ9soDMq3PU6zLnUuLDKQhVd2HSR6sPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MmT/Sz4ShSTR0y6IrGDV1x5zyjpkKq31y7PAQifK4m+dtDPCOeSCqCEZMeTmQ3SAzhWepmjnBTEHlfYLFwc//vFw0vFKyhSWfTblXLwxnHEIDqEYLmuKsg7EaJB2xdlTBrOLLKW8ksrZvcJO9WWH+jJTygWh3JR0NKPRqSRG62M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i/MucsA+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YomFSEje; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732065663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lt23iJBjVKhB5ryiui6aMnkrpdaYobrfN91IiZPhtyM=;
	b=i/MucsA+sEIpVOM02qlqKiGUi+zowVAA1rjdfEwffvsYNjXJkEE8CLmpL1sljRl/QQSqZr
	0+NgBwWRzkrq6M0XnKtlbQH+dAxVEzvawZTrrC3/20wzFGIM7sR2uqQSMDju8oqbYLlScT
	BDUD7+bHSe/alJuzSKTsK0wqmEANE+QbPw2SORBORCr/aOVDgc5duqo7PtuuYcOpXpOrfx
	AC35fBGmPLzZc4ab9pe4JZrycRG25XUMmv1ekkZ/tUEQG9m0Utpxh5XEFRoTFPaIgjXtB/
	qUFWT/xbgXC07mbxXBMvnkUs3UgryhV/tU9GAr1M84GJ5233hlhumw0l7olhEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732065663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lt23iJBjVKhB5ryiui6aMnkrpdaYobrfN91IiZPhtyM=;
	b=YomFSEjeM3+TdF5On3S0b4YHy+BrdpB9vIMdu9WAZSQS6CqNch47FHOpaZ/WQI1u02WPts
	axmsOJjb+067J4Dg==
To: Geert Uytterhoeven <geert@linux-m68k.org>, David Wang <00107082@163.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
In-Reply-To: <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
Date: Wed, 20 Nov 2024 02:20:59 +0100
Message-ID: <87ed36zon8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 19 2024 at 20:55, Geert Uytterhoeven wrote:
> E.g. on Koelsch (R-Car M-W), the output changes from:
>
>  	       CPU0       CPU1
>       27:       1871       2017 GIC-0  27 Level     arch_timer
>       29:        646          0 GIC-0 205 Level     e60b0000.i2c
>       30:          0          0 GIC-0 174 Level     ffca0000.timer
>       31:          0          0 GIC-0  36 Level     e6050000.gpio
>       32:          0          0 GIC-0  37 Level     e6051000.gpio
>       [...]
>
> to
>
>  	       CPU0       CPU1
>       27:       1966       1900GIC-0  27 Level     arch_timer
>       29:        580          0GIC-0 205 Level     e60b0000.i2c
>       30:          0          0GIC-0 174 Level     ffca0000.timer
>       31:          0          0GIC-0  36 Level     e6050000.gpio
>       32:          0          0GIC-0  37 Level     e6051000.gpio
>       [...]
>
> making the output hard to read, and probably breaking scripts that parse
> its contents.
>
> Reverting the commit fixes the issue for me.

Interestingly enough the generic version and quite some of the chip
specific print functions have a leading space, but GIC does not.

The below should restore the original state.

Thanks,

        tglx
---
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index f36c33bd2da4..9b715ce8cf2e 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -501,6 +501,7 @@ int show_interrupts(struct seq_file *p, void *v)
 
 		seq_put_decimal_ull_width(p, " ", cnt, 10);
 	}
+	seq_putc(p, ' ');
 
 	raw_spin_lock_irqsave(&desc->lock, flags);
 	if (desc->irq_data.chip) {

