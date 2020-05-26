Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE8D1E2410
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 16:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgEZO2h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 10:28:37 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:24609 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgEZO2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 10:28:37 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 May 2020 10:28:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=ie97RCMqs9WlH5PrH5gP6SPJ+2aqk/2htFbe3e8r2sU=;
        b=nnaifkHDU7u7OiZn2shdaetzJbo3Cz5rPyLTx3ko6nSWJkeE85tzlVo5OYo/pv1KvgRp
        iHwpysizDpV+E+cy7zv+qwpxaCmHa065KJQn9HP6U/U1qEbw2Y8TXr6+iIVPrXFmZYNmhG
        XKFGQeEZa9UdC8s27B5E8kmWTaR9/xGJs=
Received: by filterdrecv-p3mdw1-6dbfd75bfd-nqctr with SMTP id filterdrecv-p3mdw1-6dbfd75bfd-nqctr-17-5ECD2665-3E
        2020-05-26 14:23:33.712454802 +0000 UTC m=+2140699.008479997
Received: from [192.168.1.14] (unknown)
        by ismtpd0006p1lon1.sendgrid.net (SG) with ESMTP
        id EZEpupCJTmKe0lyPkCcqtA
        Tue, 26 May 2020 14:23:33.365 +0000 (UTC)
Subject: Re: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if
 available
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
 <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <b803dc36-f3f1-f90c-ac53-302d24397c2b@kwiboo.se>
Date:   Tue, 26 May 2020 14:23:33 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h03NQHLu7HFkXoiqq?=
 =?us-ascii?Q?cGhSu4gsDewthSmCjmgCBy04zO+sjUcH8+8tQz6?=
 =?us-ascii?Q?FEKYOzFgLEeTlFG3OfqAnHj8Ipk4AfKOXAaJHdR?=
 =?us-ascii?Q?ovfYSi9YTbUyvluCpY5o4vTya0DOIUSYfAG0Vg2?=
 =?us-ascii?Q?OYTHiRQf1qL9CaZsxP8QTqE83ikXu+SWHxyrhNE?=
 =?us-ascii?Q?sF2EIw4Cb8xqOvIpToERQ=3D=3D?=
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2020-05-26 14:50, Neil Armstrong wrote:
> On 26/05/2020 03:15, Laurent Pinchart wrote:
>> On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
>> require a video output port connected to an HDMI sink (most likely an
>> HDMI connector, in rare cases another bridges converting HDMI to another
>> protocol). For those platforms, retrieve the next bridge and attach it
>> from the dw-hdmi bridge attach handler.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
>>  include/drm/bridge/dw_hdmi.h              |  2 +
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 6148a022569a..512e67bb1c32 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
>>  struct dw_hdmi {
>>  	struct drm_connector connector;
>>  	struct drm_bridge bridge;
>> +	struct drm_bridge *next_bridge;
>>  
>>  	unsigned int version;
>>  
>> @@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>>  	struct dw_hdmi *hdmi = bridge->driver_private;
>>  
>>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>> -		return 0;
>> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>> +					 bridge, flags);
>>  
>>  	return dw_hdmi_connector_create(hdmi);
>>  }
>> @@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>>  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
>>  }
>>  
>> +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>> +{
>> +	struct device_node *endpoint;
>> +	struct device_node *remote;
>> +
>> +	if (!hdmi->plat_data->output_port)
>> +		return 0;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
>> +						 hdmi->plat_data->output_port,
>> +						 -1);
>> +	if (!endpoint) {
>> +		/*
>> +		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
>> +		 * binding doesn't make the output port mandatory.
>> +		 */
>> +		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
>> +			hdmi->plat_data->output_port);
>> +		return 0;

After this series only rcar-du set output_port so this block should only
run for rcar-du, for platforms without output_port the if-statement
for !hdmi->plat_data->output_port already return success so you can
probably return fatal error here.

The comment is a little bit misleading because of the if-statement above
or am I missing something?

Regards,
Jonas

>> +	}
>> +
>> +	remote = of_graph_get_remote_port_parent(endpoint);
>> +	of_node_put(endpoint);
>> +	if (!remote) {
>> +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
>> +			hdmi->plat_data->output_port);
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!of_device_is_available(remote)) {
>> +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
>> +			hdmi->plat_data->output_port);
>> +		of_node_put(remote);
>> +		return -ENODEV;
>> +	}
>> +
>> +	hdmi->next_bridge = of_drm_find_bridge(remote);
>> +	of_node_put(remote);
>> +	if (!hdmi->next_bridge)
>> +		return -EPROBE_DEFER;
> 
> I'll be safer to print a warn for now until all platforms has been tested.
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static struct dw_hdmi *
>>  __dw_hdmi_probe(struct platform_device *pdev,
>>  		const struct dw_hdmi_plat_data *plat_data)
>> @@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  	mutex_init(&hdmi->cec_notifier_mutex);
>>  	spin_lock_init(&hdmi->audio_lock);
>>  
>> +	ret = dw_hdmi_parse_dt(hdmi);
>> +	if (ret < 0)
>> +		return ERR_PTR(ret);
>> +
>>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>>  	if (ddc_node) {
>>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index ea34ca146b82..8ebeb65d6371 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
>>  struct dw_hdmi_plat_data {
>>  	struct regmap *regm;
>>  
>> +	unsigned int output_port;
>> +
>>  	unsigned long input_bus_encoding;
>>  	bool use_drm_infoframe;
>>  	bool ycbcr_420_allowed;
>>
> 
> I must check on meson, since I'm not sure for now if the connector probes.
> 
> Anyway, this looks fine.
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
