Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C075E499BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbfFRHDS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:03:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfFRHDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:03:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C285B20665;
        Tue, 18 Jun 2019 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560841397;
        bh=llqDQOaabgA4LoUF+l+Zv2639AhP35mJ+WTahE9pEqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D6P4TRyLL5ubkD14ULgJICR/xWIZZywSwWwxotIi3lz7kJ6EX4HpKE0R4DmxDfyLK
         YYOEKIe5AwLsVKRnDq41NevjhBZNcHo9TQp+Aan0M8UrkKcOZw6wTwR9LJOZyUqjZy
         pwJ2kYMzRhqrCridYbdEX3gHUkNtd9F1qiVIuKBc=
Date:   Tue, 18 Jun 2019 09:03:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
Message-ID: <20190618070315.GA9160@kroah.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
 <20190618064743.GA22269@kroah.com>
 <OSBPR01MB2103613A152597DF83BC18D0B8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103613A152597DF83BC18D0B8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 06:57:31AM +0000, Biju Das wrote:
> Hi Greg,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Tuesday, June 18, 2019 7:48 AM
> > To: Biju Das <biju.das@bp.renesas.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>; Matthias Brugger
> > <matthias.bgg@gmail.com>; Rob Herring <robh+dt@kernel.org>; Felipe Balbi
> > <balbi@kernel.org>; Chunfeng Yun <chunfeng.yun@mediatek.com>; linux-
> > usb@vger.kernel.org; Simon Horman <horms@verge.net.au>; Yoshihiro
> > Shimoda <yoshihiro.shimoda.uh@renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> > Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
> > DRP port controller
> > 
> > On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> > > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> > >
> > > The driver currently registers the port and supports data role swapping.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > 
> > I tried to apply this, but get the following build error:
> > 
> > drivers/usb/typec/hd3ss3220.c: In function hd3ss3220_probe:
> > drivers/usb/typec/hd3ss3220.c:179:23: error: implicit declaration of function
> > fwnode_usb_role_switch_get; did you mean usb_role_switch_get? [-
> > Werror=implicit-function-declaration]
> >   hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
> >                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >                        usb_role_switch_get
> > drivers/usb/typec/hd3ss3220.c:179:21: warning: assignment to struct
> > usb_role_switch * from int makes pointer from integer without a cast [-Wint-
> > conversion]
> >   hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
> >                      ^
> > 
> > You might want to fix that so the series can be applied :(
> 
> This patch depend upon the  below commit[1] which introduced the new API "fwnode_usb_role_switch_get()"
> 
> [1] https://patchwork.kernel.org/patch/10986227/ ("usb: roles: Add fwnode_usb_role_switch_get() function")

Ok, then I guess I will have to wait to merge this until that is
accepted.

Please resend when that happens.

thanks,

greg k-h
