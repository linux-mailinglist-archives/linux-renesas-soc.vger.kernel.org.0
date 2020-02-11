Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A980E158A4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 08:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgBKHWp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 02:22:45 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45126 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbgBKHWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 02:22:45 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B7MeN8040288;
        Tue, 11 Feb 2020 01:22:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581405760;
        bh=5L33/Ptenk9kVpRXuM6tVoqQ43eLjZ1Ibi22Csuo99A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=B/onV9WfVVQo+pF8Ul5Sh041YkDd3FU603+ByJ1yRsIaREc8GamVBVpGtxmdpoCR+
         jN/i93trg/LExb9IhWkoGds02qOrSYnHcc9JSj/pYj3ztQmG1gEHl5LO47Nfz8Cthb
         BCOGuuqvIlhnbV/aIOOPQLJTJo8HaWCXlbY6T/Js=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01B7MegI106045
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 01:22:40 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 01:22:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 01:22:40 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B7MbeX130221;
        Tue, 11 Feb 2020 01:22:38 -0600
Subject: Re: [PATCH] drm/omapdrm: Fix trivial spelling
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:DRM DRIVERS FOR TI OMAP" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <47d5d3d9-fc59-6934-c3e8-e4a731476dbe@ti.com>
Date:   Tue, 11 Feb 2020 09:22:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/12/2019 14:33, Kieran Bingham wrote:
> Fix trivial spelling identified while examining the code.
> 
> 	s/supprted./supported./
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_crtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
> index 3c5ddbf30e97..fce7e944a280 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -831,7 +831,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
>   	 * OMAP_DSS_CHANNEL_DIGIT. X server assumes 256 element gamma
>   	 * tables so lets use that. Size of HW gamma table can be
>   	 * extracted with dispc_mgr_gamma_size(). If it returns 0
> -	 * gamma table is not supprted.
> +	 * gamma table is not supported.
>   	 */
>   	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
>   		unsigned int gamma_lut_size = 256;
> 

Thanks, applied.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
