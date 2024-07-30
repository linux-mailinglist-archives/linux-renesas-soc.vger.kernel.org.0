Return-Path: <linux-renesas-soc+bounces-7631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531E94137F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 15:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0D4E1F22B48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 13:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6C91A073A;
	Tue, 30 Jul 2024 13:47:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2E1465A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347261; cv=none; b=UQytUSMKHOvAHHfg3rPhZnBEGFOtvuO8vHDCvpJEyrkXGb3gpbgdYT7cHZo42pO+0mL/QWQ90Qa1m7WIZeJ3zjL5igtFrFi3foYIfyJszGHOHWLy9rBFaL9fu7QoPjG1YmokU9u8bJ80bH0GHsQkEIJRZJkGLWIvHG8gCYgIbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347261; c=relaxed/simple;
	bh=W3U/BHWJRxI6UlHnwLzkIrC4/3Koti0ZJ5c42dMgMbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ahnWA/GfMQfJbuBXuR15I37YGQiLMiE3ZDgM/xjVmOidsQw1/w220/OVEyHrCnJGiPWQi57s1LCBF+sXmADK4OxrejQILXINC50tx4sMJrkeG6R9eskth4aimUGni3I2CGs47AFWJAQ4LmlQWdp59VfVN8dtG+nmcSgtaeTHu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso3187223276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 06:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347258; x=1722952058;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FqsibARGiY2LuqI2u8D5d08+yXzyQVQuy6w6rx4BpU=;
        b=i6hRfyxaqJeY5b7bb21Cv/TcV68LDOp4PbLjlXMQ87Cz89bfOdbP6LJMUsTkkdN8GQ
         WRuqt0IYv0U4e3XY/6Cm6wQsUFv3SUADS6S4bdSnE6aPV64vUOLT2NaKFHpkQylr3OfB
         xrmG8FecXh7hRqTDBX8wo+NNV518KixQ5NcwbLD7WcY6hqdfSkCW2QH6LQltY6SW0g/q
         f3cZh9Hh1GK/ofg8UYPeuN64prnJOS4bBpSqLmwyNAVmBbI9uFts6f5u8ssYr+Bp8Zbv
         cky4lCgQQ0JlUB5D1+yQ219g14Zka1L5IP4iPmSYPDY3TYGQ8KHDB1KOenhI3ocvKxZQ
         SFqg==
X-Gm-Message-State: AOJu0Yy3iTOv0ey4gyM/gKsewIgrLUU8xYS6yXbbhgW71/02t8Vwd4vN
	iAplq1FnLCLikV5Z3UFB/NHk6jDKGQ3iScNAuLZAasSsjZdZNbH4AMjuJEgC
X-Google-Smtp-Source: AGHT+IHehPlJQ8cbK9l8QJ6jX8fo1I8W6kTE8G/ElQ82vWDizEM16UeRoh5PIxIdx+n5gjqWT9UcUw==
X-Received: by 2002:a05:6902:918:b0:e03:33cf:79f0 with SMTP id 3f1490d57ef6-e0b545670eamr12182940276.33.1722347258074;
        Tue, 30 Jul 2024 06:47:38 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f1b026sm2289859276.8.2024.07.30.06.47.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 06:47:37 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-67b709024bfso35382967b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 06:47:37 -0700 (PDT)
X-Received: by 2002:a81:a210:0:b0:63b:f8cb:9281 with SMTP id
 00721157ae682-67a0a8f2ad2mr103944737b3.41.1722347257686; Tue, 30 Jul 2024
 06:47:37 -0700 (PDT)
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
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com> <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
In-Reply-To: <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jul 2024 15:47:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
Message-ID: <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 1:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>   - renesas-drivers-2024-07-16-v6.10 (TBD),
>   - renesas-drivers-2024-07-23-v6.10 (TBD).

So that became renesas-drivers-2024-07-16-v6.10, followed by
today's renesas-drivers-2024-07-30-v6.11-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2024-08-20-v6.11-rc4,
  - renesas-drivers-2024-09-03-v6.11-rc6,
  - renesas-drivers-2024-09-17-v6.11-rc8 or final,
  - renesas-drivers-2024-09-24-v6.11 (TBD).

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

