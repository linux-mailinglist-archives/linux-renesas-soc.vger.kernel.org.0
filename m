Return-Path: <linux-renesas-soc+bounces-5815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1608FAD2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 10:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5890C283CAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 08:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6C014037D;
	Tue,  4 Jun 2024 08:12:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD0446CF;
	Tue,  4 Jun 2024 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488721; cv=none; b=pbBsrX/J3O+GRclwX4SHQwrHc7F5p3SbO/THIWRYEn/ByNrHSNk3zLG/USTh0R7NqVS94xMnDNaZVsYMgiaw7IPJ7vbNnALClWzNwFQadpZOnHhziazsCHoU86hspIjeviUk95EeptMq8gthMJFIDiqC0qNeHhT2FmZCxUzy3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488721; c=relaxed/simple;
	bh=XVc3RxFjbGyWQiNQ70+jdudyQe9tunUmy4rsTJglS4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amV5X66eN6taxBl3JmP4iiRnnKzWret5ap2l9ZkbavX64WKXPLkHbGK4/OK8QsJBfFuqhsfObgx8Dr92j0ajMdf+bOlaXm6aa66kStw9guDdYneaDmToIH5gQ8qZiR5KWzmh2H+qE3gvUiAsll7JSTFj74Rr9mwLwdg6oRRfmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-627dfbcf42aso49843457b3.1;
        Tue, 04 Jun 2024 01:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488718; x=1718093518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gU1sDzuM45vaVlHKMzHVvwlzlxFuSrKVvI5rVVcF/YE=;
        b=c58uJlxHX+d/TMGahn4HxEAx1r07NC8VYJy6pN2xqn6fcoFf0VLRnmpAjuMNk66RJj
         HMpIzOahJTyUnbPaVsOsVBrr+FePeKwZp3F/5AW+oKGOqACaWVjJprkagXknGvLy42OW
         Txh8gB3Xu0LFMpCafbaxzmXhmM7FeFBlIZvjHcr2PvRoQdAG3SKjLpWxYVNs/+fB5HNL
         4nM3c3j27ZQpMDPguH1Bmnj90puBjNCD9KcS886WA6EH9HKg1R/U0LDIXvmzIwKkT1S0
         9n/4UVaevDKwGyNpYDBl1iyvwqKLmONEJeAB9AcTMjdQlMOgNsgudhA7YkNrO8kCcoZi
         mXeg==
X-Forwarded-Encrypted: i=1; AJvYcCW3zdzonEtO2wdI/5eDn7l4oWdcRfu+9J9N0VJL9k1FwS3V4zdUKU4WN9ZLtyLOwDUGVG49bXgWFBuxuJBK/flMNwYHUOeG4Xlxgr8L6mJ0seldFo3vT5SejhULLR6duzs8NB2eSQDrkb5Xb7T3
X-Gm-Message-State: AOJu0Yx0Gn6sxIDKo/m0TT8/T+75AqmmabABlqsIpg/d3uSGqGc5kySL
	Lsuh9hu8TG6P0xStAF+9uVGvmCZenDYijpeu4LCbhyZEnKv+h0ePiEd5ePX4
X-Google-Smtp-Source: AGHT+IEm1hrqFrxJKo8yvalQm0Ybf4gW6n2kEjsOwf5cfL5eZO+BbGzDp4wup7K65icBDz/AG1mAxw==
X-Received: by 2002:a81:ae51:0:b0:61b:91e3:f971 with SMTP id 00721157ae682-62c797efa12mr117019657b3.39.1717488718383;
        Tue, 04 Jun 2024 01:11:58 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766ce78asm17325037b3.146.2024.06.04.01.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 01:11:57 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa588f7283so5433961276.2;
        Tue, 04 Jun 2024 01:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbkRUmwwRmfcoSCBZ2SeUBy6nSLr5D0iCCnTkXznYaN9an6oEUHoxap/dQnUVgSIEfFQHkyPnnjg5WnZUQZFDF9V/f5DQWiQADzXq+rGTWBMvj8UxxzMcrltB37EYQbi5WEYWin8v8hczfAzrj
X-Received: by 2002:a25:b315:0:b0:df4:9a10:4e12 with SMTP id
 3f1490d57ef6-dfa73dd26fbmr11781649276.57.1717488717729; Tue, 04 Jun 2024
 01:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se> <20240527134129.1695450-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527134129.1695450-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 10:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGoVNC=ZwkA+H=++nr=XMTh_JQnpEsUmSvPJuQr9-tCA@mail.gmail.com>
Message-ID: <CAMuHMdUGoVNC=ZwkA+H=++nr=XMTh_JQnpEsUmSvPJuQr9-tCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: gray-hawk: Create separate
 CSI/DSI sub-board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 27, 2024 at 3:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Before adding the CSI nodes for gray-hawk create a dedicated DTS file
> for the CSI/DSI functionality to reflect what is done for white-hawk.
>
> For now its contents are limited to the Board ID EEPROM.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/gray-hawk-csi-dsi.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car V4M Gray Hawk CSI/DSI sub-board

I have mixed feelings about this patch, as (AFAIK) there is no such
thing as a Gray Hawk CSI/DSI sub-board, so at least the comment
should be fixed.

However, it does make sense to make things as similar as possible to
White Hawk (Single).  In the end, I do hope to share most of the
White/Gray Hawk (Single) DTS.  Of course we have to cater for the
small differences like the use of a C-PHY vs. D-PHY, which is one
difference I hadn't realized before.

What do other people think?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

