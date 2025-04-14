Return-Path: <linux-renesas-soc+bounces-15898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55CA87BE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 11:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1710718903A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 09:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A245E25A2BE;
	Mon, 14 Apr 2025 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mg2hKdEf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A31A08A4;
	Mon, 14 Apr 2025 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623145; cv=none; b=htjBTRylZzwKyQ3JosTvgjD1rMtW7Nmd7AvKD+AAg/4Rbbc3LxbFQpY5QQYBJQL/eo0i0GVP5N9EIvTZmAvWEgFmNPzC1i5Q2JU7PHn6WuxqL+CYTnsxmcIdWOxGI1x5LZAp08Z02FrlMd0EUyzMK32mG/coybY/n6qyi/FDbBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623145; c=relaxed/simple;
	bh=T1ricBvu6gD0hNKZi1AiodtjauiUrZN5jT9n8gpVu6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rnsi9qcXs55FH2XLqA5kW7qOvRw0Zo0CSpbrgoZQpPulxkqhxgY2F7/17rOqkOdjCKwVEh2qNLUFPCvAMmokYFlI9x0GKJ6feTbGBRhk+pDamYZS64gsw1a4AVZKmDNXnYCeA1wPZtmR4fd8NgHF0TcV2Sq6RlDaSu7fpIvTHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mg2hKdEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A64EC4CEE2;
	Mon, 14 Apr 2025 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744623144;
	bh=T1ricBvu6gD0hNKZi1AiodtjauiUrZN5jT9n8gpVu6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mg2hKdEfswh1uEbfFKcVkea0o7nleWjJCaWWjuta7AqdhErdkcgIOJatDhCzL9/sg
	 kWBsfxz/cTmtxcgooYxPLuPjzRwAb8jYK360e+nFE1ThCQF541WV9witjuaswcuooi
	 VaHXa0xUAX/WAJTvjwECZIWbjDbzL1FOi4k8Zuf4=
Date: Mon, 14 Apr 2025 11:32:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <2025041458-squint-dean-9999@gregkh>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh>
 <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <2025041456-legacy-craftwork-2d8b@gregkh>
 <eba16d9a-9e07-498f-a7ab-0bb36076de40@linatsea.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eba16d9a-9e07-498f-a7ab-0bb36076de40@linatsea.fr>

On Mon, Apr 14, 2025 at 11:23:34AM +0200, Thierry Bultel wrote:
> 
> 
> Le 14/04/2025 à 10:58, Greg KH a écrit :
> > On Mon, Apr 14, 2025 at 07:54:12AM +0000, Thierry Bultel wrote:
> > > Hi Greg,
> > > 
> > > > -----Original Message-----
> > > > From: Greg KH <gregkh@linuxfoundation.org>
> > > > Sent: vendredi 11 avril 2025 16:57
> > > > To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > > Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> > > > geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Wolfram
> > > > Sang <wsa+renesas@sang-engineering.com>; linux-kernel@vger.kernel.org;
> > > > linux-serial@vger.kernel.org
> > > > Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
> > > > 
> > > > On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> > > > > --- a/include/uapi/linux/serial_core.h
> > > > > +++ b/include/uapi/linux/serial_core.h
> > > > > @@ -231,6 +231,9 @@
> > > > >   /* Sunplus UART */
> > > > >   #define PORT_SUNPLUS	123
> > > > > 
> > > > > +/* SH-SCI */
> > > > > +#define PORT_RSCI	124
> > > > Why do you need to tell userspace about this specific port?  Is that a
> > > > hard requirement that your userspace tools require?  If not, please don't
> > > > export this here.
> > > This point has been discussed with Geert and Wolfram.
> > > We cannot use PORT_GENERIC for this IP, and adding the new type
> > > is just keeping consistent with the sh-sci driver.
> > But, why does userspace need to know this number?  And why doesn't
> > PORT_GENERIC work?
> 
> The reason is that the sh-sci driver discriminates internally between port
> types.
> There are number of locations when it checks for PORT_SCI, PORT_SCIF,
> PORT_SCIFA...

That is internal to the kernel, not external, right?

> T2H SCI needs special handling, too, that is the reason why PORT_GENERIC
> cannot work. I just therefore added this new type.

Again, why does userspace need to know this?

thanks,

greg k-h

