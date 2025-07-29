Return-Path: <linux-renesas-soc+bounces-19724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F9B14761
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 07:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0737162B68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 05:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8893122B8A6;
	Tue, 29 Jul 2025 05:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y74Fw1b3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46487224892;
	Tue, 29 Jul 2025 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753765437; cv=none; b=gWdsnu2iGj8qLaS4Uyu4ldBsRvRxRhfBxmFvw11zfrt4utadGjgvtD792TXdD39g+FXCU2DBS00+Itck4oX3ns24lWANdovTwSVyFAS0jk2MUhcgD1SQfouQF5FjG307YLQzRxiemAk4s/fCEjiEvvN5yN4wT9v2aHHYFPhpNi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753765437; c=relaxed/simple;
	bh=ldiOYfrEY1K2mlcferpJoI9SuVCOruzaKW6L6XY0VUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp/m2M5LlzLcgymH1dP5pSg6A7/0sk6SDHAzkxXH4T3Efw1wg7tU66lGsJgZglXxbt/rNzkoZMuCEzsPj4dEMM58KbywiN+rO5NyXUC/9GgZQaiC0TP2vHk6PbtvIOQJcvziEu5pmM5azaZuvUZlabn0Lj/J6nzHj+Ezm5nGb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y74Fw1b3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A06BC4CEF5;
	Tue, 29 Jul 2025 05:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753765436;
	bh=ldiOYfrEY1K2mlcferpJoI9SuVCOruzaKW6L6XY0VUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y74Fw1b3q7xRilu/IGZrhux1jqVGHKZUOH5XXJeKRYp4Q3YosGmqO9/oyjGA66n0z
	 bh1Ed8h/oafCJ7lDfkVg1SgTJ4C4d6zLjKVdn1R9/lmOydvSb6qeos6IEzmZ0Ep+xR
	 Seu8Gd84o9xW3UgEhF5VVhc8l0Ctk/J/ROpCAmpY=
Date: Tue, 29 Jul 2025 07:03:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Vinod Koul <vkoul@kernel.org>, stable@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
Message-ID: <2025072931-bagful-jelly-ffa7@gregkh>
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <2025072828-suspect-work-12ca@gregkh>
 <b9c9ba83-6da2-4295-b058-a0520c9df806@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9c9ba83-6da2-4295-b058-a0520c9df806@mailbox.org>

On Tue, Jul 29, 2025 at 05:09:55AM +0200, Marek Vasut wrote:
> On 7/28/25 6:18 AM, Greg Kroah-Hartman wrote:
> 
> [...]
> 
> > > Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Mathias Nyman <mathias.nyman@intel.com>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Cc: <stable@vger.kernel.org>
> 
> [...]
> 
> > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> >    older released kernel, yet you do not have a cc: stable line in the
> >    signed-off-by area at all, which means that the patch will not be
> >    applied to any older kernel releases.  To properly fix this, please
> >    follow the documented rules in the
> >    Documentation/process/stable-kernel-rules.rst file for how to resolve
> >    this.
> 
> Maybe the bot should take into consideration Cc: stable below the --- too ?
> Or is that considered invalid ?

That is totally invalid, it gets cut off when the patch is applied and
then is lost :(

