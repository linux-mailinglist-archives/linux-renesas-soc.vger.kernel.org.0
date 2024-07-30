Return-Path: <linux-renesas-soc+bounces-7621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE3940E28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 11:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47E2D1C23511
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41257194140;
	Tue, 30 Jul 2024 09:44:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696418EFE0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722332671; cv=none; b=XSjV4Zp1sKMZyW5ESPzGiTEUbBD+d831RjKGj1lSIAiJGeIr/nz8e44+a+5rx0du9zJBgz6TS32PTNPbDs3la27CoVN6RTXYtWH7Gjbud9vrXDMTHdpLTC3E3DJnR5MdlXsV1mdwx7v4nyhqVsWnwZVvKGQjovcTOPZFqUKUhE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722332671; c=relaxed/simple;
	bh=LWf8RmGmiC2GiiZgnXrPtiU+MZtz94nWTNz9XIM29No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FqYSBUOJAef663KQUTQomKetR3amk2Tg7jTeu3ipJH4DWge02d74ZkULUsMXyxmXRo9o65rePtBjTZc8AqrgQOo0ERvnXrf2fm7n0LziAKde6rY21t8zK4RaSPByVBALpnt7uekTWr4Spt3/IAzAwOl9g8gkHYyl+Ar0wnHokd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e0bad5cc8aeso15673276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 02:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722332667; x=1722937467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU/Sh37+1y6cP5Ldluk+PoJ336o/0iHRifjkZvD2kjk=;
        b=Q/jNU1PekSA1J+URtBWZLCszkCuiBsE+jJ9M/uEagG0Vk9jTS6kMjbMWUBtqIpe9Q3
         zMpCzxW8NLGY+TdP84Ctv8JsYNJhu7+62eXSuyFWfxjmZM6Oo2fTh5wNmjQeXnRHME7/
         XgHLEfC3oZi+P9V/JXqXoFkKXzKEjGDGHCKYAWeC8JMVsIyvHRtdezdr0vAv0OKXvIrU
         PFbj9aJ0MM3XLYQYWyP6aS528PtZ3ECZkWMDW8+hmm2XAfsNXO+UEggrOrpZBYbiP36E
         UcWcAAChgIP936RS94IAMWInR4n6Wzrx3kgec/aWwDFCsGAoRNHUNve36qxcxEYqwn5Z
         QJ8A==
X-Gm-Message-State: AOJu0YwcsJBmMqSO6QS8HYjoWICWhU6Dc9xfB7+9W9mOJn5hog3wJ6mP
	WaQFFnkBb7LGmCswoBc1d1qLQ9UFSgWdng+Zi2I4fNwo4jrDnnZ+Mgk+bfUQ
X-Google-Smtp-Source: AGHT+IFTDvtLHf8JYWSwzH8gBIexGBruIlo82Dv7p92zhKxd9FkrvmKtxLX2i52h+KMvyc6D4G3g0w==
X-Received: by 2002:a05:6902:20c7:b0:e0b:6cce:8bd5 with SMTP id 3f1490d57ef6-e0b6cce8d66mr6205289276.30.1722332667377;
        Tue, 30 Jul 2024 02:44:27 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f793fcsm2324651276.22.2024.07.30.02.44.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 02:44:27 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-65fe1239f12so22380797b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 02:44:26 -0700 (PDT)
X-Received: by 2002:a0d:c8c6:0:b0:64a:d5fd:f19e with SMTP id
 00721157ae682-67a04ffdb2emr88358617b3.3.1722332666655; Tue, 30 Jul 2024
 02:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <172233064397.19494.9781944851148048757.git-patchwork-summary@kernel.org>
In-Reply-To: <172233064397.19494.9781944851148048757.git-patchwork-summary@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 11:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnTBWY-VLEuWU6v22fgeCVYmBE3thP4izSXzPeC4MR7Q@mail.gmail.com>
Message-ID: <CAMuHMdXnTBWY-VLEuWU6v22fgeCVYmBE3thP4izSXzPeC4MR7Q@mail.gmail.com>
Subject: Re: Patchwork summary for: linux-renesas-soc
To: patchwork-bot+linux-renesas-soc@kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:10=E2=80=AFAM
<patchwork-bot+linux-renesas-soc@kernel.org> wrote:
> The following patches were marked "mainlined", because they were applied =
to
> geert/renesas-devel.git (master):
>
> Series: PWM & TPU patches for V4M
>   Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
>   Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/=
?series=3D873919
>   Lore link: https://lore.kernel.org/r/20240725194906.14644-8-wsa+renesas=
@sang-engineering.com
>     Patches: [RFT,1/6] clk: renesas: r8a779h0: Add PWM clock

Oops, did I make a mistake?
No, that commit is not part of geert/renesas-devel.git.

>              [RFT,3/6] arm64: dts: renesas: r8a779h0: Add PWM device node

Yes, commit ca999750b95caf4829dbd89ecff5c673107d257c.

> Total patches: 2

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

