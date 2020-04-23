Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E68F1B55EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 09:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgDWHir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 03:38:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:64224 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgDWHiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 03:38:46 -0400
IronPort-SDR: DZ3km4otwRAdQ9+7ub4YhHlDCCMo9Zwhowsy4ajX5U83rjpVY8infICpJe8BtDb32Foe0npnNp
 xY0aXoOu+/vw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:38:45 -0700
IronPort-SDR: /fZNDQVL4yog7+a+OIBwCGg06BDAn4ewrX6/bTWb+Bf+6+Aip3/rd+SsEw7T6r2Shw+zInHA7e
 hFesAcQbwsVw==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="259337964"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:38:43 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C5C9F2080B; Thu, 23 Apr 2020 10:38:41 +0300 (EEST)
Date:   Thu, 23 Apr 2020 10:38:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 02/13] squash! max9286: convert probe kzalloc
Message-ID: <20200423073841.GJ5381@paasikivi.fi.intel.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
 <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
 <20200409163333.GA25086@pendragon.ideasonboard.com>
 <ef7fc3df-c84f-0c3d-a34f-73460a9c1478@ideasonboard.com>
 <20200410111519.GA4751@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410111519.GA4751@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, Kieran,

On Fri, Apr 10, 2020 at 02:15:19PM +0300, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Fri, Apr 10, 2020 at 09:20:25AM +0100, Kieran Bingham wrote:
> > On 09/04/2020 17:33, Laurent Pinchart wrote:
> > > On Thu, Apr 09, 2020 at 01:11:51PM +0100, Kieran Bingham wrote:
> > >> v8:
> > >>  - Convert probe kzalloc usage to devm_ variant
> > > 
> > > This isn't worse than the existing code, but are you aware that devm_*
> > > should not be used in this case ? The memory should be allocated with
> > > kzalloc() and freed in the .release() operation.
> > 
> > This change was at the request of a review comment from Sakari.
> > 
> > From:
> > https://lore.kernel.org/linux-media/4139f241-2fde-26ad-fe55-dcaeb76ad6cc@ideasonboard.com/
> >
> > >>> +
> > >>> +static int max9286_probe(struct i2c_client *client)
> > >>> +{
> > >>> +	struct max9286_priv *priv;
> > >>> +	unsigned int i;
> > >>> +	int ret;
> > >>> +
> > >>> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > >>> +	if (!priv)
> > >>> +		return -ENOMEM;
> > >> 
> > >> You won't lose anything by using the devm_ variant here.
> > > 
> > > Indeed,
> > > 
> > >>> +
> > >>> +	priv->client = client;
> > >>> +	i2c_set_clientdata(client, priv);
> > >>> +
> > >>> +	for (i = 0; i < MAX9286_N_SINKS; i++)
> > >>> +		max9286_init_format(&priv->fmt[i]);
> > >>> +
> > >>> +	ret = max9286_parse_dt(priv);
> > >>> +	if (ret)
> > >>> +		return ret;
> > >> 
> > >> But you can avoid accidental memory leaks for nothing. :-)
> > > 
> > > It would be good not to leak indeed!
> > 
> > I understand that there are lifetime issues in V4L2 - but in my opinion
> > that needs to be handled by core V4l2 (and or support from driver core
> > framework).
> 
> I'm afraid that's not possible. The V4L2 core can't delay remove().
> There are helpers we could create to simplify correct memory management
> for drivers, but in any case, devm_kzalloc() isn't correct.
> 
> There are also issues in the core that would make unbinding unsafe even
> if correctly implemented in this driver, but a correct implementation in
> drivers will be required in any case.
> 
> As I said before this patch isn't a regression as memory allocation is
> already broken here, but it doesn't go in the right direction either.
> 
> > Also - isn't it highly unlikely to affect the max9286? Isn't the
> > lifetime issue that the device can be unplugged while the file handle is
> > open?
> > 
> > I don't think anyone is going to 'unplug' the max9286 while it's active :-)
> 
> No, but someone could unbind it through sysfs. In any case it's not an
> excuse to not implement memory allocation correctly :-)

Properly refcounting the objects and being unbind-safe would require
rewriting the memory allocation in drivers. This can't be done as the
framework is broken.

Whether you use devm_* variant here makes no difference from that point of
view. But it makes it easier to find out driver does not do its object
refcounting properly later on when (or if) the framework is fixed.

-- 
Regards,

Sakari Ailus
