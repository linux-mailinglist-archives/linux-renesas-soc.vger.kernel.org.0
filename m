Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37501D6CFC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2020 22:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgEQUwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 May 2020 16:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgEQUwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 May 2020 16:52:53 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365D4C061A0C;
        Sun, 17 May 2020 13:52:53 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id m18so1901328vkk.9;
        Sun, 17 May 2020 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kRpHuRKc3Bl5TABsYSL7dPRXInYL17v1wVRbBgtX7NU=;
        b=BHa30mzp37Lx79gKYaUpW35MfR/+nyf53/vZfb5HUDKCP+7TubeNHZQ1DYE/8kYYbn
         jEzI8UdvK58BUbyWQOKQEf/UJOkvX2dQA3eOITt4CKH8Z5cJ7UILc9Vvj3fO0yh4vWEg
         3x97oavd04iRx/wYwoNap1FdYnqdKNsI6C0xtr8QjajzLqGzEb793iL99VwfdWu6XTEa
         qstMMN+z9D5pwTONtStgS/sHYzMx0w0zv1ToEKy7mZjWuNtHD1YKBt+qgegXJ1GKq3Rd
         ZxFAw376tZwcO24fv/PuyU/MiOMGhFcrkZUJmJOMjBs3noHZ/tFm0BH4Trz0THJHhNRb
         PPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kRpHuRKc3Bl5TABsYSL7dPRXInYL17v1wVRbBgtX7NU=;
        b=rxwn2oCfeic4XkTQVBBDXwVT8NHw44dOQOljkCSEIURacv3g8UtEeUcuHVyhss3tCf
         SBqLitjunUTD8kYE1OGGIJhfIjpX9dIhdVZBWhqSrQX/3oVXoErR0lz1cc1LKReE26qe
         UjGQr9aJn9EYBD6ytdqZvWKJNOAGO7/vYqHQILHvFTbPISIzhSeBa4Dx19ltbqt3XfJY
         Dx7O/kPdlVypMvKjRjeDhgd5q3whNdF51xJQp/FLm4m0n4IPade3xvFI0/Rhqoa4h5Uu
         WQfk+pbcVOvrkwZBHUiAynESwVOW+P94xVDTwb/7U4wmuyH0nGGxgTQxdpO4b534j2ax
         7A2A==
X-Gm-Message-State: AOAM5331gJAs+sKu/gOgZvx+C9IVioVKz8ATX3n5rZ2i3DFs+Y+KtZEj
        Hi36dzBUctqSGLOGUyDZ6ztGSCvaGwjmdXh4/+A=
X-Google-Smtp-Source: ABdhPJxxoulbFHKkk5sAmi3frB7/d9hBxGQD8EXWebg6haLP3CNxcYOexxdkVTIOKDudrgSrCIxG+52osvlzN3ensV0=
X-Received: by 2002:a1f:ac0e:: with SMTP id v14mr9168388vke.28.1589748772323;
 Sun, 17 May 2020 13:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
 <20200512162837.GJ13516@ninjato> <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
In-Reply-To: <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Sun, 17 May 2020 21:50:03 +0100
Message-ID: <CACvgo51TTsggO4r3C5rsmgJP6w41twD4ngX6M5QxhyH7Jj4v0Q@mail.gmail.com>
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

On Wed, 13 May 2020 at 10:35, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Hi Wolfram,
>
> On Wed, 13 May 2020 at 10:10, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > On Mon, Mar 16, 2020 at 05:39:05PM +0100, Wolfram Sang wrote:
> > > While converting I2C users to new APIs, I found a refcounting problem in
> > > the encoder_slave implementation. This series fixes it and converts to
> > > the new API.
> > >
> > > Based on linux-next and only build tested.
> > >
> > > Wolfram Sang (2):
> > >   drm: encoder_slave: fix refcouting error for modules
> > >   drm: encoder_slave: use new I2C API
> > >
> > >  drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > Is there someone I should add to the CC list maybe?
> >
> The series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Unless someone beats me to it, I'll commit them to drm-misc later today.
>
And after a short delay, pushed to drm-misc-next.
Thanks for the patches Wolfram.

-Emil
