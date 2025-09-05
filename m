Return-Path: <linux-renesas-soc+bounces-21475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD0B456D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19EC23BD241
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EC734A30B;
	Fri,  5 Sep 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFNuP/7+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E73431E7;
	Fri,  5 Sep 2025 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072996; cv=none; b=ESYVrw3KROW46quoNYPdAPBDzXmbvabf1RS8KLakBYCXHy5vUS7wTautWFePVudft/1InADH0nC2i5VG+PQEnct3Vt98wrx8DIQ6CeqfoJkQsmgK8CA7rULsPyqRfLQ6cRR3z8EVmZxoKQUs+x9A1+56Yn1YzjzJyThR3symcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072996; c=relaxed/simple;
	bh=e5KYMCPWeDzItVr7EsOrYnFYbc9AxEl/dP88kLjEf88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+d1Ycdw8vBgp1OKoCztgULBCDYQRQG35yzN2Ytq5UswqbAvIqXtVvhB4vlq79bDYcDz5glQZz1XophQs6GFK8ocSUouwso2WkROPbLUXw8ORECFiNSierF1MgsGoqaqfTAo1uWi+DNLawg13eA9D2R/C6okSUHNN4Uq/JxkwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFNuP/7+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so263334f8f.1;
        Fri, 05 Sep 2025 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757072993; x=1757677793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMFJFW4Y9qE99x106Y3qwh7e8ICJq3Htaai8JEw2T6k=;
        b=cFNuP/7+Nu8uxcU3tE2hKemmk5kTTmsf2cRwqxWuf+Ml1JpHvR58cfIvRUez+giWxz
         VjpLZEi6WM2qoHGeNyCd/hwZQTLUS7wQI/odhB65+f16S2MzCvPFnuBKW/x9savH63YU
         FKkIpw1VDx8URBpVO2TXnRsd8vxt9q3BOkUB+oUleo/l8bcozHhqOUl0vrrThuVA2g7s
         PsiRGTxxL4o0WDzgrB+ETb1LTH93391L/40Eosdnt6j25+yyIRKOPp7BEFr+IInV0W8a
         bLiXQ+MAliOM/9SbtguYlicsS9Pz3WAgxo2a/13DMlh6Zpb8/tSx578r0s+KKlHLCUPs
         LzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072993; x=1757677793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMFJFW4Y9qE99x106Y3qwh7e8ICJq3Htaai8JEw2T6k=;
        b=TJInFJAUyBUh2CofeXGiPOxOaaUaYVp34lxfXmhGYS7p32I6/iJYHjqEXbHKUxXysH
         POeKB6IvxECz8PxPhcZFCnQiVHvyjdgvTceHq/go/d0eudR9w6vQm/BlirVGRx6benFy
         bhiu98GcXbN0PkcIcx/aJ8eZej+6VS42PKnnnSKE3GFgyNZIMj16N1HwYMkt/99oXCAx
         fGsjjY3aT3sNSFd9BCfWvJxqY/q+HjjrFWk5bQUOFl09jAUmRTIWYZFXgYBJa6iUgKCe
         ywcPu3hFv8tPehxUGIgGgj8hNzDtNGaxNZCVYgKvdCVjnsHOLjGgnHdzUokQ2dx1yU7m
         JXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUe5ykHJY7LW8oBSNy/ADI7oeQbVqA3qgf7Nflnesrg2ZY55A33EB3ILiW5d+5nHkdvS7zfu0z4yoPJ@vger.kernel.org, AJvYcCVVgZ3cJ6JICruMUs4kgDO8m86ZQoj0Oz5Y0xqAFDpLYjcIrV8uAYpaqoY2yZuSCyI4lJjczwarPgbEJPtkMtHNxVE=@vger.kernel.org, AJvYcCWykPzaWMPI1akcl3lXuOIXlMHBKomY6IXMIOg6/u+3yu35xTd+fPuLoRSxiFsPBm58UXYpYXRe@vger.kernel.org, AJvYcCXcKMRuSElkttOtwQGszXx2bi30nSu1l3BEn+Y2mInDFawexIJoFhLteClGdkOydackLVudMKZ/KdEU9IbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwVDIYBfbTh0Y6j8NZEwYuIOIsl2mex05pDfz6x9lg7YrM3TAH6
	9TGyN7u52S1CI2xfp3vTsyb034YTQSxfNq+xmCAX5XfMrK2z3wdXk0dQret8DHwF/rL19N8eSbx
	92ywlSSYihWwaHUzZVk/+KNdMt4nMWmo=
X-Gm-Gg: ASbGncuFOZ64eG633A5IDN6MiLCmZ9hhdalvMiNI4D0RsMKYfWOI1xmbU9Pw9Wk6Hyv
	yiQMYGXecljioOQsAZjsPuRGocsoUwYzHZQe6iHRJZXYnJ6z66dNlzFiqgXEunVd7e418RjRm6z
	7MG1FheAZR/C8mSCeOqnBXR3BAzU97lDoV9YjGEhUor3yPc6YpDKPj8XIjJ7BztOdlfu7w3FsFe
	WFf0yOLygYguJ5/EQ6BKObxpSSRiFIdU+x7gEjvbADVMvccR2I=
X-Google-Smtp-Source: AGHT+IGN5ir5jq7pGO5ZYcwgPMGbBC1nB8MpNP0h09fVcVV+QJyyt3gKdoDVA4z9uoPRoYtDLPPQgmRht6b4/lhmqC0=
X-Received: by 2002:a05:6000:144e:b0:3d4:eac4:9db2 with SMTP id
 ffacd0b85a97d-3d4eac4a063mr17566719f8f.5.1757072992472; Fri, 05 Sep 2025
 04:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <bb17b506-89ea-4a7e-8c15-ed4f35dae5dd@lunn.ch>
In-Reply-To: <bb17b506-89ea-4a7e-8c15-ed4f35dae5dd@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 12:49:26 +0100
X-Gm-Features: Ac12FXzsUnVw6jhah6x_ySxsUIyIQ8x8jjFotf3StZpBQWS37A8uM29WBvcLlD8
Message-ID: <CA+V-a8u=U8JkJRe4VRjFe_gpRmbpWpX7uaXO93rGQcT1rmhe5w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 9/9] net: pcs: rzn1-miic: Add RZ/T2H MIIC support
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Thu, Sep 4, 2025 at 9:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  /**
> >   * struct miic - MII converter structure
> >   * @base: base address of the MII converter
> > @@ -203,11 +255,24 @@ static inline void miic_unlock_regs(struct miic *=
miic)
> >       writel(0x0001, miic->base + MIIC_PRCMD);
> >  }
> >
> > +static inline void miic_lock_regs(struct miic *miic)
>
> Here as well.
>
Ok, I will drop it in the next version.

Cheers,
Prabhakar

