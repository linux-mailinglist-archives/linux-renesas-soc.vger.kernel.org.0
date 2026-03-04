Return-Path: <linux-renesas-soc+bounces-28765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAKENlspqGkdpAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 13:45:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C31FFC81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 13:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BC7C301A518
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 12:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DE01DE4EF;
	Wed,  4 Mar 2026 12:45:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493F17B43F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628301; cv=none; b=kwUOVhBPEg/uN2RJKBTH/RsX4ZKei6t3M0rkGjU8Fjt2ch/tDar3Av/PpqwjESRQ1vTNi/aayQee4d8OBQ+V8HIvAgThLJXW7nc0QJUBGeoGqg0NbQCzsxoFpptw6M5BrzvX2L8Lfs68l4ovs2cA9DJD0m1Q0mqPJaZTVw55Fho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628301; c=relaxed/simple;
	bh=3Mro9ieTCWZnccA7uYcdmNAs151qBip0jfucMzPC6HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlL8HZfuJAVcB6CascHCDAb1zD7fEm39iDAaFuNZw5cQSFguhWhLaYyl/K0KYbA1Au1u5Ac7oi+ahe6jXftMmtOegzvdmxdKFpwVHvSN32MCv+NDWNDA3FjTo+Wr5uHQBLZb5Rw3uhQPDmGyxSpo/K42nHc5Da+o34iSNdL1Mb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso6748956e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 04:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628299; x=1773233099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jOJis2k42MuXRJfCHvO4iLfTzm70s8fuGt1UGFetG0=;
        b=nWJwOaDOYMTIKFqcNponbte8iPnBC9pPEp+huaEfFYK+CKT1oYFmusapi9Tw4QRjP8
         zCMBeDqmtoAvjnpB80W/fjTP34VpNJv4mfbnsASRD0QR5yl/XyQ1A1vTPs6UmEyNiakE
         4y7NlZ5AHgb0cl0FvuBWyZ9GW4aY40GWqJToFdLwgtjVbnLWb1SeffdeY/mNna0ZeXWe
         s8fbLnvD/xoJlM7/X581Y0N6fwaD1065hz/aCKV9hiGDjgN3iwR5yS7nhGvnI6762i4L
         4Vi5WAhHwG/sBUTY5dVGA/1Lc/uIVy5zSzrB8aS/e05woBM/MESSiw2VeLEn4beQmvlr
         iYgw==
X-Forwarded-Encrypted: i=1; AJvYcCV85tEkWgJ7jxqsbJ4mGjFzqG//ulPZLyTtYUOvlAGUf46mq92VZGbvf8w37koJ0f6hgSxKGCjYvjEGtyjKXTWJYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJpsMuakIq8qfhcCZL/1DYbInlN/fxyEmyGsQmZNvasdOFI8Wh
	4v7OulPquC+8ps7OUPKIwdU94VVoGd9oqbpN9m5WDgn6im5Z8mE/568wink+CT/3
X-Gm-Gg: ATEYQzw57bGLCXJ4RF6S9iqMTSevHqecprO0pml9JrlxrrbPtkuIAfQ43Vzi7j9o2aO
	h23xgBPv+z/0bD5mtrvgWiLMzpqGVSECI87GGb5gMxWZKBNR9Z5byav97njZyHDTT55aETl8WtO
	FMnHzwILtVKnlV71PMfK74KIEyyZiWu+yhGUhW+QpWa+lJ4MLKXq3EIzi47SGPNr7/s92oa8mEe
	F32oxJO6hqRyRv0HkqvULqhP6Vq0h2LYCzFzN5UFbgPxJSlWPXd4PfJQ2TtYQM7FdU0y4wKC1NP
	FWpwypMXmwQxZpS//VNu9IF3rt/nXkickGUNmF2t3PBmcteRAQpwkB0T+erBHqHV/wwav8pXgGS
	AKaCrToEsuMJPGd23g2sFhwz+vmB3OcBPiR6sqKJM+ZUSCx/tuS6y/I5ZwLTEkR5SlpZ4a7n/60
	OCsgD2VMizpQgEdqSWOHHEE5/UessOZ9DBUhTD+hXKU9MXWM+Cn3mAoK2+Gihz
