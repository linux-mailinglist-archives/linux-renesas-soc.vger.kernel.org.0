Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EFE214B34
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2020 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgGEItk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Jul 2020 04:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGEItk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Jul 2020 04:49:40 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D62C061794
        for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jul 2020 01:49:40 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so41774235ljv.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Jul 2020 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iawHijKqfIsP1Qweg0GzSoNacH+U1bt2Waoj45rkqow=;
        b=0QyX6H6bynGbp+oAxtIuGb55bB7j9Xm7K1SACPw63MbUKQcPIR0QuXbMDIdFczhUd3
         Y9lb2vfyCoerTkvHxrlIP8DJmwmBDAtql2DOqqyO8L7K8IeZvsscJTuCGvN1cwVSyyBc
         coyXjGoUZUSstva+2xQcU48ZoqDWIBpAYJIw8AMCbPSaSul2iL+N3JMb4zAF16t0LZ8k
         fFSAIUIhGoEMNMjpYwcFXXDXxnwjO6wEvxemjyS+h9Fuo2XFqHZKax+pGddXCevMK2As
         bOVspMX8ZsBsZZUgCvejGr8YvVNWd/JkZ0eH14PgY6d3KmVuJj4CsiPKBpnOAm1Zzd9+
         U7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iawHijKqfIsP1Qweg0GzSoNacH+U1bt2Waoj45rkqow=;
        b=RoIyBzVHTfTCt9b5zoVoinwM1Niz0m2tcgus9wllS4mt/ArYO8s3+6gMfF2vZk/Zvj
         TVnNsvz14KTRHpJjKakrqVohQKJrp3p5cUUitSRwqOHqKgZ1pt42Xs3VakEKlweRNwLH
         uq5bSENsDux0HzxheqEEJ+FLSUNItU7hiJlw8dJvcxqz4/+lzlNfB1lO6JEDcLshdKke
         5j0BghSPefFlmDbznlE4bIN0RZ3MoWFsRby9iYaRPP/sFXEw3Osjv1B2RbLgr1z1sga1
         obPJWI5cJr3dScYYN3fW+l03DB878NICWSOcQXcWFsaDntgcSUjY7KiNAIv0o+TwtfpI
         Y58g==
X-Gm-Message-State: AOAM533axV95Kk5ApJGfqDe5GKvLRpIR9iMHdhwOcMtoDV22JWA1gvHl
        cKG//X7zp+XSFSqfwzh0PxgUZCOGABkyDw==
X-Google-Smtp-Source: ABdhPJw8PWjmXEk5tagmS5y6qt/jzYQQuCADX5J+OCQRrEAyXZD2GZh8rbnqp7i8jfkKLtqrG68dcg==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr24771827lji.129.1593938978505;
        Sun, 05 Jul 2020 01:49:38 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id s8sm5231039ljh.74.2020.07.05.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 01:49:37 -0700 (PDT)
Date:   Sun, 5 Jul 2020 10:49:36 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Resotre support for V4L2
 platform devices
Message-ID: <20200705084936.GA3875643@oden.dyn.berto.se>
References: <20200704154752.2980029-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWRLcu6mZcyY9fZOpADNrJbn7YeDuAxku4P_rWfNMFHXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWRLcu6mZcyY9fZOpADNrJbn7YeDuAxku4P_rWfNMFHXQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2020-07-04 18:56:06 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Sat, Jul 4, 2020 at 5:49 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Since commit [1] the Renesas V4L2 platform devices are no longer enabled
> > with the shmobile_defconfig, restore functionality by enabling
> > MEDIA_PLATFORM_SUPPORT.
> >
> > 1. b0cd4fb276653f8f ("media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering")
> 
> I thought it was needed since commit 06b93644f4d102bd ("media: Kconfig:
> add an option to filter in/out platform drivers")).
> This is a minor detail, though.

It might have had as many points of failure as the "feature" trusted 
upon us new use-cases :-) I did not investigate further then my bisect 
script run between v5.7 and v5.8-rc3.

> 
> > --- a/arch/arm/configs/shmobile_defconfig
> > +++ b/arch/arm/configs/shmobile_defconfig
> > @@ -112,6 +112,7 @@ CONFIG_MEDIA_SUPPORT=y
> >  CONFIG_MEDIA_CAMERA_SUPPORT=y
> >  CONFIG_MEDIA_CONTROLLER=y
> >  CONFIG_VIDEO_V4L2_SUBDEV_API=y
> > +CONFIG_MEDIA_PLATFORM_SUPPORT=y
> >  CONFIG_V4L_PLATFORM_DRIVERS=y
> >  CONFIG_VIDEO_RCAR_VIN=y
> >  CONFIG_V4L_MEM2MEM_DRIVERS=y
> 
> Already fixed in renesas-devel since commit 835a056da6409ec7 ("ARM:
> shmobile: defconfig: Refresh for v5.8-rc1").

Awesome, sorry for the noise.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
