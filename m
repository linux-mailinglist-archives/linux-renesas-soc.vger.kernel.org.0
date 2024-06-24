Return-Path: <linux-renesas-soc+bounces-6683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93962914908
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 13:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F6E1F24C6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 11:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4D91386DA;
	Mon, 24 Jun 2024 11:43:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4213A25D;
	Mon, 24 Jun 2024 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229387; cv=none; b=Vvo3KkjpYkQ2y1Vs6ItfBfdwEGQlxFj1+nCmFSrOs1L0uYQFzxrk+M/8BAnniKATZSQxlB4WhrX8MPhf+fiOetTV0GzfIe6o4LpGBFer6rfUVrxMrRMExSJ8RcWwwquWTMckQiv+7/Ae4mLx9RjFERepsUKwqw7Q2303OasbFXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229387; c=relaxed/simple;
	bh=kERiW6KJXU46fPch8EQVE0gQjuCaTjTrVhpXgPozSbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RV7ArmyNBxsOjEgf2v7DF5YCWgDQeM0bgaKR4JKoItNZdrgj7Od1szbt7ANmZSH6Jdifi++/WspGEloNd4THD1qNgFth7y8rHg4H/4P3BFotemPcix6sYgOEpOvrwrsu+SMjydnJJVQmIYdLUflPlijLAx/mlmNqK376/NpgK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6327e303739so38216917b3.2;
        Mon, 24 Jun 2024 04:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229383; x=1719834183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QaDpBHjjeUJXqqX7e0vKFXcb+stSvWB5HvQA7dXXlc=;
        b=vFfpo7QaYrR6QgxVGBVqERhtWCwpLFd/EPGpCvVtmd8Q0BihCZNRcr5QycVRQMOu96
         CcE1hQeo3PfnBa78Z4OD9jP1qfGY3fGacCEkQk0Udepc0shBlAzZUh26d5bt4StSfXnR
         zbDNi2QdMVSgb4KWiq69Oe31pFQG9IvgR8gPShabKXEJSmb2pcz+lP6ZH9AQnWiV5+1c
         1UcWey5DDLh/2wQdw/P43X/jL6n5bOO6wfiZPazeWI0jd/6z1OH++1vM7DPC6cCK21ii
         bkEXzfkI/73SJZ0PA19EYOlKFR5Ma5l3y/hXnF7kkk9sZR6av+KutOy7LSIH4roH0m92
         mvIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH93bdV9iZe4FKgi2UGNKbA3sTOBLcfOp9Zl+bxoQ+hrAF+RflEVBOaZ5Wy8s4r5UwEOaJiXEUwqy0E7HrpfDdfDVr6IwuvhN/6oiFXPdPiYjVX+Qvcy8nphJqchaC8gfuRMCFhNNWCcUshsk=
X-Gm-Message-State: AOJu0YxEZd7NSmoQEkh4++nDz0zNLWMQ+uEws/A6pG5xVOQSHHZy45yG
	xlwdQEYn2SME/N62lJzfFoPi1CkHSR0Uywn6AElOH7FqzdyHsLL9MPRdfCB1
X-Google-Smtp-Source: AGHT+IGTBqdKoL3phCH2oZH2xjsP1GJqGll921lvpGRu5uS2ufeNH3OU8LRnrCLeIBOTqZnsm9A2qg==
X-Received: by 2002:a81:9244:0:b0:62c:fcba:cfeb with SMTP id 00721157ae682-643abe4366dmr34893517b3.34.1719229383321;
        Mon, 24 Jun 2024 04:43:03 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14a3cabfsm27044297b3.88.2024.06.24.04.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:43:03 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dff305df675so4452289276.1;
        Mon, 24 Jun 2024 04:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXx1MmDvU9hcsUvTYAKI5UOM2yEUi0gkCu1Ts8jK2j9lvgJByNl5DHfseVNA7OZ5o2dvwjg8TL0ko6VKxOMwZW77aftLSVDLvm4B5eG1SY8Ve4hOhgbXQ/n1dA0hSgcyEfJhMfWZcyEiK9/a8w=
X-Received: by 2002:a25:d690:0:b0:e02:c532:cbe8 with SMTP id
 3f1490d57ef6-e0303f3cbafmr4096144276.15.1719229382983; Mon, 24 Jun 2024
 04:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718897545.git.geert+renesas@glider.be> <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
 <20240620170814.GW3029315@google.com> <CAMuHMdVdTusWYK0cD_Ez5bv21iKVF2MOT24+_VR+94W3iqDK5A@mail.gmail.com>
 <20240624104651.GO1318296@google.com>
In-Reply-To: <20240624104651.GO1318296@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 13:42:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHDHF5guDk1hUajBCX5Y1JyPUXBmWz+KpPzcNn7pA-4A@mail.gmail.com>
Message-ID: <CAMuHMdXHDHF5guDk1hUajBCX5Y1JyPUXBmWz+KpPzcNn7pA-4A@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 12:46=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Mon, 24 Jun 2024, Geert Uytterhoeven wrote:
> > On Thu, Jun 20, 2024 at 7:08=E2=80=AFPM Lee Jones <lee@kernel.org> wrot=
e:
> > > On Thu, 20 Jun 2024, Geert Uytterhoeven wrote:
> > > > Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the=
 last
> > > > user of the .set_clk_div() callback in the tmio_mmc_data structure.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  include/linux/mfd/tmio.h | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
> > > > index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
> > > > --- a/include/linux/mfd/tmio.h
> > > > +++ b/include/linux/mfd/tmio.h
> > > > @@ -101,7 +101,6 @@ struct tmio_mmc_data {
> > > >       unsigned int                    max_blk_count;
> > > >       unsigned short                  max_segs;
> > > >       void (*set_pwr)(struct platform_device *host, int state);
> > > > -     void (*set_clk_div)(struct platform_device *host, int state);
> > >
> > > Any ramifications for just hoovering this up?
> >
> > I am sorry, I am not familiar with that expression.
> > Can you please elaborate?
> > Thanks!
>
> If I take _only_ this patch and leave the MMC one, will something break?

No, nothing will break.

It will just (a) make it a tad more difficult to apply the second patch
to the MMC tree, as it has a contextual dependency on the first patch,
and (b) cause a merge conflict for linux-next and Linus later...
Perhaps it would be easier to just provide an Acked-by, like you have
already done for the second patch?

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

