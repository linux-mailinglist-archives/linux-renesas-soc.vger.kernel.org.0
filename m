Return-Path: <linux-renesas-soc+bounces-11478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510B9F4E8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 15:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986A51639C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 14:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A761F76B9;
	Tue, 17 Dec 2024 14:54:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588911F76A0;
	Tue, 17 Dec 2024 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447288; cv=none; b=ZM1541LvSlChmBudmEZISgQ2VQYwqTBpjxf6GN2X3sLw7OPYL8u+9NCSZ7sDPnL+IcktqzgA/rRImqjbTkPlWMkRT86m+GEEA0fgYpF0nlpM+1P0PofXIkJIA5JX1cIgMRrTaNCkVNkNC5ryJsQTB+iVsgHazZ1e0S5Ah0gV9NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447288; c=relaxed/simple;
	bh=kiDf/n4wa/p96MRqwhL7N374KIbFqK0C7zOdINNgGDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyxwiD3sEWz9kzPU6yEdvy0venq4XX9d0CXUI53AwuVzAojjWIuwv9L/QRTBbyLicUOK2fCGwWUlBQ7AmFgOB1/uQcJI/RgBVgaPWhb89z1pdf2GGzDPe04EPpZ/Haqt0PclUAzoPi7VMcPUTPr6mNPt3yN6Jam+5VFhE+JJ6dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so1504268e0c.1;
        Tue, 17 Dec 2024 06:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734447284; x=1735052084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdmJj7Bit7IiUWRERL1dUMIdyUMl4mYcreSSKLZ0A1g=;
        b=EaKV3R53qnjOKzzZ2Jt43YM1iUcuux25lVTfnjRP0/DKtQaRBvUO/8hZNdZmYIRumt
         GdwaWxJ0UnaRuHRJl3vIYYnsSyCuncx4wfryxKchSceYEibI/ACkqwaik5kw3qakvwMS
         zP3/7jlz9i1EP4+OsQ4eXdA/Nx0MDMmwHypaJpUO0FkhOjGBSPe2bWN5cJTaJ49R5nvB
         Hi0QdR6anW3qQ8CIgNhXqD+ig2fNcGtRSgPX/CSqVzLwMaa5Q6wg81UYdHJZGGyAKMeX
         Dxm4+tFsGldLU3PwYij/5lMZ7eeumCqyjvgDv8FzlowVRwJKdw48LbELFFgD1Ej8RCNg
         1YKw==
X-Forwarded-Encrypted: i=1; AJvYcCW+nOIb421nokxcq5EOWoKyywZ6tr53rFzs/V5BEongk39W/smbnziw3aoMfYa/1tRCi/p2N01Tgyh1FtA=@vger.kernel.org, AJvYcCXuAIeVPHcTZLf9nyqrHmKTqHXl12QApreEJg1ZH/uLlbAzoBvbgIXp+ux3BV8+BkLXzIJRmUChKDTWjuQ7PHf4MTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8I7hEbVpHfNN6rfKP06g7OgXDGAVn8XwfXcK1kwW77k2f777
	opPwowjX6/hzeTFF9b/RMB2RWn7MwrvFSMPz/Ig6Ef/TgGOjBbyfJ77sKzEC
X-Gm-Gg: ASbGncukhNqaoI4+xvTFT2eJk32kjlwO8puELxPfHxcOEuUKxa0jqmMwxxe1InMFifF
	a6G+DwOKghjtafz4eSzVe5k4xPq0TvqEP6BASk1RNwOPEvBsiHF3fap7zNp/Uec9s/tLVeQZWCh
	bXEb90fX3zw63YjmvMtEZY61LNQ2thKMmiBe/Kr555csTJxqRuBs2jhH9TVYnVqZH4auWbDwPXq
	UV7UjhTIfbVg5r+zc/7Xk49UZxcNnhscP1cbvJLU58wskJTBOzM2l2rd+7MOumzln+S77wYOMvS
	g9JTE8UlN5uOpdpcbfc=
X-Google-Smtp-Source: AGHT+IEShgh1DXJNdL+5/kBnYARSrEbcnvMmYRRyHCV81nkhJl0lDwmwSIdfsf4OhicwepSj6NyGgg==
X-Received: by 2002:a05:6122:2217:b0:518:78c7:9b4f with SMTP id 71dfb90a1353d-518ca1ab797mr13972381e0c.3.1734447283983;
        Tue, 17 Dec 2024 06:54:43 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-860ab548f91sm1203598241.6.2024.12.17.06.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:54:43 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdf8520c2so1627298137.2;
        Tue, 17 Dec 2024 06:54:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULdyxE6Oeor667E4/IYeUVckqqzXDhnCPQI0XhLkfnw3DUwtyYd26glmQYOiXZn49SkjX3GlRM9wyKmuQ=@vger.kernel.org, AJvYcCW7SFyFpDmwAIzQx31mXRjXGcu4s2i8RpqwMZNowU+fx3Y0tOav/x+gt2UvrgqFcrmILAY7Fv9bmnpD+6O5bS2vqzU=@vger.kernel.org
X-Received: by 2002:a05:6102:5122:b0:4b1:ed1:569d with SMTP id
 ada2fe7eead31-4b25de51c53mr14854492137.27.1734447283528; Tue, 17 Dec 2024
 06:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com> <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
In-Reply-To: <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 15:54:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
Message-ID: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	John Ogness <john.ogness@linutronix.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
	Caleb Connolly <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn.

On Tue, Dec 17, 2024 at 3:46=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat=
.com> wrote:
> >> drm_log is a simple logger that uses the drm_client API to print the k=
msg boot log on the screen.
> >> This is not a full replacement to fbcon, as it will only print the kms=
g.
> >> It will never handle user input, or a terminal because this is better =
done in userspace.
> >>
> >> If you're curious on how it looks like, I've put a small demo here:
> >> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> >>
> >> Design decisions:
> >>    * It uses the drm_client API, so it should work on all drm drivers =
from the start.
> >>    * It doesn't scroll the message, that way it doesn't need to redraw=
 the whole screen for each new message.
> >>      It also means it doesn't have to keep drawn messages in memory, t=
o redraw them when scrolling.
> >>    * It uses the new non-blocking console API, so it should work well =
with PREEMPT_RT
> >
> > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > Unfortunately I don't see any kernel messages, and my monitor complains
> > about no signal. Does this require special support from the driver?
>
> It doesn't require a special support from the driver. But as it is the
> first drm client other than fbdev emulation, I'm not surprised it's
> broken on some driver.
> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
> (Qualcomm SDM845/freedreno), without requiring driver changes.
>
> Do you have a serial console on this device, to check if there is
> something in kmsg?

Nothing interesting to see. Compared to the fbdev client:

     rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
     [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
     rcar-du feb00000.display: [drm] Device feb00000.display probed
    -Console: switching to colour frame buffer device 240x67
    -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device

I did verify (by adding my own debug prints) that the code does
get to the success case in drm_log_register().
Thanks!

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

