Return-Path: <linux-renesas-soc+bounces-23256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF0BEAF4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 19:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89EC1AE35E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 17:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27FF2F83B3;
	Fri, 17 Oct 2025 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HKt+D8t5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC242F83B0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720574; cv=none; b=EbBoFjaDVYArQfKgesEmytYy2fUP9yujqfvp2hSx8gEgUdJvcjbWZhkiH+8QaVtEfiH75PHbTJqmsXsrE2gHX6V/OVrhYIWAn+40TwC1+pbmK8iHg8QTgOpFxWtDXPqV4HDcPoaP56SIVRZzOKrNFBAH3ZCIZ5bJW+xyDkot9rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720574; c=relaxed/simple;
	bh=s+DfsSyxoZjkavdlNnP0h25P6XFkog0IcVoyYYb6tYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYLeU7dZemtBE93ayedgJGVxrEEIMNS0ukz9LdvSbvfGu6hIhQVC25F8nC6ILEMzypomHo4RwG7t89uxMZPLDjVpcBMsAOS2Xaz3CjEREsky+CO8xaykCcn8aNS1ply6qGruqXt28/O3Eu0ZDBE2Vx67tE7qfXb+SRgc0Kh9lkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HKt+D8t5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso2471716e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 10:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760720571; x=1761325371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+DfsSyxoZjkavdlNnP0h25P6XFkog0IcVoyYYb6tYs=;
        b=HKt+D8t5u2aiP96/Fh4I7bz9mQRuzxhG5Xfsn01F4PDLQSeCUoN57xFUYcxBeuj1iG
         UxEa+4AKf/Bh5k/CbrkcDK26gAcmD0ClFbNQ6KpFs1HQTbQtkR7IDql8WkIuogIw0cY4
         yHViRTas983wnoiTPfA5IFWdDhDkyR8vLjvhq38OEJw2txXaBcMLTjpaRuRUgowrlfxM
         BwGi9SpVe9nyDTUt93cAtPjoNuC+LTwtTW9Vn2Et6HCEOmiFxqPwXWVhRdWAvlQo5btr
         naN0bW2kS6FIBYcIgvE0UehxBxRM0pKadkudMc2dLG/LsYquFoBlJIZu7hEc0u60UfvR
         9EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720571; x=1761325371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+DfsSyxoZjkavdlNnP0h25P6XFkog0IcVoyYYb6tYs=;
        b=sbQNiREwfjolgkz2vba4s2JZMjwxl1/FtLVqb6p7z7DXMD4N77kqDHJ0OoSi0iHZQO
         YP+41tzJ7F2vxY45fcZ7haHGz8yKt62Ejl2wBWiDJF/AeIH1KR3xgeFJ9kq/gFNAeXnm
         1l7d2AjI9MGgVJ1JHc+4rqqVgDY7s8+EQybFd5GTlTiq9fvU6knvN8HOfp4QVJASREdA
         svlgoxQMrWGRoKnv/tGGRh7ZRHx2rPR8ZK6RlqFG0GuIeuIuk0Gihtk9c5/pxEru9sJQ
         V+OEla9JcZhVlLJ/cF1oUDuZW0tM3qiWDYejkI+ec4XdtRjsoj+nw6zEild8ToBi2j4H
         cF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6cQje+g0nYks6YycFUL+EWwC/fSJCugks9dN6Bu2m1vOXdMdMBI+FPZ9dqavUsRKtNJd3PLfjERi9tWpBLm1BmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZQAViKHUmpBlHh4Z4/gKI+s+6szZweQeveundBNunwWlhUAj
	eDhKjAfXnWhJAqQK/DiD/pLmfjfrV3+O8rXFJarJxLdTr1dcg2w4en4u9PXfEvQPeUiVXjuFseZ
	XdWcgtQV2aQ8+CijPedyxR0bkQrauyDxTJVaZTxYnyQ==
X-Gm-Gg: ASbGnctpwvoDusubRTXpDfb8YDsytDIcifnUF2AAYtiEAEfe6+uhpOLZ8pyYwxffCrb
	P+GDz6iMtgj9pZlNWcw/ROR9i+UVcZwPm8Cq7BM/P89SO8Ah5rsMuliYmDn92cWG979Ln5PK0en
	E41YGHzlwU01RtZcsD5z7Qb6K78Xe34nro9S0PRYWBm+XHLOqxuQGbxiqbeqw/BYfZR1xD30JXu
	E72jM6lHABKT3LY6MqofHCRJwLqPL2MM6hAUqsPEO0DzXWi906EijyfQE6me6mE5OzNAVlLfxa0
	x+CTvwZ3hV+zYCLtsaJ6lrPwtpY=
X-Google-Smtp-Source: AGHT+IE/jXqKTloLZ/aopfjxfCXoZv13PiX76YKj0csvsveMFfoiQWw14YejNOM2QPMlqcPqBUNH95FgcM8u82UXJiU=
X-Received: by 2002:a05:6512:1041:b0:560:9993:f154 with SMTP id
 2adb3069b0e04-591d854626dmr1423123e87.35.1760720570725; Fri, 17 Oct 2025
 10:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com> <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro> <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro> <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro>
In-Reply-To: <aPInv9NELU7N9QDn@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 19:02:38 +0200
X-Gm-Features: AS18NWDzZOn6Pi6ARdErmuy19hYF3sE3l-jPlZ2FtA0A_r8ld1z1r728Uxqt9Xs
Message-ID: <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 1:25=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > I think the fallback mechanism of the core should work without any
> > > module loading infrastructure. It should be there whenever possible.
> > >
> >
> > It's not really a fallback, is it? This is the path we'll always take
> > if the driver requests a reset control on a firmware node which has a
> > reset-gpios property. If the driver goes with the gpiod API, it will
> > get a regular descriptor. It's deterministic enough to not warrant the
> > term "fallback".
>
> I dunno for how many drivers this is really applicable, but I really
> liked the cleanup of the pca954x driver. Don't handle GPIOs internally,
> just get a reset, and it might be a GPIO. I think it is very useful and
> I would like to see it wherever possible.
>
> We could now make these drivers depend on RESET_GPIO. This would make
> sense in a way but is uncomfortable for the user who has not RESET_GPIO
> enabled before. The driver would just disappear because of unmet
> dependencies. Yes, this can happen all the time because we always find
> new dependencies and describe them. I just hoped it could be avoided in
> this case.
>
> > Then I believe the platform's config should make sure the driver is
> > built-in. I don't think it makes sense to just cram it into the kernel
> > image for the few users it currently has.
>
> For Morimoto-san, the PCA954x update resulted in a regression. It is
> worth thinking how to avoid that. The driver is so small, I wouldn't
> mind the extra space if it saves users from disappearing devices. But
> mileages vary...
>

It's up to Philipp but I'd personally go with "default m if GPIOLIB".

Bartosz

