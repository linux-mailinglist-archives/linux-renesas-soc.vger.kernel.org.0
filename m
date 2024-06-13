Return-Path: <linux-renesas-soc+bounces-6143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 618019068CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14D011F26A2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3A113D891;
	Thu, 13 Jun 2024 09:33:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA984D03;
	Thu, 13 Jun 2024 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271182; cv=none; b=PCE9nW74ll0Ofi85R+UvOYCT/fRbURqurbb+DFi4yK7c8dwoP5tkvRGvM3gjRBac+KYYW36yv2gKbjvC7TOvsTfswEJo1UsO9KDJvIKrMTzIOkolIOOQErRBv8ke/32e/Mtc4xx0m9llGdbFLzLFGPb/aIxdzNw/GYm3/qzo5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271182; c=relaxed/simple;
	bh=Nq8DE0/Yz7oo5eVhfZiwcymEEXI/u8zw17jUMNn5pbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH5vatqhORC41wikQg4sthYmxzAJaciEH1fxTXV4XxMOuVr7rmP+kE9bF2ozWJIXsSUM35K+rEHjMSToynQUpPXdZ+gS5T31E+h7u+QI1jf+620+F16OmrdIJivvBuAUosCoYXinGwh4NCFfoHfjH93T0hgvGpqxeEppuSjO82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfefe1a9f01so932261276.2;
        Thu, 13 Jun 2024 02:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271178; x=1718875978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lhk7FkMhRX3Hop+f1KznOVEB0LMy596r2N2+WQDXxi0=;
        b=L/8OIhFr6kjNuPEJSxDehjENbJc+2l0F3EyE+gOZHuNUiWQOSbOhcflae9E0CTZadN
         DB/yOhTR51w4m3GueD8Gp1TDaYKLRsm+7AupSaQuukyW0LkKv1I1hiVtPrJZ0WiH0/nS
         2R97SrB7Re2LRlp4MUoO2BrcoSLo3jZqCwFI/v1fM8vI3o6r7RzycRcjm+q0MYcaMONS
         6CzuwFyJwBgdC8G4z303MygP08DKeqK2XPKUeyEy+c0hX3Poh/isHJsZExfe9tDpjghB
         67+xEgPe/EEq/7Xdlgm+g+ytJypqFJHh/0iE8RV1B0eA2kC303lAwjZwbydH9sJy/v4+
         p1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2kj0TZCZjFvsiGeryg0zNmwDsB7IYQXjwrHheGmJcAjC7IRBpQOCTkMEY8aEzhyyjfebWic/EXjgmPnhSxvQmDTSB3Hctu5guSAAdoLEAOCFxXou4a0DLQX1fGdSe/0vFMEY8gL1AHpgJgYIbGQ==
X-Gm-Message-State: AOJu0YzYYrQ00OJVAdtLCeVJJMfKpzeyuusVZOcmpjQXGax4IzqYPLPD
	wqjvW+Og+GAgBuRCDmDLCzPlQJkJt58JBlO+8XYwbTyM3TR3Hq/H1GbcksOK
X-Google-Smtp-Source: AGHT+IEnjaHR+YGdHQdnKzt90p2kGsihvVGTe2KOUnpgEqII7mQbOUs7L+qj20GZlKTtP2yuS4k8Hw==
X-Received: by 2002:a25:83d1:0:b0:dfb:4ae:27c with SMTP id 3f1490d57ef6-dfe68c09aadmr4545205276.42.1718271177661;
        Thu, 13 Jun 2024 02:32:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048767e2sm147229276.17.2024.06.13.02.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 02:32:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-627e3368394so8734107b3.2;
        Thu, 13 Jun 2024 02:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTYPbgFBz+/SYUAEytbKotMT2vjcCWGl/NRwMFnt73kdhMt+0Ly8FYaLwDxPKm+D/9mDUO7aQBUwhgUle+kxk47WUTtJKwgYyIWS7KJzyg12K6hEw35r06DKbbft6+bOzmvDspp55kmLVLPyaePQ==
X-Received: by 2002:a81:89c2:0:b0:62f:74d5:5e64 with SMTP id
 00721157ae682-62fb8575257mr38097387b3.22.1718271175624; Thu, 13 Jun 2024
 02:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be> <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
In-Reply-To: <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jun 2024 11:32:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
Message-ID: <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Thu, Jun 13, 2024 at 10:38=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> > If drm/panic is enabled, a user-friendly message is shown on screen whe=
n
> > a kernel panic occurs, together with an ASCII art penguin logo.
> > Of course we can do better ;-)
> > Hence this patch series extends drm/panic to draw the monochrome
> > graphical boot logo, when available, preceded by the customary fix.
>
> Thanks for your patch.
>
> I've tested it, and it works great.

Thank you!

> You need to rebase your series on top of drm-misc-next, because it
> conflicts with a series I pushed last week:
> https://patchwork.freedesktop.org/series/134286/

I had seen that you said you had pushed this to drm-misc-next[1]
before I posted my series, but couldn't find the actual commits in
drm-misc/for-linux-next, which is still at commit dfc1209ed5a3861c
("arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations",
so I assumed you just forgot to push?
However, the latest pull request[2] does include them, while linux-next
does not.

Has the drm-misc git repo moved?

Thanks!

[1] https://lore.kernel.org/all/3649ff15-df2b-49ba-920f-c418355d79b5@redhat=
.com/
[2] "[PULL] drm-misc-next"
    https://lore.kernel.org/all/20240613-cicada-of-infinite-unity-0955ca@ho=
uat/

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

