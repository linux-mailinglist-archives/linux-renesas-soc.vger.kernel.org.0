Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2734B16447F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 13:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgBSMk6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 07:40:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36115 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgBSMk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 07:40:58 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so371867wru.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 04:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LjRLU1S8ubvmSNDUw0qavhTBctk1LWngefBqopvudHg=;
        b=CYKxIYAw/qJ8aQWgaKub255KGYLrhVtUoKJYKd4LFs9xi0DIul5gBRhW67dgYdpka6
         Sw3MdL7PnGA2UTvg3r/E1FK483pMhgQwk5svaK4wbf7mBERi13FeQK41cUjKd6hXw3TQ
         rpc5mlnsw/6k+xCecmyMUVqS3feSSJVME4ET8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LjRLU1S8ubvmSNDUw0qavhTBctk1LWngefBqopvudHg=;
        b=t4Pvf1qdl+1iHZMpSUgtQCO9euIfhkHIWE3oT/L2lKR0UJmnAjV7runOwG1QtX/ICj
         A2nyoJ8ZTXVqw4bsuD8/zdR5SISt1az/Duud9inmyFdamv7BQlzLRgOzi3Cx77DkOr7Z
         HfIuyuaE76ve/IYzYwupl75YAddWO6GLw0Uic4+yCr4yvho5we6oRtCrJojv1JK2ch7q
         LbefEpYKNo4JazJZI9p2D7zGAC/IySxT+d0R+2yNjyqoRZ8n45U8jmRFKfwjCbn8V1ms
         TMDRyt9/c9rfYdgYle+JFBM4dcL/vngGYX26wQoGhtqyT91kP6a/MmGsB+UCIvc0KH2v
         Ikyw==
X-Gm-Message-State: APjAAAVGjyeAlMtCay3ii74MBKHx+UVDGFFIY5VAADxgXzxqlARJBqyJ
        5NDDTUpctqxTarh4rlOrtlVhHQ==
X-Google-Smtp-Source: APXvYqwyfla5/5OoJuQjb0Zy7o9RZQQVJKEaRvPBDgnIYUH8Xp/48v1ZgGjUCJTRzNhh1G0d1Zpi2A==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr3012853wrn.8.1582116056215;
        Wed, 19 Feb 2020 04:40:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u8sm2895524wmm.15.2020.02.19.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:40:55 -0800 (PST)
Date:   Wed, 19 Feb 2020 13:40:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200219124053.GQ2363188@phenom.ffwll.local>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
 <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
 <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
 <CAMuHMdUBKJTcPg8GB_c52p8jXWqdn8JX3tiPxsQkRRW2EA3+yA@mail.gmail.com>
 <20200219121727.GC5070@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219121727.GC5070@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 19, 2020 at 02:17:27PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wed, Feb 19, 2020 at 12:10:18PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Feb 19, 2020 at 11:57 AM Daniel Vetter wrote:
> > > On Wed, Feb 19, 2020 at 11:30 AM Geert Uytterhoeven wrote:
> > > > On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter wrote:
> > > > > It's right above the drm_dev_put().
> > > > >
> > > > > Aside: Another driver with a bit much devm_kzalloc, which should
> > > > > probably use drmm_kzalloc instead ...
> > > >
> > > > What's drmm_kzalloc()?
> > > > The only references I can find are in this patch series.
> > >
> > > Yup, it's all new. Read cover letter for reading instructions for the
> > > entire patch series. I'm afraid the driver patches wont make much
> > > sense without the context. None actually :-/
> > 
> > IC, as the cover letter was sent only to dri-devel and intel-gfx, many
> > recipients of the patches won't have received it...
> > https://lore.kernel.org/dri-devel/20200219102122.1607365-1-daniel.vetter@ffwll.ch/
> 
> I was also going to mention that it would be nice to send the cover
> letter to all recipients from the series, otherwise it's a bit painful.
> Daniel, is this something that could be integrated in your workflow ?

No, the usual result of that if you do it is that mail servers scream at
you for too many recipients.

dri-devel is on lore.kernel.org now, with full historical backlog, so all
there.

https://lore.kernel.org/dri-devel/20200219102122.1607365-1-daniel.vetter@ffwll.ch/T/#t

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
