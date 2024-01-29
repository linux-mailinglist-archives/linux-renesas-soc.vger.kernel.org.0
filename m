Return-Path: <linux-renesas-soc+bounces-1945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1D841310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 20:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDBBA1C21782
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DEA2E85E;
	Mon, 29 Jan 2024 19:08:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A052E834;
	Mon, 29 Jan 2024 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706555323; cv=none; b=pJ7vBiUhKLFptIQxH9mezXMhZ9DSRj6u5UKE1WGs7rVWOscdAVDyAWRMIUu3xgkzjV9o0FVKjtl6GSQSTtVVWdqye86jdH8R1l7uHN0ak7ZSSqaqzyyGGXlchOlH4etRqnYdRs9sbYV7yFMlUencFypVewAy9TltZlNKcubAOIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706555323; c=relaxed/simple;
	bh=vDDhsRzXZOn2fNYB7oE/A5QKtX16c846U4Iz8WvAq0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5xAK0IGYQLYJB3Ky9hGdMDCBUw10rEp8zmMh3PWHDxIVFEH7oj304NaKweowCKSiNcPpRIZMWhmMaSLNzG6GhHRdZiIq1HR7tjeuXMFnUeHLuHFrfWFYKMW4j9eXBaAkBmDZTefnHCN6Li5iNBvodivO9ug92VJkPcChiksPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3340034276.1;
        Mon, 29 Jan 2024 11:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706555320; x=1707160120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nqme3WSvUJoFsu41T9Ti9OswToo2LcvshW4LgZ3dA34=;
        b=fashwmx3exG/SS09ctDfOdAihHWMd9YRBk+Bl8emc/Y7452fNUCZym0AZIFw9MclJS
         jnvcEvYTkSU9rC6FASCt9+frLlBssmPBRN0up3bgLIF+wb9hfb26OY0BvkC+c3U18zjR
         CAddNnTaScYKAKxL0iAW/G8/+DvUixO8kemqIP9pHmLYlblsMQDctpaav8Yd7/oAE/CS
         3gHvGVuDDOdeYsTSfaFvxVm59puM2aDvuKMdnfCytipaCnCzkSiKMVQ8HXMvs4MrOZB3
         gsSG3I4gs3A5EYu7zFPa5dQLD1wJNwhhgE8obHHHuwKAs/f5LaVUxcz3hxheVzxwPpTw
         0EDw==
X-Gm-Message-State: AOJu0Yx9XKdmeXsm/ZvrmldrYkyMUWYGbkaPhpY0OLtLcKMMj2KJOkB3
	5gBBgDevDpCKeTYTKG0YVCbsskkUxeC4kJVrGvXKCIgW0hMKsNziY+U/ClmeB8g=
X-Google-Smtp-Source: AGHT+IHpEJYTq2c4FEFZV41f+o09xLXgYzyqjtB/Y0bZ0qVYIUBu0/YXTegeNkttDjsSl0KSIuph8Q==
X-Received: by 2002:a25:ab2b:0:b0:dbd:e651:a32f with SMTP id u40-20020a25ab2b000000b00dbde651a32fmr5193875ybi.114.1706555320416;
        Mon, 29 Jan 2024 11:08:40 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h16-20020a25be10000000b00dc2537d4275sm2354530ybk.64.2024.01.29.11.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 11:08:40 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3340019276.1;
        Mon, 29 Jan 2024 11:08:40 -0800 (PST)
X-Received: by 2002:a25:9781:0:b0:dc6:978:199d with SMTP id
 i1-20020a259781000000b00dc60978199dmr4546789ybo.115.1706555320023; Mon, 29
 Jan 2024 11:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
 <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com> <202401290926.67193AB2B@keescook>
In-Reply-To: <202401290926.67193AB2B@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jan 2024 20:08:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjjjDbVRT6Dz0gnnNpTk2f4nKDBPKZr1GoDOhgAdEpJg@mail.gmail.com>
Message-ID: <CAMuHMdWjjjDbVRT6Dz0gnnNpTk2f4nKDBPKZr1GoDOhgAdEpJg@mail.gmail.com>
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
To: Kees Cook <keescook@chromium.org>
Cc: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Mon, Jan 29, 2024 at 6:38=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote>
> On Mon, Jan 29, 2024 at 10:57:40AM +0100, Geert Uytterhoeven wrote:
> > CC Kees (for the wrap-around in dma_cookie_assign() not handled in [A])
> > [...]
> > Was the system running for a very long time?
> > dma_cookie_assign() relies on 2-complement signed wrap-around:
> >
> >         cookie =3D chan->cookie + 1;
> >         if (cookie < DMA_MIN_COOKIE)
> >                 cookie =3D DMA_MIN_COOKIE;
> >
> > but given the kernel is compiled with -fno-strict-overflow (which
> > implies -fwrapv) that should work.
>
> For my own reference:
>
> typedef s32 dma_cookie_t;
> #define DMA_MIN_COOKIE  1
>
> struct dma_chan {
>         ...
>         dma_cookie_t cookie;
>
> Correct, as you say, with -fno-strict-overflow this is well defined, and
> will wrap the value around negative if chan->cookie was S32_MAX.
>
> In the future, when the signed integer wrap-around sanitizer works
> again, we'll want to change the math to something like:
>
>         cookie =3D add_wrap(typeof(cookie), chan->cookie, 1);
>
> But that will be an ongoing conversion once folks have agreed on the
> semantics of the wrapping helpers, which is not settled yet.
>
> If you want to handle this today without depending on wrap-around,
> it's a little bit more involved to do it open coded, but it's possible:
>
>         if (chan->cookie =3D=3D type_max(typeof(chan->cookie)))
>                 cookie =3D DMA_MIN_COOKIE;
>         else
>                 cookie =3D chan->cookie + 1;
>
> the "type_max(...)" part could also just be written as S32_MAX.

It's actually more complicated: this code is also used to make sure
any other values outside the valid range (e.g. initial zero are
converted to DMA_MIN_COOKIE.  So the above would not be correct
replacements for the current logic.

DMA cookies can also contain negative error values, hence the signed
type. However, I don't think that can be the case for the chan->cookie
counter, only for cookies stored in descriptors.

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

