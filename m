Return-Path: <linux-renesas-soc+bounces-6146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B892C906939
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C926B1C221C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29F13D633;
	Thu, 13 Jun 2024 09:48:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DA17BBB;
	Thu, 13 Jun 2024 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272114; cv=none; b=r9vdvXf5vqFlm0KPVnODREO/kGR7A0NLVq6xF4xO1jqz4nQeoy3tH4Ke7eXgA4IlTpypc8suvkh7Srz/JwvPrfcli/gMf+irQROAd1VP8hKeg54mUhlbX7i18nGn5HLQ3G6FA+r8RWfyYgTpc6I4ylQ0AFJ7PrZvGA1QOgp4ZXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272114; c=relaxed/simple;
	bh=+173/yFhtpAgpVqwFeMSuqtpkoBSOEPI9YqzZf6X0r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Id10FgktT/NcCZrCaUdUiduMYvz5+yvnu2k8YUNrrv2yxM5ffPis4fA0gtNsTrzK1dieA2wexIlXicdg2kEPDWPXWIqgAeMZkxg6SPCBUaBdMhJNOSq5PhJ+fd3TZSTgxxTI8N7CdeRivUAP/AKxSPP3R1/AvAuaLpbGcpPmBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62fe76c0a61so12906307b3.0;
        Thu, 13 Jun 2024 02:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718272110; x=1718876910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN0VUZxh89jUmzyj9eWjf3yLJ8FuHbgZqiXwyWKisEc=;
        b=UsZnNLvWbfq6LxyBx4fDWtS9Aojqcm/MIZCEG7U3YS5y+vn5N6g7hGcYD5elhRwRx6
         CjH9mraxEYmcHojJ6b7eB1VcEiaQQ6C4Dif7F1Y69/rW9itETH7iNdwbd77VPjL+xVcd
         tnT2i8CSPD8gsK9LpVbRa7/zPsKE9fakX/Dp/Q61TjYw66aWu6HcUIQ6JJPas/3ZFKSF
         cNXxcNIf39xFXAOeZzwGAp1ZBtgtu/YI/wmyZIkAGPi0PEGswHJ9cuAPEf2KIH+N58O7
         BGijgSA3O9juh0MHmNx0xV34dvL3Xeyhgi+TYRiVtt+gV0fjZk2Yr2hjSd+4qSqWfhl0
         5a7w==
X-Forwarded-Encrypted: i=1; AJvYcCUM4ZOBh1Vb9LNg4srUzb3xjoOc8seOCf5snuOtyFQFrUiqRdOGuF0x4Bp6w5hTpgEySF2PmLCJgwjuoZ7DXnGp6HkYK5ILjRSQkTz+Lwa1wAek9ez9HAL9U6e8o1G3L2o52q1nIEvAy0VqTTC7+g==
X-Gm-Message-State: AOJu0Ywsu3MVLngzWdddBYJmJPUv/ZXdyuBVok8dxNin8x3m/np1srGD
	PeDrwabvYrTABX3bKzooiYM0vMKCp5+Zm0xtTekpkOjlmaFC2vzfad4ToFl9
X-Google-Smtp-Source: AGHT+IHVi4ohy5eA/JGlYKTS6RwKYeIxjDlrCd+ajZRG6yrvCgOwhotIbDAQgtgTeb8YwjQHBLxh8A==
X-Received: by 2002:a0d:cc8a:0:b0:627:e3ba:2ad7 with SMTP id 00721157ae682-630bc6f89ddmr11561927b3.9.1718272110015;
        Thu, 13 Jun 2024 02:48:30 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311af0819asm1239517b3.133.2024.06.13.02.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 02:48:29 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63036fa87dbso6345307b3.1;
        Thu, 13 Jun 2024 02:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXx1jGINI0jhvpcfSVw0p/JPi0u643uVyt3Ka5PjfV92emqRCNMapkS/3p0IBBNS/j9zFmnODHacEjtUtts6VwTOVbvy9LOW4sqAdYOwQVNS0IBOIxGeZEY3CdRi5nmu4MBdluAoheT/QapZZwc+Q==
X-Received: by 2002:a81:cb0a:0:b0:622:c70b:ab2b with SMTP id
 00721157ae682-630bc213d3emr11655287b3.2.1718272108416; Thu, 13 Jun 2024
 02:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be> <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com> <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
In-Reply-To: <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 11:48:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
Message-ID: <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

CC sfr

On Thu, Jun 13, 2024 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 11:32, Geert Uytterhoeven wrote:
> > On Thu, Jun 13, 2024 at 10:38=E2=80=AFAM Jocelyn Falempe <jfalempe@redh=
at.com> wrote:
> >> On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> >>> If drm/panic is enabled, a user-friendly message is shown on screen w=
hen
> >>> a kernel panic occurs, together with an ASCII art penguin logo.
> >>> Of course we can do better ;-)
> >>> Hence this patch series extends drm/panic to draw the monochrome
> >>> graphical boot logo, when available, preceded by the customary fix.
> >>
> >> Thanks for your patch.
> >>
> >> I've tested it, and it works great.
> >
> > Thank you!
> >
> >> You need to rebase your series on top of drm-misc-next, because it
> >> conflicts with a series I pushed last week:
> >> https://patchwork.freedesktop.org/series/134286/
> >
> > I had seen that you said you had pushed this to drm-misc-next[1]
> > before I posted my series, but couldn't find the actual commits in
> > drm-misc/for-linux-next, which is still at commit dfc1209ed5a3861c
> > ("arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations",
> > so I assumed you just forgot to push?
> > However, the latest pull request[2] does include them, while linux-next
> > does not.
> >
> > Has the drm-misc git repo moved?
>
> It moved to gitlab recently, the new url is
> git@gitlab.freedesktop.org:drm/misc/kernel.git

Time to tell Stephen...

> and the drm_panic kmsg screen commit is there:
>
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next?re=
f_type=3Dheads

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

