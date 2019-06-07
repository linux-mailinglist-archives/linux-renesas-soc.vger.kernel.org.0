Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092BA39865
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 00:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729042AbfFGWQm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 18:16:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbfFGWQm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 18:16:42 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F4E334;
        Sat,  8 Jun 2019 00:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559945800;
        bh=TAoQFcLoqMcFnlEv8zycGsLhzAAbeVWKoznL0xSvtFo=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wMdvnbfatzKUxEr21SB96l7VBMsViUDQwGgUeoXTD5h8X3lZGFeXZrkoxGuxk7QZ2
         DCSoXK8uobZR4MIKaz7FKMYpTv8Qnsh8zh81LsMRaNu9C11rZ0cIXkKlelWG6Ifbr7
         S9qYQMqdecUIGEe+V1m1rsk8IZPG/W3smTzYZVfY=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 00/10] R-Car DU: LVDS dual-link mode support
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <1385e8b5-1bf9-4a9c-4835-787775b138f2@ideasonboard.com>
Date:   Fri, 7 Jun 2019 23:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 28/05/2019 15:12, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series implements support for LVDS dual-link mode in the
> R-Car DU and R-Car LVDS encoder drivers, and well as in the thc63lvd1024
> LVDS decoder driver.
> 
> LVDS dual-link is a mode of operation where two individual LVDS links
> are operated together to carry even- and odd-numbered pixels separately.
> This doubles the possible bandwidth of the video transmission. Both the
> transmitter and the receiver need to support this mode of operation.
> 
> The R-Car D3 and E3 SoCs include two independent LVDS encoders that can
> be grouped together to operate in dual-link mode. When used separately,
> the LVDS encoders are connected to two different CRTCs and transmit
> independent video streams. When used in dual-link mode, the first LVDS
> encoder is connected to the first CRTC, and split even- and odd-numbered
> pixels. It transmits half of the pixels on its LVDS output, and sends
> the other half to the second LVDS encoder for transmittion over the
> second LVDS link. The second LVDS encoder thus operates under control of
> the first one, and isn't connected directly to a CRTC.
> 
> On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
> LVDS inputs and two parallel outputs. It can operate in four different
> modes:
> 
> - Single-in, single-out: The first LVDS input receives the video stream,
>   and the bridge outputs it on the first parallel output. The second
>   LVDS input and the second parallel output are not used.
> 
> - Single-in, dual-out: The first LVDS input receives the video stream,
>   and the bridge splits even- and odd-numbered pixels and outputs them
>   on the first and second parallel outputs. The second LVDS input is not
>   used.
> 
> - Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge combines the even- and odd-numbered pixels and outputs
>   them on the first parallel output. The second parallel output is not
>   used.
> 
> - Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge outputs the even- and odd-numbered pixels on the first
>   parallel output.


Clarifying this, having checked with you, Dual-in, dual-out means 'even
pixels are received on the first input, and provided on the first
output, and odd pixels are received on the second input, and provided on
the second output'.


> The operating mode is selected by two input pins of the bridge, which
> are connected to DIP switches on the development boards I use. The mode
> is thus fixed from a Linux point of view.

Would there ever by a scenario where these could be connected to GPIO's
and changed dynamically? I guess that might not make much sense - as the
configuration is more use case dependant.


> Patch 01/10 adds a new dual_link boolen field to the drm_bridge_timings
> structure to let bridges report their LVDS mode of operation. Patch
> 02/10 clarifies the THC63LVD1024 DT bindings to document dual-link
> operation, and patch 03/10 implements dual-link support in the
> thc64lvd1024 bridge driver by setting the drm_bridge_timings dual_link
> field according to the mode selected through DT.
> 
> Patch 04/10 extends the R-Car LVDS DT bindings to specify the companion
> LVDS encoder for dual-link operation. Patches 05/10 then performs a
> small cleanup in the LVDS encoder driver. Patch 06/10 implements
> dual-link support in the LVDS encoder driver, which involves retrieving
> the operation mode from the LVDS receiver, locating the companion LVDS
> encoder, and configuring both encoders when dual-link operation is
> desired. The API towards the DU driver is also extended to report the
> mode of operation.
> 
> Patch 07/10 implements dual-link mode support in the DU driver. There is
> no specific configuration to be performed there, as dual-link is fully
> implemented in the LVDS encoder driver, but the DU driver has to skip
> creation of the DRM encoder and connector related to the second LVDS
> encoder when dual-link is used, as the second LVDS encoder operates as a
> slave of the first one, transparently from a CRTC (and thus userspace)
> perspective.
> 
> Patch 08/10 specifies the companion LVDS encoder in the D3 and E3 DT
> bindings. This by itself doesn't enable dual-link mode, the LVDS0
> encoder is still connected to the HDMI output through LVDS receiver, and
> the LVDS1 encoder is not used. Patches 09/10 and 10/10, not intended to
> be merged, enable dual-link operation for the D3 and E3 boards for
> testing and require flipping DIP switches on the boards.
> 
> The patches are based on top of my drm/du/next branch, and are available
> for convenience at
> 
>         git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link
> 
> They have been tested successfully on the D3 Draak board. I expect them
> to work on E3 as well, but I don't have access to an Ebisu board to test
> this.
> 
> Laurent Pinchart (10):
>   drm: bridge: Add dual_link field to the drm_bridge_timings structure
>   dt-bindings: display: bridge: thc63lvd1024: Document dual-link
>     operation
>   drm: bridge: thc63: Report input bus mode through bridge timings
>   dt-bindings: display: renesas: lvds: Add renesas,companion property
>   drm: rcar-du: lvds: Remove LVDS double-enable checks
>   drm: rcar-du: lvds: Add support for dual-link mode
>   drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
>   arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
>   [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
>   [HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation
> 
>  .../bindings/display/bridge/renesas,lvds.txt  |   7 +
>  .../display/bridge/thine,thc63lvd1024.txt     |   6 +
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |  24 +++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +
>  .../arm64/boot/dts/renesas/r8a77995-draak.dts |  24 +++-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c         |  54 ++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  12 ++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           | 126 +++++++++++++-----
>  drivers/gpu/drm/rcar-du/rcar_lvds.h           |   5 +
>  include/drm/drm_bridge.h                      |   8 ++
>  12 files changed, 214 insertions(+), 58 deletions(-)
> 

-- 
Regards
--
Kieran
