Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FB914EF3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2020 16:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgAaPM3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 Jan 2020 10:12:29 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:55852 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728839AbgAaPM3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Jan 2020 10:12:29 -0500
Received: (qmail 2571 invoked by uid 2102); 31 Jan 2020 10:12:28 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 Jan 2020 10:12:28 -0500
Date:   Fri, 31 Jan 2020 10:12:28 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
cc:     gregkh@linuxfoundation.org, <thinhn@synopsys.com>,
        <Kento.A.Kobayashi@sony.com>, <atmgnd@outlook.com>,
        <linux-usb@vger.kernel.org>, <andrew_gabbasov@mentor.com>,
        <erosca@de.adit-jv.com>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
In-Reply-To: <20200131103239.GA21056@vmlxhi-118.adit-jv.com>
Message-ID: <Pine.LNX.4.44L0.2001311009560.1577-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 31 Jan 2020, Hardik Gajjar wrote:

> > > @@ -1863,6 +1865,9 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> > >  	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
> > >  		hub->quirk_check_port_auto_suspend = 1;
> > >  
> > > +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND)
> > > +		usb_autopm_get_interface(intf);
> > > +
> > >  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> > >  		return 0;
> > >  
> > 
> > This isn't right.  If you call usb_autopm_get_interface() then at some 
> > later point you _must_ call usb_autopm_put_interface().  In this case, 
> > you would have to add these calls following the hub_configure() call 
> > (in the case where it returns an error) and in the hub_disconnect() 
> > routine.
> > 
> 
> Thanks for feedback.
> 
> I tried to call the usb_autopm_put_interface() after hub_configure()[1] but then,
> detection of USB3 device is stopped. Perhaps, It will increase the counter
> again and allow the hub to go into suspend/sleep Mode. I need to disable auto
> suspend permanently for SMSC hub. 
> 
> Please,  give some suggestion. 

What I mean is, you need to do something like this...

Alan Stern


Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1730,6 +1730,9 @@ static void hub_disconnect(struct usb_in
 	kfree(hub->buffer);
 
 	pm_suspend_ignore_children(&intf->dev, false);
+	if (hub->quirk_disable_autosuspend)
+		usb_autopm_put_interface(intf);
+
 	kref_put(&hub->kref, hub_release);
 }
 
@@ -1862,6 +1865,11 @@ static int hub_probe(struct usb_interfac
 	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
 		hub->quirk_check_port_auto_suspend = 1;
 
+	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
+		hub->quirk_disable_autosuspend = 1;
+		usb_autopm_get_interface(intf);
+	}
+
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
 		return 0;
 
Index: usb-devel/drivers/usb/core/hub.h
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.h
+++ usb-devel/drivers/usb/core/hub.h
@@ -63,6 +63,7 @@ struct usb_hub {
 	unsigned		in_reset:1;
 
 	unsigned		quirk_check_port_auto_suspend:1;
+	unsigned		quirk_disable_autosuspend:1;
 
 	unsigned		has_indicators:1;
 	u8			indicator[USB_MAXCHILDREN];

