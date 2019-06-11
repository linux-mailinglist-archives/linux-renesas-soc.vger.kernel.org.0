Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198123C9CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 13:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389121AbfFKLOv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 07:14:51 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33855 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388978AbfFKLOv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 07:14:51 -0400
Received: by mail-ed1-f66.google.com with SMTP id c26so19507480edt.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2019 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S73QLp7k1DkLPMyXaGEI7D4IlPsMyzjHBqCjsls845U=;
        b=PNIHMXWmURFR09YuixNt0dp7WyiPRhWU/2GKQB3+TssxtDwZBi43ksZoUk/wRPj7MR
         5yZWkZzpUPSsiP6PwnKZ34JcedWYC24gP/EGM0cXZsaxgsfhHUdZoFtmvh5l/58rltFG
         IZD9OeKm6dWT18OnXsqZhWLku2k+oMZcG02Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=S73QLp7k1DkLPMyXaGEI7D4IlPsMyzjHBqCjsls845U=;
        b=G0XLqz1GYNai/pWymdV9xRGYXrNlyzng91K2V6hqi7vQE8oisSAf5VcPe1ARnw7IHd
         EBoHTvcL8k+GxyIyn8mFAxm5KuVnTl3zv3W7mJdKU+Pn+0cWqCuWStzBThbo9+DQM6iK
         yudaS/NOXWLlm4z4bTCmpwvMnuBqA4eXVcFU2OFk/ocfbGvpGquQcNQv5KkxxvQiWqH6
         geq9SbRzbzkMdRBWt1OF8JvCbT9upVqzsxfDRIQMq/oqlrG1Qm4YokKsoP940CuYcBlm
         yh2AkVu5HydICaTmDZ8oSLDHu7zHEe1KkyKMMIDGtnAn8eyx8Q2u3laujHnxj3TbjfdA
         B5Lw==
X-Gm-Message-State: APjAAAXwZEdfT4UT2o1vm90mpFbvMR3M0peW1AygthgpSqJhAHR6wXbC
        B92pFpz5vxxBo8aoTisyuAzCAw==
X-Google-Smtp-Source: APXvYqzUxEkCuN8r8cG9MfXkZcN34e68nY4KH42pTdAqiBno+kj8cmEaUq0yrdb9R0+twEpIPz8Y6g==
X-Received: by 2002:a50:a389:: with SMTP id s9mr80137619edb.113.1560251689829;
        Tue, 11 Jun 2019 04:14:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n5sm3542176edt.65.2019.06.11.04.14.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 04:14:48 -0700 (PDT)
Date:   Tue, 11 Jun 2019 13:14:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.3] R-Car DU changes, v2
Message-ID: <20190611111442.GA2458@phenom.ffwll.local>
References: <20190607234743.GD5110@pendragon.ideasonboard.com>
 <20190608134652.GE4786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608134652.GE4786@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jun 08, 2019 at 04:46:52PM +0300, Laurent Pinchart wrote:
> Hi Dave,
> 
> If you haven't pulled the previous pull request yet, please disregard it
> and process this one instead. It contains additional patches that add
> support for more plane formats.
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/du-next-20190608-2
> 
> for you to fetch changes up to cb5f15b711d3ace7b29369657487f1281a4a5eac:
> 
>   drm: rcar-du: Add support for missing 16-bit RGB1555 formats (2019-06-08 16:36:41 +0300)
> 
> ----------------------------------------------------------------
> R-Car DU changes for v5.3:
> 
> - R8A774A1 SoC support
> - LVDS dual-link mode support
> - Support for additional formats
> - Misc fixes

I wasn't quite sure whether this has enough dt-acks, but I guess one r-b
from Rob on the main dt patch should be enough. And everything else looks
very neatly reviewed!

Thanks, pulled.
-Daniel

> 
> ----------------------------------------------------------------
> Biju Das (4):
>       dt-bindings: display: renesas: du: Document the r8a774a1 bindings
>       dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
>       drm: rcar-du: Add R8A774A1 support
>       drm: rcar-du: lvds: Add r8a774a1 support
> 
> Kieran Bingham (1):
>       drm: rcar-du: writeback: include interface header
> 
> Laurent Pinchart (10):
>       drm: bridge: Add dual_link field to the drm_bridge_timings structure
>       dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
>       drm: bridge: thc63: Report input bus mode through bridge timings
>       dt-bindings: display: renesas: lvds: Add renesas,companion property
>       drm: rcar-du: lvds: Remove LVDS double-enable checks
>       drm: rcar-du: lvds: Add support for dual-link mode
>       drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
>       drm: rcar-du: Add support for missing 32-bit RGB formats
>       drm: rcar-du: Add support for missing 16-bit RGB4444 formats
>       drm: rcar-du: Add support for missing 16-bit RGB1555 formats
> 
>  .../bindings/display/bridge/renesas,lvds.txt       |  19 ++-
>  .../bindings/display/bridge/thine,thc63lvd1024.txt |   6 +
>  .../devicetree/bindings/display/renesas,du.txt     |   2 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c              |  54 +++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  30 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  12 ++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  82 ++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   1 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 127 +++++++++++++++------
>  drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
>  include/drm/drm_bridge.h                           |   8 ++
>  11 files changed, 298 insertions(+), 48 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
