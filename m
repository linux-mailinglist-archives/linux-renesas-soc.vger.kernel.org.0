Return-Path: <linux-renesas-soc+bounces-6182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12D7908414
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 08:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBAE91C20D93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 06:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C341487C3;
	Fri, 14 Jun 2024 06:58:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7B148313;
	Fri, 14 Jun 2024 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718348326; cv=none; b=FgalRzmvgo3CXJk/nHqZd/8yCRx/rFZIaepmCPHrqwKgHZiI62zJEMCekUK+q0RszwA3PzEmlss3ZIcmESoiEH/kIbfXL63ltiso8lz/RQ/Gcyp5L1ex0hMBusZb1UaYnFJkHkm7jhvwSPrTDgLmyYjbk9Yg74YI5t8tlVmnN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718348326; c=relaxed/simple;
	bh=Hv9g3MWBEy7LVKjXcm2ZFs9ryf9gvOTVZAs584KgkEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMs0bapl1u8Ouapjb0Tgguufho9UBNIbcJ+nixMDir5EPWQJUPBdjBl2O1nw0VsHepWMGo+0o2i9JoECG6IcwUtu7YRTd1iIXAn2l1O/nruLM6NnJShLB8ZMq7e/vfL+TrihM/IwqnIak0FrpH2J6E1eXGQ99lA5Zk6T7g0vDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a087c3a92so18922877b3.2;
        Thu, 13 Jun 2024 23:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718348321; x=1718953121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDOgifzl3qyZK60HJDKWjPvBElHMmzoiAuXGri3GZ3k=;
        b=YdFfqqooTGkBD4eDbRHQ66xNNbbVLV2U7q1Pq617hqHRdTWrBqcnFfOvZu8V0NGSxp
         SzJ9HcHqWlIlv/A6dwX6VMHlLm7eg1rjACuwoNd//FfHVGWXDtbZkfN8A4FurjGK4SHV
         pz33MgH5wtTj7/QWocaxEl7XCyQwiLsjohpzfyxSNvAGcJjG7nkxiwX2lrvkR5avQHui
         vPFkdEZy3L4nEcMlLdzdUu3n0hIEY1WKw4fRfgn5SYmXvfr1owtuFGjIVt1WRS1PD14Z
         nuNlYWklNGVhGF7rZ/b1x4kksZZKTrYxY/ir995YcXWI1Lp/aryCgi9g8YArP2dtMDgf
         FfCw==
X-Forwarded-Encrypted: i=1; AJvYcCXDNlCIlmHQ9Imm+7iEpakzsqMOEF8HUVjpwKJ5PTjR0nAsjkMAeBdLG+HN5Bz6seLVEl1y0kMLagMXOhaXCA04TvBn3knc5yb2naryaReXkqYNlw6fdmbaug35yAH5pSuGBy+Sju+1GzuHerdJmQ==
X-Gm-Message-State: AOJu0YyaMmkGlufKhfyp89GgiaCevTipfcwCXY2ZOMmyZCHfs1jApcHO
	BHOviRLIlLfYD0Ld2PyjHTybTpF2296YsNSrEXMB8kknBPTZ8agQJi7luBci
X-Google-Smtp-Source: AGHT+IEyN9SOmfM1lRqyuTHuc/fkFMv3eBv1CyzdBn+STZG5Ht02FpAADX+mhxZY03VCe5fu6bs73g==
X-Received: by 2002:a25:c74b:0:b0:dff:4a3:2df7 with SMTP id 3f1490d57ef6-dff1534d83cmr1779702276.11.1718348320563;
        Thu, 13 Jun 2024 23:58:40 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff0475ded0sm439819276.1.2024.06.13.23.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 23:58:40 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6312dc531d3so16419387b3.0;
        Thu, 13 Jun 2024 23:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXevr9zwRqZ1x5AnEcqWNEQVqzBcB/FuOrku6hK9VIGvcRzQwQrCF8jqhE4EK/qKOBHTnrRDzjX7KYCi5nHEree85JkGDB/yrRCJJbVTfPx5xVLLPJB9bLM1xESORGlgpXI9PlfmYCyXgyNeuo2uw==
X-Received: by 2002:a25:ad62:0:b0:df7:955f:9b99 with SMTP id
 3f1490d57ef6-dff1549c637mr1516577276.47.1718348318895; Thu, 13 Jun 2024
 23:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718199918.git.geert+renesas@glider.be> <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
 <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com> <CAMuHMdUGEuX+8EP3gbCB-Kgri=h34q0ryjOd5-KE-4+fWWwsGQ@mail.gmail.com>
 <20240614075949.3a3c667f@canb.auug.org.au>
In-Reply-To: <20240614075949.3a3c667f@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jun 2024 08:58:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
Message-ID: <CAMuHMdUn4w74q0-_xDvX5vZogR68pKjmmRw0rC26jcr6_vcPMA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Stephen Rothwell <sfr@canb.auug.org.au>, Maxime Ripard <mripard@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen and Maxime,

On Fri, Jun 14, 2024 at 12:00=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> On Thu, 13 Jun 2024 11:48:15 +0200 Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
> > > > Has the drm-misc git repo moved?
> > >
> > > It moved to gitlab recently, the new url is
> > > git@gitlab.freedesktop.org:drm/misc/kernel.git
> >
> > Time to tell Stephen...
>
> linux-next has been using that URL for some time.

OK.

Looks like the top commit of last drm-misc PR [1] is part of the
drm-misc-next branch. but not of the for-linux-next branch, while
Stephen pulls the latter.
Is that a drm-misc or a linux-next issue?

Thanks!

[1] a13aaf157467e694a3824d81304106b58d4c20d6

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

