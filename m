Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 716E43C600
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 10:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404604AbfFKIfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 04:35:10 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39218 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404567AbfFKIfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 04:35:10 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so18788135edv.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2019 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TzDed0TQJg1TrUTqXFz4gFbkb3HIFlYJIYHPgH1TAN0=;
        b=b4p2eEzkP9xoqMxKO+DIHblA//EqoHEycgIVXqeT12ihB5DxdEq4IC4XO27th34gUB
         Oa+3Slvpx9BtR2C1XZqxXadiGs9EgrWa6mDL52as2+Fu7z4xHXUQ6yBPslrRhajIARo0
         Fktn85nn10FSGjtSZ9cimKu4bOz2cEUwYN01k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=TzDed0TQJg1TrUTqXFz4gFbkb3HIFlYJIYHPgH1TAN0=;
        b=LfUQ49SW7vTjRFfZ8Yk/zFt/0qrVBlfsjBzqvxUMeoeQTNH1R0DBBgUWUYsOkjNiZL
         bWVLmY50kq0FOLH9zPD3gty/EAkYgJkMoRFTnbPMGUDqztDme1f5qYblHBn1cHzWS1pM
         jYnAPzh76DP/YEw48BtcvzboB5W5VBawIyj7yAJKarH633roIeimR+fl6Y83j6fHE2eR
         J3Jgb3eU0A0KdILpQMureYdAlj55h75w2jQuRC0nLS0TpM/brQ22kO9sNWE0miYvJ6s1
         sCc2uTypxvV/ceqZ0mc+hUKq06SWQLyB2Yy0guQdC6846OC1JPhtjFLeKecryxA4A3Yp
         BaFA==
X-Gm-Message-State: APjAAAWzZfzbjWN1Z+NuI64Dwh0K+CPQ04CuCqMLZ7aOCprIWUYW+Fcc
        hhKk4S+knC5GM6H3qSDR5c8fsw==
X-Google-Smtp-Source: APXvYqyeJj6lOkP+dwksPbzO2lb4Yyucbsii/T+oZq4h1bcb9avDmrGSWIhEhtJhGDZrbz5+YrIGCQ==
X-Received: by 2002:a17:906:5806:: with SMTP id m6mr6861002ejq.219.1560242108736;
        Tue, 11 Jun 2019 01:35:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id g37sm2909408edb.50.2019.06.11.01.35.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 01:35:07 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:35:05 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: panels: Add MAINTAINERS entry for LVDS panel
 driver
Message-ID: <20190611083505.GR21222@phenom.ffwll.local>
References: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jun 08, 2019 at 05:12:41PM +0300, Laurent Pinchart wrote:
> As the DRM LVDS panel driver uses a different approach to DT bindings
> compared to what Thierry Reding advocates, add a specific MAINTAINERS
> entry to avoid bothering Thierry with requests related to that driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2f487ea49a..713733afec17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5021,6 +5021,14 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/i810/
>  F:	include/uapi/drm/i810_drm.h
>  
> +DRM DRIVER FOR LVDS PANELS
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +L:	dri-devel@lists.freedesktop.org
> +T:	git git://anongit.freedesktop.org/drm/drm

Panels are maintained in drm-misc. Pretty much nothing wrt drivers is
directly maintained in drm.git itself.

Also, you'd actually have commit rights for drm-misc, as opposed to
drm.git :-P

With that fixed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +S:	Maintained
> +F:	drivers/gpu/drm/panel/panel-lvds.c
> +F:	Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> +
>  DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
>  S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/mga/
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
