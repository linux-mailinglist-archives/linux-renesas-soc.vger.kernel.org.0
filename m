Return-Path: <linux-renesas-soc+bounces-6677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F89145D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 11:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 098C8286CDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 09:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B61F130485;
	Mon, 24 Jun 2024 09:05:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C300745E2;
	Mon, 24 Jun 2024 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219934; cv=none; b=NzyBYjGjP/YRnxMStrMJUF995jbeTggbUGrBlxpJj4kGMRzYzADcrwr1hm8LlVRkXp3/ororprc3e5v/OGUWflkuepC0LmnHEC841KuyCPQMGoKYFqYIndtPUGu/BltBa55ftttnVKcnt9ZEbU/TzQZS/cU93Ei1Ak/JUwP2mtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219934; c=relaxed/simple;
	bh=MGIQ9hvtO+tnV3qgcrXDb5AHL+aW+bXZP0Z9UKeMuls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibGUd9mhjfTuxMV9133R4z8GTQZI4HWEFtv8wkBUDxLw5tKe0w9lUbWO4WnD3s9nSXaJbvoUW1+z1G7BU6aDWqhSTdnabk9qLc1akNWxly3ZTImoIo7sVeNgEjDNGs6h1MEzzfzx6FuWPuyCSRM/dBRHPVrUPXve5qHY1eKsTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so3589906276.2;
        Mon, 24 Jun 2024 02:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219931; x=1719824731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Sn3OTxIINTayKCLeb6KU6Cc1bWOZasndj+qX/CG+k4=;
        b=LQEmKak4sDK/YE6ls8WS7RlQAi+lkauTK8kJnO2Ff9ktZmhHjKLrWcAFgn3qYWZ21R
         f/fvqbvlbqr11ewxQdtXnQGor0vvEX0wmNUSSfSOhKJDFoLeO7jMEiqRaPyiqr9JOI4V
         3IiN3UUO95TsKhMhIlMfMEBcdKfQ0s0J/5COtUqj2H6fFSc9mq7JfHlA2s5RaSEmdz7b
         sk6kiLwfNlchGiXij7a2MzXzMHuf6QAw7QhivHa2XnONHEtHiWblaH3ZMivMQDjCVNkz
         venrpoqR6KuEBGAW008DaGcicrlsHFX9fBYefcq2FkU+/FjbrMME1v+iBn1GJCI53oKb
         t/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdc4LE96aaT7018K+ntCTRi9C4I9+6pEZnEF/ttQvDca7dArEiRmjdF4Nb1urNCyUaiWMWjVQ7mabGCIlkAk0ivFw2cfe5HFZsOEbTk3oeCT+fBn0g36xwiqKC+IDV/MeCY3JDnrUYIkNxG3s=
X-Gm-Message-State: AOJu0Yyll63Gu6TnMmDmNtbdUrrPciERNJuyZnEfUhn/nu16Irb1dyxL
	INv9SziD4YYpHfQ0Lzcd2ltVe9cyPSnIgvk83DAzVG0LcCrJrvAi5KT/ylwD
X-Google-Smtp-Source: AGHT+IEoVtCOi+aBuI1L6GG9NH0xQEhH/fL2u6JCjRFfntGn6Sj7xMjpUnJQuIERP/7JuyCyShHRew==
X-Received: by 2002:a5b:7cb:0:b0:dff:806:1388 with SMTP id 3f1490d57ef6-e0303fea2c9mr3674973276.46.1719219930944;
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e623d1c0sm3117950276.20.2024.06.24.02.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6439f6cf79dso9097237b3.0;
        Mon, 24 Jun 2024 02:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6jLTBIhV5vkyiBm5986BjDELhV7l4rIfkVPi9cwCKyP+jWeQgm8MMCFFpWqqv8TCnSQQTdJ7cZiHOT0b6BomwjT0wC23Iavrv4lgbnQafNvxOg5yfCWALhvqEP5HJBlybFAjTRMklhYQ+v+c=
X-Received: by 2002:a05:690c:6e0c:b0:617:cbc7:26fe with SMTP id
 00721157ae682-643a9fcecb1mr40763937b3.16.1719219930598; Mon, 24 Jun 2024
 02:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718897545.git.geert+renesas@glider.be> <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
 <20240620170814.GW3029315@google.com>
In-Reply-To: <20240620170814.GW3029315@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 11:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>
Message-ID: <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
To: Lee Jones <lee@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Thu, Jun 20, 2024 at 7:08=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:
> > Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the las=
t
> > user of the .set_clk_div() callback in the tmio_mmc_data structure.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  include/linux/mfd/tmio.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> > index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> > --- a/include/linux/mfd/tmio.h
> > +++ b/include/linux/mfd/tmio.h
> > @@ -101,7 +101,6 @@ struct tmio_mmc_data {
> >       unsigned int                    max_blk_count;
> >       unsigned short                  max_segs;
> >       void (*set_pwr)(struct platform_device *host, int state);
> > -     void (*set_clk_div)(struct platform_device *host, int state);
>
> Any ramifications for just hoovering this up?

I am sorry, I am not familiar with that expression.
Can you please elaborate?
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

