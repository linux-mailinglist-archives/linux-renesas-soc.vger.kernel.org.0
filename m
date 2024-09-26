Return-Path: <linux-renesas-soc+bounces-9066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87A987108
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBAC31C22913
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AA21A704A;
	Thu, 26 Sep 2024 10:09:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94D17BB30
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345386; cv=none; b=Aqigwkv7OLTc+Nx7XprDfBp21B3OGX79gvEj9Hu88LlXeDJp1qe1jhd0MRGwWT2CW1i/Zr5cyuN9GswUgM7Lp1Vb102z8ygZai99kiaxNFmE0jg876r3TP7tiWQX+EgXJ2cnZbFYUngeWlFFInnaNIr7Js1CKPy0B1PsMFeTULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345386; c=relaxed/simple;
	bh=B+JnuGSv5SOfPxw7vZ7Dqz/IhgclntTf42wVoeEH3gE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBgSU6OCJo9y9x+TRequjMGWP+FCceYYo41XqgOiX7YhYW7zEyXw8yTV/Bvd/8ComoYIyKt8e3hrpuayV53ju07SmNzEjrmiKk/4qOSeh7DQQI/zpDImqoHWlDc8F5xk4Hl2/7r429FuzfdR1njiX48ydUp1DUTnTIjozvMWCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6db20e22c85so7619947b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 03:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727345383; x=1727950183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2KU9wDkKdBfNHt+uymqjtCMXeRKtwZzLd6Am53NnaI=;
        b=hdbrpl/kpBKMYxEEynToCXL3eTpEE/J4DSMrsJj2EnMKFOllGUcQF+T/nZRgcZilel
         5/tBsbLADtieoi5XQPuFz7Q3lj700E2der5944ogOQiOSi/rwT7EEGRPdAFqbANjiOjb
         TEidTxYIP0PyWLRYWAekZbvegH7Kx5THqrl2OfVJhQolG7I9qACCDN3lTPgoKuh2wP82
         nmQVRoMf1xhCzhqwH2hL53/O0uRb9GWIWCLx/0U+N18W1CSWyIxdUtbhg3ylB0Mvj8Ce
         xcsKnByMit+ioTQ6/WvCrbjPFhCT4F2OzLyMKaNDleLVubU54wrMW2FQl+FsNThMS0Jw
         BEOA==
X-Gm-Message-State: AOJu0Ywa2ybLMwuOrj5YOocZRGIy2ireeoW/k/o106yFLlBU4PIZbPYh
	UFz2mlcWA8QlUC3VsY2LIQ8GY5iAvtpRthBhX3y6XtwFtGJVBS2KM3TQh0OY
X-Google-Smtp-Source: AGHT+IGWqb6fpKrx7KLfsX3B27UiHuA3psiPblU8B/Qgep8leNo0cbRralHEsW5O4r0CGkaQxWfrwQ==
X-Received: by 2002:a05:690c:744a:b0:6dd:bf29:cece with SMTP id 00721157ae682-6e21d9cb628mr40067667b3.36.1727345382594;
        Thu, 26 Sep 2024 03:09:42 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e22a5e89adsm3883817b3.1.2024.09.26.03.09.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:09:42 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6dbc75acbfaso7740937b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 03:09:42 -0700 (PDT)
X-Received: by 2002:a05:690c:3:b0:6b1:8834:1588 with SMTP id
 00721157ae682-6e21d9bb582mr53472477b3.35.1727345382073; Thu, 26 Sep 2024
 03:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926075724.6161-4-wsa+renesas@sang-engineering.com>
 <20240926075724.6161-5-wsa+renesas@sang-engineering.com> <CAMuHMdVBAWny2Z1e6_D+v+=jd2y63a=HDe9+cnRMwfNTeh0cpA@mail.gmail.com>
 <ZvUxxWTIDCGOUQjh@shikoro>
In-Reply-To: <ZvUxxWTIDCGOUQjh@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 12:09:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKHJp2ZFABhh5SKP1ago+YFW=igHFj2J-k4F_u+A6ecw@mail.gmail.com>
Message-ID: <CAMuHMdUKHJp2ZFABhh5SKP1ago+YFW=igHFj2J-k4F_u+A6ecw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: add proper node names to (L)BSC devices
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Sep 26, 2024 at 12:04=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > The "@<unit-address>" part is optional.
>
> Ah! Then, I actually prefer dropping the unit address.

Fine for me!

> > Actually, I cannot find that in the DT spec, only:
> >
> >    "If the node has no reg property, the @unit-address must be omitted"=
.
>
> Sounds good to me. However, sh73a0 and r8a73a4 are still a bit strange.
> They have a unit-address because they have a reg-property which is
> documented for renesas,bsc. However, there is no driver for the BSC.
> AFAICS, this could work as well with "simple-pm-bus" and we could drop
> the renesas,bsc bindings? This probably is a separate issue, though.

You can have DT bindings without a (full) driver.

Probably the other (L)BSC variants could be extended with a register
block and interrupts, too, but so far we didn't have a need to
describe them fully.

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

