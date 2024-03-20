Return-Path: <linux-renesas-soc+bounces-3939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B4A880F53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 11:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75883284616
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 10:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1423BBF7;
	Wed, 20 Mar 2024 10:09:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83A38F82
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929369; cv=none; b=WzjZbXfSTh81tAnocW2WqAjdaWP82UPMS4FyIwTHLITynR/GorCN5Zw1csD6RDwKeSFSyOjAcY9c+JTAcoMKjKCVlmQcZ8m6R0xOCccsa9Eefh49oks99MXZGUZ0AK83hHMhFC4ekSfnwxPC/vP/iJ+5h15m9OT2gy+lywhLGeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929369; c=relaxed/simple;
	bh=RXWKnZM/iz+NQ+l83Xr5PIGl0+xH2yg2mtS8J9MgK7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2LFtgAVyfs86kJZpc5Cfb6hMCPaAeWUw926R16HJX11qk5PFPjRBMaiX1s9ZVX6qtV8nCMgcvDgh2KvVgGAji8m+Ct0zjgDA261NeP5xvhkFs+GsT08AZvRohvS1JUDx1La7Qiuqq0ms2SX8E5UdJByazryalScjU8BqzGDZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60cbcd04de9so62767377b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710929366; x=1711534166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM2co56xfae06ZAGOw7vqz7MiouDdSWH0MOOEW9dV/E=;
        b=AkNzgCFKhuAbxcDfHWRZMPCI812/j263/f3S4wGprezK1242Q5lgpLzHlfiyHDx6Ds
         vnzWHyfm16mSzLRtmyYCl64MUJz91laYmpEihxanq1M0YPfubadFe0RG1m32cL+EWJOA
         knLdRvI3mI0ITDyr3ja+J6nLvozYAiGN6q7x+IvPuWwL8eyZKKlmLfi+7Eg3SSU4uktt
         TpCy/GlAbBGeYKRr2I6sAtqltwiyHVgTfdOESLpRf7tNl2/9LaW/jvnIaSKhKgjra5z7
         rIP9DuEwbFrhru1jz0VHF9xcw4XE0i5Da6M/FUGHckM1G+crlnvl/oXcXczs3tF/nR61
         JeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHVJ09vtVWam0ZQ6mqd3r0Vqi1671dEMp6bFziJh4FMg3u0wkmuSTIIi+cIImVvz0/iOClgaNXdXnVY/MiN2esQJ7xQGRRruQzHqcxj0Fz/yA=
X-Gm-Message-State: AOJu0Yy5bAuw3XEBLy6FwrZDq+wfniT0KDdWEyzwyCi2s0qUdMNH1Qud
	OZsSXgiGfcm5RVyeR4moToZL/w/e//LxqEgTDEsrhpsSbYPyrErCMJQPgKet+2Q=
X-Google-Smtp-Source: AGHT+IEP38+QFNEkZAVLaye43U9wBEeKvZ6adCkU8jPWqmyZLl/3o362C++hVYZ0qJrdDV4m509e8w==
X-Received: by 2002:a81:a54d:0:b0:60a:32b1:d489 with SMTP id v13-20020a81a54d000000b0060a32b1d489mr15342300ywg.31.1710929366401;
        Wed, 20 Mar 2024 03:09:26 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id y74-20020a81a14d000000b0060894d466ffsm2789049ywg.121.2024.03.20.03.09.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 03:09:26 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609ed7ca444so61654147b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:09:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzCjOuQOBB5LhtXLvxy9Uzw8S53/PU3PhnhPh/Im+OKniH4/L3S1NadJ8YfhMjLHOktPsMOfulUBeZL9wAMCZtqFHhlkMcnX3/tIb1fVEF4fk=
X-Received: by 2002:a0d:e8c7:0:b0:609:fa49:2112 with SMTP id
 r190-20020a0de8c7000000b00609fa492112mr17683030ywe.27.1710929366007; Wed, 20
 Mar 2024 03:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1710864964.git.geert+renesas@glider.be> <ZfqLY8Ej6kNnAMQA@ninjato>
 <CAMuHMdWeq6c8F=i7SgEt+HBBpknaEFTsrxM26OrDpjzOS_YTZw@mail.gmail.com> <ZfqflGGizKDALEU5@shikoro>
In-Reply-To: <ZfqflGGizKDALEU5@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Mar 2024 11:09:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfdcOnPXLuwtfKXub=TrVA9wxM=etNxN1hqkbQ+cLNrw@mail.gmail.com>
Message-ID: <CAMuHMdUfdcOnPXLuwtfKXub=TrVA9wxM=etNxN1hqkbQ+cLNrw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
To: Wolfram Sang <wsa@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Mar 20, 2024 at 9:34=E2=80=AFAM Wolfram Sang <wsa@kernel.org> wrote=
:
> > > Huh? It works on Lager and fails on Koelsch? Do you have a log file?
> >
> > Of course it succeeded on the next try...
>
> Interesting. I will try Lager then and see if it fails there as well. It
> is only TMU3, right?

On Koelsch TMU3 is rather erratic.
On other SoCs, I did see a few sporadic test failures, even for
arch_sys_counter instead of TMUx.

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

