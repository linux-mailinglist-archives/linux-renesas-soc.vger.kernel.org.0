Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586B446354E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 14:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbhK3NYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 08:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240046AbhK3NY3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 08:24:29 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980F3C061758
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:21:03 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id v64so52574771ybi.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 05:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q10SE73N8n1ItZ90HNcXpg0LKiw8FfWs2GwuL0D4PbM=;
        b=P7CugpU6L0beW6N08lrK/mIinli/Ks4thQRVKX8tHAoTA1nshWczrg213LYeiQOz8/
         ndcQm7APsw/hpWLePQTgdjIkQtAzVx0h/SXGy0Amhzcwd8DwlF1IsKakMXjYyRSOItkv
         Qwdct9w0j1rT14ye2mzat3Ulzdt5uW5ucjJzuYLDpvm/Vz6pWQhI0qWD0mNLBwzU9RdP
         eqpuC3ev9dRuZ1uLpu9iwKpmMUb8b+DcbMh0PIaFubEH/GBO28g+a7x5xx56wW51t3nN
         c+RryuXAcI1zuoeBy+7TGvd2bNuZ88aQshW0Y5PKslnjq0HP2ZAjN9TptRNNxhp50GD/
         hWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q10SE73N8n1ItZ90HNcXpg0LKiw8FfWs2GwuL0D4PbM=;
        b=URjJluXq9eKAYbuYmMxW8/MAFC+EZju9lssnLrXL3NxbZr+jybHTuemvFGAiyKoxNm
         BN/ypvAEvlOvRiQhiLwuZxHzZfC9imbmzOhZF0ccYL2+BfSeFIuxdKyhZR/znZTEFLIg
         L0sjA8OWTvcgB1P2nHBJd/Jhn3OzpBS5TZpOAWl8GgkWwf86yg42KNfbCHJh/UpM6ibX
         bCgRNtWBLjmrcqk0GkNN/UJg5xZa73G+40n24A5mZXxrtdxjT3gXDrZw+CTABXBkNCK4
         K2+fQdkIVktkSSBOlGigzfd7gK2Q+AW7vnrt8ti4vPbFetkE2GzLplU2oDy7KJ6XfbnZ
         tfZg==
X-Gm-Message-State: AOAM5312oRoDfHh6xnLIwjoAX+XIdTkpJP4z1z+QWnEjrYQof6IQQQ1f
        ELTd1hC/ecZxRcL5nXGWtA5TYhc7cfw5ork2ScnbZ548bl0=
X-Google-Smtp-Source: ABdhPJyrh7gbJnnJ1YBpJoDyxJrYbXi//k274SiynG22v+OkN3Z3G39FqQKObaECw08h2q5Mmt7YyrsPVw+lkyr9UJc=
X-Received: by 2002:a25:b96:: with SMTP id 144mr40193349ybl.188.1638278459412;
 Tue, 30 Nov 2021 05:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20190509054518.10781-1-etom@igel.co.jp> <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp> <20190511181027.GC13043@pendragon.ideasonboard.com>
 <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com> <CAPj87rNPiLve14H85ZBbn-oozqgeS26DGUCg2oJ8LupAdYcEqA@mail.gmail.com>
 <YZZdjlzFPDCbAfQU@pendragon.ideasonboard.com> <6b27be2c-9b13-38ef-ca6a-77c986757386@igel.co.jp>
In-Reply-To: <6b27be2c-9b13-38ef-ca6a-77c986757386@igel.co.jp>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Tue, 30 Nov 2021 13:20:48 +0000
Message-ID: <CAPj87rPjCtXLtsfh2V=rPo_tcAQC64cWJXu89qCNb+iQCi1Wag@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
To:     Esaki Tomohito <etom@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Esaki-san,

On Tue, 30 Nov 2021 at 08:44, Esaki Tomohito <etom@igel.co.jp> wrote:
> On 2021/11/18 23:05, Laurent Pinchart wrote:
> > On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> >> Laurent's concern is that the DRM core should handle this rather than
> >> open-coding in every driver, which I agree with. Some drivers (e.g.
> >> radeon, maybe legacy NV?) do not support modifiers, and _also_ do
> >> magic inference of the actual layout of the underlying buffer.
> >> However, these drivers are legacy and we do not accept any new
> >> addition of inferring layout without modifiers.
> >>
> >> I think the best way forward here is:
> >>    - add a new mode_config.cannot_support_modifiers flag, and enable
> >> this in radeon (plus any other drivers in the same boat)
> >
> > Is there an easy way to identify the drivers that need this ?
>
> Should I find a driver that has not use drm_plane_funcs?

I don't think there's a good way to systematically audit it. The only
two I know are radeon (i.e. pre-amdgpu) and nouveau (pre-nv50), both
of which pass no modifiers to drm_universal_plane_init(), but do have
magic back channels to communicate tiling information. If anyone knows
of any others, well, I guess we'll find out. :)

> >>    - change drm_universal_plane_init() to advertise the LINEAR modifier
> >> when NULL is passed as the modifier list (including installing a
> >> default .format_mod_supported hook)

... except when cannot_support_modifiers is set.

> >>    - remove the mode_config.allow_fb_modifiers hook and always
> >> advertise modifier support, unless
> >> mode_config.cannot_support_modifiers is set
> >
> > Looks good to me.
>
> I agree with this way, I'll try to create a patches.

Thanks a lot! :)

Cheers,
Daniel
