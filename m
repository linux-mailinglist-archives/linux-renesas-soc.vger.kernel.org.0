Return-Path: <linux-renesas-soc+bounces-22707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 259FFBBE404
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 15:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28FEA18998BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44A2D3A94;
	Mon,  6 Oct 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U1JBdkb+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79482D3A60;
	Mon,  6 Oct 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758996; cv=none; b=IJENBQ/s7+Jh4X9o1AJiT/gfWLHAzkYCjuwzfBNOAaEgq0dmRx5MFLt4EeDEuc0XVUpW+spNOv/6nNilHplEDiNpXLK1bp9QylFTMGabhhv48zo2kfCKDhWPLIzQ/ZjVE5xFXguvxKM38KEYMQptPu+JU3MHlWSLzAuQZgsu3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758996; c=relaxed/simple;
	bh=YJpeWvqDunXPYuY/JFHMD2lTDfGHpDSS6O2t4v4gzTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ0jsgx0ss0i9AH2EjkL//TAyvWWPUHQv6tN4oKkHxkj2gzFnjCF+wOlq3e1q56sVWXD+aLcW+pHsK2x1msp3O/UUfox+F6rtJpDd/rgBg1iJFm9yfdEJTMspj8Xv5JlJw9Q8J5U+pcN1OlndEiLu7Sx0ufhdbDetrX3S3ttqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U1JBdkb+; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cgLQv6Smxz9tDR;
	Mon,  6 Oct 2025 15:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759758983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeVFFnaSfB5mkZsBbYAtfrp74HJNpzJXYhSUBh9bRwA=;
	b=U1JBdkb+XqjVTvIbz6F0HiN2fFU5KRqIc1dWR4plyapm3PBSBktC4t3TzwXf+b8EddOttQ
	eRmPRKxeTswZCnPl2JfhV9kmzm7LrBxgQt02CjhvxYF6NId2oijz/QjsUL9f3w9AyflTp0
	PMl0cjH6zI08RpfhpOYWZ0YTB6i+9udgLlSHgTTXJ7UqKY7AVO0sPojxYHQDtinTqMnPe9
	uIset4TRmWAfTazq4RyHZp6IoYUPTbwABZsqd1oQHODg7HYqbtbDjSVrLe0UtNmYyOw+VP
	VuaMltndfcCTi1BJ7WQVK+qhVjEn0fWPc5SrPGkp30QeXQNdRW2onflqZ+wzgw==
Message-ID: <9864e81d-3b62-4513-9deb-1ce154cdc571@mailbox.org>
Date: Mon, 6 Oct 2025 15:56:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ipubr4z4obp7sk1atdgum66csk3d47go
X-MBO-RS-ID: e1b7a018b9ecb8bbe90

On 10/6/25 3:43 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
>> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
>> after reset has been asserted by writing a matching reset bit into register
>> SRCR, it is mandatory to wait 1ms.

[...]

>> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
>> +        * On older SoCs, delay after SRCR has been written is 35us
>> +        * (one cycle of the RCLK clock @ ca. 32 kHz).
>> +        */
>> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
>> +               udelay(1000);
> 
> 1ms is a bit long for busy waiting, so I'd really like to avoid this.
> 
> While the documentation does state this 1ms, I understand the
> issue we saw in the field was fixed by
> https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org

This synchronizes the asynchronized resets, this is a separate topic 
from the 1ms delay.

> so perhaps we can do without this longer delay?

This aligns the driver with hardware operation charts in the V4H RM, 
which mandate the 1ms. If we want to follow the RM accurately, then we 
do need the 1ms delay, otherwise who knows what kind of fringe failures 
we could run into.

> FTR, it looks like the reset controller documentation doesn't say
> anything about the context from which it is safe to make reset calls?
What does this mean ? Please clarify .

