Return-Path: <linux-renesas-soc+bounces-15896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEAA87B29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 10:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C926C17236E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 08:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD3825DAFC;
	Mon, 14 Apr 2025 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WW2mgQtK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A1029D19;
	Mon, 14 Apr 2025 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621114; cv=none; b=KaMWNJ0uCQ44dARcoVV6Wjc/pn+VroIKTy3wvwL7LIGgswVGeDT0KVDEYh/OTdeYz6/Usp7ri2ELUixGTHMNuz6llkI/XBqKm9GzKge8rxXsFsy4oIVkI3fg9VXFGO2FIqKOkFZqLSM5cFRvQG1gM2iFbqnFWJU70aps3TIGLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621114; c=relaxed/simple;
	bh=cDCg7kZe9XYJRnj5EtD58kfDWWU0IFD44ydOOCFeVBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4qZ3h+DJuI5Rn4cMLnYTVWXc7w75c+2lP1/MgRukeyobuOupx+VJYrxTSeJTeQjS/ZzrAG9f0BXAq3DhazLlTwoqGYPk8dGbGAly+z0XKDY/h23SkLMWsoKAheI7p1aWx7d+/aqdoEPdhJfbDi7VE7vAgGeiVK0cK8zJKnZRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WW2mgQtK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACEFC4CEE2;
	Mon, 14 Apr 2025 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744621113;
	bh=cDCg7kZe9XYJRnj5EtD58kfDWWU0IFD44ydOOCFeVBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WW2mgQtKJFst6/rbJhHuohhNDCSEOuBE4hUAGyMLos4Qm2f12/6ovmU9ScQdvO8hP
	 tKZY6w0qaLg/xNO3LWuT9YYRq81e4CsQbA7ZEAj6JOpCZ4C/eqyan7ux46OLCu+OR7
	 sA6nhYjBHDJo2UGYpHw2PtOgxwmoGbdkEcctrViY=
Date: Mon, 14 Apr 2025 10:58:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <2025041456-legacy-craftwork-2d8b@gregkh>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh>
 <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>

On Mon, Apr 14, 2025 at 07:54:12AM +0000, Thierry Bultel wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: vendredi 11 avril 2025 16:57
> > To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> > geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Wolfram
> > Sang <wsa+renesas@sang-engineering.com>; linux-kernel@vger.kernel.org;
> > linux-serial@vger.kernel.org
> > Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
> > 
> > On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> > > --- a/include/uapi/linux/serial_core.h
> > > +++ b/include/uapi/linux/serial_core.h
> > > @@ -231,6 +231,9 @@
> > >  /* Sunplus UART */
> > >  #define PORT_SUNPLUS	123
> > >
> > > +/* SH-SCI */
> > > +#define PORT_RSCI	124
> > 
> > Why do you need to tell userspace about this specific port?  Is that a
> > hard requirement that your userspace tools require?  If not, please don't
> > export this here.
> 
> This point has been discussed with Geert and Wolfram.
> We cannot use PORT_GENERIC for this IP, and adding the new type
> is just keeping consistent with the sh-sci driver.

But, why does userspace need to know this number?  And why doesn't
PORT_GENERIC work?

thanks,

greg k-h

