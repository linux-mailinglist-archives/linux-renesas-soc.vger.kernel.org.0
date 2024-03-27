Return-Path: <linux-renesas-soc+bounces-4110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356988DA26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 10:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81C7B24F78
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22FB37702;
	Wed, 27 Mar 2024 09:21:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC6376F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711531291; cv=none; b=LzH6uBWk5WDgevSqrcWLKqZVgWb9T+untf/DZBqKi6JKJJrCRpTQp+zGlEtR6qcTTNfpzd9HeZhtPt48RMNpcWVPtPLXH8rm+Yrq1w56azGav33xA0/Z3cUnm8WuwrxGut37YwhrMlMO+YFs8AkAvHjfZwZ816BfqasHEeM9rng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711531291; c=relaxed/simple;
	bh=1zzq62vVVVJ8MPd2w5yI/quEGz/B9q8P5unAkNtkul0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=oHar3EQEPFOpyEQXsJbhNxXLR9RV93pmk+1gtgsP7lP8wy/ssKHpQ1jpaIlfJ34vw7H57QF8uAk865NSHOg/8yRf64I98WVAnMpDbxK5VjVu4pjfWultkF+gFSgP+GezZMKSgHKwNNNMeMkOpA785bsLwnHlLbTKIIEt8DnVXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-60a5a11b59dso71040207b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 02:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711531288; x=1712136088;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Umw4B+sfUmATPKTlHPe+8bMgQFd2P9+qOBR4We+1JN4=;
        b=TRv2Ty+wd+IkU4POAMIL8cco0a+8zQYigGX+XeqwwsC+FmWKigzxwhMAOkOsuolSxd
         3FWnRtrMGab1u6AU8IUN+rlT41ya6Vf1ixIG18yJ/G/FKMjjTZeIixQcsADVUN31Kj+L
         8LUfR4RBy7v2Hglfqmr7vGhQ9/QgGUKn2LRhBCU+gMrktG8c9P5/GJkSdXJ+JWdM4Hie
         7btJe7Jd07ZVoPLaQWrAubPrmzrWfmUxC+82UJh2x2cbPM9Iw4bnF+Uwy+XLWbsG9zKF
         46XYqhgMUwkgfAu0c8Rnh++EJQzDALMbgVTXwe48vB5Biy3L2e1ozhVoSBlJWL/ew1Wv
         mZaQ==
X-Gm-Message-State: AOJu0YzBtmh3fZZdnmibpaDLC+QeoBMsrEhBt/dsiIVDLgZJ9q7bXxG9
	A2uyuXp9Blw2Xgei0Zi+BwbqazdNBgz+Ik3u1eulOIRUpBCvcALbN0hKW6i5Ilw=
X-Google-Smtp-Source: AGHT+IHqkHxOceOS1nO3o8gKjghWFHmGtC63pekPsrMzvSGx0H27upAgmVI+JiQKr9ZQ6s12GUuHBg==
X-Received: by 2002:a81:4842:0:b0:611:7132:e6ba with SMTP id v63-20020a814842000000b006117132e6bamr2152216ywa.40.1711531288284;
        Wed, 27 Mar 2024 02:21:28 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id i138-20020a816d90000000b006110e345a81sm1898563ywc.110.2024.03.27.02.21.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:21:28 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso6306394276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 02:21:28 -0700 (PDT)
X-Received: by 2002:a05:6902:1344:b0:dc6:bcb3:5d8e with SMTP id
 g4-20020a056902134400b00dc6bcb35d8emr1998094ybu.20.1711531287686; Wed, 27 Mar
 2024 02:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com> <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
In-Reply-To: <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Mar 2024 10:21:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
Message-ID: <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:25=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>   - renesas-drivers-2024-03-12-v6.8 (TBD),
>   - renesas-drivers-2024-03-19-v6.8 (TBD).

So that became renesas-drivers-2024-03-12-v6.8, followed
by renesas-drivers-2024-03-26-v6.9-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2024-04-09-v6.9-rc3,
  - renesas-drivers-2024-04-23-v6.9-rc5,
  - renesas-drivers-2024-05-07-v6.9-rc7,
  - renesas-drivers-2024-05-14-v6.9 (TBD),
  - renesas-drivers-2024-05-21-v6.9 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

