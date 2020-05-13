Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82DF1D0C6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 11:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEMJib (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 05:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgEMJib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 05:38:31 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2D7C061A0C;
        Wed, 13 May 2020 02:38:31 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id v23so4080736vke.13;
        Wed, 13 May 2020 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBsI8/q9tCGEEr55DJmDyAoQAE0dfC+ZmLFYnoZKRCY=;
        b=MxYtgadZIuiNwe154KOVvjuls/0cwiolNG2D9UH9scIN/ePCk8mhg33byFHHVmf9Lo
         5791+hCe5kOsHfd6lXsklQ29x9dARBVEQbQw0YFuNxd33xvKOHa7gJwNSPy1Jy5EejHS
         ZFIIXzSsh2EXBM3S0HNPbUxKCntLv0s6rn7+oNVTxCKOSl96yrhvm95FdSMfJbQOLQor
         byRRgFAILKpv4Xpms63nR0Qs7sL2syoxP3R1+VdzWUUFzS6aWc/2yC06x0YO3WPLlEQk
         PVfLyEBljZ/VHiiSZw9omyHNLvAjGok1IICKKgT2A6KdNWPEmxXBJHlr/n85hlcTuzbv
         vlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBsI8/q9tCGEEr55DJmDyAoQAE0dfC+ZmLFYnoZKRCY=;
        b=aboneyqEef7AjCzlUdUFN5EjIKqiyR4735bc8mal+ggsuQ22Hrfyu5tP9/YTtKvnbf
         LtQriJVfzUu7fqfbkU6IInkq3cwgF+0aVjD266Xf34/cd3GVIgB7fbbSH8hQuJpxsNX6
         HWNqB+TiiKjJr88OmS/1ocxfTwD6aD8VF4djxFcxz8TuOjzKzY6aXRtXxQ5DhJwrwQ3m
         DDn52QpiN0oGKi62wb4ZCdey5U7ip5NNiEq6d9mouEWXqnMdklyE17tHQh0QB4kqUI36
         IRoApq+QnW29ph2BqweNq3LTzf5dA6e7JS17milfN3qgLdJ2de6O+BGJHUafgRRWQ3k/
         swAA==
X-Gm-Message-State: AGi0PuZumfmhwyx1DjfkHoipmn7QBxRJEpl+2E6Tzexsey3JjwAfI4mc
        FxVIpiIfjJyXAM04ZCLRxux8/SFfkV2AvJZi3H4rkg==
X-Google-Smtp-Source: APiQypKmaaAa47QovnAzyFDTLeQNTPb9fvrKbCBsSUUUr20M3otbNDJLYwk5l9cb4/1Lsw0VMkkPYL0pPw04l6brm5E=
X-Received: by 2002:a1f:a454:: with SMTP id n81mr20221401vke.6.1589362710294;
 Wed, 13 May 2020 02:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com> <20200512162837.GJ13516@ninjato>
In-Reply-To: <20200512162837.GJ13516@ninjato>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 13 May 2020 10:35:49 +0100
Message-ID: <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: encoder_slave: some updates
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Dave Airlie <airlied@redhat.com>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, 13 May 2020 at 10:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Mar 16, 2020 at 05:39:05PM +0100, Wolfram Sang wrote:
> > While converting I2C users to new APIs, I found a refcounting problem in
> > the encoder_slave implementation. This series fixes it and converts to
> > the new API.
> >
> > Based on linux-next and only build tested.
> >
> > Wolfram Sang (2):
> >   drm: encoder_slave: fix refcouting error for modules
> >   drm: encoder_slave: use new I2C API
> >
> >  drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
>
> Is there someone I should add to the CC list maybe?
>
The series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Unless someone beats me to it, I'll commit them to drm-misc later today.

-Emil
