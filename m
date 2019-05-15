Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717A81E9DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfEOIKz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:10:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57870 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbfEOIKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:10:54 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id AA83625AEAD;
        Wed, 15 May 2019 18:10:52 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 72119E21335; Wed, 15 May 2019 10:10:50 +0200 (CEST)
Date:   Wed, 15 May 2019 10:10:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
Message-ID: <20190515081049.7pr556t73mm4f3oe@verge.net.au>
References: <1557715229-13102-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513120124.72pyg5hileurtkry@verge.net.au>
 <OSBPR01MB3174C65FDF208431F988068DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3174C65FDF208431F988068DD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
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

FWIIW that sounds entirely reasonable to me as
my suggestion is a cleanup.

> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=117459
> 
> Best regards,
> Yoshihiro Shimoda
> 
> > > +
> > >  	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
> > >  		dparam->buswait_bwait = tmp;
> > >  	gpio = of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio", 0,
> > > @@ -607,19 +654,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
> > >  	if (gpio > 0)
> > >  		dparam->enable_gpio = gpio;
> > >
> > > -	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
> > > -	    dparam->type == USBHS_TYPE_RCAR_GEN3 ||
> > > -	    dparam->type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
> > > -		dparam->has_usb_dmac = 1;
> > > -		dparam->pipe_configs = usbhsc_new_pipe;
> > > -		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
> > > -	}
> > > -
> > > -	if (dparam->type == USBHS_TYPE_RZA1) {
> > > -		dparam->pipe_configs = usbhsc_new_pipe;
> > > -		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
> > > -	}
> > > -
> > >  	return info;
> > >  }
> > >
> > > @@ -676,29 +710,13 @@ static int usbhs_probe(struct platform_device *pdev)
> > >  	       &info->driver_param,
> > >  	       sizeof(struct renesas_usbhs_driver_param));
> > 
> > Likewise in the (otherwise unchanged) use of memcpy above.
> > 
> > >
> > > -	switch (priv->dparam.type) {
> > > -	case USBHS_TYPE_RCAR_GEN2:
> > > -		priv->pfunc = usbhs_rcar2_ops;
> > > -		break;
> > > -	case USBHS_TYPE_RCAR_GEN3:
> > > -		priv->pfunc = usbhs_rcar3_ops;
> > > -		break;
> > > -	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
> > > -		priv->pfunc = usbhs_rcar3_with_pll_ops;
> > > -		break;
> > > -	case USBHS_TYPE_RZA1:
> > > -		priv->pfunc = usbhs_rza1_ops;
> > > -		break;
> > > -	default:
> > > -		if (!info->platform_callback.get_id) {
> > > -			dev_err(&pdev->dev, "no platform callbacks");
> > > -			return -EINVAL;
> > > -		}
> > > -		memcpy(&priv->pfunc,
> > > -		       &info->platform_callback,
> > > -		       sizeof(struct renesas_usbhs_platform_callback));
> > > -		break;
> > > +	if (!info->platform_callback.get_id) {
> > > +		dev_err(&pdev->dev, "no platform callbacks");
> > > +		return -EINVAL;
> > >  	}
> > > +	memcpy(&priv->pfunc,
> > > +	       &info->platform_callback,
> > > +	       sizeof(struct renesas_usbhs_platform_callback));
> > 
> > And here too.
> > 
> > >
> > >  	/* set driver callback functions for platform */
> > >  	dfunc			= &info->driver_callback;
> > > diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
> > > index 3777af8..de1a663 100644
> > > --- a/drivers/usb/renesas_usbhs/common.h
> > > +++ b/drivers/usb/renesas_usbhs/common.h
> > > @@ -282,6 +282,11 @@ struct usbhs_priv {
> > >  	struct clk *clks[2];
> > >  };
> > >
> > > +struct usbhs_of_data {
> > > +	const struct renesas_usbhs_platform_callback	*platform_callback;
> > > +	const struct renesas_usbhs_driver_param		param;
> > > +};
> > > +
> > >  /*
> > >   * common
> > >   */
> > > --
> > > 2.7.4
> > >
> 
