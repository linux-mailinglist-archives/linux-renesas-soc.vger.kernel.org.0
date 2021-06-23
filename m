Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1803B118E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 04:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhFWCMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 22:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWCMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 22:12:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F720C061574;
        Tue, 22 Jun 2021 19:10:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 391EA9B1;
        Wed, 23 Jun 2021 04:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624414224;
        bh=93LMMNTAt4uAzlvI1TIp36PyNMZaJQuvuK+SM2yxdQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UTEL7y4rsEJ6MGUTGAcjEGqmwvmu/s0rdDAlssok3fuCu8oKoS+BhXc+2wuQ9EVv0
         H2oyM/BBXzGGXI4G0J7MtILjNEwVpVTPyK5uhtg2ZdGU1cyb6CRr/IVcMw7PatRhrX
         kIr1G3a92sgp6PZuAE748CKEfTGTcHpSn3w1E26k=
Date:   Wed, 23 Jun 2021 05:09:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm: rcar-du: V3U support
Message-ID: <YNKX8qN4YtjFlW6T@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

It seems that the cover letter didn't include the mailing lists on CC,
fixing this.

On Wed, Jun 23, 2021 at 12:20:21AM +0100, Kieran Bingham wrote:
> Extend support for the V3U Display Unit, making use of the {recently,
> soon to be} posted DSI encoder from Laurent.
> 
> Patch 1 just cleans up in preparation for patch 3, and patch 2 is
> required for operation on the V3U, however it is functional and should
> be correct for the D3 and E3 as well, as they also lack external sync.
> 
> Patch 3 enables the V3U and connects it to the MIPI DSI encoder, of
> which I'm in a race between me and laurent for posting these patches ;-)

You won the race :-)

> Tests have been run and produce images - but there are artifacts visible
> and some modes are unavailable, which will need further investigations,
> but can be done on top of this integration.
> 
> Kieran Bingham (3):
>   drm: rcar-du: Sort the DU outputs
>   drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
>   drm: rcar-du: Add r8a779a0 device support
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 25 ++++++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h    |  6 ++++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 21 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  6 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  4 ++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c   |  2 ++
>  6 files changed, 61 insertions(+), 3 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
