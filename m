Return-Path: <linux-renesas-soc+bounces-2768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C3854AB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BFAF282A02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D61954745;
	Wed, 14 Feb 2024 13:45:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2217535CC;
	Wed, 14 Feb 2024 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707918304; cv=none; b=o8ksdi8KC/vh+RtPxBi2eeJJRJIaq6hjaMFou9wEI79s4cLTKMxRTfy3locyJA5T0/FyfDzE/h+8vSQBrofgwB/q5jPSdiqc8H8vmOdyDDXIkHYZX7PtqfgHnZdB2+Bpx5ELmZMJ32mykoRfTlyg8VTLDwI1nKe4WEFAJcGt8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707918304; c=relaxed/simple;
	bh=nBaPHkIVuR7flloYS8LASWXQTdbgs8T21toFeIe4v44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPyBryDIkrzsH1VLb7p7lArcKFeO8CZrW0X6acxFIn4wotsMcHnX0wrWhBkMT6DCgh5Bo+SpOQ/YNfK3XpSzYscJLy567dInb1z1TEgc8xiiTEsSjRqHDZQpva+JAOrRQpLOWYSjCEC1FjBrEDLC+Mx182ysrnT6aIBRwRAzKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so689443276.0;
        Wed, 14 Feb 2024 05:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918301; x=1708523101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQOeNstt3RXI2238CFLQ3UHnfov62fpAyks7O9zYyRg=;
        b=kmlNYrqlETRWZJRn22AHVUZ0V6imMaeRhiRJ1G84MABqZoRU5QOoC0ZZsvH+5RtsGN
         Q1a0l7s+3WVj0uhprnDVJpsifCIntpHaXUKUk15Seh2mYKQA/dqXYgQMyyxzC4hj7VO8
         k6RAGfAZOjbpULJ/iFPWhRFd44I3Kvk2aMrVqZ1XEzmrtVx8axgXqGodWJeER4lfaAsl
         qKAqJnz5ksjgrDyXc8qP3gvuTCIuyLQxc45dUGoqKZKz2DSOP7CnacZ6VYyBQXD3zaKG
         1uPpve8fYBgyBYXMtPfE4CJzcHwloXR1ub2VipF34spWWIFVeOHk7LcCWGsvJUa2AtW1
         rxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGAGlKBjkOke50/wqyjNAa2Fy/NjUKWfc+0rS6w7lfHV3K2AnbCZ3a1MsGs5FWjk/kPfIa3cvBAWAjSizWDX0lpcZfkP/twAradmYATs+syOysP5B2ypF1YIoqkG6k3EVonhOpmZTCc45JhS4=
X-Gm-Message-State: AOJu0YwB2fEXu8V1nHoo7lUh1UJTbRQblQ+7djlbEqU1bx8v9NE/3MLp
	PN7hbBuXZAKxlGNHaTEq1RKmyh5c+resFHgqwXOPbRl4pmc+XlASBCIUZrkuX/I=
X-Google-Smtp-Source: AGHT+IF7FH4BbqaP1kGi4Gz9RPNsvgnsg27vQs+YgjE8987qcFR9paID9/NfSuxBYMC218fpaNSgvw==
X-Received: by 2002:a25:35d4:0:b0:dc7:46da:77ce with SMTP id c203-20020a2535d4000000b00dc746da77cemr1391584yba.4.1707918301246;
        Wed, 14 Feb 2024 05:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcTjOQzQ/72YjtewU75IAtYXjZVssHn2XajqJQvQ97v7paE7bh9Euai07S+ZBZr2rgYkclm3H08BbZTMptWwtTeU2PS++cHiun4Uio1k2txEH4dtlt2ud2SAAyUyL14HgANEY3/mTY+a+7js4=
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id j124-20020a0df982000000b00607ac837eb5sm190378ywf.13.2024.02.14.05.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 05:45:01 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso698140276.0;
        Wed, 14 Feb 2024 05:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXi5xr4qFerdKlUfetoInytUzMfXVOuMPfthehFC+LsAmbp6pAOIZn3DekzxyGgA/XWBPBuX0ZLxHmBLNxpljj4W2boftYHfSTD6NKCfX/x8fnWAHr85afNCHxNWioLX+RBQCuH+pfuwACHic=
X-Received: by 2002:a05:6902:2589:b0:dc2:23b1:eaef with SMTP id
 du9-20020a056902258900b00dc223b1eaefmr1691995ybb.18.1707918300880; Wed, 14
 Feb 2024 05:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3a604a6924043775c2ed0630b1c5c29be2d1a5b9.1707915642.git.geert+renesas@glider.be>
 <Zcy70FoMmAenmy1A@shikoro>
In-Reply-To: <Zcy70FoMmAenmy1A@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 14:44:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGsEGBTTYZ4o+__uvupOvR8QDSWrEk2e4AB6Vwkn_Acg@mail.gmail.com>
Message-ID: <CAMuHMdVGsEGBTTYZ4o+__uvupOvR8QDSWrEk2e4AB6Vwkn_Acg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add SDHI clock
To: Wolfram Sang <wsa@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Cong Dang <cong.dang.xn@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Feb 14, 2024 at 2:10=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
> On Wed, Feb 14, 2024 at 02:01:34PM +0100, Geert Uytterhoeven wrote:
> > From: Cong Dang <cong.dang.xn@renesas.com>
> >
> > Add the SDHI module clock, which is used by the SD Card/MMC Interface o=
n
> > the Renesas R-Car V4M (R8A779H0) SoC.
> >
> > Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > +     DEF_MOD("sdhi0",        706,    R8A779H0_CLK_SD0),
>
> I assume this is correct because you got it to work, so:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> But documentation is unclear, the diagram above the table says sdhi0 is
> 707 while the table says 706. I guess you reported this already?

Thanks, I had missed that inconsistency.

After adding a dummy module clock for 707 to the clock driver, so
unused 707 gets disabled during late boot, eMMC still works.
After exchanging 706 and 707 in both the clock driver and the .dtsi,
ee140000.mmc times out waiting for SD bus idle.

So 706 must be correct.
I will report the documentation issue.

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

