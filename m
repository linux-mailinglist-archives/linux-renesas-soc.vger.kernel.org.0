Return-Path: <linux-renesas-soc+bounces-1759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15A83A6B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 11:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12ED1F21E6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EF318057;
	Wed, 24 Jan 2024 10:25:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956E171AB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091916; cv=none; b=KnOg6DVGwN4oBk2L/tE1Ymf9G9bO6jdpDYQ4jpE6tjTjxZmrbDkgflu8LudJUhN3UZHX5xA/eZkiX/MyNpuRCc9GzG4SdjD6nj0ryFURyvQUKWNE4KgCgXYqt98pK77pAnn9rI3FrDggaOFubBacu5vkQnPYP7S6VtG6uj3zBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091916; c=relaxed/simple;
	bh=jo1c1cjQDnNevCb33d9r4F/oikmxOKsbijMPj25vUm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=M86QaYZJKcEgWEMtWl3yZ1gI3wkcg/DcFhC3N/se2v9bFuIX9tAOmmkX0zNHTr8AFIVoGbfaS7SOE3aJ7gnbhmsSyxwPnZBJJ0QzpGtxucEedmv7XyBDXo89DrHOBTsT2lDxrijpOdCGRRMrMR5FYf0confnzXgwWcNxHAR4XTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso46534747b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 02:25:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091913; x=1706696713;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+0LuqyTp8WFTeaQw03cu6oLwLbepvbfSHYAoHPrjy0=;
        b=YDFx/6QlUQ7Tf97wM9U4Q8/GTt0gZXRHXmr/bXJG9tgpk9i+PBLUMhrZyxelkinJES
         yvD68yMFpuR4OJZR5+17uo28Es/n/Fsiz0p/mSeosVBrES+URJ3a7nxIVd2WFPYFaQmO
         rMN1Ujqmlkr2RK89PtsNLGGhSOd9bkwqE1LOpCOXy/lw3lU04NPUW2W3TKKczBTKlNVL
         trftK+5Ttxdcz7pw9pN5lRU+aMflY4YwnfT1No7mGF3cIXGN39yl2WqBstBechFyiADh
         1GvJ7gf9M/lKoM9W4DYEWzBngFlR8tYtI7pW7r24nALHMwebso0VQwG2xwlguI5zQGW6
         yBjQ==
X-Gm-Message-State: AOJu0Yzq5ZoO061uC8BQVxWlNWt0YZwX1T3SlXbJiQfHL1jqfP5iSg1s
	vuDkc4n5bjOQ0SoF0ZSOgQ4RdBLJIgZshDgubXIG9TFG/n5sRHxm+spWzdwxoyA=
X-Google-Smtp-Source: AGHT+IESbXGoaFX4PL9r9fSxwBeCp7pcIwkL0/QYKt3LKfvivaS5/TGKkiq3eWsPMywFfeUaCllKog==
X-Received: by 2002:a81:9c4d:0:b0:5ff:64cf:1c49 with SMTP id n13-20020a819c4d000000b005ff64cf1c49mr557445ywa.56.1706091913052;
        Wed, 24 Jan 2024 02:25:13 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id h81-20020a815354000000b005ffa62881e0sm3472306ywb.91.2024.01.24.02.25.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 02:25:12 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5fc2e997804so47594687b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 02:25:12 -0800 (PST)
X-Received: by 2002:a81:a14c:0:b0:5ff:57cc:dd3b with SMTP id
 y73-20020a81a14c000000b005ff57ccdd3bmr523260ywg.15.1706091912513; Wed, 24 Jan
 2024 02:25:12 -0800 (PST)
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
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com> <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
In-Reply-To: <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jan 2024 11:25:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
Message-ID: <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 12:03=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>   - renesas-drivers-2024-01-02-v6.7 (TBD),
>   - renesas-drivers-2024-01-09-v6.7 (TBD).

So that became renesas-drivers-2024-01-09-v6.7, followed by
renesas-drivers-2024-01-23-v6.8-rc1.

Next planned releases, if all goes well:
  - renesas-drivers-2024-02-06-v6.8-rc3,
  - renesas-drivers-2024-02-20-v6.8-rc5,
  - renesas-drivers-2024-03-05-v6.8-rc7,
  - renesas-drivers-2024-03-12-v6.8 (TBD),
  - renesas-drivers-2024-03-19-v6.8 (TBD).

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

