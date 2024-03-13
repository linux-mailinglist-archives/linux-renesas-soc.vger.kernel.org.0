Return-Path: <linux-renesas-soc+bounces-3744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B197E87AA98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 16:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37881C209D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B353446BF;
	Wed, 13 Mar 2024 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JHDNkiqa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dA12BPOM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF506FAE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344566; cv=none; b=E/PKOOGF6kyfmHtMuI7ZPZ9wgvWZNTCYab7ujxJoBIpqRs/kHsEpkfMKostbdpRjt9f97qPswAxPZe22T75+4BtLCO3uq/e+SUOTlrRQuQx9ZTMc9LipaTF9L3rJSAq0pzL4Sfsuh27EhV4oW5/6y6c5b5RE20nzG6rF4RRnbuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344566; c=relaxed/simple;
	bh=IrzSo0DypJqge7QQ46UbSH0L7jCoYCJSxGGO50Yonug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=arp8poRJa9pRbkYtUtieU2r6Bt77TE/Jyu/v7pHMTzCN3FL8vB9ecsPeZ40sr5NrzYV20+oeZDJiSSsAHAkNQcOwOb1fXF/bP2RM+kkYv8+ha3ZJjCZH5sa7ybpBzaY2KVIC45DYLqR5ccLcbbSJRmCf3kfD0roh9q6L57XA6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JHDNkiqa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dA12BPOM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710344562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptc8ufu+QUVY4XkoqOJQln2yR9+qSo2rgCC6YqvQ/7c=;
	b=JHDNkiqatoRHJ33DPEgIa6E08q/+QO4JntsoWCr7yKbv1kVxXLRPAqPhBCNl+h+ony8buS
	V2dNExlnpZNr6rKxkRGnqCi/cQKDCyAPfhPz21X7HsWjjPLTqrCoPM2BCGB/LpCBrJoIu9
	PPDkIl3j4I3vtH/Nm4k+wGrZY8GS8d7sZTo8gZVKDs6tChBqUIgr76dCIP666zjEcu5U8W
	afncZJEaBNN8mu+3rfsFMnjvm/iCB5I3PmQQXZvybjjK/JYeb3nxYY0uO87KfSJg+GBarq
	iYE+X7+Pb+wn3xIYbQDUpPDtrHiE8f7MKiIl4K8uhEvsZvqpKmHy2wv80ICZvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710344562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ptc8ufu+QUVY4XkoqOJQln2yR9+qSo2rgCC6YqvQ/7c=;
	b=dA12BPOMGogFrX8As/VOFnD/Sag4ZtriRDGt0zltosgdR20hm/kYcxV+KG5x8ckyiF7E2+
	ObpxwXDJqEr8WFCA==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
In-Reply-To: <OSAPR01MB1587D16D699155C52A240E5B862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-5-biju.das.jz@bp.renesas.com> <87msr2nqmy.ffs@tglx>
 <OSAPR01MB1587D16D699155C52A240E5B862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Date: Wed, 13 Mar 2024 16:42:42 +0100
Message-ID: <87edcennnx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 13 2024 at 14:58, Biju Das wrote:
>> > -	raw_spin_lock(&priv->lock);
>> > +	raw_spin_lock_irqsave(&priv->lock, flags);
>> 
>> irq_set_type() is always called with irq_desc::lock held and interrupts disabled. What's exactly the
>> point of this change?
>
> Oops, in that case this change is not needed.
>
> HW manual mentions, interrupt should be disabled while setting the value. 
>
> I will drop this change in next version.

I fixed it up locally already. I'm going to merge 1-4 because those are
fixes (2/3 are preparatory). #5 wants a change log matching reality
though.

Thanks,

        tglx

