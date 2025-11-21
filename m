Return-Path: <linux-renesas-soc+bounces-24906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F26C77D44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 09:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D00135065F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 08:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03352FC019;
	Fri, 21 Nov 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSGiD9M3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC62F99B8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713058; cv=none; b=m3/I5H5d54w1fCc0Roof0OmsIrL52m3QNk2QSjJ0A7lX4ItnosuouHyzMdlivYySC44dkNrXLOoFmvS1q7Ia7xaVGDwKlXlTJnIQ/pl+Qjii4tfPi4zMwluIFKV165uJFTAmrdqtPkdWV9vnO3QqZ348BlnRX+uU/Pz1P6sXCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713058; c=relaxed/simple;
	bh=ZxNL4WDP1NxE7Y6tOWw+wsU/bh+QHBcVmvwUtwTV7/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDJBaXDfm3KIlvvqZnyWMIJmF4Jap6njhREoA7TxK6u3VpaimTk3Ir0wLbjywfmlqfZAsA+Qg6WpoqG1pDlTWhZpW2VyYbNhsTOwWbTJIUuDiPBaimx2IDzkeHXNwYzwpHatuPCmt/QfwNoXIwQ7DYMdGWKlVlRUldt+UNWl7G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSGiD9M3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9C2C116D0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763713058;
	bh=ZxNL4WDP1NxE7Y6tOWw+wsU/bh+QHBcVmvwUtwTV7/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MSGiD9M3i0HgEvsLoJ93c6pSfgP3neN5I3LSW0GTW0RLR8CIaV6XTOqsa4jFlT8mC
	 6dMUKZ89RMEGleozg/cugTTjBoDUTcwezsXH6H96E+O1FWKt3V7H0kfrOKo8NaAdEm
	 Gkkxt7/LBRR2PmFKL2sBKD4d2EIyLWlsMZWzhNoD1XBBNyhGBbTuce5ZeqCeKobQ6m
	 A2L0ihcT6skbaFOW/nySMHKXVN8RaLjtYxWPR8F501eHygX4W03UyyHY5chH8ojld7
	 mk0Fi5SB7o1iNsDfP/nBRH7dgoprnt2y6/UkinI6u8K0jjuLRggPs8T5PoTuuHHAIQ
	 XXNdzFfoF7DWQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787e7aa1631so34833387b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVnCfm/Xkx88aS71Ha3UnpsL/wUSc3KSXxJX12ReDkgohJ2UpfN7U5nCoLbVyMGehy4rkgqBcWU1v5dbMfPOqrfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8qgfm3GlJP55/3+6uOAi44i/CNmOpN77Cxtg1VGDWDnIP8I1r
	tEtUit5rfKfmM6s6p6Fl2mlc4sL1ole0WOy6kI72Iky/G0phdZ0ZKtgC8s4GLLgGM3hPGlG0jmt
	y3HvQf/b4G4mDOakGkPpf4/O6pqyucwQ=
X-Google-Smtp-Source: AGHT+IGz/ZassbK2KhUhK8BGDBTfY682756Y7uunrw+26DdUeq3vz5aPSRwICt4Vk6dL/KVr1FANk8QqBNVMNwalptk=
X-Received: by 2002:a53:d008:0:b0:63f:b330:8c85 with SMTP id
 956f58d0204a3-642f8dee6cbmr3343757d50.18.1763713057800; Fri, 21 Nov 2025
 00:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org> <20251121024206.GC11519@pendragon.ideasonboard.com>
In-Reply-To: <20251121024206.GC11519@pendragon.ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Nov 2025 09:17:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLkNCH=8VmwXh0UJS5QZ9wB-iP2kinytT+__fq0L1PzoZQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkSFb3C22QokljT-j-z5EP6W6WYTPVlLJ5Gz6Ap3vM-D9eJPAdozQanQPI
Message-ID: <CAD++jLkNCH=8VmwXh0UJS5QZ9wB-iP2kinytT+__fq0L1PzoZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Fri, Nov 21, 2025 at 3:42=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > This is needed on R-Car DU, where the CRTC provides clock to LVDS
> > and DSI, and has to be started before a bridge may call .prepare,
> > which may trigger e.g. a DSI transfer.
>
> Is there an issue with LVDS ? The LVDS encoder receivers its pixel clock
> from the CRTC the same way any encoder does (except on R-Car D3 and E3
> where the encoder *provides* the pixel clock to the CRTC, which is
> handled through explicit function calls from the CRTC to the LVDS
> encoder). There's no command mode with LVDS. Is the concern that we may
> have an external LVDS to DSI bridge ?

Question to Marek, this commit text is from his original patch (which
I modified heavily so almost only the commit message is left...)

> > -     /* Apply the atomic update. */
> > -     drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > +     /*
> > +      * Apply the atomic update.
> > +      *
> > +      * We need special ordering to make sure the CRTC disabled last
> > +      * and enabled first. We do this with modified versions of the
> > +      * common modeset_disables/enables functions.
> > +      */
> > +
> > +     /* Variant of drm_atomic_helper_commit_modeset_disables() */
> > +     drm_encoder_bridge_disable(dev, state);
> > +     drm_encoder_bridge_post_disable(dev, state);
> > +     drm_crtc_disable(dev, state);
>
> I think we have a fundamental issue here. Commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> states that
>
>     The definition of bridge pre_enable hook says that,
>     "The display pipe (i.e. clocks and timing signals) feeding this bridg=
e
>     will not yet be running when this callback is called".
>
> This is right, and the above sequence does not comply with the
> documentation, which is a concern. Quite clearly the bridge API isn't up
> to the task here. I don't know how we'll fix it, the pre/post
> enable/disable operations are really a hack and don't scale, and fixing
> that will likely not be a simple task.

Well in the v1 patch I tried to go with this definition, if:

1. The display pipe is not running and
2. The hardware is such that DSI will not work unless the display
    pipe is running then it follows logically that:

3. We cannot send DSI commands in bridge prepare()/unprepare()
   execution paths.

Thus the v1 patch moves all DSI commands to the enable/disable
callbacks. It fixes the regression, too.

We would need to comb over the existing DSI bridges and panels
to convert them to this semantic if we wanna be strict, what I
did was to just fix all panels used by this one hardware. I'm pretty
sure the same can be done of any R-Car DU-related panel/bridge.

> The short term question is how to deal with the regression that
> c9b1150a68d9 caused in the MCDE and R-Car DU drivers. This patch
> probably works. The complexity makes me worry that we'll introduce other
> regressions, but it can be argued that we're merely restoring the
> previous order of operations, which should therefore be safe. I'm still
> concerned about maintainability though. Commit c9b1150a68d9 should
> probably have been rejected, we should have developed a proper solution
> instead :-(

Yeah, it's a bit of a mess when regressions get detected late.
I'm also worried about more regressions popping up. They will
all be with DSI panels/bridges I think.

Yours,
Linus Walleij

