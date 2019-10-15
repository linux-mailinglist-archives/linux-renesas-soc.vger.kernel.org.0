Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FC5D7C6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 18:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388286AbfJOQzB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 12:55:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57130 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfJOQzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 12:55:00 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85EDC324;
        Tue, 15 Oct 2019 18:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571158497;
        bh=WOk9Rl/94vhaYcZy/MBFyHM9vyXT8YyyEUhoevdSg9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p5Ddy4+2aU9kWNpMX2TTyVCyBrNjvdRk2LlJCwUSNY9lXd7g9kHEuSyJuz27X198h
         ZGn0unbdjz9BakZ+SyXxq1mXqPq3W8EnqTvvWqKPmcU/OMqSVD1G/F++w2G6MMBs3C
         NfVadEe3svJjsvWjoXaKr9103oTThcCyYCVm8bc4=
Date:   Tue, 15 Oct 2019 19:54:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
        seanpaul@chromium.org, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20191015165454.GL4875@pendragon.ideasonboard.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jcopo,

Thank you for the patches.

On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> References:
> A reference to the v1 cover letter, with some background on the CMM is
> available here:
> https://lkml.org/lkml/2019/6/6/583
> v2:
> https://lore.kernel.org/linux-renesas-soc/20190706140746.29132-10-jacopo+renesas@jmondi.org/
> v3:
> https://lore.kernel.org/linux-renesas-soc/20190825135154.11488-1-jacopo+renesas@jmondi.org/
> v4:
> https://lore.kernel.org/linux-renesas-soc/20190906135436.10622-1-jacopo+renesas@jmondi.org/
> 
> Again, quite a consistent changelog, mostly due to the developments happened on
> Ezequiel's VOP unit following Sean's advices.
> 
> I here implemented the same, and moved the CMM handling to the crtc being and
> enable callbacks. As a result the overall implementation results quite a lot
> simplified, mostly on the CMM driver side.
> 
> I have dropped tags and acks on the CMM driver and CMM enablement patches in
> DU crtc driver because of the number of changes.
> 
> A more detailed change log:
> 
> - Rebased on renesas-devel-2019-10-07-v5.4-rc4
> 
> * Bindings/DT
> - Included Rob's comments on the yaml file license and the use of 'OneOf'
>   in the compatible property description
> - Use the bracketed style suggested by Kieran for the 'renesas,cmm' property
>   introduced in patch 2
> - Re-order the properties in the SoC DTS files as suggested by Kieran
> 
> * CMM/DU
> - As anticipated, moved CMM management to the crtc from the atomic commit tail
>   helper where it was implemented in v4
>   This allow to correctly support resume/suspend and proper ordering of the CMM
>   enable and setup operations (enable -before- setup)
> - As a consequence the CMM driver is greatly simplified by removing the need
>   to cache the LUT table entries provided to cmm_setup() and later re-apply
>   them at enable time.
> - Better support handling of disabled CMM config option by returning -ENODEV
>   at cmm_init() time as suggested by Kieran.

Could you, for your next series (hopefully not CMM-related :-)) move the
changelog to individual patches ? Having it in the cover letter requires
going back and forth, and also doesn't provide detailed changelog. I
recommend adding below a --- line in the commit message, so that every
time you commit --amend to update a patch, you can record the exact
detailed change at the same time.

> * Testing
> I have tested by injecting a color inversion LUT table and enabling/disabling it
> every 50 displayed frames:
> https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut
> 
> CMM functionalities are retained between suspend/resume cycles (tested with
> suspend-to-idle) without requiring a re-programming of the LUT tables.
> 
> Testing with real world use cases might be beneficial. Rajesh are you still
> interested in giving this series a spin?
> 
> Laurent, Kieran, could we fast-track review of this and hopefully try to have it
> merged for v5.5 ?
> 
> Thanks Ezequiel for having suggested me this solution.
> 
> Thanks
>    j
> 
> Jacopo Mondi (8):
>   dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
>   dt-bindings: display, renesas,du: Document cmms property
>   drm: rcar-du: Add support for CMM
>   drm: rcar-du: kms: Initialize CMM instances
>   drm: rcar-du: crtc: Control CMM operations
>   drm: rcar-du: crtc: Register GAMMA_LUT properties
>   arm64: dts: renesas: Add CMM units to Gen3 SoCs
>   drm: rcar-du: kms: Expand comment in vsps parsing routine
> 
>  .../bindings/display/renesas,cmm.yaml         |  67 ++++++
>  .../bindings/display/renesas,du.txt           |   5 +
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  39 ++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  31 ++-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  31 ++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  21 ++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  21 ++
>  drivers/gpu/drm/rcar-du/Kconfig               |   7 +
>  drivers/gpu/drm/rcar-du/Makefile              |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c            | 198 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h            |  60 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  89 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c       |   5 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  82 +++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
>  18 files changed, 665 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> 

-- 
Regards,

Laurent Pinchart
