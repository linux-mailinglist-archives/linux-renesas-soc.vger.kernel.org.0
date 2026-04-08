Return-Path: <linux-renesas-soc+bounces-31042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCDIEPOG1mmwFwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:48:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926A3BF11A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B114300AC3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E2B386C13;
	Wed,  8 Apr 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="gsyyC4sr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1908462;
	Wed,  8 Apr 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666927; cv=none; b=NUfCO2t4wZ6SPMafMQDkwDMXT9wdhvy+2z1uoLYP8PonH3g9mIYpEbWFggHCtqe4dlB2H1wWS7p9jKRZdNIMClCTXMGTh+7XIU2205kYwaqQ3GJsEFOn0+R0qYvPloN850cZ2G7gNTr/0yg+K3jQbDtdrdkjITgPScrWEntO/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666927; c=relaxed/simple;
	bh=rMQcw+5cwLK7n2JQpQDIpU7CRDhaFaOs/4LZkx5KXlU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NC2+eUnB9Xug+LJeqk/KXOJDHeQTYNJ6CmLWXjI/AgeawIJed+I/uZ45V3qFC8o4kfpWpWsM2S903xcRrf4W36vjr0zBzsoxFCjUTdpb2IrZ70SHBiEY+fD+VmVw+nh/oN3AtkwZAgAKqhoc4usA4yjp8dpSoc3/uAxGbzdvdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=gsyyC4sr; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=Q4fyU3vJZUdxo6+Ksii25ECZuhHpi4HPHpwV0nulV3U=; b=gsyyC4srQ3Mpn/Lh/2+QdAnuwM
	GzYx+LcdXOLBnVLrLOXT0aswEfBS7Fe0JmPdJ4tVpQ19YZAzKRixF59xRIofgmcnBnj79Mef9n+TC
	B24MGj6yPqDj2GejxXWIa22NwAQYWNW1OYid0FTBaQQqTmOBdooYtRk/ryv2ps9Mk/8o=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wAVnc-0000000009r-0Cqp;
	Wed, 08 Apr 2026 12:30:41 -0400
Date: Wed, 8 Apr 2026 12:30:39 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Message-Id: <20260408123039.922a75327fd7672df3bd61da@hugovil.com>
In-Reply-To: <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31042-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hugovil.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hugovil.com:dkim,hugovil.com:mid]
X-Rspamd-Queue-Id: 7926A3BF11A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed,  8 Apr 2026 15:20:58 +0100
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> uart_update_timeout() computes a timeout value by dividing by the baud
> rate. If baud is zero — which can occur when the hardware returns an
> unsupported or invalid rate — this results in a divide-by-zero fault.

baud is returned by uart_get_baud_rate(), so this is not returned
by the hardware?


> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Missing Fixes tag?


> ---
> v2:
>  * New patch
> ---
>  drivers/tty/serial/rsci.c   | 3 ++-
>  drivers/tty/serial/sh-sci.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
> index b00c9e385169..a0858bab0822 100644
> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -286,7 +286,8 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>  	sci_port_enable(s);
>  	uart_port_lock_irqsave(port, &flags);
>  
> -	uart_update_timeout(port, termios->c_cflag, baud);
> +	if (baud)
> +		uart_update_timeout(port, termios->c_cflag, baud);
>  
>  	rsci_serial_out(port, CCR0, ccr0_val);
>  
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 6c819b6b2425..429e89106ee3 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2805,7 +2805,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>  
>  	sci_reset(port);
>  
> -	uart_update_timeout(port, termios->c_cflag, baud);
> +	if (baud)
> +		uart_update_timeout(port, termios->c_cflag, baud);

After this patch, have you re-tested if having baud = 0 produces any
other errors? A litle bit later in the same function, there is this
code:

    /* Calculate delay for 2 DMA buffers (4 FIFO). */
    s->rx_frame = (10000 * bits) / (baud / 100);

Does this trigger a division by zero fault?

There is also this:

	if ((srr + 1 == 5) &&
	    (s->type == PORT_SCIFA || s->type == PORT_SCIFB)) {
            ...
		udelay(DIV_ROUND_UP(10 * 1000000, baud));

Can this also trigger a division by zero fault?


>  
>  	/* byte size and parity */
>  	bits = tty_get_frame_size(termios->c_cflag);
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve

