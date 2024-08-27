Return-Path: <linux-renesas-soc+bounces-8390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A29613C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 18:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C071C23341
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A8F1C8700;
	Tue, 27 Aug 2024 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvypKUkj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B119EEB4;
	Tue, 27 Aug 2024 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724775255; cv=none; b=rfx3XD9bsSWRKkKdx8+fyn+zig/qEgLgjHyiKpnXWcUwg9I0Sda2JPMaqybOWLEiLAsTPq9AdU+X5APSqSqWGJxwRzZMB5GaHDowYl0DmKUPksoTYLYixlL2aRgWDwlwS5x48n1FGx8XtwHEavdsT/KSlYisbj3f717T9C3oxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724775255; c=relaxed/simple;
	bh=ANltZQlNMXUC/raYAwwTWFrv0mMK49Ggh38qhIinfoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2MW3ZQLCN48vqXLoYTzGMxGRd+sH3KZ7DcTJb48ug59/Df0GYWUqC1w9Xq8ZOzMOCK6+blGuddi3xCecy3UVrDTch7jGwxW0rSk69434xsG6FibYAnMdrLCMgqOGYbGaZLpNquWSgg5WgayninZBnr2Q3vmBzpuYYUWmVF0DpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvypKUkj; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db1e21b0e4so594910b6e.2;
        Tue, 27 Aug 2024 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775253; x=1725380053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aa6xcT3MJxzEFLTzf5A2PiY1HCQJjSWCUnddlk6n61o=;
        b=mvypKUkjW3jpa3jH6SBvM9DwlguGe/NJYNG9ivtsxZ2DKGuQ5IPnBdADomycVoR5pC
         434cCkjSErWIaQyQeWGYVzIUY7sziEVkxq3zHk7QOpQW4oZQJjlv+XiaCOtklR0x3C4u
         d0KgqUwJsikkdUxyY8ZPz1TK9PtORGMa1KkZ95O9NXyYi/T4D1G7Vu5/3FtSIex8C5gQ
         9FEQpK0AzPC0j+BRIZGn2UPb4p/xozreMCYjwpjNGC5jOexIQ/IWlQJEdSEWjvh4JIbC
         tXYrLC8eF+jFDU9mM9dtEvokOXrhpetB+5CcPhXQLQn/YezeiD/0n4vB1GSxSC8SEt4+
         4Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775253; x=1725380053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aa6xcT3MJxzEFLTzf5A2PiY1HCQJjSWCUnddlk6n61o=;
        b=LZYD+YPE6zIxtkY2wTi3cCCC1kPgtXatce2UvWQ24TSlEq89fmPJ3Jh03ZdCZzXpeD
         PRNaqxEAhGmUBWtvXxBIBw+l0DVM042Ah2IfdoCPrzZVxLRcXHYynGB8AUbzGPrFo+uf
         wF0H82lv1y8Y0wbqsuqyH+vhlylefCuuVMSJm8XIdTWwKXgayle7J9W2uAyvjYhW9c0U
         kMIcL4LPED5QePpIjgC2mh42/zP9MOPBgi9xgbTKWJDqSGoqgzIDvEax7ap7RyB3gaoN
         c9QuZpLjMA+mQIeAXD13Z83RHsK3v3mRDpfBQlig3z+A+jYOu2qYEDaXeHosXjT1Divp
         UN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcHTSgE0oT/DbpE61vHhDqUteoRHNmf6+NWey1Wewu4+SmAuQiClovSH5aL50TN4MvU0dayGMkUunNC4aq@vger.kernel.org, AJvYcCXAYRZWvYW7KmohirjFGA4SZG19KdnD4eR/mfOMauXtABxuGMuZRExNxc93dIJi5thwpH8rHA39s4C8@vger.kernel.org, AJvYcCXDAbpeLfWrytQQRfcNie5M9WbYJanxmxa0XtQYpkkmgFrjW7+eMfpWDDNBYeqsYQXR8/3jcubSAvofy0OQ7ga6sYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlXjHPukWi06P2jlyGPYTm0RRIf0guNRGvNU+0+zj0lnR/Uqk
	YthlFm6HuaOp3vRa/B9ABeZvyCAk2l5Vf3x8NkuWkHZHc+hT4ZXnpZefRZIFfzTy9sKGP4Cffw8
	byXDoRZgXcylu7/JZMixflg6Dzdg=
X-Google-Smtp-Source: AGHT+IEeiQotsUr+GkK5yN/p67VboH4ZO9deY7B7MqAyr+C+/Bg7qj24ZRgznhykflAIsJ4MsNKHgHW2uf+YX8Co8vM=
X-Received: by 2002:a05:6808:ec9:b0:3dd:b5b:e5ca with SMTP id
 5614622812f47-3de2a8c94a6mr17027105b6e.46.1724775253312; Tue, 27 Aug 2024
 09:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240821085644.240009-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUyW_8ma++zP8bRLMh120mysSD7206On0euRG7+S-081A@mail.gmail.com>
In-Reply-To: <CAMuHMdUyW_8ma++zP8bRLMh120mysSD7206On0euRG7+S-081A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 17:13:46 +0100
Message-ID: <CA+V-a8tWCXxOCdD_C-rWJG_6EBL1S0nSxG2cNZQ6rVsqStsA6A@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 26, 2024 at 1:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD=
2
> > connector) on the RZ/V2H GP-EVK platform.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > ---
> > note, for i2c nodes we are defaulting the clock-frequency and this
> > will be updated when slave nodes are enabled.
>
> This causes lots of "'clock-frequency' is a required property" warnings
> from "make dtbs".  Moreover, what if I run i2cdetect on any of these
> buses? Could it run the bus faster than the board wiring allows?
> Hence I think you should add "clock-frequency" properties to all
> enabled I2C bus nodes.
>
OK, I will set the clock-frequency property for all the enabled i2c
buses to 400K.

Cheers,
Prabhakar

