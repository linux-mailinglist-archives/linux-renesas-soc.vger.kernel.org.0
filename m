Return-Path: <linux-renesas-soc+bounces-5108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB08BB801
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 May 2024 01:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C1F1F24EAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 23:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870BA83A01;
	Fri,  3 May 2024 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mLdEs7A2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA905A4D1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 May 2024 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714777921; cv=none; b=Tfea2L/NkzGH7p4CrwfRlLwx87e9ShafoW2HgnAo9GV0RXuyHok7df2W9MDw+QzuzVW/xQpBa3M6SuUUf+/yPSRxX9de6WFL4YLIUnEP9ChS6rOrUzBsozEusJkvusDo8GbroE2OheMjGwfx/Uvx6xEd++oZakvV+jbIf7hZtoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714777921; c=relaxed/simple;
	bh=l/mKQkIONdKvQEQ/grQVTnwzjXj7UaJ5y7zIj77h89A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvRY60n0qsTj8bN8Qu8ScL2l+GPjhS8IN7ZYjiKUzIRafcRMgX1s9z87qC5oXdnaYHtS5JabX2FM2S644q/nlFD6+aYLtULNC0DghyTGFK+36YIWpjBkwms1VdhSaSONw/e6Sn3pOd9+7YMCf0lOhJIwZ1ZvulM4On2sp/w8NUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mLdEs7A2; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-790c7785ddbso9678685a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2024 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714777918; x=1715382718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prxQbPa1s7Bfkbjtnci/PRV2YJ37FKzJezsvysnibwU=;
        b=mLdEs7A2Cg4GFWDS85whun/hYJdULZXNFZc+h3qsqlNuGaAn44QnoQpDaLOBcj5L9k
         vS22oACw2Zt+newuAqXZOlr4GWZx+U8yXKv/9jDJD7qzh7FZrRNz8G3Pd9F3C2edXML7
         y1tdp0m2unnp5Ua6UuIFgPrgYI/Bm3PUzct58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714777918; x=1715382718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prxQbPa1s7Bfkbjtnci/PRV2YJ37FKzJezsvysnibwU=;
        b=ORahqwjYbQDbz/aNbM1o4zd6/NFOIbgGANivHDpfS6hyWS82SsVKi1Ncy0MvjWLWds
         Ad4ZRzewGs9mIM/GK7q8WUIVxG65Vdl+a838eC2HsvkvyGLP7LV4EKKqi8RUGNFT0fPv
         dLXlwnS5CaDfjC0VdL4dCQ82ziqo/AbL0VF5nFNNTDXNHHmfSSMXxpoT6zKN2nAWykjo
         eQS/HLvvV/7qyAhTbe9txzD43fHgd7QHS2nBCc3kmaJ/Le2FIkzicM0Th8bN8pL1CHvc
         zdS27rgeqCzVAhG8OtKbuTN9Y5bEK22ysLEGFcU4H9EJlFMFD44EjwUW4COz4URMtLdu
         zoZw==
X-Forwarded-Encrypted: i=1; AJvYcCXsyI/M7hnbsGoX8lBrPh1sfhtRZ35vzPtX9N40fvk/eW495SsQ+0GjcXeKnbNvfZvLLd8mHsLN3mk/oB43OkUR02kLoYXxcYUN7fMzdcRLd7E=
X-Gm-Message-State: AOJu0YytdNBMS54yx1t9F/2a7G3RZqtJ8Pesb357uG0+/WpiPihcHVYl
	ZZwsoK5IPn53vBninXCl4S3dT+DuY/lKjqq9M9gvOGFk94Krkvuwh/QoMvEv1mJuy8sp3LFCP3w
	1KQ==
X-Google-Smtp-Source: AGHT+IHXMLEkmYKuCIbiDWHz6rn/iVwneqfAvLP9LaZA67H01lThlzH54dwI0snlqcaZEMAOP5ucLw==
X-Received: by 2002:a05:620a:1d84:b0:790:f03a:243f with SMTP id pj4-20020a05620a1d8400b00790f03a243fmr4001912qkn.46.1714777918191;
        Fri, 03 May 2024 16:11:58 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id m24-20020ae9e718000000b0078d5e60b52esm1613153qka.114.2024.05.03.16.11.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 16:11:56 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-436ed871225so51381cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2024 16:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9xtpDDJCOysfpSiinIM/7ke5xckNebINyraovsuvoDbpQw4uWB2i3dxTrDvQUBabHZ0cbYQCF0/L08K8HXpCVtHa+wNmiRvLgQCnn0G7ZvHc=
