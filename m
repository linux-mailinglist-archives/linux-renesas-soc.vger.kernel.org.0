Return-Path: <linux-renesas-soc+bounces-727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C062E8055FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 14:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B07A81C20F77
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEC55D8EB;
	Tue,  5 Dec 2023 13:31:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207251AB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 05:31:38 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d3644ca426so54879707b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2023 05:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701783097; x=1702387897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WLCGfltwE6Kjvks8kpsa3EEhQwG2EjNCMrRG0bAxcU=;
        b=EW0Rvfgp1GVa1RVLwrAgJqpgLCRSabzyKkKtL237GHZdDkR9RA3X/sGgs73feneYdJ
         V2l7/SKOgPPj02zttflqZ5oUAGJNXxCkbd+t5ovA6oeZikYO8waiZOj941VhH6DM+pgo
         bxryh8NaPU2BHQEJeReKJgNROOHzSK0bEqgwDDXGIYTi61tnzpiv7HzZSVv95HjnXreh
         NrsWQjpwJJtIEmRSikOhAJM+cXdgl3SpdC3u61m1l50V0TdOcKcXuYZ3l0+pR8daQht+
         SLhNt/7lLfAOyTsNVPsisacOk82sKt853Pi9HA+tz62E2AtiSphAT+S+6i/0rof03t5S
         72Yw==
X-Gm-Message-State: AOJu0YwghTthZBEALG9xsPOFJKgnqbtOd26jeeF7EvN5r3lQc16MnipW
	npFABdX/SNt8VBy4ELa1XS/c9SKd27l+og==
X-Google-Smtp-Source: AGHT+IHzYUzTv2l9ncMi54qBSCAcXxTs7/R1xaGXxbiglIdKePKgHg5RVExhoFhuKQHbw53q57hz9Q==
X-Received: by 2002:a81:ae02:0:b0:5d7:1941:3552 with SMTP id m2-20020a81ae02000000b005d719413552mr3612085ywh.57.1701783097177;
        Tue, 05 Dec 2023 05:31:37 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id g188-20020a0df6c5000000b005a7daa09f43sm4146260ywf.125.2023.12.05.05.31.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 05:31:36 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9fe0a598d8so3343677276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2023 05:31:35 -0800 (PST)
X-Received: by 2002:a25:f205:0:b0:db7:dad0:76d0 with SMTP id
 i5-20020a25f205000000b00db7dad076d0mr3644485ybe.108.1701783095615; Tue, 05
 Dec 2023 05:31:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
In-Reply-To: <20231205121617.GF17394@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 14:31:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
Message-ID: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call drm_helper_force_disable_all()
 at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Douglas Anderson <dianders@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > This is important because drm_helper_force_disable_all() will cause
> > panels to get disabled cleanly which may be important for their power
> > sequencing.  Future changes will remove any custom powering off in
> > individual panel drivers so the DRM drivers need to start getting this
> > right.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case o=
f
> > OS shutdown comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c30=
7a6192efabb4cbb06b195f15@changeid
> > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> > Panel-simple does print two new warnings:
> >
> >     +panel-simple panel: Skipping disable of already disabled panel
> >     +panel-simple panel: Skipping unprepare of already unprepared panel
>
> Have you investigated where this comes from ?

Meh, I knew I forgot something ;-)

The panel is unprepared and disabled a first time from shmob_drm's
.shutdown() callback:

  shmob_drm_shutdown
    drm_atomic_helper_shutdown
      drm_atomic_helper_disable_all
        drm_atomic_commit
          drm_atomic_helper_commit
            commit_tail
              drm_atomic_helper_commit_tail
                drm_atomic_helper_commit_modeset_disables
                  disable_outputs
                    drm_atomic_bridge_chain_disable
                        drm_panel_disable
                    drm_atomic_bridge_chain_post_disable
                        drm_panel_unprepare

And a second time from simple_panel's .shutdown() callback():

  panel_simple_platform_shutdown
    panel_simple_shutdown
      drm_panel_disable
      drm_panel_unprepare

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

