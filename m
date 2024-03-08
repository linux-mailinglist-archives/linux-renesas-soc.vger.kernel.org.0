Return-Path: <linux-renesas-soc+bounces-3618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CDA876B49
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 20:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593851F22231
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CB65A7AF;
	Fri,  8 Mar 2024 19:41:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0C2BD0F;
	Fri,  8 Mar 2024 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709926871; cv=none; b=cSIY1H0Ef8/iILa5eSWgb15y/5J1fIZniySKL1uN+PY/IWw93FQm7tJKaiCxdNuTGwokRrdbDsWCBnIQXwLR89qkgClcdzUu3p705e8AL/KUh+AmN49Q3DD1mswwVIVZN9cW5dkauAcNOREwgBXKvg/ygAWZCLDtRAGLjL78XFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709926871; c=relaxed/simple;
	bh=LZtYYIRtxz7pK3POU+G1oTdbKiuk2pwLAylnThlM27s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAOA63IcohgwPF+ZX4c47a/2sUoaCD9SLgZAed4AqiawaNUkuSPHNK7gl1V3z/6ytsc6qysqQNo+uzY/A2JfRH4tBCPQicxAG4aHiN4TKaBglZBmsuxw1UPsPrh3CJfzFXOeA81+pfqaPL8QWpU2ejlL2UUAxCUqp611gWASR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f359b7b1so22777107b3.1;
        Fri, 08 Mar 2024 11:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709926869; x=1710531669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3zCwFchG/fixnMMCfo9dg07UkVNJ0ksdP+fhs1/xwE=;
        b=jcyXrUG9SZtI9m3iL/VqCAhJVsxFa20cXX0gLar4f3BNQOIoF3M+Xop0wA+klnvKvv
         IQqP+FmeHQX73kdFSC62G+RktFMoTKwEs6azJutoe7RRnxsV3e/RhD9tGEke8h0n/2ic
         fqoee+Q4I4/C/6UJQtUQcS+ljpJJv8oX/7F9567UmYkUtipw0s2oxozXB4NsdeJ0ZS+q
         0DXbXY6eF1C17ua+eDzcvOuM2ICXMJ3DmMUMK787vXOAJq2JxKES0PkLB69l0t1tiKEj
         lVIwQT37nCLKaOx3kXv1ncsFbFVpGvsHzfVjdsswz6jL7CLO+XknB1or9glld72a3PL1
         jqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFZoEQVLDWeOKtGh3e4AJ/gKczB6fLFtWTZJ8cTDY5Vy4kpH43vct3ZT5eg4joxe5g6pOqSoZP53ohGfXRJvWgjAzqvu0VF15gUDyeJmx6m9LV7npFV3AnTcXX1eFE+u24yBGRGuLxhN0ACrE=
X-Gm-Message-State: AOJu0Yy72+rvOdpoIhiC6ppVf+wFf6O99tA04TuAXR3xaQjf6se9/6F0
	1Asnn15Krsd9qOZlmpnw+DEDhxJoThWmgbsd6assUUKMXdW0PCHfUBMKHg3yrPM=
X-Google-Smtp-Source: AGHT+IEq+GwB2/BvDFwIYj6wnzX9wCCj/8b8u573bl5mhV+weXtkC9F2iCVN6IGk9IgNCSj3uSK1Cw==
X-Received: by 2002:a0d:fd44:0:b0:604:eb7f:30f4 with SMTP id n65-20020a0dfd44000000b00604eb7f30f4mr145532ywf.31.1709926868706;
        Fri, 08 Mar 2024 11:41:08 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id j128-20020a0dc786000000b006049c16b843sm18761ywd.145.2024.03.08.11.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 11:41:06 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60a0579a955so10049567b3.3;
        Fri, 08 Mar 2024 11:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVuwhnw21KN89CwN5HMB4lcc9lzV9KljuYf0Hn4qFWlHvSycVzSoskhvHuB4qAFhQh43Nve9PHMWsYvGDeDgYtQczxpk8Xu/ce02Oj/GQKtriiIbe3fwzdhwxbC3hd/wCuOFv9s2inFymX89Y=
X-Received: by 2002:a0d:c9c5:0:b0:607:f785:c5b5 with SMTP id
 l188-20020a0dc9c5000000b00607f785c5b5mr179101ywd.22.1709926865502; Fri, 08
 Mar 2024 11:41:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com> <20240308180919.6603-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240308180919.6603-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Mar 2024 20:40:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYUXAyD6o+knoxHdEEG9qCJGxMohGG+RneP0UQ1Ye3NA@mail.gmail.com>
Message-ID: <CAMuHMdVYUXAyD6o+knoxHdEEG9qCJGxMohGG+RneP0UQ1Ye3NA@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: renesas_usbhs: Remove trailing comma in the
 terminator entry for OF table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 7:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Remove the trailing comma in the terminator entry for the OF table
> making code robust against (theoretical) misrebases or other similar
> things where the new entry goes _after_ the termination without the
> compiler noticing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

