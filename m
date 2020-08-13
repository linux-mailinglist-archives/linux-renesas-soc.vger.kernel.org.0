Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F31E24396D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 13:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMLjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 07:39:39 -0400
Received: from mga18.intel.com ([134.134.136.126]:64726 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgHMLji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 07:39:38 -0400
IronPort-SDR: u9UU7lK1oVTTUJsbCs2iBzjP92d1WZpvOd7PbsYGB0J3JbsGJB0EymeOhdXWmHQXfZRBs71Y2/
 DbJJIK81oLqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="141828839"
X-IronPort-AV: E=Sophos;i="5.76,308,1592895600"; 
   d="scan'208";a="141828839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 04:39:37 -0700
IronPort-SDR: nPp9b/iBDzZXdE4r9Tae2Z8ONkZmjIeYVQ/ewudwgqoKtGDwhZF4/Thdm4115qerU9cg56pN8P
 QCaRngToyigA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,308,1592895600"; 
   d="scan'208";a="399139572"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Aug 2020 04:39:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Aug 2020 14:39:32 +0300
Date:   Thu, 13 Aug 2020 14:39:32 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/5] usb: typec: hd3ss3220: Use OF graph API to get
 the connector fwnode
Message-ID: <20200813113932.GI1169992@kuha.fi.intel.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811080227.3170-4-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 11, 2020 at 09:02:25AM +0100, Biju Das wrote:
> Some platforms have only super speed data bus connected to this device
> and high speed data bus directly connected to the SoC. In such platforms
> modelling connector as a child of this device is making it non compliant
> with usb connector bindings. By modelling connector node as standalone
> device node along with this device and the SoC data bus will make it
> compliant with usb connector bindings.
> Update the driver to handle this model by using OF graph API to get the
> connector fwnode and usb role switch class API to get role switch handle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v1->v2: Fixed the commit message (https://patchwork.kernel.org/patch/11700777/)
> Ref:https://patchwork.kernel.org/patch/11669423/
> ---
>  drivers/usb/typec/hd3ss3220.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 323dfa8160ab..f633ec15b1a1 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -155,7 +155,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  {
>  	struct typec_capability typec_cap = { };
>  	struct hd3ss3220 *hd3ss3220;
> -	struct fwnode_handle *connector;
> +	struct fwnode_handle *connector, *ep;
>  	int ret;
>  	unsigned int data;
>  
> @@ -173,11 +173,21 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>  	hd3ss3220_set_source_pref(hd3ss3220,
>  				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> +	/* For backward compatibility check the connector child node first */
>  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
> -	if (!connector)
> -		return -ENODEV;
> +	if (connector) {
> +		hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
> +	} else {
> +		ep = fwnode_graph_get_next_endpoint(dev_fwnode(hd3ss3220->dev), NULL);
> +		if (!ep)
> +			return -ENODEV;
> +		connector = fwnode_graph_get_remote_port_parent(ep);
> +		fwnode_handle_put(ep);
> +		if (!connector)
> +			return -ENODEV;
> +		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
> +	}
>  
> -	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
>  	if (IS_ERR(hd3ss3220->role_sw)) {
>  		ret = PTR_ERR(hd3ss3220->role_sw);
>  		goto err_put_fwnode;
> -- 
> 2.17.1

thanks,

-- 
heikki
