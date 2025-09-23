Return-Path: <linux-renesas-soc+bounces-22197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B845B951C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7725F3A75DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 09:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB1B31FEF7;
	Tue, 23 Sep 2025 09:02:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C806315D2C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758618162; cv=none; b=qZtSmDjJout2EXyfEIJqrmFV6plLc1MvxsarRh8wOH15ULvgN+Sy+QSsJROF8/nKlPS2nTOdStWDeD0kAiu/OSYZL6/USthGbv0c6M7Y1Bx8TLuwbRHHn3Ev5bTuKTfcKX+YOt7MMeuiiAgq4bJFM7fCFx2p3WCVr76gHfYXTkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758618162; c=relaxed/simple;
	bh=V9Bnyhc2LiTupgXlAm4UX/P/ViAnCZJZO7I/lP2rjo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsEoYQXm97GRdn/mc3m0wZclboQ0jbfpV0sjeZNhwqhHEjy4DPS65xcVKyoVHwpF9O/POUsIylggu4HBM/hMp+55sZFOqjpmvSHXdCBU9zwNb0kAZSDTVKa+bfrK2k1b4OtZdvT+uNZet/ENw5o4nBG38MmY6UL8KY41HgESn14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5997f407c85so1046124137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758618158; x=1759222958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNBYTpqWi/E84xPUQlHNqQtKJX+BSjN7K2AeCYNEx38=;
        b=AmS8bsfLlqwVgf70xumSVp7z34lmapUSXJQ9/fmudNJkAPlWEwK6b6HoxvXV1OO+ZN
         oVNnxwdh7/uBpxmQhCs8wfjRDwvcKc+a2mJTLV+zAi1DZRveGFL/lGyJ+LkAOUkquklX
         dBurJZ01/v/gXZKwaZFPmLtWZCfgjJA5rc68C8HCLwuXt3/fdSSYDxSSzkidJJeFkbFd
         jimaIBO24fiiIdgvSGJjJVSr7IwSOjZkoaijWrps5Jhab6P67zItLU7rN0IGNNdU3jDi
         fpEtbc+HImoo1ZjVXxNP4e7p3pjN+QfaAa2xGHW398kNS5mFI5EoJK4IlAiKptXageIS
         5Fcw==
X-Forwarded-Encrypted: i=1; AJvYcCWTm2gczJul4WlIugMRYWog5WWx6zmzGtM53qWMBALnW88OJ41+GZvP1vgfumKHUcQnNhkZZGcYy4OebWCyzSE1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzML7bWKSju6vZ/BBieeOeVuQjaupN5HrkLLAsvUnKu8vkxMk1G
	o0XOQ4ovlYwtrCTh3yHsIOORC3HLbumnixE9sV3JqTTdqxFA76noqH72bVQjW0Of
X-Gm-Gg: ASbGnct4dgHyTQcBe+dke3NaV9Xq0eT4aOx6EZIGBfCJ1XbZ6NFMFCKt42ykYtNgRyK
	Jwe6hf5tpS2niyeQ5foIrPsPPXgrA2ksHTreaTbNrq1OmV/i1zbFrWyKoa6f9bbsT81qFzxJuGz
	zQkmUaWc6vyYoEbzewEhMrXuyedVKodLawz91lOx5VKG9bx4FsyLsfSHHSsLqYj1v+rXaSStg4A
	elAKF72yLtjM2v0Fkdwk87pCVsdk+reSA1IXSZ8kNDdFURGSuAZ8oJARZfGUtfYBJFVk8trluhq
	lQ7Y+OC5Mbr8rkuVaUbeK1s9FUAb6NI4AyohqVuqKPIGjAJfMpKko7lYC41Q4R3X53WFOLqk5kp
	JiPbRmNhrdC4wEWSPE8HkIm/LN6d0egTF+PI81IprSEVN/jmWEvOdX5oXxQtVNuYD8Anb+68=
X-Google-Smtp-Source: AGHT+IHs6eE/tCMdrOmHOFQ1EcMF/9tR4N9EYP3hB7QM4isExC/A0tgqUccGXK49VQFOHWFZqZSDLQ==
X-Received: by 2002:a05:6102:4bc8:b0:522:f65e:c76d with SMTP id ada2fe7eead31-5a578c96e36mr645437137.23.1758618157644;
        Tue, 23 Sep 2025 02:02:37 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8f25b3cf97dsm1493557241.18.2025.09.23.02.02.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:02:36 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5a3511312d6so731163137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 02:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5qqdTDl/+PRihzUlDqoRqEBLU7DhLLhmqDDSwZqxhH6jakDi0XH//FGuOavUA0WsKk8lRdMqVM9WpFxeQJIP4qg==@vger.kernel.org
X-Received: by 2002:a05:6102:2c85:b0:523:d987:2170 with SMTP id
 ada2fe7eead31-5a577ff90c1mr582185137.21.1758618156219; Tue, 23 Sep 2025
 02:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
 <241530bb-7c06-4055-b95b-83a89f27895b@mailbox.org> <20250923085712.GB20765@pendragon.ideasonboard.com>
In-Reply-To: <20250923085712.GB20765@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 11:02:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb70kgf6EMZuqfbW2+Pw5fjmYSzDwHOzaPJUAqbbU4jw@mail.gmail.com>
X-Gm-Features: AS18NWCQnjp4Gw0SnVg36PQ_Ax26g3WaJZQDOF8461nVJTCkiD8fvdqoe-5LgZA
Message-ID: <CAMuHMdWb70kgf6EMZuqfbW2+Pw5fjmYSzDwHOzaPJUAqbbU4jw@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp()
 usage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 10:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 23, 2025 at 10:55:20AM +0200, Marek Vasut wrote:
> > On 9/23/25 8:47 AM, Geert Uytterhoeven wrote:
> > >> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
> > >>          u32 vprmset4r;
> > >>
> > >>          /* Configuration for Pixel Stream and Packet Header */
> > >> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> > >> +       if (dsibpp == 24)
> > >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> > >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> > >> +       else if (dsibpp == 18)
> > >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> > >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> > >> +       else if (dsibpp == 16)
> > >
> > > What about using the switch() statement instead?
> >
> > Not for single-line bodies in the conditionals. The switch {} statement
> > would require additional break; in each case and that's not worth it
> > here, it would only add noise into the code.
>
> I'm a bit surprised. I don't mind much as I don't work on this driver
> myself, but for what it's worth I would find a switch statement to be
> more readable too. Coding style is of course a matter of personal
> preference in many cases.

Exactly.
And you would no longer need the dsibpp local variable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

