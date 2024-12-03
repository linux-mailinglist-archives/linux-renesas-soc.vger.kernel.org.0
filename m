Return-Path: <linux-renesas-soc+bounces-10854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B29E1E69
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 14:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3C472828A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC0C1F4285;
	Tue,  3 Dec 2024 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BNYGsyyD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ExqgN15"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA61EE006;
	Tue,  3 Dec 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234205; cv=none; b=lo91xwwKFsQ7IAHdwhDN0wc2xs2MmI2+gdsbSJDUFFVSBR1T61EeRt0ucJBLExpQTlrOg9Yb/fp3Y9e6QhZ+XtfW46kmf8IAmtGSfvyIdUJQ2kC9uJP3uOe9ThBAAG8vgyrV3yGiJTpLJsSL/q6AUHaWnFzYdZzInQNYlVS62rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234205; c=relaxed/simple;
	bh=DOSaW97ofhZDd/qj/ltzOD9+35p2Q9owvaQadEbW7sQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VZdvU6JFt38sRgNc2RF8vaPXrDT09dhiecq1j7L+NiXPP/0qMB8G53h3AbZtHBAjgWRNdHmZOTd3rbkJHcVqk+plfRlZEh8izTHQjVM4WQgEriRmq0bel/R7rPTUQxysCncjKxHZMKAurSMrz92boq8KwJQ7TiCxGcvt/n1C1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BNYGsyyD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ExqgN15; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733234201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE07ei6sG26ffw8LXh4n+e1HM8a6j30I61CI/5pEb1k=;
	b=BNYGsyyDRaoXzU1zZcnUmIlp/nSncTpSpsC5UJq0grX9OvD3hNGS2SYinACqXd6msKnA8a
	E3q3N4NPnvkxMo8e9H+8CsYs3DfiMV2XgxNfGUR/Bdtx7ihtpJ5zUsMGeX8loFsd8dPCOp
	j458fHq4SmJP70L87mx8P2LiTEV7iGf+D+BRRS/Jg9gq4HxTJkVKE/fDxo7U0wTJS0l5eM
	dKEDaVQj+mX7O5Sb/3+kOXt6TR9g33F27SDb77glWn+9zC44CnkzValX2bCOsHujfahnOw
	RWUfcTbEv6akrBMzUhUbJbwKPG7Zey3Ee3NVotEiqwYcyO+B8fyFn0UcUw+QYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733234201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TE07ei6sG26ffw8LXh4n+e1HM8a6j30I61CI/5pEb1k=;
	b=0ExqgN15zBqNCHuGPJWv8+2hj++PcmofwzVdEx5p2M6WiFcYXyi8OJ/lwdDw4jmdJvdxJl
	Rm0jTWl2ozLG5SCA==
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Wang <00107082@163.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] genirq/proc: Add missing space separator back
In-Reply-To: <CAMuHMdWY_Yqx3hQSWx1XAUpDx+-YG6ZNPpb-LisOgATOVocKuw@mail.gmail.com>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
 <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
 <87zfldt5g4.ffs@tglx>
 <CAMuHMdWY_Yqx3hQSWx1XAUpDx+-YG6ZNPpb-LisOgATOVocKuw@mail.gmail.com>
Date: Tue, 03 Dec 2024 14:56:41 +0100
Message-ID: <87jzcguaxy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 03 2024 at 12:21, Geert Uytterhoeven wrote:
>
> You should also remove the leading space from the few .irq_print_chip()
> callbacks that print such a space. According to
>
>     git grep -lw irq_print_chip | xargs git grep -W "seq_.*\" "
>
> and filterng out the false positives:
>
>     arch/powerpc/sysdev/fsl_msi.c:  seq_printf(p, " fsl-msi-%d", cascade_virq);
>     drivers/bus/moxtet.c:   seq_printf(p, " moxtet-%s.%i#%i",
> mox_module_name(id), pos->idx,
>     drivers/irqchip/irq-partition-percpu.c: seq_printf(p, " %5s-%lu",
> chip->name, data->hwirq);
>     drivers/soc/qcom/smp2p.c:       seq_printf(p, " %8s",
> dev_name(entry->smp2p->dev));

Care to send a patch?

Thanks,

        tglx

