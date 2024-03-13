Return-Path: <linux-renesas-soc+bounces-3743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC287AA8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 16:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79AFF1C230DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 15:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E219347F59;
	Wed, 13 Mar 2024 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q2QFpSxT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="znvi4A70"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75F47F64
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344429; cv=none; b=UtZqHmJfcq7crnHqckn2Ehyv/1ktAboolg+9nwJbi61ggAIMTm4Z3QcyNW7K1uo9qgrcx4lkQxzXLzj9vlsl6YEbL14+4Ip+XyGMMFQMkVvQBf0nYjhpJxKTGl5f/bA97VIGhsDUVKyT3qw4CEwJ1NCc7zQ4Kas+CQDulzDwcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344429; c=relaxed/simple;
	bh=aOC0yPmFW+jO2U/4DJ2ri5kzM30HCcCcD4+75mVng7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QIfvbdBbjTFZp0hP2o/LLJNYmjGJl0ppFctfuZZUvqeqDP7n/DwU/7bFqe9pPOjfP+w2ctOnDVodgpZiflZmNrIgyzOWW6enXy1rJ/5BHNw1ff1yYWwsqvO385a4oa5vy9m/ynwV3+MNpipQm/UxmYS/7+2yfK28axcBk8vyTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q2QFpSxT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=znvi4A70; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710344426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABQrUHsizSUWatgyx+JcWmihzJKjACvPpI9BkGsoBnA=;
	b=Q2QFpSxT19e4D84OwEopneaoi1QwGyJ1gjHNwXUnsQwG5fENKBC7dhv2m/wbQnATUvTAb/
	EpJg7jOw+h+y0ETGQDSSgdEMWMa3fhv1eGUXwJsdfqlAO+c6vaYRC21C0Z139nxN6jOO20
	w+BxnD4J3JzTI/CyPrGAEhfh2xhMmNRiN7P5IG4/F/XrYOpZm7zEardYoj1Nifm/i7AM7o
	xGXAbPaLHsd5EjOe1ZcHFIoM6ci9oDW/NSKDwp78pHPFcYyfHnLS8GTxQZb30FXgiRLwPs
	GRg97qc2mXPXe/KPk28Vhd17KRZ9LNXLCOkd/OhrSlf8cTMhBbCVBzbgiV5m0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710344426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABQrUHsizSUWatgyx+JcWmihzJKjACvPpI9BkGsoBnA=;
	b=znvi4A70NfqwUJ+nHyXMv1dPdSPGlKgvHCNy0n4AL3eFi4PzrDemNU9rymF/UwuH/gSzt4
	D3RkX6NV0SJny4BQ==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
In-Reply-To: <20240305183922.138727-6-biju.das.jz@bp.renesas.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-6-biju.das.jz@bp.renesas.com>
Date: Wed, 13 Mar 2024 16:40:25 +0100
Message-ID: <87h6hannrq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 05 2024 at 18:39, Biju Das wrote:
> Currently hardware settings for TINT detection is not in sync with
> TINT source as the enable/disable overrides source setting value leading
> to hardware inconsistent state. For eg: consider the case GPIOINT0 is used
> as TINT interrupt and configuring GPIOINT5 as edgetype. During disable the
> clearing of the entire bytes of TINT source selection for GPIOINT5 is same
> as GPIOINT0 with TIEN disabled. Other than this during enabling, the
> setting of GPIOINT5 with TIEN results in spurious IRQ as due to a HW race,
> it is possible that IP can use the TIEN with previous source value
> (GPIOINT0).
>
> So, it is better to just use TIEN for enable/disable and avoid modifying
> TINT source selection register.This will make the consistent hardware
> settings for detection method tied with TINT source and allows to simplify
> the code.

I have no idea how the subject and change log is related to what the
patch is doing.

The patch just consolidates the almost identical functionality of
rzg2l_irqc_irq_disable() and rzg2l_irqc_irq_enable() into a helper
function which is invoked from both places. The existing code already
uses TIEN for disable and enable, so what's the change?

IOW, it's zero functional change and completely unrelated to the above
blurb.

Thanks,

        tglx

