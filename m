Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD4CB4BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 09:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387851AbfJDHCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 03:02:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42448 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387420AbfJDHCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 03:02:36 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59CB8592;
        Fri,  4 Oct 2019 09:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570172554;
        bh=+8JuRiBylKBi8jvQtiwjfnTISZPsR2OZbRJ1IJE/Qjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f0wsefBx4ByR1SKVDBPpdCB/G1spyTdTPPXi/abj8hinwRwwIZeYXWfSZ28WXADCp
         ojOpgdUQh9RBmePajh/c12wfnBme7Aeto3lm66hIMeYwk0vgKDKmnz6ZS/UTc9QaWH
         n+rZekhxnkk3BJoV7NSjbNNqIaHajANR5xvdMIB4=
Date:   Fri, 4 Oct 2019 10:02:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add RZ/G2N DU support
Message-ID: <20190930231125.GA10149@pendragon.ideasonboard.com>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patches;

On Mon, Sep 30, 2019 at 10:15:01AM +0100, Biju Das wrote:
> This patch series aims to add binding/driver support for
> R8A774B1(a.k.a RZ/G2N) DU (which is very similar to the R8A77965 DU);
> it has one RGB output, one LVDS output and one HDMI output.
> 
> Biju Das (4):
>   dt-bindings: display: renesas: du: Document the r8a774b1 bindings
>   drm: rcar-du: Add R8A774B1 support
>   dt-bindings: display: renesas: lvds: Document r8a774b1 bindings
>   drm: rcar-du: lvds: Add r8a774b1 support

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

>  .../bindings/display/bridge/renesas,lvds.txt       |  1 +
>  .../devicetree/bindings/display/renesas,du.txt     |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 30 ++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
>  4 files changed, 34 insertions(+)

-- 
Regards,

Laurent Pinchart
