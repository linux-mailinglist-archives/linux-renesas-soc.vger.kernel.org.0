Return-Path: <linux-renesas-soc+bounces-748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A98805B37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 18:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A781F213BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 17:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E9168B72;
	Tue,  5 Dec 2023 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fyCQ6sKS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA67D1B6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 09:35:32 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3334a701cbbso2150830f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2023 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701797730; x=1702402530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndluAKrKzxsWUgZyPsRUnjGXiLqileF9IHLPH69o7cE=;
        b=fyCQ6sKSfWAzhPFgFO0ukzeASicPXNzxHyzsK6hBNpy4RStZm6i+KgIRuNC2rPDb5t
         //nxk895zYxysdTU50StgukAC/3QgVlxnO1maq6yaowDMSNe9zHR//kltOcSGb6cjpdt
         mpFn8RjDKhsAWPouDgci0+nhJ1OOZu/h6bl7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701797730; x=1702402530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndluAKrKzxsWUgZyPsRUnjGXiLqileF9IHLPH69o7cE=;
        b=AG48/tvy7YXojWC1YMPI2yxyEgqePw66BsJoccmS/Ii5HuezMyFDk9uteaUPMR2OqY
         CnmvYMG4EROuivCZKpUHAs4wyd+c1YwUtz3YutCcQ0TnhYi0ZIN+sQJE+1oDLCcEP0uu
         OuMFJ4LUxrJ4MZ1Yob4io2LX8FZVJZe4FBbESZ0vrhM1rpOe6/euSbBR3X6Vuqr1P7BO
         ydmm75zLnMRmH2gJS6a7fYQKCrEhmdoGE9UEYl+w/3nt09uwxdWACVd7NuCrOCOvdzKX
         q0QHsTcwq+awr+RkK4SVPSorlYDJcyo22w7xCZpUJjcAtaM5Q0yrQ/JPf3oEbE3ajBUW
         ENvg==
X-Gm-Message-State: AOJu0YxxZsPU/O41TKbfdacBBgnykPKuWdeYs9NF8Npe9Dtrj2Z5ejIt
	gRc1iy0izyXA/GK4dwGmZpmXnLtt7Dny7x5rtWUUWSaJ
X-Google-Smtp-Source: AGHT+IEhNOM8R/S/KV/R9DlppPu1ljKS0h28Ut2Z/JmQu/YrooSzyazRZ/0Mb38Vf81uHL0GCCd4cg==
X-Received: by 2002:a05:600c:600d:b0:40b:5e1e:fb96 with SMTP id az13-20020a05600c600d00b0040b5e1efb96mr590558wmb.75.1701797730113;
        Tue, 05 Dec 2023 09:35:30 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090624cb00b00a1cd9151af6sm762663ejb.210.2023.12.05.09.35.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 09:35:29 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b35199f94so35e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2023 09:35:29 -0800 (PST)
X-Received: by 2002:a05:600c:511a:b0:40b:2ec6:2a87 with SMTP id
 o26-20020a05600c511a00b0040b2ec62a87mr561610wms.5.1701797729119; Tue, 05 Dec
 2023 09:35:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com> <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
 <20231205134050.GG17394@pendragon.ideasonboard.com>
In-Reply-To: <20231205134050.GG17394@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 09:35:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
Message-ID: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call drm_helper_force_disable_all()
 at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 5, 2023 at 5:40=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart wrote:
> > > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > > From: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > Based on grepping through the source code, this driver appears to b=
e
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown t=
ime.
> > > > This is important because drm_helper_force_disable_all() will cause
> > > > panels to get disabled cleanly which may be important for their pow=
er
> > > > sequencing.  Future changes will remove any custom powering off in
> > > > individual panel drivers so the DRM drivers need to start getting t=
his
> > > > right.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se of
> > > > OS shutdown comes straight out of the kernel doc "driver instance
> > > > overview" in drm_drv.c.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b=
3c307a6192efabb4cbb06b195f15@changeid
> > > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown=
]
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Thanks!
> >
> > > > Panel-simple does print two new warnings:
> > > >
> > > >     +panel-simple panel: Skipping disable of already disabled panel
> > > >     +panel-simple panel: Skipping unprepare of already unprepared p=
anel
> > >
> > > Have you investigated where this comes from ?
> >
> > Meh, I knew I forgot something ;-)
> >
> > The panel is unprepared and disabled a first time from shmob_drm's
> > .shutdown() callback:
> >
> >   shmob_drm_shutdown
> >     drm_atomic_helper_shutdown
> >       drm_atomic_helper_disable_all
> >         drm_atomic_commit
> >           drm_atomic_helper_commit
> >             commit_tail
> >               drm_atomic_helper_commit_tail
> >                 drm_atomic_helper_commit_modeset_disables
> >                   disable_outputs
> >                     drm_atomic_bridge_chain_disable
> >                         drm_panel_disable
> >                     drm_atomic_bridge_chain_post_disable
> >                         drm_panel_unprepare
> >
> > And a second time from simple_panel's .shutdown() callback():
> >
> >   panel_simple_platform_shutdown
> >     panel_simple_shutdown
> >       drm_panel_disable
> >       drm_panel_unprepare
>
> That looks like what Doug mentioned should be removed in the commit
> message of this patch (a confirmation would be nice). It should be fine
> for now.

Yup, this is completely expected right now and is actually a _good_
sign that your patch is doing what it should be. We unfortunately
can't remove the panel_simple_shutdown() until all DRM modeset drivers
(or at least all the ones that could be used w/ panel_simple) are
properly calling drm_helper_force_disable_all(), though.

-Doug

