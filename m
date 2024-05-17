Return-Path: <linux-renesas-soc+bounces-5397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5518C89BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 18:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E7028172C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 16:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A4612D76A;
	Fri, 17 May 2024 16:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514D3D9E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715961796; cv=none; b=X4v5WI+hb0xgaiZe+GAOecKQ3pFcOYYHvKQJ6WmNlcfuYMUzhcU5nv+6phA59jcC/eDjqEDzzaEZ07LoUq+ccqjVZRF9s2QdB9Qw832WlRZN7gGJY29VpFe/07ghJBxIMMzx5f09oPNWjY6ws0cd+f85kT5seqO2XCZzaL4gcV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715961796; c=relaxed/simple;
	bh=x1IP4IOuvamecl9rvUH5ryTB7rZ1YFw+L5JuDrraPTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4VxUFsOH2wVOqy9+CMWTXKde0l8+tMPukBh0CE2tsemGBHjGggXzkH9suEEW+HKM5aMO+yKW0L6/rmAFYUFZGJSFNvDsoyC0Pty9hpZj56Fmgpf6m5gAJ8Y79tC94sUowJvKs+vaAsa2CKnjYS1MMVq/Ovwp2L8XqeMhIHSFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dee9943a293so356389276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715961793; x=1716566593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHhQjopodaQUBA+VPIwstTvnt/quyB+jmfGuNe8BhHQ=;
        b=wfWMWoXn/gyxxEQdhTKCjl95Q50qBE8T0RmEXzeRA6dCnRMTEL8sZmUdC4hH8ByXH1
         x2dZeWaGv2yXDai+zZ90fzwE77YurB2RlWCFqImX8J0gQks+5aQFXX0poFXw5+OcbaCh
         NZw6HIcZVXDijaSfUHuAu6/A7cYnIk0qwTzBF7lHCrcpQVJhAXQLUnhaOrNymxeNwWJi
         /r/07D13qjB3QR849+HhdZjOTOrPiUtu/GY4O4DTo/cMAZNiXGqXGZBHdeAgHxng5sLM
         9+LxDbOK8Dv8pQD9oKeKfXe/fTfdk/mi2wHNHYugpFmKlwR21DnIeaJwVDrfZ1XNIhDe
         I0iQ==
X-Gm-Message-State: AOJu0Yy1EdaTT05UsmDygyTgHqDhSeGo0Q87tmYLmagouMcr7KeHx/qY
	f8XSvayVXTw5VJjvu6VJQmBSmCy/w5WzQ1jE+NNfXQuzJoItJnysOOuFrDNM
X-Google-Smtp-Source: AGHT+IGEohrKsfQboFjDnrkbHkZ7XgtbT3CCDD52i0zvA1pKxgZkwLnPmLwJVA5AP7qSq6TxXFh/ww==
X-Received: by 2002:a25:ef0e:0:b0:de4:7bae:d57f with SMTP id 3f1490d57ef6-dee4f1cd577mr20891425276.38.1715961793271;
        Fri, 17 May 2024 09:03:13 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-debd3713845sm4075781276.3.2024.05.17.09.03.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 09:03:13 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso331708276.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 09:03:12 -0700 (PDT)
X-Received: by 2002:a25:2b45:0:b0:de0:d515:259b with SMTP id
 3f1490d57ef6-dee4f335262mr19306577276.59.1715961791431; Fri, 17 May 2024
 09:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715956819.git.geert+renesas@glider.be> <r74ymblr7f7ruwjzo3dfnr5y7xu3z3nf3e4esadicixdiexxf3@ycwbwxdskzzc>
 <CAMuHMdVBWDtfa81bOnbPneDEc=n4hC8wbM=EeXNddPHU8rd0ZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVBWDtfa81bOnbPneDEc=n4hC8wbM=EeXNddPHU8rd0ZQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 May 2024 18:02:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV__ZZYPdN04CS=iLSRawgCKOf=EO0WGioTAZsrc_=XQA@mail.gmail.com>
Message-ID: <CAMuHMdV__ZZYPdN04CS=iLSRawgCKOf=EO0WGioTAZsrc_=XQA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] *arm64: Add CAN-FD support for R-Car V4M and Gray
 Hawk Single
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, May 17, 2024 at 5:27=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, May 17, 2024 at 5:18=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4=
H,
> > > but differ in some hardware parameters, as reflected by the Parameter
> > > Status Information part of the Global IP Version Register.  However,
> > > none of this parameterization should have any impact on the driver, a=
s
> > > the driver does not access any register that is impacted by the
> > > parameterization (except for the number of channels).
> >
> > Does the BSP work?
>
> I haven't tried the BSP in-se (it does not support Gray Hawk Single),
> but a forward port of rcar_canfd from the BSP exhibits the same behavior.

I just booted the BSP's kernel and its Gray Hawk DTS on Gray Hawk
Single, and I no longer get an error message when bringing up the CAN
devices.  However, that does not make CAN work, as v5.10 (and the BSP
rcar-canfd driver) lack CAN transceiver support.  Backporting that
didn't help, but now I have something more to investigate next week ;-)

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

