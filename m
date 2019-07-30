Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1277A7E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2019 14:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfG3MNH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jul 2019 08:13:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45277 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfG3MNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 08:13:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so65491565wre.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2019 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CoevLnz9qhbxVrh6xp3GZfUbxDHCKJ+w5xMOaazCWGE=;
        b=VjSbwR4ggCr39FOFHCCONu4SAe4/fB4fPP/lEdpeC2k7gmY98WrfU/eQSagqB4/E1U
         civE8A4KOXfOYnsGVdRCDDEhZ1GMEi6b8CF5pnt8xay06JfCUwgwTI+tzvMGQD+7KO+r
         U5/uVdmSTF8XEVlEv9sOoOActsKqsVaHXPsgMWIsFf0YAFHbS3WM4movPT8d0DDipTy2
         gf2mj9IYQJdM8pInyEM5tFK0tYFGlGJ8olojiR1InlfuTrM/fmNmj9K/zczWUzoDR6DD
         gZl9tdDUBi8UF3gEisg0fzTbph78M7ew005PL2TXpwg2sHCO6P+c0twGp8Z9n0b8t3sW
         hIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CoevLnz9qhbxVrh6xp3GZfUbxDHCKJ+w5xMOaazCWGE=;
        b=fXbFU2RM8++PhclNlpTv6NiqD5LQTFUyQBsQ4YEn2+SPuGGELbwe+wxCSZ+fKtC5ke
         WrMHDSwNEbyRXr2xbO+C5sNDzEKOeDDZxYrwPnlzYOpxD/V+NPwWqRoIxji3JFkh2ujf
         49PCldabZpMllf4KMqZD0W0aqP+XjY93XAm/n/Ca4S4VPWAnytqfLNY6un9FEDTtU4br
         D0zGeeok+uVBtbDA+Y/hrZKruizAPCTve7ORs9bBf2nLHSP4+bpEpePDdnwmi7r/zAhC
         4mJUefphkm8KXbO+iX+Hn4jySlE4gF8wVEr16RKZWt7g4wcC3k0x++XoWMmLi8n9XFWT
         /FSg==
X-Gm-Message-State: APjAAAWSu1qASU8nydAflLd1H8lhgIEumwnPilyki4zkjn4X2f0VnCve
        ++g/9RJvFf/+n0ysSqwSXbstJQ==
X-Google-Smtp-Source: APXvYqzB2vTwkAYXhlh5iDX3zJM0AjTxbO55fB9iMEp4FRIGchhOObYooU0dzpkcC/74Kny0Nqqkkw==
X-Received: by 2002:a5d:5302:: with SMTP id e2mr111656029wrv.347.1564488783720;
        Tue, 30 Jul 2019 05:13:03 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s15sm47385709wrw.21.2019.07.30.05.13.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 05:13:03 -0700 (PDT)
Subject: Re: [PATCH v3 03/10] drm: bridge: thc63: Report input bus mode
 through bridge timings
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6185d397-1c4d-fbf5-4f4d-889a0a7b93ad@baylibre.com>
Date:   Tue, 30 Jul 2019 14:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28/05/2019 16:12, Laurent Pinchart wrote:
> Set a drm_bridge_timings in the drm_bridge, and use it to report the
> input bus mode (single-link or dual-link). The other fields of the
> timings structure are kept to 0 as they do not apply to LVDS buses.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Changes since v1:
> 
> - Ignore disabled remote device
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 54 +++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index b083a740565c..709dd28b43d6 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -31,6 +31,8 @@ struct thc63_dev {
>  
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next;
> +
> +	struct drm_bridge_timings timings;
>  };
>  
>  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> @@ -48,15 +50,28 @@ static int thc63_attach(struct drm_bridge *bridge)
>  static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
>  					const struct drm_display_mode *mode)
>  {
> +	struct thc63_dev *thc63 = to_thc63(bridge);
> +	unsigned int min_freq;
> +	unsigned int max_freq;
> +
>  	/*
> -	 * The THC63LVD1024 clock frequency range is 8 to 135 MHz in single-in
> -	 * mode. Note that the limits are different in dual-in, single-out mode,
> -	 * and will need to be adjusted accordingly.
> +	 * The THC63LVD1024 pixel rate range is 8 to 135 MHz in all modes but
> +	 * dual-in, single-out where it is 40 to 150 MHz. As dual-in, dual-out
> +	 * isn't supported by the driver yet, simply derive the limits from the
> +	 * input mode.
>  	 */
> -	if (mode->clock < 8000)
> +	if (thc63->timings.dual_link) {
> +		min_freq = 40000;
> +		max_freq = 150000;
> +	} else {
> +		min_freq = 8000;
> +		max_freq = 135000;
> +	}
> +
> +	if (mode->clock < min_freq)
>  		return MODE_CLOCK_LOW;
>  
> -	if (mode->clock > 135000)
> +	if (mode->clock > max_freq)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;
> @@ -101,19 +116,19 @@ static const struct drm_bridge_funcs thc63_bridge_func = {
>  
>  static int thc63_parse_dt(struct thc63_dev *thc63)
>  {
> -	struct device_node *thc63_out;
> +	struct device_node *endpoint;
>  	struct device_node *remote;
>  
> -	thc63_out = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> -						  THC63_RGB_OUT0, -1);
> -	if (!thc63_out) {
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_RGB_OUT0, -1);
> +	if (!endpoint) {
>  		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
>  			THC63_RGB_OUT0);
>  		return -ENODEV;
>  	}
>  
> -	remote = of_graph_get_remote_port_parent(thc63_out);
> -	of_node_put(thc63_out);
> +	remote = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
>  	if (!remote) {
>  		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
>  			THC63_RGB_OUT0);
> @@ -132,6 +147,22 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>  	if (!thc63->next)
>  		return -EPROBE_DEFER;
>  
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_LVDS_IN1, -1);
> +	if (endpoint) {
> +		remote = of_graph_get_remote_port_parent(endpoint);
> +		of_node_put(endpoint);
> +
> +		if (remote) {
> +			if (of_device_is_available(remote))
> +				thc63->timings.dual_link = true;
> +			of_node_put(remote);
> +		}
> +	}
> +
> +	dev_dbg(thc63->dev, "operating in %s-link mode\n",
> +		thc63->timings.dual_link ? "dual" : "single");
> +
>  	return 0;
>  }
>  
> @@ -188,6 +219,7 @@ static int thc63_probe(struct platform_device *pdev)
>  	thc63->bridge.driver_private = thc63;
>  	thc63->bridge.of_node = pdev->dev.of_node;
>  	thc63->bridge.funcs = &thc63_bridge_func;
> +	thc63->bridge.timings = &thc63->timings;
>  
>  	drm_bridge_add(&thc63->bridge);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
