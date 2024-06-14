Return-Path: <linux-renesas-soc+bounces-6249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B8908B38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 14:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9931C22D3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 12:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7444C195B16;
	Fri, 14 Jun 2024 12:04:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C41195B2E;
	Fri, 14 Jun 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366669; cv=none; b=EPtjUtEQD6/Jx2G7mZA/90yb3vZY7jRY5PK2qoGhWDG8cjU+a1JC3AgqMX2FjoM/PvxHfuoeUOrX3aY3e9N0PZKXo7jhxeWQubai+x8wFJ/9pR50FwKqu9NsiymfS5AVkk3J+fNSQ44pHVxCMCUWErclYkBn6UK90njpylHla0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366669; c=relaxed/simple;
	bh=ySfgBRoyQ1djsPjzR4KlUp1ITUBtOx3b10XESW5KDt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+BDsYE7q7MdikFiN3X3ci8NmaW/y43LkNdZnfnOvXl52l0v/uvtgR2plArCy79YBW1kzuctQ3l/z8/TMrTzUvxQQOcNm4y58rBzBVXG74oMVe3dPUVc/f7lJz+SWw9wcDi4Ij164p41C1h7a9smKNhhVtz2bWTZk9kXeMGyl/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6333082fb8fso167587b3.2;
        Fri, 14 Jun 2024 05:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718366664; x=1718971464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ovNrKBz6SE0Xp6qLyWrHKke2Z46ajqO3lSt7jQEreM=;
        b=o3nw6KqQQrRHN8U9BGo7IuqlXwjpk1zvPDh/cXb7JB3fC1nCCnRNkTEbx7UGEHns6k
         SRjz0o8l8/EV9hcRSp+AJn3ufL4vufEP6qJsT/dkdA8t5VgmxZatv+WWnz4rpag23Dm0
         hhuk8pVLwodk6zzvNS0vTMgDC/WnWFJzxGKF0+CU5YEPukITmUpkhOKL5V9ih+m+mRIF
         LbtpSaWiWHTTpj9rzYb5wrloTylpUXSJ1LJrI2kYKJjbPcE3naopX87yej+M1H0pFgT2
         S78q6ilzqXzUeT8PFm0uaGWQJc4UptyHEnGqw/YWXDWmfg2ikNZOXtuTANKXldS7Qo7o
         N0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNCrTZ49G07MdsrjdAJuW63n2fuaQSMEveEWuE/gQBEhI3JVXrKQ13gKh7jr2HKsoA+8owycrcUhG2XgHfY/Gr6bau4IJzHEiHevmd7maXY4+kcYaIFMy3HtU36WHFtHOzmtC/EslMGvPxn3Lsg==
X-Gm-Message-State: AOJu0YxKgvfdsdCCiY+ZQ8gyg9eyj3Vdb7SdcZtVe2L2lh00koPqfwc8
	EDOrg91MMFCqDHmKhISIalwdwXv7hYJdEujQpDFWBEk5AbLnrAaqvQajX22m
X-Google-Smtp-Source: AGHT+IFIOtKAR0nY7aoEZsz3zwd7HFTxy0dmv8SoXNEl/qxrMpNi2Hxdd55LL+o6eJ8MUuNZOf75pA==
X-Received: by 2002:a0d:f083:0:b0:627:dfbd:89e with SMTP id 00721157ae682-6322206f4e4mr20968907b3.11.1718366664440;
        Fri, 14 Jun 2024 05:04:24 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e99877sm4384307b3.64.2024.06.14.05.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 05:04:24 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-630640c1e14so26442607b3.1;
        Fri, 14 Jun 2024 05:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJb/rDZMava6zHD7X3IkX2LYjFoW28N6Yeb1BAN1UKhGbf/DzW5OL0N2X3p8NcLSAM33vgnUoDJoLY2xSbWwG94mgFvsD1Pt0nmt+SLXv+x6EWRggNyd4CrIqgh8SsGAKOo+nZQl/VwO0rJK1LGg==
X-Received: by 2002:a0d:c304:0:b0:61b:349c:817 with SMTP id
 00721157ae682-63222560c71mr22278067b3.12.1718366662348; Fri, 14 Jun 2024
 05:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718305355.git.geert+renesas@glider.be> <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
 <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
In-Reply-To: <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 14:04:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWR=XgMi_9-K_FxJ9wUForvrNLG-QH0K7DvCOJsRGD7Q@mail.gmail.com>
Message-ID: <CAMuHMdVWR=XgMi_9-K_FxJ9wUForvrNLG-QH0K7DvCOJsRGD7Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Fri, Jun 14, 2024 at 11:55=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> > Re-use the existing support for boot-up logos to draw a monochrome
> > graphical logo in the DRM panic handler.  When no suitable graphical
> > logo is available, the code falls back to the ASCII art penguin logo.
> >
> > Note that all graphical boot-up logos are freed during late kernel
> > initialization, hence a copy must be made for later use.
>
> Would it be possible to have the logo not in the __init section if
> DRM_PANIC is set ?

That would be rather complicated.  The C source files for the logos
(there can be multiple) are generated by drivers/video/logo/pnmtologo.c.

> The patch looks good to me anyway.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

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

