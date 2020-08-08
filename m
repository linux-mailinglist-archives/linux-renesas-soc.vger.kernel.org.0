Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71C23F8E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 23:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgHHVCi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 17:02:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgHHVCi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 17:02:38 -0400
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AC2DF9;
        Sat,  8 Aug 2020 23:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596920554;
        bh=vINdyI0QCckZCf5KNzdqgtA/iyl+UJhlXN/pjqWdvHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tr3ZDKIU7VvZv5QU7zUuZjEn4MT79dGZ8kmsjcPXEjufzfADIp/qBt5zi8gVowQYC
         10vtti+jZTAGdHO+JOxzmeVwm8nmTl12X4Fcil9xwZishp7xL+Say8oh9ptEWbCaaK
         28ZsjKtD9xb7433fwZSj1RvE2rrX6jG62DR2zulI=
Date:   Sun, 9 Aug 2020 00:02:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/7] drm: rcar-du: Add r8a7742 support
Message-ID: <20200808210219.GN6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:49PM +0100, Lad Prabhakar wrote:
> Add direct support for the r8a7742 (RZ/G1H).
> 
> The RZ/G1H shares a common, compatible configuration with the r8a7790
> (R-Car H2) so that device info structure is reused, the only difference
> being TCON is unsupported on RZ/G1H (Currently unsupported by the driver).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e67cf70f040..7e286c7a7a6c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -216,8 +216,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
>  	.channels_mask = BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> -		 * R8A7790 has one RGB output, two LVDS outputs and one
> -		 * (currently unsupported) TCON output.
> +		 * R8A7742 and R8A7790 each have one RGB output and two LVDS outputs. Additionally
> +		 * R8A7790 supports one TCON output (currently unsupported by the driver).

Once we support TCON we'll have to split this, but for now I suppose
it's fine. Would you however mind wrapping this to 80 columns ? I can do
so when applying if it's fine with you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		 */
>  		[RCAR_DU_OUTPUT_DPAD0] = {
>  			.possible_crtcs = BIT(2) | BIT(1) | BIT(0),
> @@ -443,6 +443,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  };
>  
>  static const struct of_device_id rcar_du_of_table[] = {
> +	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
>  	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },

-- 
Regards,

Laurent Pinchart
