Return-Path: <linux-renesas-soc+bounces-11475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3669F4CAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 14:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A229C1883D88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 13:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42771F4712;
	Tue, 17 Dec 2024 13:42:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD091F426B;
	Tue, 17 Dec 2024 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442945; cv=none; b=UZiw24jifiIl4odwS7Ink5w2VyH/JvMZbqzC+K9M781sCQ7uKvNNR03jLo0pI9vIPHBKlOWo3SDwKhjtqY+uwlRg59R90qDAQtwzNMCP5OqXeLxRcJLI09tGb+qrh5IXz5UW1/QRBmmrbZiywfS3I2KaPFhgNH1bkjS6pZw5X6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442945; c=relaxed/simple;
	bh=+NLEb6CqCiJoZfeGjcIUH+M3JreOrl4k58RvErRAt5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMY+vi5HMr/PWnSnenH0IXrE9k1+vn8yC4fxgM+AspWkKztPds7R62uG38KQptBNDXmqI7NQHTEpKlBSuaW4raNeob5VsVqjpiesbIpvawUh4Fp3kPbDL/8NZJ4FnBVbQbxs6lTGael12VRbyMMBZ8VPBdt+cjVu89jjJYxw+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so2379683241.2;
        Tue, 17 Dec 2024 05:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442941; x=1735047741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55x747loPYs9UKeI6ysGYmeJmLBuEdA1brrJreZX3rI=;
        b=TqbUZh7BV5YNOZPfnHfynMuCM+/d+khBPjUPAat2EYoda+6as69wlNsyk9hI8Altxw
         d0CZepN+s0uzz6zsJOVajY5vrwive3IMeMXCC7csI1YaL6CkFJcX1c94uEU4v2Igxwiu
         rdt7PJbwW3Z7A43zeDCAJlih5g9yvN5v3u9Hgw48Q2dMIpdgsFmPpgp0fNMnaqha16Y3
         qMU+GvlleFO17Wr+kc5oLY4zARfb1XZU6MSQ93CwsQfm8vWSsp0eOCqqv/2512bHnrAr
         xAU/H3UF7or2ncyQUGvpAlI8vYVe2YMmwb0D1ImhAuSCZ0i18M8gEMJ4KwJGTszvAslZ
         nnkw==
X-Forwarded-Encrypted: i=1; AJvYcCUw2/zj/mJhbPT0QY93YU//tIR+YxTbljhaDTfkv99QXigfsPAX53XAG7Taon3HrxaRq7WQyS28DXzH9e2n@vger.kernel.org, AJvYcCVphbEriuK2a6pJdSejX3jutQjvgTL5NYcj5CbVcPmI8MnF9Oxo5dLEUpX+43jqIWk1e/OEFfbfKP1NpZNJ8n0z1aw=@vger.kernel.org, AJvYcCVt0S26APclShmorTS2T5aiHhMaBcRy5rRBWsUqVnDacuOr62WXLwV41daHLLA7lcDjHbV5Jvcyx2he@vger.kernel.org, AJvYcCWlhn9eHQfwAmVAkYnRrEgOXaAN6xf40dMPELbrzU5p8AeK/rmWDQtgp1dz1IWvOMyK1UErzK1vEH97@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3RFMzGm1HAS9Kx+wF/ttiGiScSLOZE9XRBg1sdVYYJLBj1XG
	ldSVDXwDX323CwolQsz8NThj3ZGk18pddiRmf3Kx3gXdtkhuamjw2CEdMA/P
X-Gm-Gg: ASbGncuKdCECl2xB+BjjxiyT+96cFnfhuMKz0OaYuRsOkT7O4/Mvc4EenswznJ935DQ
	9+PcIrq32/dHGObrFSJtdHP2TOd8nE7BS7PeR/4pDhiSojuo8+ssjBl6r2vGrpzJ6ZpcuQjEhWR
	vhNHeB7ottOKylMIy4w9GwRSMIm9vpB3mmyzlwnCv8WWBfh3bQIbO5BrDLDNEC45vV1uxowSno2
	eHedErhvGIZdJFmWZWqjsT4AtH+6ofpfHBrdsUuJ2o0BG0C6/WIOkOhrwuTBKkjYTK7eylNi0ow
	HiLmJny2h30IQ78sQtw=
