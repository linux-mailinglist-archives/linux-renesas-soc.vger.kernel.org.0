Return-Path: <linux-renesas-soc+bounces-11621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DF9F8F05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7959318972F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18111BD9C1;
	Fri, 20 Dec 2024 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GYQ2+DvP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E31BD004;
	Fri, 20 Dec 2024 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687121; cv=none; b=j5KWITf7+Xyy2rSaQKHew6zum0/bRBrArVaiv8LWG7VuDcSjkzaGABOy4oPA2RZMa3ocRS/scazPLlxkbDICsiZ72dTWUFlRy+LxpHtLnm9jUsoMNgGEBD6ELXDa869zYIqcY81aT+TAqHWL49+6OoVvkPYkMoaB0RfFqUQ+/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687121; c=relaxed/simple;
	bh=yPM/LW+bfWvt1MyA1G9gHVOrAHzvtZWm4cfm+QkEuBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPw/cqTj1i+iz1qc50qiRnSoAmDu9svn6jhJHNhqDvUn+lPD6nUkXtt7CfH7UEDxmxD0YdqWAVS6wegUdgFpyCspou09VRz97c4AtG18MzEyYQaWdgLYRVq1A2BRv4ozqiwcoR98KvzaM+GDHC1n0cr2LcxT8BhxwChr3LNIFLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GYQ2+DvP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j7xmBAzEXQnknelxXqChfysQESiy2Y/n5d30YkxfEyA=; b=GYQ2+DvPrPp8l/1Hn10bbrbZwd
	Wib8faxYtamL+1dvd/5aqZjYClnZWU0GeuziU1W3FpwRneEifLsZAOqvTG8WEu7l4GkGm6V7+KnBU
	t0NPbMgk807MkDjumlKfXkbTTvVQgBjjAX7Z4AB9hx6Ktj08bQZjNtELQe5ptoY3Rn1I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOZMN-001wKq-Fc; Fri, 20 Dec 2024 10:31:51 +0100
Date: Fri, 20 Dec 2024 10:31:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Message-ID: <7c8c1baf-f398-4439-b974-b7d1425942b1@lunn.ch>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
 <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
 <7b009b7f-0406-4dc1-80b3-79927d6143f0@cogentembedded.com>
 <TYCPR01MB1104022CD76BDE941D1C22536D8072@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <01c3755a-d57c-4da8-9505-551663a694c7@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c3755a-d57c-4da8-9505-551663a694c7@cogentembedded.com>

On Fri, Dec 20, 2024 at 02:23:31PM +0500, Nikita Yushchenko wrote:
> > > > Sorry, but I can't find where this property is documented?
> > > 
> > > I will add this.
> > 
> > Device tree properties should be a hardware description. However,
> > about the "irq-index", it seems a software configuration. So, even if we would
> > like to submit such a patch to add the property, it will be rejected.
> 
> Hmm...
> 
> Indeed it is a software configuration.
> 
> I was not aware of such a rule.
> 
> I believe there shall be plenty of situations when a per-hardware-node
> software configuration is desired. What method do other use, if not device
> tree?
> 
> > Also, even if we can add a new device tree property, we should keep backward compatible.
> > However, this patch seems to break a backward compatibility.
> 
> It does not.
> If this new property is not defined, then it will default to 0, which will
> result exactly into previous behavior.

This is where the DT binding patch would of been useful, because you
would of stated that in the binding...

Backwards compatibility is something reviewers always look for, so it
is good to make it obvious that it has been considered.

Even if it is backwards compatible, lets see if we can think of a way
to not require the property. Maybe you can explain the hardware in
more details, and what you are trying to achieve.

	Andrew

