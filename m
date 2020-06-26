Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705AC20AEE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 11:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgFZJZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 05:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgFZJZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 05:25:58 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40E8C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 02:25:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z13so8792099wrw.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4QboZ+2BYaxwFLVRZE8pYUcmIgl+vR3O91iE5KRbMc=;
        b=Artw0zulwtDI/tGmL95uMhiddF93m595rGy03Zk1iMnIh1widOXNePpRNBDDNkusI6
         nQBKrbeTvVBSwkhtq99Dgb6AGC7YIoQwcCtSB1oaFIUrZXfM8GsP4n2tUfQdzLK67PdG
         Bo8EXMjiI9nMmGS3v5cdpELPJKh1akyh837vaf6BddHTUNIAMmZ5ewdKN2JyenXDuUwd
         1GbEqrtZScuDZknjwv+MQikYlwO1AK9U4Z7PVk2eMiSxdXtu5bfwnM6Gh+x1HLEhrs4K
         0ag+n2DyGzeWjz1eeELP2TlQ6fuY1HJ7c289GSjvbK24jEghcCmeKmk5FGEK1uR7ceQi
         2a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4QboZ+2BYaxwFLVRZE8pYUcmIgl+vR3O91iE5KRbMc=;
        b=K4JdatjCD0k792KmiZYkCcw9Erx/Xd5Fa620IAsRHjFVzYdBYemak2MSKW+dLcrd5r
         lSTfmDUqr5z8ZGmi+VfgnF/osrA8A7J/XvxTXPsdsbD50l89AmS8xMoQcCJBV+Xq+7xg
         DqvoqUhuiqCZ07WcZ2LJI9WuYqw25ez4bNuHnSaw2k5EskP1F3bcgdXgldGOb/lLVqdi
         Cfeco3L+RcVQAwWgJvUV/cPK94Cz+HPhrsYT80IPClrmdD4YyI8mzQMLRuLpNNmU73eQ
         ZaJoHY0jTqYllBCax4CwvbZBtCvl1MqQxeyH4FFtg47v0ZGqyOjmz9oWS0tE+4291M8E
         yTlg==
X-Gm-Message-State: AOAM533XDkBtpMQKcufEJZBJ1zVKvtQuxH7JKoq4jZMHoGCX2Sk2pdxQ
        0E2J8sEzMXkLxF9oOsI9y4sfIqkXVZ2gRfEkCm+Gvg==
X-Google-Smtp-Source: ABdhPJziZBr18mhrggpfS2x3HdfY+CYO0A70NiaVkBhAoksbbX17oyoZOYgWqaoO72WmViYHknTtYHeVMn6O87BVprg=
X-Received: by 2002:adf:8091:: with SMTP id 17mr2688885wrl.244.1593163556649;
 Fri, 26 Jun 2020 02:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org> <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local> <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local> <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
 <20200625133157.0e749602@eldfell> <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
 <20200626115957.566efa5b@eldfell>
In-Reply-To: <20200626115957.566efa5b@eldfell>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 26 Jun 2020 10:25:45 +0100
Message-ID: <CAPj87rMo61nVdhVo4HVc2-Lqb9EHgZmGVc7cFaRuuN1zGHQtPQ@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown state
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Fri, 26 Jun 2020 at 10:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Thu, 25 Jun 2020 12:44:36 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> > Maybe an aside, but the guideline is for autoconfiguration:
> > - Light up everything that has connector status connected.
> > - If nothing has that status, try to light up the connectors with
> > status "unknown".
> >
> > This is only really relevant on older platforms, mostly for VGA and
> > somewhat for dvi outputs.
> >
> > Maybe another thing we should put down somewhere in the uapi docs ...
>
> As I had no idea what "unknown" means or when it can happen, I assumed
> that it must mean "the hardware cannot know". If the hardware cannot
> know, then I certainly will not be trying to enable that, unless
> explicitly configured to do so. Having a phantom output is worse than
> having a real output that does not light up, because it's not obvious at
> first with phantom output that anything is wrong. You may just be
> wondering where your windows disappear, or where did you mouse cursor
> go, or why you see a wallpaper but no login dialog, etc.

How about a refinement of Dan's suggestion, proceeding down this
logical order and breaking if true:
- ignore all disconnected outputs
- if any outputs are connected, ignore all unknown outputs
- if only one output is unknown, use only that output (with default
mode if need be)
- if any outputs are unknown but have EDID present, use only those outputs
- at this point, we have multiple unknown outputs with no EDID - break
and demand explicit user configuration

Cheers,
Daniel
