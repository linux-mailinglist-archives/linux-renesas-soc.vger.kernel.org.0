Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C9A3E0E51
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 08:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhHEG3A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Aug 2021 02:29:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236559AbhHEG25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 02:28:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F11FF61029;
        Thu,  5 Aug 2021 06:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628144916;
        bh=k6bsxY/D73lQ+HaYdrBBsUHM9IGpDMOqYLXB6rXEp04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GBX4c28J+oXZ9o09msSFsub9Qgrf98bhF8NFfqc4rKfQ/6zFa6gr5f20TYkYYEFU1
         o2GIkHyvuoSgADTGQKmJoo3KajDIbmfzqgsXEX5h6aXjzxRyWLEOUVjQLWQMpU26+U
         dfgtzcFK5YntjrFwm+04k5+1S7tzEgXH3JSRFBGRSrIKK9oPcBSlLHpku5dcWrZaV+
         nI4QPyF0zcxS4Sl/j0WbAkBru69xoFEqjLBmY3Kt7Pe82dUg1P35O+/sLkS1RWUAPX
         ACUyiwxzy+9XT+NQb5WjhihzSO6NIoB7UhO/sdjKiP0NZRonHPIocI7VLEPY4hqltj
         W6QR1di7co5rQ==
Subject: Re: [PATCH v2 1/9] drm/omap: Use correct printk format specifiers for
 size_t
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210731013954.11926-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomba@kernel.org>
Message-ID: <5ebe0407-5da0-69c2-08d9-dd382f1fd44e@kernel.org>
Date:   Thu, 5 Aug 2021 09:28:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731013954.11926-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 31/07/2021 04:39, Laurent Pinchart wrote:
> The correct format specifier for size_t is %zu. Using %d (or %u)
> generates a warning on 64-bit platforms. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 5f1722b040f4..503b5d4bf2c2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2094,7 +2094,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
>   	u8 b1, b2, b3, b4;
>   
>   	if (dsi->debug_write)
> -		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
> +		DSSDBG("dsi_vc_send_long, %zu bytes\n", msg->tx_len);
>   
>   	/* len + header */
>   	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
> @@ -2390,7 +2390,7 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
>   
>   	return 0;
>   err:
> -	DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
> +	DSSERR("%s(vc %d, reqlen %zu) failed\n", __func__,  vc, msg->tx_len);
>   	return r;
>   }
>   
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