X-Received: by 2002:ac8:7f03:0:b0:43b:af4:d3a with SMTP id d75a77b69052e-43d088fc74amr388471cf.19.1714777916272;
 Fri, 03 May 2024 16:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com> <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
 <20231205134050.GG17394@pendragon.ideasonboard.com> <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
In-Reply-To: <CAD=FV=WFykYh2PAw5G3uL-64LG45O3cPRiwN1HOfMAoeLK5KMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 May 2024 16:11:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VODa=t2WTgs8sE4HVnS77eoS3y4TjoOEyCD4OAKHg94w@mail.gmail.com>
Message-ID: <CAD=FV=VODa=t2WTgs8sE4HVnS77eoS3y4TjoOEyCD4OAKHg94w@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call drm_helper_force_disable_all()
 at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 5, 2023 at 9:35=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Dec 5, 2023 at 5:40=E2=80=AFAM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart wrote:
> > > > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > > > From: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > Based on grepping through the source code, this driver appears to=
 be
> > > > > missing a call to drm_atomic_helper_shutdown() at system shutdown=
 time.
> > > > > This is important because drm_helper_force_disable_all() will cau=
se
> > > > > panels to get disabled cleanly which may be important for their p=
ower
> > > > > sequencing.  Future changes will remove any custom powering off i=
n
> > > > > individual panel drivers so the DRM drivers need to start getting=
 this
> > > > > right.
> > > > >
> > > > > The fact that we should call drm_atomic_helper_shutdown() in the =
case of
> > > > > OS shutdown comes straight out of the kernel doc "driver instance
> > > > > overview" in drm_drv.c.
> > > > >
> > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c=
8b3c307a6192efabb4cbb06b195f15@changeid
> > > > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown=
/]
> > > > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdo=
wn]
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > Thanks!
> > >
> > > > > Panel-simple does print two new warnings:
> > > > >
> > > > >     +panel-simple panel: Skipping disable of already disabled pan=
el
> > > > >     +panel-simple panel: Skipping unprepare of already unprepared=
 panel
> > > >
> > > > Have you investigated where this comes from ?
> > >
> > > Meh, I knew I forgot something ;-)
> > >
> > > The panel is unprepared and disabled a first time from shmob_drm's
> > > .shutdown() callback:
> > >
> > >   shmob_drm_shutdown
> > >     drm_atomic_helper_shutdown
> > >       drm_atomic_helper_disable_all
> > >         drm_atomic_commit
> > >           drm_atomic_helper_commit
> > >             commit_tail
> > >               drm_atomic_helper_commit_tail
> > >                 drm_atomic_helper_commit_modeset_disables
> > >                   disable_outputs
> > >                     drm_atomic_bridge_chain_disable
> > >                         drm_panel_disable
> > >                     drm_atomic_bridge_chain_post_disable
> > >                         drm_panel_unprepare
> > >
> > > And a second time from simple_panel's .shutdown() callback():
> > >
> > >   panel_simple_platform_shutdown
> > >     panel_simple_shutdown
> > >       drm_panel_disable
> > >       drm_panel_unprepare
> >
> > That looks like what Doug mentioned should be removed in the commit
> > message of this patch (a confirmation would be nice). It should be fine
> > for now.
>
> Yup, this is completely expected right now and is actually a _good_
> sign that your patch is doing what it should be. We unfortunately
> can't remove the panel_simple_shutdown() until all DRM modeset drivers
> (or at least all the ones that could be used w/ panel_simple) are
> properly calling drm_helper_force_disable_all(), though.

FWIW, I've sent out a new version of the series that removes most
panel-specific enable/prepare tracking and also adjusts the TODO to
make it clear that these warnings are expected for panel-simple and
panel-edp [1]. For all other panels my series removes the extra
drm_panel_disable() and drm_panel_unprepare().

I noticed that ${SUBJECT} patch hasn't landed yet, but from grepping I
couldn't find it used with any panels that I was touching... In any
case, it seems like it would be nice if it could land...

I'm not sure the best way to deal with panel-simple / panel-edp. I'm a
little scared to just remove the disable/unprepare since they are used
across so many different DRM modeset drivers, but the annoying thing
is that the warning shows up only on DRM modeset drivers that have
been fixed and _not_ on ones that weren't fixed. :( To get a warning
at the right times we'd need something that runs _after_ driver
shutdown to check whether the DRM modeset driver forgot to call
drm_atomic_helper_shutdown()...

[1] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org

