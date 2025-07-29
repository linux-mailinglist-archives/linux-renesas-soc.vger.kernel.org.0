Return-Path: <linux-renesas-soc+bounces-19727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE78B14995
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 09:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739101642E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 07:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62234269AFB;
	Tue, 29 Jul 2025 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oufB7XRO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C0D261573;
	Tue, 29 Jul 2025 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775745; cv=none; b=OvYe76m3HrOnDJByKcJ4FBc1by4gePKZ/dkPJkg6VsclYF6vcqOSrlO+J98YQG6Vm+wUjEz//Ma5Ipug79x1q5x7YXGap5logLJy2R/yHRd4U4hcYcBgU4Rd1h2DLCLwvCVz82Q/C9oh3ONzrpkNdZpBzrq0cclw0Q+m9Jpq53c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775745; c=relaxed/simple;
	bh=o/NBOQiS8XDe1sfH7OYpjbTZhzQLeRg1YZte/uRqo7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQocKcndSq1zm1ch2usgxsz13vLbBIEA/fgw4mR83Vg0ACdt2+sQE/8aT0fMWbtkSpz+VjVM6PGdBOD9m5ZLdgPHoz9d3gr8nkQBUtPUn6/XHWOarzdrcpfHeXDstbLLoBU/xrX0/miZCPqtsvZfY+SGsGQJsUBDVnC/J7WKKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oufB7XRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227E1C4CEF5;
	Tue, 29 Jul 2025 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753775744;
	bh=o/NBOQiS8XDe1sfH7OYpjbTZhzQLeRg1YZte/uRqo7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oufB7XRO69I73yphTRJFKUEvs5aF8eDymClrT4Tv5uONmTlDnxB6EPEQddYlOefIL
	 WJqP/cZw3A4DkYQgAbCIg0lAoMUGdkDlsQYtbIXCFlHysNc4yF9rbu5z5sYgC2FvQf
	 mFn9tw/qGBZge7NNHw0PeS/EK8RyU2yMllW4jzDQ=
Date: Tue, 29 Jul 2025 09:55:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Vinod Koul <vkoul@kernel.org>, stable@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
Message-ID: <2025072932-shale-morale-10af@gregkh>
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
 <2025072828-suspect-work-12ca@gregkh>
 <b9c9ba83-6da2-4295-b058-a0520c9df806@mailbox.org>
 <2025072931-bagful-jelly-ffa7@gregkh>
 <CAMuHMdWJQ2iUwNvH+APo0tFtbWfvoBvtFeH7Njej9sANMKtzZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJQ2iUwNvH+APo0tFtbWfvoBvtFeH7Njej9sANMKtzZw@mail.gmail.com>

On Tue, Jul 29, 2025 at 09:11:46AM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Tue, 29 Jul 2025 at 07:03, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jul 29, 2025 at 05:09:55AM +0200, Marek Vasut wrote:
> > > On 7/28/25 6:18 AM, Greg Kroah-Hartman wrote:
> > >
> > > [...]
> > >
> > > > > Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > > ---
> > > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Cc: Mathias Nyman <mathias.nyman@intel.com>
> > > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > > Cc: <stable@vger.kernel.org>
> > >
> > > [...]
> > >
> > > > - You have marked a patch with a "Fixes:" tag for a commit that is in an
> > > >    older released kernel, yet you do not have a cc: stable line in the
> > > >    signed-off-by area at all, which means that the patch will not be
> > > >    applied to any older kernel releases.  To properly fix this, please
> > > >    follow the documented rules in the
> > > >    Documentation/process/stable-kernel-rules.rst file for how to resolve
> > > >    this.
> > >
> > > Maybe the bot should take into consideration Cc: stable below the --- too ?
> > > Or is that considered invalid ?
> >
> > That is totally invalid, it gets cut off when the patch is applied and
> > then is lost :(
> 
> But the "Fix" keyword in the oneline-summary and the "Fixes" tag are
> not, so your stable minions will still take it ;-)

{sigh}

No, please NEVER rely on that.  Grabbing "Fixes:" only patches are a
"best effort" thing that we do that is not reliable at all, AND you
never get a FAILED notification if something does not actually apply
properly.

The documentation clearly states how to mark something for the stable
tree, and that is NOT by only haveing a "Fixes:" tag in the commit.

thanks,

greg k-h

