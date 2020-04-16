Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C2A1ABFF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 13:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634102AbgDPLoI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 07:44:08 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:53721 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506499AbgDPLli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 07:41:38 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AC786100003;
        Thu, 16 Apr 2020 11:41:29 +0000 (UTC)
Date:   Thu, 16 Apr 2020 13:44:33 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: Re: [v8-rc1 15/20] squash! max9286: Disable overlap window
Message-ID: <20200416114433.dosgzx2tfgksgvxx@uno.localdomain>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
 <20200416104052.2643098-16-jacopo+renesas@jmondi.org>
 <f5b02b7e-4479-c6ea-1318-ff5bfd1d816b@ideasonboard.com>
 <20200416113108.2t5dfemqgxo5q77j@uno.localdomain>
 <5b36845b-5433-4b34-b40a-913482e5fd8c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b36845b-5433-4b34-b40a-913482e5fd8c@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Apr 16, 2020 at 12:31:32PM +0100, Kieran Bingham wrote:
> On 16/04/2020 12:31, Jacopo Mondi wrote:
> > Hi Kieran,
> >
> > On Thu, Apr 16, 2020 at 11:50:07AM +0100, Kieran Bingham wrote:
> >> Hi Jacopo,
> >>
> >> On 16/04/2020 11:40, Jacopo Mondi wrote:
> >>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> v2:
> >>>   [Jacopo]
> >>>   - Write register 0x63 and 0x64 directly as going through the function
> >>>     breaks RDACM21 operations
> >>> ---
> >>>  drivers/media/i2c/max9286.c | 12 ++++++++++++
> >>>  1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >>> index 3ef74ba10074..e0c637d4a7de 100644
> >>> --- a/drivers/media/i2c/max9286.c
> >>> +++ b/drivers/media/i2c/max9286.c
> >>> @@ -966,6 +966,18 @@ static int max9286_setup(struct max9286_priv *priv)
> >>>  	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> >>>  		      MAX9286_HVSRC_D14);
> >>>
> >>> +	/*
> >>> +	 * The overlap window seems to provide additional validation by tracking
> >>> +	 * the delay between vsync and frame sync, generating an error if the
> >>> +	 * delay is bigger than the programmed window, though it's not yet clear
> >>> +	 * what value should be set.
> >>> +	 *
> >>> +	 * As it's an optional value and can be disabled, we do so by setting
> >>> +	 * a 0 overlap value.
> >>
> >> Are you happy to add the following as part of the removal of the function?
> >>
> >> 	 *
> >> 	 * The overlap window is a 13 bit value, and register 0x64 is
> >> 	 * shared with ENFSINLAST in BIT(5) which is also set zero.
> >> 	 *
> >
> > Not sure, as I noticed failres for RDACM21 when not writing the
> > supposidely reserved bits.
> >
> > As we blindly write the full registers I would leave details out until
> > we figure out what's happening.
>
> But that's precisely why I think we should document it :-) Otherwise -
> some other person could hit this issue in a different way...

In that case yes, I was concerned about the "reserved bits", but
please go ahead and add that comment.

>
> >
> >>
> >>> +	 */
> >>> +	max9286_write(priv, 0x63, 0);
> >>> +	max9286_write(priv, 0x64, 0);
> >>> +
> >>>  	/*
> >>>  	 * Wait for 2ms to allow the link to resynchronize after the
> >>>  	 * configuration change.
> >>>
> >>
>
