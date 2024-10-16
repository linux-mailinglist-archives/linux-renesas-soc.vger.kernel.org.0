Return-Path: <linux-renesas-soc+bounces-9796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173E9A047A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 10:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BC891C20311
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 08:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C751F80DD;
	Wed, 16 Oct 2024 08:40:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5811D8E05
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2024 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729068030; cv=none; b=XOLjr1q7DRz3Yjf7yQD3Mlo+/1sZ1vt22TcQhm+fwHuEFfihejkh6K7Ti9DXFRHnZl0Sq2xq0OFN2JeAUK2lDoGYGVV3vc5PNkNtiW0kN54ZZADFwCC6S6HfBw/NZB05A07hT/V27JhzFGTiKae9dXEFQqvM31SA14JRfPjwv44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729068030; c=relaxed/simple;
	bh=7RrvENSETZVWuEsL5G/guQ89yb/DTkWr6OtRMNLimP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Ea2Ogx82gd5LXUc7CvK6qfRbioU6G7+UToSACWWcemriPSgpE/WzLREvDRKjhRbhv00uQPtaD/+G3T/sWHyl8BU7bPuVttnhZYKWybCTsDIOLnYq7a/MjcdwyNBk7QrUDrEdUd7sdQ90B4OBobr08U6rbBPgcCIcsbqtb9NW09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3cdbc25a0so13887947b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2024 01:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068026; x=1729672826;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E39YYXDCimWu7YLGSw9SvTygd7bW9UQ/ZLEgV1R/YMY=;
        b=IaaUTwSVv/34kGv9ZQtU4FOamScADQEWRJJ5sk0uo5pKZWF2d+xkUNeN72HpDNtrTL
         lspdOPkZNXi3ched2Re8Zv92EJLXSg8ni0sMwti+Mq+tdwpadyRbv/us63Pv6qOrP/NL
         lDJ8PXf5S1yGlsYsrD+GDFEN9PVoTyx5kqevbmDKFz3XH88MNNAGytbL8o3CWl4tdGJ8
         1cflKTXL+/+fuWZGjEl84IIcEgqIi9g3ShFI53BpexV61ew2+o+rnBTTZmIrMqt6p9/X
         5EWBBXos8p1tVvCjIFBdYQnZ5SjLgyptB6/T7mtlTtgpj4QW815CfrFUZYT/hZSVanaT
         fUXg==
X-Gm-Message-State: AOJu0Ywa5A3EgGc2BZkdhN9h1MeIP2TwU1q7iokllklyILU4rSsgfrEz
	I12LYorAVx5L0EKsoUUoBJrAGaUljTNBR6bkEo26vbGMViqHboUPTUruhugG
X-Google-Smtp-Source: AGHT+IGbw9qc0ZGp46h1dmqWfMfzThEA64llvwLL/KAD7ktYxCr0QZM3SxOrmvs/MYeD43Uv63f2VA==
X-Received: by 2002:a05:690c:a9d:b0:6e3:2608:d5af with SMTP id 00721157ae682-6e36434f351mr127458507b3.26.1729068026564;
        Wed, 16 Oct 2024 01:40:26 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c5cb7015sm6071007b3.101.2024.10.16.01.40.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 01:40:26 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3b7b3e9acso19345007b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2024 01:40:25 -0700 (PDT)
X-Received: by 2002:a05:690c:d1e:b0:6e3:153a:ff62 with SMTP id
 00721157ae682-6e36434ef60mr129288807b3.23.1729068025690; Wed, 16 Oct 2024
 01:40:25 -0700 (PDT)
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
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com> <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
In-Reply-To: <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Oct 2024 10:40:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
Message-ID: <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>   - renesas-drivers-2024-09-17-v6.11-rc8 or final,
>   - renesas-drivers-2024-09-24-v6.11 (TBD).

This became renesas-drivers-2024-09-17-v6.11, followed by:

  - renesas-drivers-2024-10-01-v6.12-rc1,
  - renesas-drivers-2024-10-15-v6.12-rc3.

Next planned releases, if all goes well:
  - renesas-drivers-2024-10-29-v6.12-rc5,
  - renesas-drivers-2024-11-12-v6.12-rc7,
  - renesas-drivers-2024-11-19-v6.12 (TBD),
  - renesas-drivers-2024-11-26-v6.12 (TBD).

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

