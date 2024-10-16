Return-Path: <linux-renesas-soc+bounces-9806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 187259A157A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 00:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51AD91C23583
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 22:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AA51D2202;
	Wed, 16 Oct 2024 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C+p5po82";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aGfZF+uW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E4F14EC47;
	Wed, 16 Oct 2024 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116034; cv=none; b=hKXOJ9nrx/KahvhI0VOGtpm4ovVE8kxJchmGYH01uyQKSQ8Axl04pbgfyZ62zpl4yNMMzgI0siJc2SeiiiVY9Zx4UAV7SJJUGe0tvAqqdDEw6khDX7GMbRXvMy7hJGE4MZ6hfcHqbyd5w7hVScZt2TUovvDQmT7MoI3GRvXdkZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116034; c=relaxed/simple;
	bh=yl1F6BzOPZEQ03ekfz6crqlH1mqvRN6+fW0z4mNfXEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ljHSCrFTQvbwP4imaKr74hXjo7ECmWmnHsfYvn8baMbYnVfZY7e2Qs5JsMuu/BTSxFECV//lZ2oqERoyg27qPArrOJO40gOQgcie5we0oORsiejXXLPG4OU2gfnWHUFFKz+1AcnNaU5NDV6WxuqwooIA8TOPsQe7jNXuYanpAuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C+p5po82; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aGfZF+uW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729116031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhf8iOfPlNIrpxB6coA1JKEPQMoCR9lDm2Uzc0nNue0=;
	b=C+p5po82ZftR+wAkoYIxfhg4jmOwez76sav0tQzEYqcZ5kLC39vUHWtZ3UKztF+p10fuDU
	0yI1DFlAboaJuO0Jma7f1E6ib1rP0LOaPPVf6vh33oyzuqW+muKp1hiisKHba+GZcny9h7
	iY4wzrvEeCHGhNv9ql18Xdv3G/0/DWC3wbLXx6LZkMVKVc5H4hN6TSs9RNtcF1ykHrJfjk
	WiIsHw/Mg8hccDrTTihb687jVNkRu5DPROFJ4xSByLc7sXSbjZjmqR6y7jLwvZvZz0EONN
	eOq/ReI5WOyG37MO2nB6YuRzNFS8+gBorNcJTCM4APCbAf6ApCMKLQxrGDgedA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729116031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhf8iOfPlNIrpxB6coA1JKEPQMoCR9lDm2Uzc0nNue0=;
	b=aGfZF+uWID7vnA57nFHlYeeyWNm7Fq823AmcaWQv593ZJmCTk9SUou2i+/ST1P3bK1VIBJ
	jsmX+MNJdKtW5lAg==
To: Markus Elfring <Markus.Elfring@web.de>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Paterson
 <Chris.Paterson2@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [v4] irqchip/renesas-rzg2l: Fix missing put_device
In-Reply-To: <692cabd4-038b-403a-b21e-69a2b0492e57@web.de>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <663a37fe-ffc4-4826-b8ba-bcefdb0e7992@web.de> <871q0hdofq.ffs@tglx>
 <692cabd4-038b-403a-b21e-69a2b0492e57@web.de>
Date: Thu, 17 Oct 2024 00:00:30 +0200
Message-ID: <87cyjzaetd.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 16 2024 at 11:38, Markus Elfring wrote:
>> But this change fixes a bug and that's it.
>
> Maybe.

Maybe?

There is no maybe. You clearly failed to read and understand the
documentation I asked you to read and understand.

Either you are impersonating a badly implemented LLM or you are actually
living in the delusion that you can teach people who are actually doing
work based on your particular flavor of hubris.

Your answer to this mail will clearly tell me into which category you
fall into, but neither of them are in any way useful to the Linux kernel
community.

Whatever the answer is, I don't care because your input is completely
irrelevant. You have proven that over the years.

Thanks,

        tglx

