Return-Path: <linux-renesas-soc+bounces-31043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL/xJKmH1mmwFwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:51:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81B3BF1B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F342B3002F74
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027E53B3C11;
	Wed,  8 Apr 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="KaKnbsB5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A829B67E;
	Wed,  8 Apr 2026 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667108; cv=none; b=thkZkTimmJom0KUbjevWF79FOPMzOWoHVWMf/24QOcc0OooXJTTTj7+7zDnPZkLWiC/UizDdBpIUy5qvhKujr106b2MCiZJW2Vzupq4N6LegkOjI3pHfEGsbcfX5IJKhdW5+PwDn402pDE8I8eAFubsDxNVeeQtHlvTuCHwXioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667108; c=relaxed/simple;
	bh=ret9EVLILv0Dg0RY57swm6/HDrEeY+PJKd4omdvuU2M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SatOf9t5dDsKQl/BDrYelEYxtL9wDOSQpgv3epjPkzVjE/+fULzT80E7vfBbo3XuhsWHVCgEN/dpybb93BrnjZgqpbIYWi9XfF+1BOjwB81LXNApw0bHlYTEGjyTUqwkbE0Ge43WgbfUrQcWIVMlh7zfwU/zM599Y7AzxQNajHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=KaKnbsB5; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=5ny48/qY5i49r0IS1ljnHNGrZ3V6YE7/kuovlo0QNkE=; b=KaKnbsB5zwwqG6PKrH3E+1vvn6
	hhnn8CR/8rddoCf/WIqlyW34ZhqXCtlp0ya1wxF/HZGVN9zFJoQRkwkCRMRDkDpNn/ldsLlH5fh2U
	YOTS6kM5EcgqtZXMMtfNnXt0pQy8VXJZ7vT8Ybd605fzvZqeqruEXJARotIDskorkVkU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wAW7y-000000001ht-2FZ7;
	Wed, 08 Apr 2026 12:51:43 -0400
Date: Wed, 8 Apr 2026 12:51:42 -0400
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
Message-Id: <20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
In-Reply-To: <TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
	<20260408123039.922a75327fd7672df3bd61da@hugovil.com>
	<TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31043-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hugovil.com:dkim,hugovil.com:email,hugovil.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: BD81B3BF1B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 8 Apr 2026 16:35:44 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 08 April 2026 17:31
> > Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
> > 
> > Hi Biju,
> > 
> > On Wed,  8 Apr 2026 15:20:58 +0100
> > Biju <biju.das.au@gmail.com> wrote:
> > 
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > uart_update_timeout() computes a timeout value by dividing by the baud
> > > rate. If baud is zero — which can occur when the hardware returns an
> > > unsupported or invalid rate — this results in a divide-by-zero fault.
> > 
> > baud is returned by uart_get_baud_rate(), so this is not returned by the hardware?
> 
> You are tight, Will update commit description.

How can uart_get_baud_rate() return a zero value? If I am not mistaken
even for the B0 case, it will return 9600?

What are other consequences if a zero value is returned apart
from the division by zero fault? Is it ok (or logical) then to proceed
with the rest of the configuration?

> > 
> > 
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Missing Fixes tag?
> 
> I will split patch into 2 adding Fixes tag.
> 
> > 
> > 
> > > ---
> > > v2:
> > >  * New patch
> > > ---
> > >  drivers/tty/serial/rsci.c   | 3 ++-
> > >  drivers/tty/serial/sh-sci.c | 3 ++-
> > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
> > > index b00c9e385169..a0858bab0822 100644
> > > --- a/drivers/tty/serial/rsci.c
> > > +++ b/drivers/tty/serial/rsci.c
> > > @@ -286,7 +286,8 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
> > >  	sci_port_enable(s);
> > >  	uart_port_lock_irqsave(port, &flags);
> > >
> > > -	uart_update_timeout(port, termios->c_cflag, baud);
> > > +	if (baud)
> > > +		uart_update_timeout(port, termios->c_cflag, baud);
> > >
> > >  	rsci_serial_out(port, CCR0, ccr0_val);
> > >
> > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > > index 6c819b6b2425..429e89106ee3 100644
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -2805,7 +2805,8 @@ static void sci_set_termios(struct uart_port
> > > *port, struct ktermios *termios,
> > >
> > >  	sci_reset(port);
> > >
> > > -	uart_update_timeout(port, termios->c_cflag, baud);
> > > +	if (baud)
> > > +		uart_update_timeout(port, termios->c_cflag, baud);
> > 
> > After this patch, have you re-tested if having baud = 0 produces any other errors? A litle bit later in
> > the same function, there is this
> > code:
> 
> +	/* Avoid divide-by-zero fault in divider operations */
> +	if (!baud)
> +		baud = 100;
> +
> 
> Plan is to update the code with the above change, that will cover
> All divide-by-zero case in this function.

As stated above, does it makes sense to proceed if baud was zero?

> 
> Cheers,
> Biju


-- 
Hugo Villeneuve