X-Received: by 2002:a05:6122:e46d:b0:567:44ba:bd92 with SMTP id 71dfb90a1353d-56ae7611857mr842555e0c.7.1772628299217;
        Wed, 04 Mar 2026 04:44:59 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9229a4d4sm22689511e0c.19.2026.03.04.04.44.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 04:44:58 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dd06a96easo4366959241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 04:44:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfCTQnYzINMGSIc1fl/Bz473CrxFj5OuCKSf0fzvgJtVkDcvAozMlZbtI3iWBUQECEOoVD1DyL9CUOHKTeeC6XcQ==@vger.kernel.org
X-Received: by 2002:a05:6102:d93:b0:5f8:e54c:2f72 with SMTP id
 ada2fe7eead31-5ffaaf499d5mr808375137.20.1772628298656; Wed, 04 Mar 2026
 04:44:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be>
 <CAPDyKFotV3bUEQic6X3PEC8m4fcXtc0JF0u7HTj9nRF1koowgA@mail.gmail.com>
 <CAMuHMdUwLqWxp1pYj3fHf6OVtxrScg=wP=bdwLbjo7vpgmP4Jw@mail.gmail.com> <CAPDyKFq2it5TAEBBKBh+q+UiRsGYaORar0Q_42LCuxyKRLYj0A@mail.gmail.com>
In-Reply-To: <CAPDyKFq2it5TAEBBKBh+q+UiRsGYaORar0Q_42LCuxyKRLYj0A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 13:44:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYydpHzVCyCWjM97R72Kw7CC_yixh90Xkdx7zTFLrp1A@mail.gmail.com>
X-Gm-Features: AaiRm50ns5ZCriEiTsGAXYy21SfUlanA_iiWCQM7_dyXADpF8EAVg--zFZV8C4o
Message-ID: <CAMuHMdVYydpHzVCyCWjM97R72Kw7CC_yixh90Xkdx7zTFLrp1A@mail.gmail.com>
Subject: Re: [PATCH/RFC] pmdomain: core: Support pd_ignore_unused with sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 752C31FFC81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28765-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Ulf,

On Wed, 4 Mar 2026 at 12:52, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Wed, 4 Mar 2026 at 12:06, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 4 Mar 2026 at 11:56, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > On Mon, 16 Feb 2026 at 19:47, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Since the introduction of the sync_state mechanism, the
> > > > "pd_ignore_unused" kernel command line option doesn't really work
> > > > anymore.  While genpd_power_off_unused() still checks for that flag
> > > > before powering down unused domains, the new sync_state callbacks lack
> > > > such checks, thus powering down unused domains regardless.
> > > >
> > > > Fix this by adding checks to the sync_state helpers and callbacks.
> > > > Factor out the printing of the warning message, to make sure it is
> > > > printed only once.
> > > >
> > > > Fixes: 002ebddd695a5399 ("pmdomain: core: Restore behaviour for disabling unused PM domains")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > RFC as I have no need for this in upstream.
> > >
> > > I am trying to understand the use case and whether we should consider
> > > to land this upstream.
> > >
> > > Would you mind elaborating on how this is useful for you?
> >
> > It is (currently) not useful for me, but it may be useful for others.
> > During work on a new SoC, someone had hardcoded "pd_ignore_unused"
> > in the kernel command line.  After adding support for PM Domains on
> > that SoC, I noticed PM Domains were still powered down.
> >
> > The issue is that pd_ignore_unused no longer does what it claims to do:
> >
> >         pd_ignore_unused
> >                         [PM]
> >                         Keep all power-domains already enabled by bootloader on,
> >                         even if no driver has claimed them. This is useful
> >                         for debug and development, but should not be
> >                         needed on a platform with proper driver support.
> >

[...]

> > So IMO that should either be fixed, or the option should be removed.
> > Do you agree?
>
> Right, I think it's time to consider removing it, unless people still
> find it useful ofcourse.
>
> Do you want to send a patch that we can test/review or you prefer me
> to handle it?

Feel free to handle it.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

