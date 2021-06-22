Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7813B0FA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 23:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhFVVz2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 17:55:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54436 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhFVVz2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 17:55:28 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 048E7E6B;
        Tue, 22 Jun 2021 23:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624398791;
        bh=91kmGklfIbkTHDp1AbTzbfAd/5MhGYK8aUr7hM2kxwI=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=vBXjbwgh8EIEuksx1kMhhokbCMh+DzI57HucLwaQoqVf/uG+3OOXc2XUAMmagYUtj
         PGPXPsLZDPemkp47+4Nr6IRjU3zRQgYwyFHHvnsAL+mh6JRTYFGx4fPXROAh7Qre9P
         0z80SD9VSFwk7IkleUJ63KCxCOKD4TzRCMm92EqI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 0/4] Converter R-Car DU to the DRM bridge connector
 helper
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <07173239-7f08-f7a6-4761-2f56cbbc85d2@ideasonboard.com>
Date:   Tue, 22 Jun 2021 22:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 20/05/2021 07:50, Laurent Pinchart wrote:
> Hello,
> 
> This patch series converts the R-Car DU driver to use the DRM bridge
> connector helper drm_bridge_connector_init().
> 
> The bulk of the v1 series was converting the adv7511, simple-bridge and
> dw-hdmi drivers to make connector creation optional (through the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag), and have already been merged. v2
> included the remaining patches and has bitrotten. v3 rebased the code
> and should be ready for merge.
> 
> Patch 1/4 adds support to the dw-hdmi driver to attach to a downstream
> bridge if one is specified in DT. As the DT port number corresponding to
> the video output differs between platforms that integrate the dw-hdmi
> (some of them even don't have a video output port, which should probably
> be fixed, but that's out of scope for this series), the port number has
> to be specified by the platform glue layer.
> 
> Patch 2/4 then addresses the rcar-lvds driver. Instead of implementing
> direct support for DRM_BRIDGE_ATTACH_NO_CONNECTOR, it simply removes
> code that shouldn't have been in the driver in the first place by
> switching to the panel bridge helper.
> 
> Patch 3/4 specifies the port number in the R-Car dw-hdmi glue layer, as
> required by 1/4.
> 
> Patch 4/4 finally makes use of the drm_bridge_connector_init() helper.
> 
> The series has been tested on the Renesas R-Car Salvator-XS and Draak
> boards with the VGA, HDMI and LVDS outputs.

I'll start here,

This series fixes the connector issue I had on V3U, and removes the need
for me to carry a workaround. So that's excellent ;-)

For the series,

Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com> (on V3U)

> 
> Laurent Pinchart (4):
>   drm: bridge: dw-hdmi: Attach to next bridge if available
>   drm: rcar-du: lvds: Convert to DRM panel bridge helper
>   drm: rcar-du: dw-hdmi: Set output port number
>   drm: rcar-du: Use drm_bridge_connector_init() helper
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  54 +++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  26 ++++-
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c    |   1 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c       | 120 +++-------------------
>  include/drm/bridge/dw_hdmi.h              |   2 +
>  5 files changed, 89 insertions(+), 114 deletions(-)
> 
