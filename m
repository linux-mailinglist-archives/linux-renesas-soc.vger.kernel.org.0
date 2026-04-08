Return-Path: <linux-renesas-soc+bounces-31049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAlaOcab1mmyGggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:17:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E50B3C05BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 20:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D4DD303D30B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 18:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B3E3859FE;
	Wed,  8 Apr 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="kH7YfPMM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC7385513;
	Wed,  8 Apr 2026 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672121; cv=none; b=nNBnkKdte5S9b1f20FcxDWHRhcI/Rw4krVujq+wN+seV2tr7n0lTxhm89RCxioEFEdRO44u0r5MzSrikt42XSCgvrG+wtDrBIBIP02E2ceHgj2Ryg8wszeiY8W6jWo0HqNoPwd4fXTz0sFezM8GSG/PDh3lrhuKczuqoRYPMdac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672121; c=relaxed/simple;
	bh=U5N99pSeLajzDDGN7pkmqfhQpRr+EX4p8ltQRS53UJk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=E4yAVT8RKgvq8VQKHEYRHvw+bolyXLmYIdYgUxol3A66Je7ChjkurqYRxNTT0F4B2QoYQdQkNzAQ+XNGDGKWRy88WYCRxS4puLhwD4pIAaErpAT6Tk6Cphw+73kudc6L4n2VeAUa8vEA9P6kbrl3XQJz4X7P0W8JBSYpGzhjzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=kH7YfPMM; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=Dzvz+c+dzLUm/IFQK0oBH4SlRuQdV3daA1JqnO+uzSo=; b=kH7YfPMMHwFsvACNOLGGrJkhRI
	4dA9qzMSky2cfc3S9jArSm/rMf3pJmRNTlNX5cpnH0C0yH6nfw071+R+eVtWi6033eIs0sp9od9GV
	AVRSqpTT063AnvTruxMI1GErONeCbNYmsugzZ99MBsEGkzg3Eg7IiQ0CxIWbO5ANbZd0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wAXQp-0000000048M-1iGy;
	Wed, 08 Apr 2026 14:15:16 -0400
Date: Wed, 8 Apr 2026 14:15:15 -0400
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
Message-Id: <20260408141515.fc210b4b3c86f7a61f680dd1@hugovil.com>
In-Reply-To: <TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
	<TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31049-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hugovil.com:dkim,hugovil.com:email,hugovil.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 5E50B3C05BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 8 Apr 2026 17:25:19 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 08 April 2026 17:52
> > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
> > 
> > Hi Biju,
> > 
> > On Wed, 8 Apr 2026 16:35:44 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > 
> > > Hi Hugo,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > > Sent: 08 April 2026 17:31
> > > > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero
> > > > fault
> > > >
> > > > Hi Biju,
> > > >
> > > > On Wed,  8 Apr 2026 15:20:58 +0100
> > > > Biju <biju.das.au@gmail.com> wrote:
> > > >
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > uart_update_timeout() computes a timeout value by dividing by the
> > > > > baud rate. If baud is zero — which can occur when the hardware
> > > > > returns an unsupported or invalid rate — this results in a divide-by-zero fault.
> > > >
> > > > baud is returned by uart_get_baud_rate(), so this is not returned by the hardware?
> > >
> > > You are tight, Will update commit description.
> > 
> > How can uart_get_baud_rate() return a zero value? If I am not mistaken even for the B0 case, it will
> > return 9600?
> 
> As per the comment and code, this API can return 0.
> 
> * If the new baud rate is invalid, try the @old termios setting. If it's still
> * invalid, we try 9600 baud. If that is also invalid 0 is returned.
> 
> In drives/tty currently only 1 driver is checking the return value
> and it calls panic
> 
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/tty/serial/apbuart.c#L214

Hmmm, more than 1:

icom.c:
    if (!baud)
         baud = 9600;    /* B0 transition handled in rs_set_termios */

8250/8250_fintek.c:
    if (!baud)
         goto exit;

> I believe we should call panic, if baud =0, instead of proceeding.
> Geert, any thoughts??

There once was a warning, removed by:

commit 23bf72faaebdf2cb199c0ef8cf96467b10904b35
Author: Max Filippov <jcmvbkbc@gmail.com>
Date:   Tue Oct 10 01:59:22 2023 -0700
    serial: core: tidy invalid baudrate handling in uart_get_baud_rate
    ...
    Clarify that 0 can be (and always could be) returned from the
    uart_get_baud_rate. Don't issue a warning in that case.
    ...

-- 
Hugo Villeneuve

