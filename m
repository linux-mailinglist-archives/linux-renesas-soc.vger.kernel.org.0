Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01C01FEEEA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 11:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgFRJoI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 05:44:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:44222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729348AbgFRJoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 05:44:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D65321D7B;
        Thu, 18 Jun 2020 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592473447;
        bh=hjSY+0gQqkNkM+yEdu3IotPRnnGkBkGW0tkkJThgNIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=af3MuqZbyEhdwAFtHor3U+pR/hP4Q6doDD1q+pGf2NhkrpYFFljWjj6ax2Fq4figR
         h1oU1DCnDJP/at4OODCpn6XdkgMnnkdpqEZwM8M/eoRtxbK8Qj/dHAHqdl8dawAhG5
         RRu428V03DeEZyM0qH9ZsiFige7NVHUf4a6OKCUc=
Date:   Thu, 18 Jun 2020 11:43:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Jiri Kosina <trivial@kernel.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/17] drivers: usb: Fix trivial spelling
Message-ID: <20200618094359.GA1888087@kroah.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-8-kieran.bingham+renesas@ideasonboard.com>
 <20200618082147.GA1050104@kroah.com>
 <0d1fb492-7503-895c-82d3-b7f4611ef1f2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d1fb492-7503-895c-82d3-b7f4611ef1f2@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 18, 2020 at 09:52:28AM +0100, Kieran Bingham wrote:
> Hi Greg,
> 
> On 18/06/2020 09:21, Greg Kroah-Hartman wrote:
> > On Tue, Jun 09, 2020 at 01:46:00PM +0100, Kieran Bingham wrote:
> >> The word 'descriptor' is misspelled throughout the tree.
> >>
> >> Fix it up accordingly:
> >>     decriptors -> descriptors
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> ---
> >>  drivers/usb/core/of.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> >> index 651708d8c908..617e92569b2c 100644
> >> --- a/drivers/usb/core/of.c
> >> +++ b/drivers/usb/core/of.c
> >> @@ -45,7 +45,7 @@ EXPORT_SYMBOL_GPL(usb_of_get_device_node);
> >>   *
> >>   * Determine whether a USB device has a so called combined node which is
> >>   * shared with its sole interface. This is the case if and only if the device
> >> - * has a node and its decriptors report the following:
> >> + * has a node and its descriptors report the following:
> >>   *
> >>   *	1) bDeviceClass is 0 or 9, and
> >>   *	2) bNumConfigurations is 1, and
> >> -- 
> >> 2.25.1
> >>
> > 
> > Already fixed in Linus's tree :(
> 
> Don't be sad - that makes me happy ;-) This was just a global fixup
> while I added the correction to scripts/spelling.txt...
> 
> But wait, are you sure? I've just rebased this series on top of
> 1b5044021070 ("Merge tag 'dma-mapping-5.8-3' of
> git://git.infradead.org/users/hch/dma-mapping"), and this still applies
> for me ... Am I failing to pick up the latest branch from Linus?
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> looks like I'm on the latest, so I don't think so).
> 
> I see a bot-notification from you saying it's been added to your
> usb-testing tree, so I'll assume this is all fine. No need to worry
> though It's only a trivial and can get picked up by the trivial bot I
> think if I resend when the dust settles.

Ah, I might have tried to apply this twice, sorry for the noise, all is
good...

greg k-h
