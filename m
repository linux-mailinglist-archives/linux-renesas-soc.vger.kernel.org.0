Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B684AD61A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 11:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390043AbfIIJzr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 05:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729219AbfIIJzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 05:55:47 -0400
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E2062086D;
        Mon,  9 Sep 2019 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568022946;
        bh=jdkNyv/gG06Sh67/s+iuQnDbKorGXVGoFEBp4pU3fwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OrJqT/DjmGhfIb7VVXiETRpZBT18NXPR9mwETfjW86Q48Xtej/TiAPfQbOHps1KC1
         Aix08xtASO9FYqbst/DinNdM1VzumX6kLhoLwk3ZLHj5lm5SgapCZq74czbcFwiAjk
         O+pXcTDjY3wTiaByw2DOMW+gsCfXaL0xf9b3fQU4=
Date:   Mon, 9 Sep 2019 10:55:43 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20190909095543.GA17624@kroah.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB4544AA760AE8DBC4CA8AC25ED8B70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544AA760AE8DBC4CA8AC25ED8B70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 09, 2019 at 07:02:46AM +0000, Yoshihiro Shimoda wrote:
> Hi Veeraiyan,
> 
> > From: Veeraiyan Chidambaram, Sent: Friday, September 6, 2019 9:04 PM
> > 
> > From: Eugeniu Rosca <erosca@de.adit-jv.com>
> > 
> > Commit [1] enabled the possibility of checking the DVST (Device State
> > Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> > the irq_dev_state() handler if the DVST bit is set. But neither
> > commit [1] nor commit [2] actually enabled the DVSE (Device State
> > Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> > Register 0). As a consequence, irq_dev_state() handler is getting
> > called as a side effect of other (non-DVSE) interrupts being fired,
> > which definitely can't be relied upon, if DVST notifications are of
> > any value.
> > 
> > Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> > doesn't do much except of a dev_dbg(). Once more work is added to
> > the handler (e.g. detecting device "Suspended" state and notifying
> > other USB gadget components about it), enabling DVSE becomes a hard
> > requirement. Do it in a standalone commit for better visibility and
> > clear explanation.
> > 
> > [1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> > [2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> I think your Signed-off-by is needed here and patch 2/3.

Yes, I can't take this as-is without that.

thanks,

greg k-h
