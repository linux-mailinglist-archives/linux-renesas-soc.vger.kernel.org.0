Return-Path: <linux-renesas-soc+bounces-23962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B359C2596E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 15:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668751A21C2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 14:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5403A34BA2B;
	Fri, 31 Oct 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="Qq9sD7TS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4CC3446C4;
	Fri, 31 Oct 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921269; cv=none; b=FDyQ4NMLokBZkeRhKYLQ+P/Pb7Tar16HAZuad0/DaJGdqZNyLlq/EGRNub9jwoKi4WARwy7O0J9CY9bH+DV6aIJ1ElW0kJvN3heKk4LoaPvvBDifZExK55sPF5tJLEt4aWm0cQuPwUncgbF8Wa+I4OJU9GtVaCwWe91Bos+45AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921269; c=relaxed/simple;
	bh=fUtT4yyaxPZDIJm+CMf9XzeSHwaBFvBHzs3q09vOeow=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=NwdnlQ9WEwqUPoqq4Asq8sOhFyzmwxsdFCdXLRx6WpklFMKN1bGeUSoZRqSkW5DYKmUO0vqMWeFKXLQxD364XtVOhZefbXNha28MnS6XkmeSvNsSL2ZyEb3YBx3CqapH+XFSXjzhr3uGaa4GxWp2CZ4U5Ln++W1rXx0NbRrxuq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=Qq9sD7TS; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=mZR9Pq04nskBCnZfHR64uH8c7tW1FVjIhdfQXoh36wA=; b=Qq9sD7TScjYoYu+npw7XmZcDcg
	1oUcBaaanP3cn8MCTFkHxj6n24qb6dY4XI8aISeJxnDmOleBgtsUAZNHoeessS8uU7tvkMBnLbUyt
	gyOTV2rIDFkU/ytgqCjXsCkqtEKk1FvyYpf4rcSn3hMKOBKLp4pPqm4AxxwQ4SHuMm3w=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:53038 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vEqCr-00059X-9u; Fri, 31 Oct 2025 10:34:22 -0400
Date: Fri, 31 Oct 2025 10:34:20 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Message-Id: <20251031103420.e02c11d51e6f8e8871d22b96@hugovil.com>
In-Reply-To: <TY3PR01MB11346985328E37A14287CB3B986F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
	<20251030175811.607137-4-biju.das.jz@bp.renesas.com>
	<20251030162155.d08e9d6fd3100092be2ade80@hugovil.com>
	<TY3PR01MB1134686842EA2A6EF864E1ABD86F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
	<TY3PR01MB11346985328E37A14287CB3B986F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.4 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Fri, 31 Oct 2025 07:08:24 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> 
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: 31 October 2025 07:07
> > To: 'Hugo Villeneuve' <hugo@hugovil.com>; biju.das.au <biju.das.au@gmail.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby <jirislaby@kernel.org>; wsa+renesas
> > <wsa+renesas@sang-engineering.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> > Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org; linux-
> > serial@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> > Subject: RE: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
> > 
> > Hi Hugo,
> > 
> > > -----Original Message-----
> > > From: Hugo Villeneuve <hugo@hugovil.com>
> > > Sent: 30 October 2025 20:22
> > > Subject: Re: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
> > >
> > > Hi Biju,
> > >
> > > On Thu, 30 Oct 2025 17:57:51 +0000
> > > Biju <biju.das.au@gmail.com> wrote:
> > >
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Shorten the number lines in sci_init_clocks() by fitting the error
> > > > messages within an 100-character length limit.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > v1->v2:
> > > >  * Updated commit message 80-character->100-character.
> > > >  * Increased line limit for error messages to 100-column limit.
> > > > ---
> > > >  drivers/tty/serial/sh-sci.c | 13 ++++---------
> > > >  1 file changed, 4 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/tty/serial/sh-sci.c
> > > > b/drivers/tty/serial/sh-sci.c index b33894d0273b..e9345f898224
> > > > 100644
> > > > --- a/drivers/tty/serial/sh-sci.c
> > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > @@ -3008,11 +3008,8 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
> > > >  			return PTR_ERR(clk);
> > > >
> > > >  		if (!clk && sci_port->type == SCI_PORT_RSCI &&
> > > > -		    (i == SCI_FCK || i == SCI_BRG_INT)) {
> > > > -			return dev_err_probe(dev, -ENODEV,
> > > > -					     "failed to get %s\n",
> > > > -					     name);
> > > > -		}
> > > > +		    (i == SCI_FCK || i == SCI_BRG_INT))
> > > > +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
> > > >
> > > >  		if (!clk && i == SCI_FCK) {
> > > >  			/*
> > > > @@ -3022,16 +3019,14 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
> > > >  			 */
> > > >  			clk = devm_clk_get(dev, "peripheral_clk");
> > > >  			if (IS_ERR(clk))
> > > > -				return dev_err_probe(dev, PTR_ERR(clk),
> > > > -						     "failed to get %s\n",
> > > > +				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n",
> > > >  						     name);
> > >
> > > This one can also be on one line (99 characters).
> > 
> > It is 101 characters.
> 
> Sorry, 100 Characters. Let me run checkpatch to see, it generates warning.

Hi Biju,
I already did before replying, it was fine.

Hugo.

