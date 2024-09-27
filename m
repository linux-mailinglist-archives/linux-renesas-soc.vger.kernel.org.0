Return-Path: <linux-renesas-soc+bounces-9132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEE988582
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA4361F21794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6327F18C90F;
	Fri, 27 Sep 2024 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahUHxrcw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6818BC04;
	Fri, 27 Sep 2024 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441505; cv=none; b=W+ZIe9xHC6KC02UEpjgegaNWJ9tTBDbFn4/zPpCbDytE+hhiltSfP1KDv4lm7AtorHNCcNBUhiCvaXreaspkBKqZ1UjOqIlHTUWPkC2RUlePx4t7FcTVSpZwjV8uC9TKP8IIbitlyv2/MRoGh1D4gsHkzhmGSIqSK0odyTpephs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441505; c=relaxed/simple;
	bh=0iCcyK0xhDdXSzyESI4QdHyyn8/5nWa+RjukUfHggL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gviKXQ7soopcp6brwLG7EdgCWLtRHleiFX8+1X+KRSn2s7u6SN6vVTHq/1EA0h0DaswOwyo+0diWYdioZnH8eo2+egISIh/lJ3F+SG+Hc5hPnHCtndPpEzWkt7G1n812jFhhs7Wr/qqEqTdSeV2QWWD1sASXZvkN7G7jUmwkNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahUHxrcw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e0b0142bbfso987663a91.1;
        Fri, 27 Sep 2024 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727441503; x=1728046303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SiLgZzv72UGTTfq/8HIAGPqjf+QzQeRGWzMfPwIen4=;
        b=ahUHxrcwa/qk/q9OAxWZTdFHWGdp65kTcUG98VS5BD8aAdzJ+7q1JjYvTPsQMyK75F
         kw4OLp7N18zj3Cxd9mK+Vd1Y2u141OG7QT6dduN+uXQaT8B2FoR329LHOC0H0YHAlfnP
         BjMHs0Y+WDXb+wmgb0rtzF6booMtkjGQqZi0m72hlsDWq6MMvxt3Kz0ry9rN01lgxSxl
         gXIzhZ02fCsr8dJ5RkoqAa9t2F46gNguH+vmXJaYaRezeciNRGNhM51SgHCUk4AoYTyP
         KWaLBD6HFbo0BzIOjT9RbV+Q3eBNVUdn5Ozd7rtTZ3E5B5GE4MmtbXB8fR9Fkho3OunZ
         5h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441503; x=1728046303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SiLgZzv72UGTTfq/8HIAGPqjf+QzQeRGWzMfPwIen4=;
        b=DcT5O10MES/ctFCafKafItYqXeucS7fmLnBmyDioMGE+It8RBLdOAIWsBx+gZAs8Yx
         F+xuAxq4Ref9IwNY8Y5ecGRV+dwt2hcdxDGf/7xw/+lliYYd12hky6yQX+pGbjYHMvCX
         S9MHKCLlm7/yz6uu2W0B9Zfvq9bcbuP7h2LWOOBs4SNM6haocDtx+97VhFJ3Sv5RWB3/
         FNV099GNh0X1fcnmLvYpSAeiP3GHkxMtTuiydYENoQX3KEJUHLr4b2ipOaHFJJFwkumP
         o8x5r5g3xROgrFb+wTBj1i96nWlb2UijwflbMD4qgRRflH3GX7TlltH7O5GQRTRabJWE
         pacA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AliEZ8TiLuQUzzM++PF73emuR2tzGLuMMIUiNjGpeJl34UUi80vAIYYFdTKUl6nHwoo7hSMgCd+k30F3MCj3iyY=@vger.kernel.org, AJvYcCW0D5uT7zOtmDtIlcBun9A0w+t03tkv2q8LbXthyRqIbZuw6iwTxss4M8yPbDNZj+XqFfbRq3R311f+@vger.kernel.org, AJvYcCXtMqPeC3N4jc6Vsu4wk/Vv2d97j2NTiD2g4JvOfCO2ASAva9TB2XtIE2D6ZQ4n99vZT8J/JgjZNHD5yNdL@vger.kernel.org
X-Gm-Message-State: AOJu0YxwPcKCTIoxA01J0pmiQ85OEJ51dPbhZ7pZ1D0Qeo1m3wU7WbG0
	kM9UqOE5T1fUhxVM1zBhABYg9+Mk0FDzFDL5qE5to8+gpmT40QdkZ3NXTTO4s2xvLfHim6lqmJD
	5FLaxJkphZXNpPwizMNGEUZodYc4=
X-Google-Smtp-Source: AGHT+IFjt1shEus2r3XU62QGxTJTEeUQIAR+fvJGnhOXYbZF/st8NuDwqhEl2pmpnwk46oGSyrRO6EVcd0DlWJqYQFU=
X-Received: by 2002:a17:90a:dc18:b0:2e0:8518:44fa with SMTP id
 98e67ed59e1d1-2e09111a88amr10370853a91.7.1727441503134; Fri, 27 Sep 2024
 05:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev>
 <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev> <CAHCN7x+tcvih1-kmUs8tVLCAk0Gnj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com>
 <CAMuHMdW3Lnu+fLm6tsWvtysOGmvKJ-utNYGJRUpRXtRmOXpQiw@mail.gmail.com>
In-Reply-To: <CAMuHMdW3Lnu+fLm6tsWvtysOGmvKJ-utNYGJRUpRXtRmOXpQiw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:51:31 -0500
Message-ID: <CAHCN7xK4WxuLCbR_C6v7QKgoRkzuGoXq92YVQQOTTajUgO7njw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add SD/OE pin properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 7:38=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> On Fri, Sep 27, 2024 at 2:20=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> > On Thu, Sep 26, 2024 at 1:24=E2=80=AFPM Sean Anderson <sean.anderson@li=
nux.dev> wrote:
> > > > - Inspect (or send me) the schematic to determine the state of the =
SD/OE
> > > >   pin during normal operation.
> >
> > The SD/OE pins on the Beacon boards are not tied high by default.
> > They have an optional pull-up resistor, but it is not populated by
> > default.
>
> Whoops, this "np" suffix is really tiny! I had completely missed it :-(

I have worked at Beacon/Logic PD for 10 years and I still miss the
'np' at times.  It's done that way, so when the bill-of-material is
generated from the schematic, the system throws away anything with an
'np' suffix, but it makes it really easy to enable it and know what
the part should be.

adam
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

