Return-Path: <linux-renesas-soc+bounces-18997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB9AF0454
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 22:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B8D1BC8605
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 20:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDAA25F97A;
	Tue,  1 Jul 2025 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lWMLEmiI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YYfiilrl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F71B95B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 20:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400600; cv=none; b=spE27LaZD+cZ1n7vVR1h9+sag2IIfFHekiSh2GDgJDuJsrUVgJv6gd0pO+NneroSOxdM497rjzHi7xC+pkzx3kaOuo72ZR5JEkDIhH1t2cRP9foH7f1Ul9OMIyIxF5L5By/aNTYxic+e97n9ELed2V9ilxX7zWfDZkgz0usIrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400600; c=relaxed/simple;
	bh=itoFg1vwSwK7PCV/t2T3dZT5EARvGRPBtSQTbPmetCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Spp8h4i/MD3UTuJP+ytkBAU/GVe4RoUA5hmzxqVyZV8VYp6XJXCn5oJ6hl2pev7bohFmYRlL+3J8JXbOpVQfdk1O7xxGINpXoyDv/Z1QSgJGOhdEt1hvx9KCqV9+45fpz74ObsNvBDkWefBaoDYHMqOJDDO4hmKyoOGl2CubS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lWMLEmiI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YYfiilrl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751400597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5YKKjcKiq+yZu7D8YevcvheQQYWUZxkZYwk+s3KCx8=;
	b=lWMLEmiIlo8TMMPNbfmXAxmbI+kXW+cgDv16HulxIurzhOMspRE2nofdHNz3IAHRbEhjqx
	xPE9K/ovl1kAqeLpOUdm8Rqrt1CtFxK1cA4cV6KJ0eUcYLdcw+a3Cjy/Q4NG6n5hEL8v84
	1/uMsWiTe5rjig7PUtGIGc77DGc7Smd/ScwKK5rFdRhj/4jnzysg9/pG/Le3dVXXTuR4Y7
	Ki01C15C/8S8uIHDBPV6xcg5pYGR/iq8LdtICRghTUUNvK36Waaj965eifRgwSiSvlAhRL
	B6fAR7rB/ev2NPmYYTgi3L8AAgiZ/wMC6i2Txo59WnI+g1DwUty2T181IQlq1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751400597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G5YKKjcKiq+yZu7D8YevcvheQQYWUZxkZYwk+s3KCx8=;
	b=YYfiilrlvi6DWrvvwjrNVQmvHFoQQqqIaSyxInwR426D3tCWZ1adRumCpCNzcFqRxPAxEA
	wr+pr3uBGN6RnpAg==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.au@gmail.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
In-Reply-To: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
References: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
Date: Tue, 01 Jul 2025 22:09:55 +0200
Message-ID: <87ldp7llkc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 11:59, Biju Das wrote:

Can you please cc: lkml as required by the MAINTAINER file entry on
future submissions?

Why can't people just follow documentation and thereby make the life of
people they want to deal with their submissions easier?

It's truly not rocket science.

Thanks,

        tglx

