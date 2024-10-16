Return-Path: <linux-renesas-soc+bounces-9802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 611409A0CC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 16:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C655EB26A2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 14:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F855209F5E;
	Wed, 16 Oct 2024 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="On8ulFps";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8bM/sX0L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCE1D1748;
	Wed, 16 Oct 2024 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089306; cv=none; b=hRY0iUgcph3X2CYkxv4RG4QH1mOaEBwuX2uUFg23/gqQ6xmgrDmQHcqN3/vpVNGO4/4GyVypUEGV/5qDgIHLlEwMVTh/OtFiMeMHVXdnXTDBwm0HpsuRkaPOMi9Ed4hCPThmYLIre8ctm8h1LWgwwzYxPtFDrGnboP874zVEyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089306; c=relaxed/simple;
	bh=pQMQXj/R2fZDK/7JoZqlsC3XPxjmyc64AUqjn4r+iLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AO4MTjtSu+nNuju+GRGIq3bCd+Fv773+fGj/MQmj82JVa8mIt4QX9+XIbV0qt99WJzzN6kaXEMc10BnhUAen4YS5LRQXw0L77mEwlYlbu1KE4vMyAO5JKvXN2giyDP+yZ1rHJg9yY2Xwv5RHDq8t6CkzG+Y0qC4HxfyAEmzRb+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=On8ulFps; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8bM/sX0L; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729089302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQMQXj/R2fZDK/7JoZqlsC3XPxjmyc64AUqjn4r+iLA=;
	b=On8ulFpseIFW4ue5RlZ9mMhudTTqRw2BvQ8vYls+Jngd0o2oXS8rmd+80vzQN2Cbs0OPDi
	ff3jbd3yxGLS7cQROyr84NrvmYkSJlVntQuIZenJlWiIZROG7NS9GGtchxivZbsF1X4p92
	+lAQxvnLptBLEuZObfp8zDU3YgAjJWVdHf/thR4NAU1sXO7DcwoF1TSQE4iiQcR23mWhg6
	El12KY9IADu8AoCd34PCzc4RAUYac1BQxBOcdSzLZUU0xIfN9vFXKExwK5sgChGpy7llTX
	tgvX7fkekhncp2i877NlehYIHlcrQCeOELuoIYygRXbEt27i3OxQ8PICK7ZrOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729089302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQMQXj/R2fZDK/7JoZqlsC3XPxjmyc64AUqjn4r+iLA=;
	b=8bM/sX0LvP1G6jFgAGGxNA1J0n5yRnB6o5NwHWQduoG2Xh7l/aIMJ3BQamTAATnFq6zHxh
	DrPISF1cXIJSnHDw==
To: Markus Elfring <Markus.Elfring@web.de>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson
 <Chris.Paterson2@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [v4] irqchip/renesas-rzg2l: Fix missing put_device
In-Reply-To: <692cabd4-038b-403a-b21e-69a2b0492e57@web.de>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de> <871q0hdofq.ffs@tglx>
 <692cabd4-038b-403a-b21e-69a2b0492e57@web.de>
Date: Wed, 16 Oct 2024 16:35:02 +0200
Message-ID: <87iktsce09.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 16 2024 at 11:38, Markus Elfring wrote:
>> We are not doing cleanups in a bug fix.
>
> Additional adjustments can be offered in subsequent update steps
> (within a patch series?).

Feel free to send patches.

