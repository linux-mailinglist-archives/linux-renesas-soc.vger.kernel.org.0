Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B0B64B224
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 10:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbiLMJUW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 04:20:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbiLMJTt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 04:19:49 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01E013F44;
        Tue, 13 Dec 2022 01:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670923076; x=1702459076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dC9RgAsmkG9yjYo7dBX0uBtkf8ADUg4IQ9ieUm2N6jU=;
  b=bjq4C5+dt7HXu2lEgTtSYDfae1u3wbmVR4KY90LwGOWAb/EcoEF7yP+i
   L9+r7WzHBXZp2kRrF8bxEQpdm8tiTxxKZLcXB5Gd/pYnE40WSxQwvAOzL
   EEKnxloD5h0Ktqk5kKWv4vDkSpDT8B3rzj3jqQjJZM3TnUMjI+Uqw/qZB
   /mUtvms0kSv9yAWpOo3tjFQY4bsS+zguzWdFB26+591eXVcDQj15yhMH6
   GeqEQCjMItCtrOQI4kIPY3p8aRl9yeJ3YMJlc1hy8uHOvDBLKYHvToFmi
   6ZS5pMr10hv1erCkxuoXXkPEwQwHZ565mU+qSXDJtnHfI+q3KPiZgHRpd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="297765783"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="297765783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 01:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="790830439"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="790830439"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Dec 2022 01:17:53 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 13 Dec 2022 11:17:52 +0200
Date:   Tue, 13 Dec 2022 11:17:52 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: hd3ss3220: Add polling support
Message-ID: <Y5hDQJbxqz1WVpTF@kuha.fi.intel.com>
References: <20221209171836.71610-1-biju.das.jz@bp.renesas.com>
 <20221209171836.71610-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209171836.71610-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 09, 2022 at 05:18:36PM +0000, Biju Das wrote:
> Some platforms(for eg: RZ/V2M EVK) does not have interrupt pin
> connected to HD3SS3220. Add polling support for role detection.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v1->v2:
>  * Dropped patch#3 for soring header files.
> ---
>  drivers/usb/typec/hd3ss3220.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index c24bbccd14f9..a445c1bd0627 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/usb/typec.h>
>  #include <linux/delay.h>
> +#include <linux/workqueue.h>
>  
>  #define HD3SS3220_REG_CN_STAT_CTRL	0x09
>  #define HD3SS3220_REG_GEN_CTRL		0x0A
> @@ -37,6 +38,9 @@ struct hd3ss3220 {
>  	struct regmap *regmap;
>  	struct usb_role_switch	*role_sw;
>  	struct typec_port *port;
> +	struct delayed_work output_poll_work;
> +	enum usb_role role_state;
> +	bool poll;
>  };
>  
>  static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
> @@ -118,6 +122,22 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
>  	default:
>  		break;
>  	}
> +
> +	hd3ss3220->role_state = role_state;
> +}
> +
> +static void output_poll_execute(struct work_struct *work)
> +{
> +	struct delayed_work *delayed_work = to_delayed_work(work);
> +	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
> +						   struct hd3ss3220,
> +						   output_poll_work);
> +	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +
> +	if (hd3ss3220->role_state != role_state)
> +		hd3ss3220_set_role(hd3ss3220);
> +
> +	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
>  }
>  
>  static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
> @@ -227,6 +247,9 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  					"hd3ss3220", &client->dev);
>  		if (ret)
>  			goto err_unreg_port;
> +	} else {
> +		INIT_DELAYED_WORK(&hd3ss3220->output_poll_work, output_poll_execute);
> +		hd3ss3220->poll = true;
>  	}
>  
>  	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
> @@ -235,6 +258,9 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>  	fwnode_handle_put(connector);
>  
> +	if (hd3ss3220->poll)
> +		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
> +
>  	dev_info(&client->dev, "probed revision=0x%x\n", ret);
>  
>  	return 0;
> @@ -252,6 +278,9 @@ static void hd3ss3220_remove(struct i2c_client *client)
>  {
>  	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
>  
> +	if (hd3ss3220->poll)
> +		cancel_delayed_work_sync(&hd3ss3220->output_poll_work);
> +
>  	typec_unregister_port(hd3ss3220->port);
>  	usb_role_switch_put(hd3ss3220->role_sw);
>  }
> -- 
> 2.25.1

-- 
heikki
