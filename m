Return-Path: <linux-renesas-soc+bounces-31508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CESoFfDV6GklQQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 16:06:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC354470D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 16:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4696E3017245
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE683ECBDA;
	Wed, 22 Apr 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="J1bOutV3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599AA3ECBF1;
	Wed, 22 Apr 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776866750; cv=none; b=hpwfmTJ4+V+bRgqXOSq52KsUNeJNzo+XyamZBAQrtA+sRtv6neVMAWgp3pYRufxs0CyPp2XIMoH4F5XvbCqD/o2ko5+dde6Nj192t3liXJrV+C03+8vo/9MuAgHW6mF1tnv8LyhyeUhnDW2nf+djDeIeaN9qR9ThuOIXug3LlY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776866750; c=relaxed/simple;
	bh=f1Ng/d4WwlQshVPNa+sETuoIN+hph/4UdqXt+9JEC6w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=f1cqAkXnXNVJus8uJ9zYwXcmE7fG6StcyOy5GvqIf3EGNc8KPlKBB9SFjqT0gYIxFeQIwb6znz7TYm2kfnL8dFfiJsjbGc8wM8t9givLb3bpYorGv98qLUMtrMzqNJDo5JzYrB4nzYxWmNl/QdgcmrLEvrSxJbiU/p1O9gAtbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=J1bOutV3; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=KoyBoEZdYxOPiuUGWPWbQWQkDn08BLM63DVYlkrR4vM=; b=J1bOutV3pJULB7hdV7Kmv4XwZ5
	AHk1eDXhfXPqHf9OicNi2y3L3XumKu92iWlWG15vg6s4DPP1JIIgDbdvhLFU/X9pv32lAR/DovENj
	WZb0eyyhJ/m9+OBQex0enPuYulbufJaSPH1UwyJ92nskZVXoi0b4r9PGNHNWxSQCfxL0=;
Received: from [70.80.174.168] (helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wFYCx-000000000dH-0aYu;
	Wed, 22 Apr 2026 10:05:39 -0400
Date: Wed, 22 Apr 2026 10:05:38 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate
 from uart_get_baud_rate()
Message-Id: <20260422100538.25c6a279ec46defecd8d9a4f@hugovil.com>
In-Reply-To: <CAMuHMdUfGY6VwW09zQX8T3_JkRHwKGRUyNGRXvQaD4e58OV8qA@mail.gmail.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
	<20260420140426.237865-3-biju.das.jz@bp.renesas.com>
	<CAMuHMdXQi7eSZg71=01dYjpmgHRXS+L9hXZMN_dR-mtM6sLKNw@mail.gmail.com>
	<TY3PR01MB113464AE43A23A0B69BCC5675862D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	<CAMuHMdUfGY6VwW09zQX8T3_JkRHwKGRUyNGRXvQaD4e58OV8qA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31508-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hugovil.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hugovil.com:dkim,hugovil.com:mid,renesas.com:email,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFC354470D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, 22 Apr 2026 10:59:23 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Biju,
> 
> On Wed, 22 Apr 2026 at 09:26, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Mon, 20 Apr 2026 at 16:04, Biju <biju.das.au@gmail.com> wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > On DT systems, a zero baud rate from uart_get_baud_rate() is not

The fact that uart_get_baud_rate() cannot return zero is not related
to the system using DT or not, so I would drop this "On DT systems, "
from the commit message.

> > > > possible even earlycon derives its bit rate from chosen/stdout-path.
> > > > The zero baud guard and its associated done label are therefore dead code. So remove it.
> > > >
> > > > Also drop the unused done label from rsci_set_termios().
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > --- a/drivers/tty/serial/sh-sci.c
> > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > @@ -2719,8 +2719,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
> > > >                 max_freq = max(max_freq, s->clk_rates[i]);
> > > >
> > > >         baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
> > > > -       if (!baud)
> > > > -               goto done;
> > > >
> > > >         /*
> > > >          * There can be multiple sources for the sampling clock.  Find
> > > > the one
> > >
> > > I am afraid you are missing that sh-sci is also used on SH, without DT?
> >
> > Ok, please share your thoughts to handle divide_by_zero fault for
> > SH platforms on the code path after done label??
> 
> Someone has to check on an SH platform (or qemu rts7751r2d) if
> this can happen. It might have been broken along the road, as people
> only use earlyprintk when debugging a problem that requires it.

Geert: this "goto done" is not related to the earlyprintk block, which
is untouched by this patch?

-- 
Hugo Villeneuve

