Return-Path: <linux-renesas-soc+bounces-21779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861EB536DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8F23A458C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC7A2367A0;
	Thu, 11 Sep 2025 15:04:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C12D130A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603059; cv=none; b=QZP9cMFe2si7R3tmAf08HE5gTigs6wRHBhkbZNaaJDg6MYbuQTqW6157su0Vb7G6sWBbIPV4YDnIq9KbLrs/rEqBCtd80pQcGZDAAwututE6RpeS4ZSHGuYKyYJFNmfWMBGnJOyhsr+voqHgMcUl9zIU0K8KeRo1b29DVT+92bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603059; c=relaxed/simple;
	bh=oWtxSBVhDimdr6SjfynlXvRAiMg/Q+KHFuZIgiM0LVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCpF7mRvAjbnjg+kQe4PtoKpevx1l9R0y21nEJ37N9C01IVKsPPxxIR00UuWzdWlbJNF0ygejnH9+wU0V0aD9bUvwx8gZqT0HEZAuYov+iopamF+sUpzNQtpHWB1xPED4oa6b1Nfzan20GpHtCspn/ZJTjA/AdxNkqjQUbQr3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-807e414be94so84795985a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603056; x=1758207856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhSpd5S4ftC19lFF4e4ovsw+6zbB9iulG9RQAY9XGQ0=;
        b=ko2z6lYntV7nccabLMtg7oTON0ajx3P8/nWNyPMsRz2qOeDEdlUPYDDdys02AQCzHX
         E3j40Aofy8DsrN3Mu3z4PF4JzMU04eXj/+j9+rL5Ce+hBJWRHgPj5mAdmdAMgyO/i7pH
         kX6wTpDSGbXwjUZmoBQOaTofLHH/5CFrNjP0zI56gWYhXqnbgb0wyjo/LyWuv2vZcvs0
         mA9w0Ak4pc5Y+jtzN0WzaoUT0VzXSzEr9vPDm4hUYCkpwTLpOk9z6mGD68ZvEmixs1cz
         cDI5S3hqlTFOBaJuIVPQMFNdR4OnC4/ItLimt3BMR25fr2JapvTKf+SM5lxZRuVqQPBt
         ADJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBI9duKBNU0+x23V7lmWu+9XtmBSm3S4L1ThhWcWZdsGQm36yNtImSEiVZR4GQtem1ALRoLeDIhgi9KCjLWsg5Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkeuF1vvvdoKqwBHy3ajp5+6CJXVhXLSWwlL+hlJgvkooiagNS
	YbeGnCPK6nNxIZ7yIH+JhxuU8ZDQ9GT83iU9HTteIlaKnaE5K0Nm3MXICxC3f520
X-Gm-Gg: ASbGncv22b5blNmA6ItAfqbLI7MU87Uk5Rsb9D3ekNPB1EFZD1Mr95KsOdwJbzrwU/X
	oN+6E6MMQH6Q3qUHxbNKeCD4IS0rCWhQHyhE86i/8up11+8dQeIPBkQXq59ssZJIzfwl/BPiFkJ
	BoE3mupzjPrIEFqGYfAKt/8CvQO2WKCwRNByCcEnUDbtg6QaG0p7NVP5XSmxxiLLUmqnalIJth5
	xH9AKfKf7nJzBRJ26ifh0hiT+kqRzIpNEUhMVg8vb9YxzzBFlSQX/4JAqMDuuVtr3fOqtr0X5Yq
	44VOX7qFryL0JTm0YGn/u6Y5Ag3uLFRvy7b+7bqA2W7dTmRC+cZdnN655pmdolgeejGFat8XwhU
	6fmv0Vg0psPEHtmQfgK/qai8WJcHLXpYxajQlKWwPfbgkGRv4Qrw0LEgCnngk
X-Google-Smtp-Source: AGHT+IFFjQx6daxjGvFc8fmyJyLIjDwymrbMVPp82eBrIvkPbstnbQQugcZ+ywF03FuX0Av/bp5Y3Q==
X-Received: by 2002:ac8:5d91:0:b0:4b3:49a4:2a1e with SMTP id d75a77b69052e-4b5f8386368mr241280791cf.5.1757603055675;
        Thu, 11 Sep 2025 08:04:15 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dc918bsm11199791cf.36.2025.09.11.08.04.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:04:15 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70ba7aa131fso7108916d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:04:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqj44BJR8VnsdEjm3V985Bqo/6ogOn5YpRuCpk76bawSeCW32q5Sz0QPLi9AFGgFFsun0j5+uq8HzitGE5JB9bKQ==@vger.kernel.org
X-Received: by 2002:a05:6214:cc4:b0:71e:a083:f188 with SMTP id
 6a1803df08f44-7391f304070mr229589496d6.21.1757603053669; Thu, 11 Sep 2025
 08:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905084050.310651-1-niklas.soderlund+renesas@ragnatech.se> <20250905084050.310651-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250905084050.310651-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:04:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP0x1QOsF_CL_pk7A1RL-D3QJRuiZ86JQ9ToBbyE-nxw@mail.gmail.com>
X-Gm-Features: AS18NWD6acvKzOUuqSg1o2nuZAq-uubKmAvzpXi8O8YvebaNo6zjuBwRr5FZcrc
Message-ID: <CAMuHMdUP0x1QOsF_CL_pk7A1RL-D3QJRuiZ86JQ9ToBbyE-nxw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Sept 2025 at 10:45, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX219 camera sensor to the J2 connector.
> The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI41 Rx to be enabled to process images from the
> sensor.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

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

