Return-Path: <linux-renesas-soc+bounces-31098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDTqCta012lURwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 16:16:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12F3CBDEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 16:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 078163008503
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 14:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF36C3D9021;
	Thu,  9 Apr 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="pLWCu2G9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB5250C06;
	Thu,  9 Apr 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744208; cv=none; b=P3jUVkMFXup6GiPREid0KcYd5D+K7mvmBS2v9JvROk4CIAuAISNeRBu3Dl2HhACFBLcT/7DCrcC1mzx9wykrP60kUi2kTNb8dZ35GjwHMM7LzXUuHVry+A3TmFEGj3Cc99V0es115uCi96mGuXe2d12MxASymQfD7jBGx0Np3d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744208; c=relaxed/simple;
	bh=DYZzYAGWKLvR/rwy25S1u/xzYttZ5IhxkTqMemtevV0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pIXm+DzlUM1qtXxVpy41EpSNAGhNhHvNN003iyHhVxWyCgsY5KvKLd/ho2wLsxItNO2mg0zOFhK+iL9i4M7ihXgmlpvMY5xtenAQkMWwWn0ptwh5JB547zwMM4u4lCs+QlQ2RNauql1hADjayTR/qibTwVM4wVocipaNwUO9hUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=pLWCu2G9; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=Hr6xXI3C/cIWqZzUGbR1Zy8YyypSIcz9d+o8IgWSUyc=; b=pLWCu2G9tNePBL5EvK8Au27Va4
	/Kiv2ILs+Spj6EiOQCDLQl5+hNJyoB1xuL5z0kR5FeyBd7KhEXCcKBppwyTx0c3QqX2V1HY7pO0Pj
	CvVl45kC13bKNy8u7zlWgii4M36ExQwc2rN6liKpQE0ozlqlVxdOoVlAxsfiFYampbes=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wAqBV-000000000PU-1jAK;
	Thu, 09 Apr 2026 10:16:42 -0400
Date: Thu, 9 Apr 2026 10:16:41 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, wsa+renesas
 <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Message-Id: <20260409101641.8121ddb0e795e4fb2b4cbb1e@hugovil.com>
In-Reply-To: <TYCPR01MB113322203884106612468FB4286582@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
	<TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<20260408141515.fc210b4b3c86f7a61f680dd1@hugovil.com>
	<TYCPR01MB113326DDA1FC854689CE34A6C865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<TYCPR01MB113322203884106612468FB4286582@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31098-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,glider.be,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[hugovil.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4C12F3CBDEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 9 Apr 2026 07:40:02 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> 
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: 08 April 2026 20:02
> > To: Hugo Villeneuve <hugo@hugovil.com>
> > Cc: biju.das.au <biju.das.au@gmail.com>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby
> > <jirislaby@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>; Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engineering.com>; Prabhakar Mahadev
> > Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-kernel@vger.kernel.org; linux-
> > serial@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> > Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
> > 
> > Hi Hugo,
> > 
> > > -----Original Message-----
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 08 April 2026 19:15
> > > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
> > >
> > > Hi Biju,
> > >
> > > On Wed, 8 Apr 2026 17:25:19 +0000
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > > Hi Hugo,
> > > >
> > > > > -----Original Message-----
> > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > Sent: 08 April 2026 17:52
> > > > > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero
> > > > > fault
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > On Wed, 8 Apr 2026 16:35:44 +0000
> > > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > >
> > > > > > Hi Hugo,
> > > > > >
> > > > > > Thanks for the feedback.
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > > > > Sent: 08 April 2026 17:31
> > > > > > > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid
> > > > > > > divide-by-zero fault
> > > > > > >
> > > > > > > Hi Biju,
> > > > > > >
> > > > > > > On Wed,  8 Apr 2026 15:20:58 +0100 Biju
> > > > > > > <biju.das.au@gmail.com>
> > > > > > > wrote:
> > > > > > >
> > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > >
> > > > > > > > uart_update_timeout() computes a timeout value by dividing
> > > > > > > > by the baud rate. If baud is zero — which can occur when the
> > > > > > > > hardware returns an unsupported or invalid rate — this results in a divide-by-zero fault.
> > > > > > >
> > > > > > > baud is returned by uart_get_baud_rate(), so this is not returned by the hardware?
> > > > > >
> > > > > > You are tight, Will update commit description.
> > > > >
> > > > > How can uart_get_baud_rate() return a zero value? If I am not
> > > > > mistaken even for the B0 case, it will return 9600?
> > > >
> > > > As per the comment and code, this API can return 0.
> > > >
> > > > * If the new baud rate is invalid, try the @old termios setting. If
> > > > it's still
> > > > * invalid, we try 9600 baud. If that is also invalid 0 is returned.
> > > >
> > > > In drives/tty currently only 1 driver is checking the return value
> > > > and it calls panic
> > > >
> > > > https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/tty/serial/
> > > > ap
> > > > buart.c#L214
> > >
> > > Hmmm, more than 1:
> > 
> > >
> > > icom.c:
> > >     if (!baud)
> > >          baud = 9600;    /* B0 transition handled in rs_set_termios */
> > 
> > A zero return from uart_get_baud_rate() is a normal, recoverable condition (unsupported rate requested
> > by userspace) and must not crash the kernel.
> > 
> > Or drop the check like other tty drivers, as SCIF/RSCI IP support 9600 baud rate.
> 
> May be setting a buadrate 115200 is safe in this cas like earlyprintk??
> I will send next version setting buad = 115200, if uart_get_baud_rate() returns 0.

Is it logical to proceed with configuration if it returned zero?

Also we still pass 0 as a minimum value in uart_get_baud_rate(), so
that a baud rate of 75, for example, would be valid, but would trigger a
fault later (division by zero). Wouldn't it be a good idea to also set a
proper minimum baud rate?

-- 
Hugo Villeneuve

