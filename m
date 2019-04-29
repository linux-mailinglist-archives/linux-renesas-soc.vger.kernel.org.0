Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06D9DEA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfD2JGb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:06:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbfD2JGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:06:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5605720673;
        Mon, 29 Apr 2019 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556528789;
        bh=2DoERtex72gITa+joeCTe5vnBu5Qj/LMYKvp2UDvKAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Yz74e4wEoC1m34GmNxOveFdY/SHeDfX7Wv40DMptQ0i6RU1MXQD1CC9c+lZNNkZW
         LiotrF8s82E2KZ+Wpnlu7vJW7spPf9En7sl3LjDcwK8XfHC8csDoH/QIMBbXY5R3pH
         +m1e8gAlaxnBV8XRic9G25t6TfedD3bKICHS1nRM=
Date:   Mon, 29 Apr 2019 11:06:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Message-ID: <20190429090627.GA10302@kroah.com>
References: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190301161624.GA19937@kroah.com>
 <TYXPR01MB17756DBAF2FD7A1F2A9B82B0C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770DB45DCD263C6933B9210C0230@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190427125606.GA25493@kroah.com>
 <TY1PR01MB177019CA89AC165803270945C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177019CA89AC165803270945C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 08:53:00AM +0000, Fabrizio Castro wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: 27 April 2019 13:56
> > Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
> > 
> > On Tue, Apr 23, 2019 at 03:32:59PM +0000, Fabrizio Castro wrote:
> > > Hello Simon,
> > >
> > > I know you don't normally take this type of patches, but this one has
> > > been around for more than 4 months now, and I am losing hope here...
> > >
> > > Do you think you can this patch?
> > 
> > I think this got dropped somehow, sorry about that.
> > 
> > Can you resend it, with the acks that have been given to it, and I will
> > be glad to queue it up.
> 
> Thank you Greg, I have sent it now.

Now queued up, sorry about the delay.

greg k-h