X-Google-Smtp-Source: AGHT+IGXk+bIQkA+vs44jCZavZSL5TkL+WHLryMuIhUxedGP6axYmeZUHD20UU7WTIEuf2HUgL3MMA==
X-Received: by 2002:a05:6102:3e27:b0:4b0:2d7c:43ca with SMTP id ada2fe7eead31-4b25ddc752dmr16415745137.18.1734442940972;
        Tue, 17 Dec 2024 05:42:20 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b270231d1dsm1152174137.8.2024.12.17.05.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 05:42:20 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85b88a685e6so2379653241.2;
        Tue, 17 Dec 2024 05:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURyLqochOV57Y96LSnZjbAYgLK+bo5rvmBWrdKoY7riQXiUXfBI2S4Pdby+hHFqUEUL2Ma7RfeXZoUoman8ABVXqs=@vger.kernel.org, AJvYcCV4svlOnXcN4Zh8inM7x7s61ZqOtpwUUZVt1ubeacZhDObA/iQIB1XF2xm8COjUbt5FQgVXLqv8ulu8@vger.kernel.org, AJvYcCXctSyRc+IdZFuKCxUsWMzZBBDP8dFzAu8zh5JqkF6OGK+iC/aQlfUcE9uPmnZTSNj+dVpDHKiFAOQznfLO@vger.kernel.org, AJvYcCXq7cEj4KX+jXWwpJb18cG00xlcOnoEhtP4S9sQq0qs1FXnUIs48VFokQ8I59GgluGK2mIQqIFpLER4@vger.kernel.org
X-Received: by 2002:a05:6102:1591:b0:4af:597b:ef with SMTP id
 ada2fe7eead31-4b25dca388dmr15489033137.8.1734442939984; Tue, 17 Dec 2024
 05:42:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
 <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com> <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 14:42:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+baSFtX-U-w4CBSqMsceDS+RoQY55qs=SmyydK6BLVA@mail.gmail.com>
Message-ID: <CAMuHMdX+baSFtX-U-w4CBSqMsceDS+RoQY55qs=SmyydK6BLVA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC Saravana

On Tue, Dec 17, 2024 at 2:29=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, Dec 16, 2024 at 2:33=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >
> > > Add support for the mini DP output on the Gray Hawk board.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch, which is now commit b1000645dc29701f
> > ("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
> > in renesas-devel/renesas-dts-for-v6.14.
> >
> > Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
> > v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
> > when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
> > is not available, the ti_sn65dsi86.bridge part fails to probe with
> > -EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
> > driver must do something critical, as resuming from s2idle now hangs.
> > I haven't identified yet where exactly it hangs.
> >
> > As a result, s2idle is broken in current renesas-devel, which only
> > has the DTS changes.  Perhaps I should drop the DTS until the issue
> > is resolved?
> >
> > However, I suspect White Hawk has the same issue (if
> > CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local Whit=
e
> > Hawk is currently not available for kernel testing.
>
> Confirmed on White Hawk by Tomi and me.
>
> When the hang occurs, magic sysrq no longer works. However, the system
> still prints "nfs server not responding" once in a while, so I added
> calls to various sysrq print functions to rpc_check_timeout().
> This revealed that the system is blocked on wait_for_completion()
> in dpm_wait_for_superior(), called from device_resume_noirq().
> Printing the actual device and parent gives:
>
>     platform fed80000.dsi-encoder: PM: device_resume_noirq
>     platform fed80000.dsi-encoder: PM: dpm_wait_for_superior: parent fed8=
0000.dsi-encoder

So it's waiting for itself, i.e. deadlock :-(

When the DSI driver is available:

    rcar-mipi-dsi fed80000.dsi-encoder: PM: device_resume_noirq:627
    rcar-mipi-dsi fed80000.dsi-encoder: PM: dpm_wait_for_superior:280
    rcar-mipi-dsi fed80000.dsi-encoder: PM: dpm_wait_for_superior:296:
parent fed80000.dsi-encoder

still waiting for itself, but it does continue!
Note that the fed80000.dsi-encoder block is now bound, and
"rcar-mipi-dsi" is printed instead of "platform".

fw_devlink issue?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

