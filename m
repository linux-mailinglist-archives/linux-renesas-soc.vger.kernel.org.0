Return-Path: <linux-renesas-soc+bounces-23047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3F8BDD8A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 10:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AEEE4FF8BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 08:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8764531A7FE;
	Wed, 15 Oct 2025 08:51:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAFE31A7E6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518297; cv=none; b=k4T8Sz21gYpUxwDiCY2psxXPRGMNZGJA6ocSectTRGJ6ltwL6UTqLk/V8/0Jw6YWPHBPgbyYCeUEO1kJaVW9CLopULYw/YvTk4zC9bnyVFg6bnmZ6NsMGAk8yRhUnzV4O85Y3mFgnu8rbKKWS+W4bGrUcjri1t4QoNf8bXVJGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518297; c=relaxed/simple;
	bh=Xe6Y50t/1UHK03lauiiO1RqhnypsAyHrTe2pPSI8Vmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4fdHXyp61oorhMnI4Hm4q/I/ENcpBprEH01ZPWghz2hPpOUGvd0tQ8zKTlt5XX15/7JO1LnF6xUY6IeEiu4Zxm3ntaPbJmnIMhSZJxdu1oc3feIqHX0haMDblOj9pfYZWXXJRIQDnReYozxTtcCXhZ+9sah7vvLL+A8FZ9oB8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e364003538so4115907241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 01:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760518287; x=1761123087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cc23OylIA7nwIKH5grl86j81RiWu7A7C8vOJ884eZmU=;
        b=knoOKa37G5j/sMTfsUZkjbGWRuxnEqWw3m/vzXQYD+KlyNhibkfS0NADgv+5fgveWZ
         dMHeEOdDCufv5Itq2HvgxsXYCBlGk3t5l1si/AE+iVxPX8wOhBBRIjRf7WoWyok6M4El
         2cP6L8nb50wgmrJ3Z1uUtSPlwWeAlB25lSC3XKl2+dYW0U8PJX6fKdmcyo4e3zDITC8y
         XkJueBz6YSYGjlNTv8XNoRXrj5ShpbMQvJCK7Z27KNctU8WYzopQ2xSrvqA2og1ubjAn
         wndaWCZoft3Jqughfe/eRwz+qXibjK71IL9kERAR5F9P+oSKf5KU/o+MS72GJjayH/DN
         76hg==
X-Forwarded-Encrypted: i=1; AJvYcCVqEbP/zE00sZNn1GNGNZjj8RpXGhomCR4FbMlzf/9zj8TlgvIKT6/lGJxsrllN2liNrP/7nYZz5dGAh6aEBD4Byw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4rMAyF4QdDpNJg32hshwGhz+wmosRs0lg12KFEfomMVN5cfl
	LzzejQyOGjlxaHybPuvnRIl01SxXbxag65Gf2uLw19RuYMeay+rs3oluVaB/SO7l
X-Gm-Gg: ASbGnctoyoeSfU7LHfLZ/ocIlpAWG7AtvvtwpHsxZzJg8AOZcvsJIR4aONPE3wzIzMl
	SxLf+5zXg7YVfBPlxTaWbC2v1BFZFNNtuh6rg7m/i355Fr9anV+xv/CFegsA2I3/pV0W/dlhRK8
	ph5ru3A8GcjJqxe7dlggEbPACLSHvYNdFCZYvRgg/WrALWirbK6/VRfznpM6XusrKWUhIHDwqfh
	kM1LeEOFBxPbxEDDY3lCGwjg7CsxAHtZI3AtVMtdWOYSZzosmAxetQNVLl4DXs1zaju6XrMl7En
	M6eoPShz3rvYcF0nIHKONpqixi7JXPBGPp60m1/D+aodi3MirJmPbk3zwBgoflj3Rlsj0qosbos
	YOp6RdVCQbT5GDbtU7w/ebAvQPbLtojYEzQMP3db97unebjyGUZBYxEf030kjFNoo/MNrlfkS2y
	dpOcR8AdorR8LtFA==
X-Google-Smtp-Source: AGHT+IFCkQnsMbkGpItLoADxjYfuzFFZJM0wGADImDihH737Js6hpsLUOC+OwwxLTfAN3nr27gyGKw==
X-Received: by 2002:a05:6102:598c:b0:51e:8f20:159b with SMTP id ada2fe7eead31-5d5e2357302mr11186079137.29.1760518287312;
        Wed, 15 Oct 2025 01:51:27 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6ceb59sm4312266241.6.2025.10.15.01.51.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:51:26 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ce093debf6so5756675137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 01:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWw6NF9H6vmN9Tow1zA05vbGUvON9hzyN9477b13hMEwoehBUYCOFCTrlo2sMlUIEmF+HYilPaDG0aXnS1li29AvA==@vger.kernel.org
X-Received: by 2002:a05:6102:6219:10b0:5d5:f40d:28cc with SMTP id
 ada2fe7eead31-5d5f40d28d5mr7213275137.34.1760518286251; Wed, 15 Oct 2025
 01:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
 <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
 <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev> <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
 <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev> <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
 <c1099a8e422abbc5d12bf3f325cb9f2140c8c006.camel@pengutronix.de>
 <77678dd6-071b-4911-a5c5-f1519c92e91a@tuxon.dev> <6ba1fd1f07753c9b98a57c87bffbbee16971da7a.camel@pengutronix.de>
In-Reply-To: <6ba1fd1f07753c9b98a57c87bffbbee16971da7a.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 10:51:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ_Eabhz0=FRB28BqdidQDpjdBOGq6+9yR6pioNfA_Lg@mail.gmail.com>
X-Gm-Features: AS18NWCfZCQ0twtFVwNHBIGpA19Nn65er5LxlXMaub9DnCgxRsRqvVPljtERNfU
Message-ID: <CAMuHMdVQ_Eabhz0=FRB28BqdidQDpjdBOGq6+9yR6pioNfA_Lg@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Tue, 14 Oct 2025 at 18:42, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Di, 2025-10-14 at 11:36 +0300, Claudiu Beznea wrote:
> > On 10/13/25 17:57, Philipp Zabel wrote:
> > > Is the issue that you need the PWRRDY signal to be (de)asserted
> > > independently from the CPG power domain enable/disable?
> >
> > Yes. I need to de-assert it before clocks, MSTOP on probe/resume and assert
> > it back after clocks, MSTOP, on remove/suspend.
> >
> > > (Why?)
> >
> > Due to hardware constraints. This is how Renesas HW team recommended.
>
> I still haven't understood this part. Isn't CPG the power domain
> enabled "before clocks, MSTOP on probe resume" and disabled "after
> clocks, MSTOP, on remove/suspend"? So PWRRDY could be toggled from
> genpd notifications. If it needs to be (de)asserted independently,
> wouldn't that mean the genpd notifier approach can not be used?
> The notifiers are called from genpd_power_on/off(), after all.

Please let me chime in to clarify...

The CPG is not a power domain in the sense of a power area that can
be powered on or off.
The CPG is a clock domain in the Linux PM Domain abstraction, more
specifically an always-on power domain that contains devices that are
all power-managed similarly, through their module clock(s).
Hence the CPG PM Domain itself cannot be powered on or off (through
the generic_pm_domain.power_o{ff,n}() callbacks), but the individual
devices that are part of it can be started/stopped (through the
generic_pm_domain.dev_ops.{start,stop}() callbacks).

I hope this helps.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

