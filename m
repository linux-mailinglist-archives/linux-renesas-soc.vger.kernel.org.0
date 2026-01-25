Return-Path: <linux-renesas-soc+bounces-27388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGG5AGqqdWlYHQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 06:30:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D587FCB7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 06:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F09D73001460
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Jan 2026 05:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29D52DB799;
	Sun, 25 Jan 2026 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3n6HWtP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1852417C3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 25 Jan 2026 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769319013; cv=none; b=k/nZad4+dues0619/2SOSaMzxTLCTeehYboI+kpTMRB39hDO8Z6KsGmlNVqkuiihhhnIRXKCwJzSFnrDADTKwqR0Og1DtqxPVtGJRJFfI/+xR8/M4G5BV7PL+9Ap87WO1Vs161L8bPXGH7LnBLzW2YMsS7BcjTQRTcOPmX7T3/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769319013; c=relaxed/simple;
	bh=Jt1WVQ7kpD6vAUdyUPQXEmWntKszXzMyTQU3h3Iz/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaAFPh6f99vZC6HWl6vdvld66qaHK6Dzka3ZRD1Ca4mg0msXCUX8/P4B2fjoza9jUkNVIxskounizhChIH1ScF2HZ7iu7n9Jz4fHCvp6O2z/h+8y9XhpDL2YUrTImJZQD/TNOkE6pFPvOoxZlEq2zoYKgxyYdHM/mIZA+rPSBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3n6HWtP; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b751c8b6beso365265eec.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Jan 2026 21:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769319011; x=1769923811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4IiGCcexlgth84wQDt2zHknJREH0L1/eshHrOemxLY=;
        b=O3n6HWtPCnVTNm9V7wuS8xWY7We5Bhi0C4OLQt6+1bT6Ea91ZoQiwHrO5oHuftCEkW
         k9S3RodxlO1XlrdOHQl4yMaT9kmcbVggnqAhIc8Dn9Be9mWvtEvFAj+Dxn6CNdLKCMea
         XDvrvWgADcHkorfB285p7xVEFl5FJ/3G/NwXWE6u9L7OfVYDHHSOkruQUdaMm70EQGgc
         SkrhsOwBb0LFeaXZuIxJGrDbYDAqqL44UghNIeiUz+uETd/bzYsLDXuZNshHiqcg7bni
         RzFByCBW4FUIBOQNhOrUQeTuaMr9w/swDqSoDcY5I7CwI2iwv5ViNyfIO3CpV7l3u0Cn
         U1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769319011; x=1769923811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4IiGCcexlgth84wQDt2zHknJREH0L1/eshHrOemxLY=;
        b=sQAYgTYIf2TjA7/YY2cHCifo2Hkx30FjulBVt8oJ4nzZkyJUJq0lX/yOGk4cbMLAy5
         j0MCHHw8B2Vv1h/MskECwcnee4WNmPcw5Nt6TgNbZTKIWxoU2dYPJEnuDMOf05m51QdG
         3WykwfzAFlHw/VoPZ3UU0cIxR6oH8gNU7NrT9Q89K6tY/Bncf9yv5npVf1UsHzGa9uES
         pTgpyR9dsvw2GnSnBzVlHDLYYDYtC+j2SFo1tmtO6GCg9z8bLTaKTliiandWVxwtiCXB
         +ql22prLQU3ZWE7Pudb4RP92MZWiim/VAS9BOdlhDZYbF3VCBMP9IFQezttXI6QfMcNS
         0rrg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Hy52iD9h07aNnwapQ8tqT8llQa25SCqyd/hnWZSW1AffjcGaXjvdgvXL7hBCU4AP25q1VOLIr6UWuGQLWNLsvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94NL8JZxsqSEjQbTDVFZJl7+Sh4HUAleDGLTKIR/9Vh4XBzx7
	5qSU1sbvg1ziUPntMb7h//TucuFGSbu51wrUzWD/9gpCyUaty172iYns
X-Gm-Gg: AZuq6aLPRBvXvBEmlEzg7N2sImmWuE+BGnKUzqENCmcCIErfo+d97+Rh4C01Y3lH+Ie
	Vp137WTE9qgIwQFkfjU19wflg44ESS5IrN0ILeGOp2k6Ms33GPmVwyotJUsrxyngPbpeFd+Uzkm
	s685s2W+Y2OMTQ/3PzG1UeoJU6oCU7FGp8XKsqVV4pem/zAVyr2Jeb2LeZzbdsWJ/uPF5azO5zV
	rSxqpr7twSLdypcgnJAfNHaFfwm4qrbAVaHWkC/UUmtOAq0Gke/WzpH1ZcUrjaxizc/5XYTLxeo
	Xcp41DNDKFyH+DLlw+grtnX6ga+IjdxMmAKco94C6/SHfEdk1ZZ+s6ZHstOgpyXrQWl0byp/8Mj
	t+N9XMS8i5BDb9Og62zq80Gv67WZyzCLNaCxPTHgDKhDLXt1IxaVBjvg67Q2EFz+YzkHLTRKGHT
	tDaDHeYZHLS8Wj1AF/yKtm/oYHvPt1p7hkC9rTKGYBqVQdfPIvSVpf
X-Received: by 2002:a05:7300:8804:b0:2ae:5022:fe7c with SMTP id 5a478bee46e88-2b7638844bfmr285363eec.1.1769319011095;
        Sat, 24 Jan 2026 21:30:11 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:106d:a8a0:84b7:2d62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa03fd0sm9112849eec.23.2026.01.24.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 21:30:10 -0800 (PST)
Date: Sat, 24 Jan 2026 21:30:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
Message-ID: <al63ckh4mhr24yony4paeuegh5m3nir77ymkx25okbzvazmghh@avpbc2lsejle>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <20260122162206.9wrHkrTZ@linutronix.de>
 <87h5sca9dh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5sca9dh.ffs@tglx>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27388-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linutronix.de,mailbox.org,vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89D587FCB7
X-Rspamd-Action: no action

Hi Thomas,

On Fri, Jan 23, 2026 at 11:52:58AM +0100, Thomas Gleixner wrote:
> On Thu, Jan 22 2026 at 17:22, Sebastian Andrzej Siewior wrote:
> 
> > On 2026-01-22 00:23:47 [+0100], Marek Vasut wrote:
> >> @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
> >>  DEFINE_LOCK_GUARD_1(disable_irq, int,
> >>  		    disable_irq(*_T->lock), enable_irq(*_T->lock))
> >>  
> >> +static inline void disable_valid_irq(unsigned int irq)
> >> +{
> >> +	if (irq > 0)
> >> +		disable_irq(irq);
> >> +}
> >
> > | $ grep " 0:" /proc/interrupts
> > |    0:         43          0          IO-APIC  2-edge      timer
> >
> > in other words, interrupt 0 is valid.
> 
> No. It's not really.
> 
> Interrupt number zero is a historic leftover and a mistake which is only
> relevant to some oddball archaic architectures like x86 and others which
> tried to mimic that.
> 
> The general agreement is that interrupt 0 is a legacy oddity and only
> supported in very special cases. Everything else treats 0 as invalid.

Could you ack this new guard if you agree with it please?

Thanks.

-- 
Dmitry

