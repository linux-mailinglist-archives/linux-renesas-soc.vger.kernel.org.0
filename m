Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0B8249B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 10:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUID6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 04:03:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfEUID6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 04:03:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EABE42173C;
        Tue, 21 May 2019 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558425837;
        bh=nAiSQc1/drJI/PcZrZh84RChhzD4Kmo1dkrxjZCBbjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5kSxl4e2+pVVzSdTsWOBJqV0R75hs3zgJfbkLsq04H7ZAQTENkwNS4vYMRHJgQDN
         sp4E6SgAHitD54yGb4fioxHh6P+9h1iD6fb32dZtx1Ld8rEZF6R/68XhCCSlaEx0FY
         zowMSE/WO6u0J7snJplkcwAtQj+b9k9qNZuNRXZ8=
Date:   Tue, 21 May 2019 10:03:54 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Message-ID: <20190521080354.GA25718@kroah.com>
References: <1557715229-13102-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513120124.72pyg5hileurtkry@verge.net.au>
 <OSBPR01MB3174C65FDF208431F988068DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3174C65FDF208431F988068DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 06:57:17AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Monday, May 13, 2019 9:01 PM
> > 
> > On Mon, May 13, 2019 at 11:40:29AM +0900, Yoshihiro Shimoda wrote:
> > > This patch adds a specific struct "usbhs_of_data" to add a new SoC
> > > data easily instead of code basis in the future.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Hi Shimoda-san,
> > 
> > the minor suggestion below not withstanding this looks good to me.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thank you for your review!
> 
> > > ---
> > >  Changes from v1 [1]:
> > >  - Use sizeof(variable) instead of sizeof(type).
> > >  - Add Geert-san's reviewed-by (thanks!).
> > >
> > > [1]
> > > https://patchwork.kernel.org/patch/10938575/
> > >
> > >  drivers/usb/renesas_usbhs/common.c | 112 +++++++++++++++++++++----------------
> > >  drivers/usb/renesas_usbhs/common.h |   5 ++
> > >  2 files changed, 70 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> > > index 249fbee..0ca89de 100644
> > > --- a/drivers/usb/renesas_usbhs/common.c
> > > +++ b/drivers/usb/renesas_usbhs/common.c
> <snip>
> > > @@ -598,8 +638,15 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
> > >  	if (!info)
> > >  		return NULL;
> > >
> > > +	data = of_device_get_match_data(dev);
> > > +	if (!data)
> > > +		return NULL;
> > > +
> > >  	dparam = &info->driver_param;
> > > -	dparam->type = (uintptr_t)of_device_get_match_data(dev);
> > > +	memcpy(dparam, &data->param, sizeof(data->param));
> > > +	memcpy(&info->platform_callback, data->platform_callback,
> > > +	       sizeof(*data->platform_callback));
> > 
> > Can we avoid the error-proneness of calls to sizeof() as follows?
> > 
> >         *dparam = data->param;
> >         info->platform_callback = *data->platform_callback;
> 
> Since Chris-san has submitted a patch series [1] that is based on this patch today,
> I'd like to submit an incremental patch to avoid the error-proneness in the renesas_usbhs
> (common.c and mod_host.c) later, if possible.
> 
> Greg-san, is it acceptable?

Fine with me!
