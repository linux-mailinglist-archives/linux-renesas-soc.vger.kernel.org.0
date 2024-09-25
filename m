Return-Path: <linux-renesas-soc+bounces-9054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0509863CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 17:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70D561F2699B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 15:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D321D5ABD;
	Wed, 25 Sep 2024 15:40:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A81D5AC5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 15:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278801; cv=none; b=oWECmYbnkYcP/wBLD2hxEcx47vvOOTdOmr8WlUHYk98qAP9q2/PlY5NlvMSBIOE8qm695w3+GT8aJTGE8a9YpDMNTtI9npyEBYJikVBdLrwYJc2p2Qa/kOX40WvuS9tl8IEtoWDzzdcQ+/B6im/fMeDziAKp370H0KaGQ+z7Y3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278801; c=relaxed/simple;
	bh=3q6cA7JOo5iMZPW0mXz7vjkCLOwdBgI+nhhU/Qvnvyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8OYD7IZFB7n9QklePNj8A4nYOvjG1BX93J9QrD0vW9tSZe07YkoGdkilVSI1IfIQR805pGfuPENCUHtjgQZm1rJfnZHsH5BD0YfVuvsIN7wgIyevqvSVrl3PtH3h4NPx5VnDMLsGqjFD6Cg7hIpm5DWMdBOGADVqLmAlWMRLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e21b4d7236so11634567b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278798; x=1727883598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdwgfMpzF8weocD4o26tOSH0qUyd9nI7GjEWgdlEvmw=;
        b=Ok4n7zWFVze44DfKRdKqvpDobEHIaS9ljwZWsbWrNZP0nCft4qubWOaJbqcUCSLbIn
         0pKCRN++Fz+vDYHsCsnr5AFf9Aoy1nvgBbwizmWZD9ogbghFt4OX/F/Ocu9W48VtA3l0
         at9vwITZf23Dk5K/JrehrczL34sJyeOsgjBYPn2MNVTV1aMYrEnhSJzturcjQumyamEY
         j2YjSKj1GssLw08r/DogtJV0y7oh6oJfm1gDOwY4SMDoD6EgIbMpzPNAgRpe9YVD5VGT
         ZSW+tptBwD9JbDMQFA3gmDOXp8ZtI30eEoI9/ufx0KnVB8svoXEMptan0JjTuO4X7cZH
         4NYw==
X-Forwarded-Encrypted: i=1; AJvYcCXM6kRYeZcKDVb+LRNWyeZrMsLuOyKvtbGDPFHy8gclh+WLWk9+aDdMGrdvE07QqbNHK+5Axu6l2a3x7Bn7xlTROA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnrqac1pqRtHRepFIyLO/DRawX2Zw8rblz03sOrozkN/zz9jUT
	YFTsKqC5fTB7aOJxE/Z6/OEnfN2sH9nq350GKSW/hIvX5UmcXgm3FXMmhnSS
X-Google-Smtp-Source: AGHT+IEDUdNhf4JzDjZARKwU6EPsRCecjoGn/7Yz+m4KBmxGOpRkzqPTH1yz7vdABkWToe5foFy1SA==
X-Received: by 2002:a05:690c:ecd:b0:6e2:ffd:c123 with SMTP id 00721157ae682-6e21d6e3ee7mr26308947b3.7.1727278797759;
        Wed, 25 Sep 2024 08:39:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d27bc54sm6301597b3.107.2024.09.25.08.39.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 08:39:57 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e214c3d045so178637b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:39:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6v3dvcxer9aMMFgFL353JqTI7PvtN8SDhNoDYWf8Vgt/VvUMd/Mp6i1VDD2ZpB33jvCh3X+GZU5YfmKoeTfb38Q==@vger.kernel.org
X-Received: by 2002:a05:690c:f96:b0:6e2:1545:754 with SMTP id
 00721157ae682-6e21d6e3c5dmr30304917b3.9.1727278797274; Wed, 25 Sep 2024
 08:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904003409.1578212-1-yoshihiro.shimoda.uh@renesas.com> <20240904003409.1578212-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240904003409.1578212-2-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Sep 2024 17:39:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1sgHiVo4N9jhPpPM3K3=Lbgc4W5ANaGcFCwfcuEE9Rw@mail.gmail.com>
Message-ID: <CAMuHMdW1sgHiVo4N9jhPpPM3K3=Lbgc4W5ANaGcFCwfcuEE9Rw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add PCIe Host and
 Endpoint nodes
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 2:34=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car V4M (R8A779H0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

