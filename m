Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C525262074
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 22:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgIHPPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 11:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730204AbgIHPOM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:14:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7035C0A3BF8;
        Tue,  8 Sep 2020 07:55:40 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AEAB47;
        Tue,  8 Sep 2020 16:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599576547;
        bh=VZxVwE367zy4rnEIhb63fedqnKUY0kWbKadgCVRNRv0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=N0wpce4zDfPAHsgZads0/14dzBak9A0fu+bjbQ6s1Y6lSytdhL4L3h3IS5xIf5OOu
         ppkmpwp78QggvOf4/EUoydmRywUQWczmGMMkERPe1zxPb8doIsnDfQDkw6HQenJSOB
         NDHinoqWTFdTuaaI4LcXStCULWi+jI6ZQX6GhBew=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 04/10] drm: rcar-du: Add r8a77961 support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87imcprtw3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e398fbd9-5dcc-5373-b23b-5bd80779bd30@ideasonboard.com>
Date:   Tue, 8 Sep 2020 15:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87imcprtw3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On 08/09/2020 01:34, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds R-Car M3-W+ (R8A77961) support which has
> compatible to R-Car M3-W (R8A77960).

With the "which is compatible with" as suggested-by Laurent:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index f53b0ec71085..64533cbdbef0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -458,6 +458,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7794", .data = &rcar_du_r8a7794_info },
>  	{ .compatible = "renesas,du-r8a7795", .data = &rcar_du_r8a7795_info },
>  	{ .compatible = "renesas,du-r8a7796", .data = &rcar_du_r8a7796_info },
> +	{ .compatible = "renesas,du-r8a77961", .data = &rcar_du_r8a7796_info },
>  	{ .compatible = "renesas,du-r8a77965", .data = &rcar_du_r8a77965_info },
>  	{ .compatible = "renesas,du-r8a77970", .data = &rcar_du_r8a77970_info },
>  	{ .compatible = "renesas,du-r8a77980", .data = &rcar_du_r8a77970_info },
> 

