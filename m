Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700D01FDF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 05:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfEPDQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 23:16:12 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:42734 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726157AbfEPDQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 23:16:11 -0400
X-UUID: 3eb65bece7fc4ee19c58e615ade9b720-20190516
X-UUID: 3eb65bece7fc4ee19c58e615ade9b720-20190516
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1738276002; Thu, 16 May 2019 11:16:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 16 May
 2019 11:16:03 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 May 2019 11:16:02 +0800
Message-ID: <1557976562.10179.326.camel@mhfsdcap03>
Subject: Re: [PATCH v6 4/7] usb: gadget: udc: renesas_usb3: Add dual role
 switch support
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Date:   Thu, 16 May 2019 11:16:02 +0800
In-Reply-To: <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
         <1557922152-16449-5-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-TM-SNTS-SMTP: C02A7DC772F259663E5B2271F61F023BFC87436FBD1DDD05F90D49972FB20CEA2000:8
X-MTK:  N
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2019-05-15 at 13:09 +0100, Biju Das wrote:
> The RZ/G2E cat874 board has a type-c connector connected to hd3ss3220 usb
> type-c drp port controller. This patch adds dual role switch support for
> the type-c connector using the usb role switch class framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V5-->V6
>    * Added graph api's to find the role supported by the connector.
>  V4-->V5
>    * Incorporated Shimoda-san's review comment
>     (https://patchwork.kernel.org/patch/10902537/)
>  V3-->V4
>    * No Change
>  V2-->V3
>    * Incorporated Shimoda-san's review comment
>      (https://patchwork.kernel.org/patch/10852507/)
>    * Used renesas,usb-role-switch property for differentiating USB
>      role switch associated with Type-C port controller driver.
>  V1-->V2
>    * Driver uses usb role clas for handling dual role switch and handling
>      connect/disconnect events instead of extcon.
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 121 ++++++++++++++++++++++++++++++++--
>  1 file changed, 114 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index 7dc2485..1d41998 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -24,6 +24,7 @@
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/usb/role.h>
>  
>  /* register definitions */
> @@ -351,6 +352,8 @@ struct renesas_usb3 {
>  	int disabled_count;
>  
>  	struct usb_request *ep0_req;
> +
> +	enum usb_role connection_state;
>  	u16 test_mode;
>  	u8 ep0_buf[USB3_EP0_BUF_SIZE];
>  	bool softconnect;
> @@ -359,6 +362,7 @@ struct renesas_usb3 {
>  	bool extcon_usb;		/* check vbus and set EXTCON_USB */
>  	bool forced_b_device;
>  	bool start_to_connect;
> +	bool dual_role_sw;
>  };
>  
>  #define gadget_to_renesas_usb3(_gadget)	\
> @@ -699,8 +703,10 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&usb3->lock, flags);
> -	usb3_set_mode_by_role_sw(usb3, host);
> -	usb3_vbus_out(usb3, a_dev);
> +	if (!usb3->dual_role_sw || usb3->connection_state != USB_ROLE_NONE) {
> +		usb3_set_mode_by_role_sw(usb3, host);
> +		usb3_vbus_out(usb3, a_dev);
> +	}
>  	/* for A-Peripheral or forced B-device mode */
>  	if ((!host && a_dev) || usb3->start_to_connect)
>  		usb3_connect(usb3);
> @@ -716,7 +722,8 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
>  {
>  	usb3->extcon_host = usb3_is_a_device(usb3);
>  
> -	if (usb3->extcon_host && !usb3->forced_b_device)
> +	if ((!usb3->dual_role_sw && usb3->extcon_host && !usb3->forced_b_device)
> +	    || usb3->connection_state == USB_ROLE_HOST)
>  		usb3_mode_config(usb3, true, true);
>  	else
>  		usb3_mode_config(usb3, false, false);
> @@ -2343,14 +2350,65 @@ static enum usb_role renesas_usb3_role_switch_get(struct device *dev)
>  	return cur_role;
>  }
>  
> -static int renesas_usb3_role_switch_set(struct device *dev,
> -					enum usb_role role)
> +static void handle_ext_role_switch_states(struct device *dev,
> +					    enum usb_role role)
> +{
> +	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
> +	struct device *host = usb3->host_dev;
> +	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
> +
> +	switch (role) {
> +	case USB_ROLE_NONE:
> +		usb3->connection_state = USB_ROLE_NONE;
> +		if (usb3->driver)
> +			usb3_disconnect(usb3);
> +		usb3_vbus_out(usb3, false);
> +		break;
> +	case USB_ROLE_DEVICE:
> +		if (usb3->connection_state == USB_ROLE_NONE) {
> +			usb3->connection_state = USB_ROLE_DEVICE;
> +			usb3_set_mode(usb3, false);
> +			if (usb3->driver)
> +				usb3_connect(usb3);
> +		} else if (cur_role == USB_ROLE_HOST)  {
> +			device_release_driver(host);
> +			usb3_set_mode(usb3, false);
> +			if (usb3->driver)
> +				usb3_connect(usb3);
> +		}
> +		usb3_vbus_out(usb3, false);
> +		break;
> +	case USB_ROLE_HOST:
> +		if (usb3->connection_state == USB_ROLE_NONE) {
> +			if (usb3->driver)
> +				usb3_disconnect(usb3);
> +
> +			usb3->connection_state = USB_ROLE_HOST;
> +			usb3_set_mode(usb3, true);
> +			usb3_vbus_out(usb3, true);
> +			if (device_attach(host) < 0)
> +				dev_err(dev, "device_attach(host) failed\n");
> +		} else if (cur_role == USB_ROLE_DEVICE) {
> +			usb3_disconnect(usb3);
> +			/* Must set the mode before device_attach of the host */
> +			usb3_set_mode(usb3, true);
> +			/* This device_attach() might sleep */
> +			if (device_attach(host) < 0)
> +				dev_err(dev, "device_attach(host) failed\n");
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void handle_role_switch_states(struct device *dev,
> +					    enum usb_role role)
>  {
>  	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
>  	struct device *host = usb3->host_dev;
>  	enum usb_role cur_role = renesas_usb3_role_switch_get(dev);
>  
> -	pm_runtime_get_sync(dev);
>  	if (cur_role == USB_ROLE_HOST && role == USB_ROLE_DEVICE) {
>  		device_release_driver(host);
>  		usb3_set_mode(usb3, false);
> @@ -2361,6 +2419,20 @@ static int renesas_usb3_role_switch_set(struct device *dev,
>  		if (device_attach(host) < 0)
>  			dev_err(dev, "device_attach(host) failed\n");
>  	}
> +}
> +
> +static int renesas_usb3_role_switch_set(struct device *dev,
> +					enum usb_role role)
> +{
> +	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +
> +	if (usb3->dual_role_sw)
> +		handle_ext_role_switch_states(dev, role);
> +	else
> +		handle_role_switch_states(dev, role);
> +
>  	pm_runtime_put(dev);
>  
>  	return 0;
> @@ -2650,12 +2722,41 @@ static const unsigned int renesas_usb3_cable[] = {
>  	EXTCON_NONE,
>  };
>  
> -static const struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
> +static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {
>  	.set = renesas_usb3_role_switch_set,
>  	.get = renesas_usb3_role_switch_get,
>  	.allow_userspace_control = true,
>  };
>  
> +static bool is_usb_dual_role_switch(struct device *dev)
To me, it's not good idea to pay an attention to specific consumer of
the role switch, assume any device could assign role if it get this USB
role switch, not only type-c connector

> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *parent;
> +	struct device_node *child;
> +	bool ret = false;
> +	const char *role_type = NULL;
> +
> +	child = of_graph_get_endpoint_by_regs(np, -1, -1);
> +	if (!child)
> +		return ret;
> +
> +	parent = of_graph_get_remote_port_parent(child);
> +	of_node_put(child);
> +	child = of_get_child_by_name(parent, "connector");
> +	of_node_put(parent);
> +	if (!child)
> +		return ret;
> +
> +	if (of_device_is_compatible(child, "usb-c-connector")) {
> +		of_property_read_string(child, "data-role", &role_type);
> +		if (role_type && (!strncmp(role_type, "dual", strlen("dual"))))
> +			ret = true;
> +	}
> +
> +	of_node_put(child);
> +	return ret;
> +}
> +
>  static int renesas_usb3_probe(struct platform_device *pdev)
>  {
>  	struct renesas_usb3 *usb3;
> @@ -2741,6 +2842,12 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_dev_create;
>  
> +	if (device_property_read_bool(&pdev->dev, "usb-role-switch") &&
> +	    is_usb_dual_role_switch(&pdev->dev)) {
> +		usb3->dual_role_sw = true;
> +		renesas_usb3_role_switch_desc.fwnode = dev_fwnode(&pdev->dev);
> +	}
> +
>  	INIT_WORK(&usb3->role_work, renesas_usb3_role_work);
>  	usb3->role_sw = usb_role_switch_register(&pdev->dev,
>  					&renesas_usb3_role_switch_desc);


