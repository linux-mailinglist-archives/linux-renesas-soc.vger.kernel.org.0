Return-Path: <linux-renesas-soc+bounces-12967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C8A2E3B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 06:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E90165393
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 05:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB16E188906;
	Mon, 10 Feb 2025 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MxGko+tI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1214885B;
	Mon, 10 Feb 2025 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165829; cv=none; b=IzNbHbScJu7/FIDokiK8fV4FU2Po4AeL/LDcW1eFegUtKQzAjwcTeNza9G+0hxR/5LIw8JDC/kjZewdk8WjJhVB8ezlkkMWmEOdevIP+RLT/DQtC4ptXASfBnTchf0XrhdBgMBaSZ/TBL4eZ5b0p118ANPGZcCXQJpb9I+fqi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165829; c=relaxed/simple;
	bh=DtC2gku+n7uFp3rwtALBT1ZRRXnyZ/Hx/EryPEjObV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK5Doc9cFEzE/E7kWcYmZhW27yaRblJ2flhv5JUQD5pquUesWaaNm54o6RsEItSb3cx+eLVLX/toIAkjV9Oe34q7umF3PHGcex/B5KHhuS/MMEJL0K8QFnbNkGKlo1cn0CkkRuK7SH0OzoG141Omme7xqBWinFngsrpf4lgtkZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MxGko+tI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA7AC4CED1;
	Mon, 10 Feb 2025 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739165829;
	bh=DtC2gku+n7uFp3rwtALBT1ZRRXnyZ/Hx/EryPEjObV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxGko+tIzkp6kuF2sQssWr4FuD35wjoEjtWP4bLvOMUlWzVgf04fQh45vyYAhAgYQ
	 859mr36xcyY00dVQZHnfeJ8kFb02u35rpbCriYh1Id7oZZzDbMUNgWKoZOP8Nmoe8O
	 WNpwvjTVPBr6QrMDKtuELuTsdScCnuce500J1YrM=
Date: Mon, 10 Feb 2025 06:37:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-usb@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Oliver Neukum <oneukum@suse.com>, linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode
 quirk
Message-ID: <2025021043-imply-blissful-b352@gregkh>
References: <20250209145708.106914-1-marek.vasut+renesas@mailbox.org>
 <2025020939-mammary-prevalent-df29@gregkh>
 <e10ad19a-af26-4aff-9f49-5706946f735e@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e10ad19a-af26-4aff-9f49-5706946f735e@mailbox.org>

On Sun, Feb 09, 2025 at 07:10:47PM +0100, Marek Vasut wrote:
> On 2/9/25 4:44 PM, Greg Kroah-Hartman wrote:
> > On Sun, Feb 09, 2025 at 03:56:11PM +0100, Marek Vasut wrote:
> > > Add Renesas R-Car D3 USB Download mode quirk and update comments
> > > on all the other Renesas R-Car USB Download mode quirks to discern
> > > them from each other. This follows R-Car Series, 3rd Generation
> > > reference manual Rev.2.00 chapter 19.2.8 USB download mode .
> > > 
> > > Fixes: 6d853c9e4104 ("usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode")
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Chris Brandt <chris.brandt@renesas.com>
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Oliver Neukum <oneukum@suse.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Cc: linux-usb@vger.kernel.org
> > > Cc: stable@vger.kernel.org
> 
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> [...]
> 
> > You are receiving this message because of the following common error(s)
> > as indicated below:
> > 
> > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> >    older released kernel, yet you do not have a cc: stable line in the
> >    signed-off-by area at all, which means that the patch will not be
> >    applied to any older kernel releases.  To properly fix this, please
> >    follow the documented rules in the
> >    Documentation/process/stable-kernel-rules.rst file for how to resolve
> >    this.
> 
> Cc: stable is right there, below --- so it wouldn't become part of the
> commit message when the patch is applied. Is that OK too ?

No that is not, it needs to become part of the commit message, as per
the kernel documentation.

thanks,

greg k-h

