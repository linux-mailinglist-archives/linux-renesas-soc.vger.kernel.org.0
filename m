Return-Path: <linux-renesas-soc+bounces-15998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3CA89E3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 075333BF57C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15881294A1F;
	Tue, 15 Apr 2025 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cqI9iCbJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47E610B;
	Tue, 15 Apr 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720514; cv=none; b=ji/R4CuN3uqVcrFvxK9LWlNMwnWfRbKRQSKQDyDK9x0p0CQEaM3Z6fsy2GGqGaUocyTnS9pXK5/ESVXwBC+BiLbIhUwatMS85v3roHUMf9uf6ZeKatvzXJ5NxUh1Jt8OOrKkeKu4kizP0FQuume4sF3erEJRRABpYtlxSQmz9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720514; c=relaxed/simple;
	bh=2+VnzMSsmMahtUzM9CIm6OiwR6PEG7xIrg6sW8qWgKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McfJrwxqyVDWaAjTFj4opnORRiIdYU5ZkUzwnGV5MOodhrgxiGcvN2VT3m0HZPq7MMX1lIZwd9lU4/7jpyeSCW66He0tPpPJaOwcmuqsuBBnHX5RtBpNuMeJ3eAoxI8mxIKcOaZ5pUbLIvYBARTX0iEisI6UTnKiz9Sk56+WL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cqI9iCbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A1CC4CEDD;
	Tue, 15 Apr 2025 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744720513;
	bh=2+VnzMSsmMahtUzM9CIm6OiwR6PEG7xIrg6sW8qWgKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqI9iCbJNwysw7TG2w9fKMS5tplTiaZwa3rc05oVpPbS5t9KYL5fQsFJ45wKY58Ea
	 Wh6IMyZYAF8aM8Pl7M6Ovx9j4cdGaz7gMq/e9cpB92HzHMXytnTn83vZYZZQfuKKKz
	 ZZb+g7EjSKHzyiQXNnGX4xmfIKDni/gsrH2lE+7Q=
Date: Tue, 15 Apr 2025 14:35:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <2025041535-devouring-drove-e173@gregkh>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh>
 <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <2025041456-legacy-craftwork-2d8b@gregkh>
 <eba16d9a-9e07-498f-a7ab-0bb36076de40@linatsea.fr>
 <2025041458-squint-dean-9999@gregkh>
 <CAMuHMdV=1Hoo4b8jmKV2sE0VG2E4g=EUus_gfE8hdMvLag1pew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV=1Hoo4b8jmKV2sE0VG2E4g=EUus_gfE8hdMvLag1pew@mail.gmail.com>

On Mon, Apr 14, 2025 at 04:07:23PM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Mon, 14 Apr 2025 at 11:32, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Mon, Apr 14, 2025 at 11:23:34AM +0200, Thierry Bultel wrote:
> > > Le 14/04/2025 à 10:58, Greg KH a écrit :
> > > > On Mon, Apr 14, 2025 at 07:54:12AM +0000, Thierry Bultel wrote:
> > > > > > From: Greg KH <gregkh@linuxfoundation.org>
>  > > > > On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> > > > > > > --- a/include/uapi/linux/serial_core.h
> > > > > > > +++ b/include/uapi/linux/serial_core.h
> > > > > > > @@ -231,6 +231,9 @@
> > > > > > >   /* Sunplus UART */
> > > > > > >   #define PORT_SUNPLUS        123
> > > > > > >
> > > > > > > +/* SH-SCI */
> > > > > > > +#define PORT_RSCI    124
> > > > > > Why do you need to tell userspace about this specific port?  Is that a
> > > > > > hard requirement that your userspace tools require?  If not, please don't
> > > > > > export this here.
> > > > > This point has been discussed with Geert and Wolfram.
> > > > > We cannot use PORT_GENERIC for this IP, and adding the new type
> > > > > is just keeping consistent with the sh-sci driver.
> > > > But, why does userspace need to know this number?  And why doesn't
> > > > PORT_GENERIC work?
> > >
> > > The reason is that the sh-sci driver discriminates internally between port
> > > types.
> > > There are number of locations when it checks for PORT_SCI, PORT_SCIF,
> > > PORT_SCIFA...
> >
> > That is internal to the kernel, not external, right?
> 
> Indeed.
> 
> > > T2H SCI needs special handling, too, that is the reason why PORT_GENERIC
> > > cannot work. I just therefore added this new type.
> >
> > Again, why does userspace need to know this?
> 
> I guess userspace does not need to know about this (does userspace
> actually care about any of these values, except for PORT_8250 and
> friends?).
> 
> However, traditionally PORT_* has been used as the differentiator
> for serial port types in most drivers in the kernel (incl. sh-sci.c)
> as well.  Just two drivers use PORT_GENERIC, and these are the ones
> that came with the introduction of PORT_GENERIC.  Since the rsci driver
> is not a new driver, but a sub-driver of the existing sh-sci driver,
> I think it warrants keeping on using the type field, like before. Else
> it will have to become even more complex than it already is.
> 
> Note I am fine with using a non-uapi value. Is there a PORT_* number
> range meant for internal (non-uapi) use?

We can just start putting them in a non-uapi file so that we don't have
to keep adding things to userspace that never needs it.

thanks,

greg k-h

