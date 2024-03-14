Return-Path: <linux-renesas-soc+bounces-3767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28E87B9E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3846BB22728
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 08:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F2F6BB54;
	Thu, 14 Mar 2024 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PPKcx8R0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1ogVlgyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063BD6BB45
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710406752; cv=none; b=DoLGebNh4mVmhmqVCU/j5O7XYTyxCiwKfytOpeE9lzmXKw77CS2beyaLa01jDt5CxhrX5TZEEmhDo+1fueQO/2MatE5SqHne7DLMr5jb8PnJPyDP+LEgw74iXCWCxwO6YL7ToMUe1r0dcHZia7sM0SpRsQKGaAfW6Dt5TdpsN30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710406752; c=relaxed/simple;
	bh=kz3XYp+Ud+qY62KRA5OJUdPoibfROcQicDxA3mzKSNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y/xNGjchzQi3wJvah/t/y20Jby5Ai43MhuPm5DSGXuAgR9LMSveQT+6gzUf37H96y6mdzGBJEEoo/88UYSj0PEcP2ocjZSiI3GMOR86AJo+zPXrg5kkHrZ59zybYl7XoynQoQ3ucblT+YWeMD3pnHrcLwu+dQtMiE7KSaGmtzAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PPKcx8R0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1ogVlgyf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710406748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PHGhUWTlpN6/2cPfK4UB8zUApqtmmhAEsLIHhZQybZk=;
	b=PPKcx8R0VuDUWONNwwV+JXDrVjEbz8WR8gJOSGv8UETpynXyJ09cjgNpc9hZaCj+lez/Uo
	ukO1ZdPWASyfFew8Fc7Sis8P8ZnOHJdCw1ebT4bhlWgbyCYeou7ycyGBxAZ4S00EmEkMNz
	0AjY0a3z85SkV6TVdevG0kdJXqINRF2OUdNRu5s/5ZjqK9T8X9nFnNAmnV8NlAcJLsi4ed
	iEmiZ0KfK9jL0ZO0IktySUcQ/ijFpJfuzgD1qKl15Q6uoORPUmy0qOaTdjmIfMuk5Qzp/R
	4mok1lbdj0aU0tOqc49NEtqOKygF0Q4ro21lUHDhXE+BYyQORzSKS070sfbYFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710406748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PHGhUWTlpN6/2cPfK4UB8zUApqtmmhAEsLIHhZQybZk=;
	b=1ogVlgyfF0PS9pkGjfJ70BHYjODoDGWPhtub416OWLwRWUFrf3+ZjsNXwiL/2iiZPiKU33
	PpZOhcDYiwfwjtAA==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
In-Reply-To: <OSAPR01MB15876D7985BD2DA5B0E25463862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-6-biju.das.jz@bp.renesas.com> <87h6hannrq.ffs@tglx>
 <OSAPR01MB15876D7985BD2DA5B0E25463862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Date: Thu, 14 Mar 2024 09:59:07 +0100
Message-ID: <87r0gdmbok.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 13 2024 at 15:59, Biju Das wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> IOW, it's zero functional change and completely unrelated to the above blurb.
>
> There is functional change. During disable, TINT source and TIEN cleared together
>
> reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
>
> During Enable, TINT source and TIEN set together
>
> reg |= (TIEN | tint) << TSSEL_SHIFT(tssr_offset);
>
> This patch avoids modifying TINT source register which avoids hw race
> as mentioned by hardware team. According to them we should not
> set TINT source and TIEN together.

Can you please split this into two pieces?

    1) The fix itself at both places

    2) The consolidation

That way it's obvious what this is doing. I really missed that subtle
change.

Thanks,

        tglx

