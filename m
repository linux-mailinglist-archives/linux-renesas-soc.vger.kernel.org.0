Return-Path: <linux-renesas-soc+bounces-9787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AB99FA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B552AB20D69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 21:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A6C21E3AA;
	Tue, 15 Oct 2024 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vl7V5SQ4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sSlxmmtY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB421E3A2;
	Tue, 15 Oct 2024 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029132; cv=none; b=ty0sjzVXLhpyvOdt5V8o8DrdAL42pRGuORn4A7E84R5V/bBK8MDaSwDiYFeuqYGHIy6vM9FgAwoiz0JVtg41ar+CAz1dviSspIKRFIEb+CrTXAANSE47hTGNxdHQskdSzfDh1vf0Ex2hu6c2Chs+bps6mIJYqJCiLbfOykoalX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029132; c=relaxed/simple;
	bh=p61YuIh1Y8MUDVqmuiNV/jsV3UiIoa56tIkQZUYCVNA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VTQVGo50U2UUrhQL/93FGEjR0QB9H4C68gSdZzw0BdCbg2X5Z5/ZISoM6+OUZfOlsYyzZColDkvJUoM2oQC9RiMIlFGb30uDXhb3ALJ0A40F8iIXGPOYZflQBLGQvXwzGlIBSTXRzh2ZyIYAyvgRoXQNOlUVi8fJW26DliPRtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vl7V5SQ4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sSlxmmtY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729029129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V17BgVSHlm/Th688C4r6hGpuwTlMDXhpOb8SuP6x8Fo=;
	b=vl7V5SQ4lMqu3lE1zrTeHK9jmn0btpzXg4+Xff4gScdfjUYVEFvzS4ow1o9zqeQzWkvtsJ
	XtzXKpbmbtRDt2aqseFwH0ruGL6K6VG3iPk+o8yqTMX/KV21p3ptn5CROAVPzH0r3jprYz
	1jxzmUxhuH8X8XZdpBIGFR4v6rCsSf6koIrJW13IAkF9tUzWW9ZawHQiPieJ6s0LG/AO53
	bmTiC0HY8x+/FxKIkYKm9NGjqONYD/1/j4rxBxr8V2mEFGsaLPR/0JYVVnIqGBDOCXFigH
	L5Yth5QMuZ9x9xfZP9D0J4n3Sys6emhfDgQVmpNyN1jXzi2fdNu7QkpDWhLL9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729029129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V17BgVSHlm/Th688C4r6hGpuwTlMDXhpOb8SuP6x8Fo=;
	b=sSlxmmtYfGW/39lSIkBfcY+CL/ruYvLqhaZw59bKhPNV165tpJOQAEaURvx4WxlJUnw5lX
	23eB9XeHPdcoKBAQ==
To: Markus Elfring <Markus.Elfring@web.de>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson
 <Chris.Paterson2@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
In-Reply-To: <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de>
Date: Tue, 15 Oct 2024 23:52:09 +0200
Message-ID: <871q0hdofq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11 2024 at 20:48, Markus Elfring wrote:
>> rzg2l_irqc_common_init calls of_find_device_by_node, but the
>> corresponding put_device call is missing.
>
> How do you think about to append parentheses to function names
> (so that they can be distinguished a bit easier from other identifiers)?
>
>
>> Make use of the cleanup interfaces from cleanup.h to call into
>> __free_put_device (which in turn calls into put_device) when
>
> Can it help to influence the understanding of this programming
> interface by mentioning the usage of a special attribute?

Can you please stop pestering people with incomprehensible word salad?

>> leaving function rzg2l_irqc_common_init and variable "dev" goes
>> out of scope.
>>
>> Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
>> completes successfully, therefore assign NULL to "dev" to prevent
>> __free_put_device from calling into put_device within the successful
>> path.
>
> Will further software design options become applicable here?
>
> Can any pointer type be used for the return value
> (instead of the data type =E2=80=9Cint=E2=80=9D)?

How is this relevant here?

>
>> "make coccicheck" will still complain about missing put_device calls,
>> but those are false positives now.
>
> Would you like to discuss any adjustment possibilities for this
> development tool?

Would you like to get useful work done insteead of telling everyone what
to do? There is nothing to discuss.

>> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
>> @@ -8,6 +8,7 @@
>>   */
>>
>>  #include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
> =E2=80=A6
>
> This header file would usually be included by an other inclusion statemen=
t already,
> wouldn't it?

Relying on indirect includes is not necessarily a good idea/

>> @@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2=
l_irqc_priv *priv,
>>  static int rzg2l_irqc_common_init(struct device_node *node, struct devi=
ce_node *parent,
>>  				  const struct irq_chip *irq_chip)
>>  {
>> +	struct platform_device *pdev =3D of_find_device_by_node(node);
>> +	struct device *dev __free(put_device) =3D pdev ? &pdev->dev : NULL;
>>  	struct irq_domain *irq_domain, *parent_domain;
>> -	struct platform_device *pdev;
>>  	struct reset_control *resetn;
>>  	int ret;
>>
>> -	pdev =3D of_find_device_by_node(node);
>>  	if (!pdev)
>>  		return -ENODEV;
> =E2=80=A6
>
> Would you dare to reduce the scopes for any local variables here?
> https://refactoring.com/catalog/reduceScopeOfVariable.html

Can you keep your refactoring links for yourself please? We are aware of
this.

But this change fixes a bug and that's it. We are not doing cleanups in
a bug fix. Please read and understand Documentation/process before
giving people ill defined advise.

Thanks,

        tglx

