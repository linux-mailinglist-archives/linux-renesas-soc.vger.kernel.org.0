Return-Path: <linux-renesas-soc+bounces-11476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124F9F4D76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 15:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60EAA188A95A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 14:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EDE1E47BA;
	Tue, 17 Dec 2024 14:20:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9F27470;
	Tue, 17 Dec 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445211; cv=none; b=RC4MHEubxnk+wVZKeUWbWFkYa4OPxMb+gzqr3aUt4utOgJAZzpXOJ3DheUVGn2M3lXvx8k4B/R+N0netVqpZfVlZIphu+JHEtucdafs4DsWv9WHLiGp36mQqqrOpTKw27Bo38tTFVXSbSd63Tl0+7cQRYzoQoIKwnJyd3j6Rnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445211; c=relaxed/simple;
	bh=eoTLSTtUrCSr5bdD9WjtwL3ov78MZ7cpPX8AkiWU4QY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAk81abp3YrW7OY90SHdvi7BmWH1Pbhtgz2TAhx/G9Hzij2JWGZa2QY0u6sNSo6r9+93nJnbaOSEYToPlv8DZdVGQMPk1Wfrqi+jdrmh3mTwXOl4b/nGQW+S1pSj1MCx+0tP7TwNg/+57KZKkSxNlyfBhUfqCh2BkuumXKUMroM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85b95896cefso980206241.2;
        Tue, 17 Dec 2024 06:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445206; x=1735050006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXPkplgvFfsbNTNn42otx4BMRNpKHlQWJuCfcyWJJJc=;
        b=gNsjSrXFJdZ3q5egqpyewR0RutyaXa9w0It+ifV/5W6x+VcjvNHvoW6p7LCrHqKEmP
         bEuB5Wbd640iqtr/CvsQgrXW5NwVxQa/pUUTZNPo7UO8qDD9Qx831UUePpIgrcJZ9c6q
         K5SCEwAYxk+CET3zRUu2XIt2VRnaY8xBBGJU4Zqo1qbMXMJ/DZ9BqWKrIH+Ht7P7DHyB
         FpsEBUJu7O3H5bB94e78K40AIQeYBURr9Iy4cuocKgoIatnjugpUjEPXTrvK59/3V1cy
         qnNIbY5UmCZYQLE1in/Ci7FyHM6KdaHUH5ImMY353zg6ukC2e21VKMP7iU1U3fEllnJ6
         8+zg==
X-Forwarded-Encrypted: i=1; AJvYcCV1JAyh+SQfyemnuZLZywz9c7J8NeZSyxCRXott7FDjxMDDmpmKLctCtGWD0xcdmOC84aDPmxuLGkDAq9oV84b/lAg=@vger.kernel.org, AJvYcCXcMv1ofRnA1Lt9oqMXxIIr3gaBoelZUeHCK5TNbLL8tBI+yhQwA5IE+BtmLCPujKNHBE9GptjwJ1rSMug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgKi5oiZLwQW2nN5A2rlugOSZ355HWyifRaXkjGDP9TP95bKD
	Hd5tnIgemDXbY8SHnoaiU32nuSXWswXdK+EMiB/D/sC4UiKrnQ1qB7TQrV1O
X-Gm-Gg: ASbGncuXzxmJF6Y6JS5mPp7cWWEQ+bMR4r7sm6+Y81WpWH+zFyop2JNKHCgUL56SLTg
	cBPLORDYQHx3Hi0mpF5HsJrpmFElVrMUL48G9BmBumxawZOFxitpKLZjUiSPQj5ciUpLuQ07L1/
	VjLJlsbXIDV2UjLJdvot1H1zctjNKSa54zZWe/Yo3fGEAaSr3vHwUqSrpEA9ntI5NtWs4plebiD
	e2FjPhk87jfC0pWuCQx+2+M5UKLDsw+n4TnZTsO2BUMogwzbhmHLrqa73jEfKPWYzuxFK7pT5Qe
	0pilaN1zDw/fusyqp/k=
X-Google-Smtp-Source: AGHT+IEYsGLResGlc2dqGOdxooFxiaAmWMvw+kWdv0Fq2lLoDbFfC5ArRSVaYvlc6AtkD+O2VIGuQQ==
X-Received: by 2002:a05:6122:8c12:b0:515:c769:9d32 with SMTP id 71dfb90a1353d-518ca399ec3mr17194386e0c.4.1734445206293;
        Tue, 17 Dec 2024 06:20:06 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-519eb6fc69esm907680e0c.37.2024.12.17.06.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:20:05 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afefc876c6so1483091137.2;
        Tue, 17 Dec 2024 06:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWB6L/F/o3LNps2r7xsm3ih40/CAEGwxEuib3QhLHHd+E3zE3SJelhiUpSa7YH99B6/mBRXY9KyqANxlXk=@vger.kernel.org, AJvYcCXWDd0pXGBjqrE+TCb60PejFehUgiTxNNtzfvh2OwHIwZsIOr/GAS04xquxlPw2ntz+Ku8D4nZmz7oEfdu3aKP+duU=@vger.kernel.org
X-Received: by 2002:a05:6102:c0d:b0:4af:de38:dff7 with SMTP id
 ada2fe7eead31-4b25d6d83a1mr19193213137.0.1734445204670; Tue, 17 Dec 2024
 06:20:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com>
In-Reply-To: <20241204160014.1171469-1-jfalempe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 15:19:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
Message-ID: <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
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

Hi Jocelyn,

On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:
> drm_log is a simple logger that uses the drm_client API to print the kmsg=
 boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better don=
e in userspace.
>
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>
> Design decisions:
>   * It uses the drm_client API, so it should work on all drm drivers from=
 the start.
>   * It doesn't scroll the message, that way it doesn't need to redraw the=
 whole screen for each new message.
>     It also means it doesn't have to keep drawn messages in memory, to re=
draw them when scrolling.
>   * It uses the new non-blocking console API, so it should work well with=
 PREEMPT_RT

I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
Unfortunately I don't see any kernel messages, and my monitor complains
about no signal. Does this require special support from the driver?

    CONFIG_DRM_CLIENT=3Dy
    CONFIG_DRM_CLIENT_LIB=3Dy
    CONFIG_DRM_CLIENT_SELECTION=3Dy
    CONFIG_DRM_CLIENT_SETUP=3Dy
    CONFIG_DRM_CLIENT_LOG=3Dy
    # CONFIG_DRM_CLIENT_DEFAULT_FBDEV is not set
    CONFIG_DRM_CLIENT_DEFAULT_LOG=3Dy
    CONFIG_DRM_CLIENT_DEFAULT=3D"log"

Switching to fbdev gives a working display, as before:

    CONFIG_DRM_CLIENT_DEFAULT_FBDEV=3Dy
    # CONFIG_DRM_CLIENT_DEFAULT_LOG is not set
    CONFIG_DRM_CLIENT_DEFAULT=3D"fbdev"

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

