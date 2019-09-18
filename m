Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7F8B63FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 15:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfIRNDo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 09:03:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfIRNDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 09:03:43 -0400
Received: from pendragon.ideasonboard.com (126.92.103.87.rev.vodafone.pt [87.103.92.126])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35E4B325;
        Wed, 18 Sep 2019 15:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568811821;
        bh=Bd/SwyG0H1MmBai0JFG0Y2O/9j+qimtkExgKIEyutN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UQBGw2zF2DMetIvPGfASDFUK+z2+czuQ8xOWA2Tntr2PP1ZLHdwNIHGfiykKn+zE2
         ZJju+HHXrE+Xd7vU71iLimj0WXIyYxp51fsEyz3XwN/IVTF7MsWBYU5wH0gzbOTFbg
         bxqO/nc4GY6asCAmu2o7EybYuyH1p18Ct30KTuDM=
Date:   Wed, 18 Sep 2019 16:03:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: DRM Driver implementation question
Message-ID: <20190918130331.GD6306@pendragon.ideasonboard.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gareth,

Sorry for the delayed response, I was travelling for the Linux Plumbers
Conference followed by a code camp.

On Tue, Sep 17, 2019 at 03:27:34PM +0000, Gareth Williams wrote:
> Hi Yoshihiro,
> 
> This looks like an elegant solution that I can implement.
> Many thanks for pointing me in a good direction.
> 
> > From: Yoshihiro Shimoda, Sent: Tuesday, September 17, 2019 05:39 PM
> > 
> > Hi Gareth,
> > 
> > > From: Gareth Williams, Sent: Monday, September 16, 2019 10:56 PM
> > >
> > > Hi Laurent/Kieran,
> > >
> > > I need to upstream a driver for a display controller that within its
> > > registers memory region contains registers related to a PWM
> > > device. The PWM device is for controlling the backlight of the
> > > display.
> > >
> > > Ideally, I would like to create a separated driver for the PWM, so
> > > that I can re-use "pwm-backlight", but since the registers for the PWM
> > > are right in the middle of the registers for the display
> > > controller I would need to ioremap the memory region for the PWM
> > > registers region twice, once from the display controller driver,
> > > and once from the PWM driver.
> > >
> > > Do you think that the double ioremap would be acceptable upstream?
> > 
> > I think that an MFD driver can support such hardware. I checked
> > Documentation/devicetree/bindings/mfd roughly, and then atmel-hlcdc.txt
> > seems to have a display controller and a PWM device.

While MFD should technically work, I think it's quite overkill. You
could instead bundle both the display controller and the PWM controller
in the same driver. The driver would create both a DRM/KMS device and a
PWM device. The DT node for your device would contain a #pwm-cells
property and could thus be referenced as a PWM controller by the
backlight using the pwms property.

-- 
Regards,

Laurent Pinchart
