Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2417124E471
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Aug 2020 03:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgHVBUs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 21:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgHVBUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 21:20:45 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E77FC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 18:20:45 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id t23so2569949qto.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 18:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=alqsuLjRIbrXdAlbW9c5s4ZuhliUbHIiXWeuZS/UsUs=;
        b=r+YcyHmi3Ads0IkAGbm6Tg7P9IhT1PkYzo3vq5csouLShpbtuxhXK9HpZilSnPjShT
         HBCzedlhq9HehZ+1ohCVUxuoySSAN7sG7EX+3276XxYxNoq1sQ6K2mILIazpXJ6rD54I
         d0WdsaaWUCHtoeYeOzMLONgoeMnuBgau7T2AFLc0QaSihvWaL6df0UKMAp5avYCmUdzj
         znphFfwkX2pKhKn9kt4JI3mRvb/fK0vYZLooarVtDoqd4v9Uw1hqzKokv8ZWCZTyGqCj
         8FfHNinLZ5lkgB1V/7cOejmLMtzUgmOggUlIL3kZFLkrg4p2PwdYuB6DAjUg4X67zMts
         G3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=alqsuLjRIbrXdAlbW9c5s4ZuhliUbHIiXWeuZS/UsUs=;
        b=Y5wvlYEsOvOXyKPYTJjaad8NQCVUwy7lPBt6UNo5hYVSIxMb88qkFPRCKwdZ2VvKEZ
         /opPXQRrt7Ygfnlvkn5XkvwEneuNEs/srz8vVCnV2T77GqoJwsH18Vw/hNNEVq61kbOn
         Q2C2gh4WSz14iBclDhQk/oH8S+LnudbrWnNOmz6y5730zcwZaJ6aQ11//1PeaOypY/2Y
         IQJENzQbhnn9m3YCoaK7ixhM7SXVf1nfpVe3TweZChpN8DMF6ff94TG8V5KLxkylYw2j
         8Xrg4ucCpmEQLJCl8PhFAPfPxdDzLt0hcrIp/2THrpCSUdNj2+a3e05fBTNR3tnbcIVs
         ZcKQ==
X-Gm-Message-State: AOAM530hsHRkiw0Al/5tfxH8oJfrXjb8QXogU1ggnboLrJ3ByWiJO/zf
        TAR2vhZogXEkwZPmPaIIf9WtQg==
X-Google-Smtp-Source: ABdhPJxeDssrajw6JuftjZhYmAJqOu1G4f1+FhQrVW3m1ZYoHj7OW72Xb2a+KA1xkh/G9V0FMhugVA==
X-Received: by 2002:ac8:78d:: with SMTP id l13mr5351576qth.188.1598059244689;
        Fri, 21 Aug 2020 18:20:44 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id w2sm3150752qkf.6.2020.08.21.18.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 18:20:44 -0700 (PDT)
Date:   Fri, 21 Aug 2020 21:20:37 -0400
From:   Qian Cai <cai@lca.pw>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200822012036.GA26224@lca.pw>
References: <20200608025340.3050-1-cai@lca.pw>
 <20200608031442.GP22208@pendragon.ideasonboard.com>
 <20200608031622.GQ22208@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608031622.GQ22208@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 08, 2020 at 06:16:22AM +0300, Laurent Pinchart wrote:
> Hi Qian,
> 
> I forgot to mention, I think the subject line should be
> 
> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
> 
> Could you please let me know if you're OK with these two small changes ?

Laurent, this patch is still not in the latest linux-next. Can you take a look?

> 
> On Mon, Jun 08, 2020 at 06:14:43AM +0300, Laurent Pinchart wrote:
> > On Sun, Jun 07, 2020 at 10:53:40PM -0400, Qian Cai wrote:
> > > There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
> > 
> > s/DRM=n/DRM_RCAR_DU=n/ here.
> > 
> > > the generated .config a bit ugly.
> > > 
> > >  # ARM devices
> > >  #
> > >  # end of ARM devices
> > > 
> > >  CONFIG_DRM_RCAR_WRITEBACK=y
> > > 
> > >  #
> > >  # Frame buffer Devices
> > > 
> > > Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.
> > > 
> > > Signed-off-by: Qian Cai <cai@lca.pw>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > No need to submit a v3 if you agree with the above change, I'll fix it
> > in my tree.
> > 
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index 0919f1f159a4..3304b41f5611 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
> > >  config DRM_RCAR_WRITEBACK
> > >  	bool
> > >  	default y if ARM64
> > > +	depends on DRM_RCAR_DU
> 
> -- 
> Regards,
> 
> Laurent Pinchart
