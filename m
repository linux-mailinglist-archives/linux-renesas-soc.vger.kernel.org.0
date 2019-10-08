Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20FF0CF9D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 14:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbfJHMcg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 08:32:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:25947 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730541AbfJHMcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 08:32:36 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 05:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206627559"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 08 Oct 2019 05:32:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 08 Oct 2019 15:32:31 +0300
Date:   Tue, 8 Oct 2019 15:32:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: hd3ss3220_probe() warn: passing
 zero to 'PTR_ERR'
Message-ID: <20191008123231.GB12909@kuha.fi.intel.com>
References: <1570462729-25722-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570462729-25722-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Oct 07, 2019 at 04:38:49PM +0100, Biju Das wrote:
> This patch fixes the warning passing zero to 'PTR_ERR' by changing the
> check from 'IS_ERR_OR_NULL' to 'IS_ERR'. Also improved the error handling
> on probe function.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

OK by me. FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 1900910..7e5f3f7 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -178,7 +178,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>  	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
>  	fwnode_handle_put(connector);
> -	if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> +	if (IS_ERR(hd3ss3220->role_sw))
>  		return PTR_ERR(hd3ss3220->role_sw);
>  
>  	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> @@ -188,20 +188,22 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>  	hd3ss3220->port = typec_register_port(&client->dev,
>  					      &hd3ss3220->typec_cap);
> -	if (IS_ERR(hd3ss3220->port))
> -		return PTR_ERR(hd3ss3220->port);
> +	if (IS_ERR(hd3ss3220->port)) {
> +		ret = PTR_ERR(hd3ss3220->port);
> +		goto err_put_role;
> +	}
>  
>  	hd3ss3220_set_role(hd3ss3220);
>  	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
>  	if (ret < 0)
> -		goto error;
> +		goto err_unreg_port;
>  
>  	if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
>  		ret = regmap_write(hd3ss3220->regmap,
>  				HD3SS3220_REG_CN_STAT_CTRL,
>  				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
>  		if (ret < 0)
> -			goto error;
> +			goto err_unreg_port;
>  	}
>  
>  	if (client->irq > 0) {
> @@ -210,18 +212,19 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>  					"hd3ss3220", &client->dev);
>  		if (ret)
> -			goto error;
> +			goto err_unreg_port;
>  	}
>  
>  	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
>  	if (ret < 0)
> -		goto error;
> +		goto err_unreg_port;
>  
>  	dev_info(&client->dev, "probed revision=0x%x\n", ret);
>  
>  	return 0;
> -error:
> +err_unreg_port:
>  	typec_unregister_port(hd3ss3220->port);
> +err_put_role:
>  	usb_role_switch_put(hd3ss3220->role_sw);
>  
>  	return ret;
> -- 
> 2.7.4

thanks,

-- 
heikki
