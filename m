Return-Path: <linux-renesas-soc+bounces-8482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981319640F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CE3282089
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6536E18DF90;
	Thu, 29 Aug 2024 10:09:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226418E02F;
	Thu, 29 Aug 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926165; cv=none; b=ixxCrXr2enW8enGE9DZOorEHViVuL6uhn9ZbTkzWMQB9btcE0hzdqRL09sC41kPfOHCcltPdI8acweR9pFjihao3z78It+bVudnB81hzsx67hRtYt47mMZ2bED4GiIs/XfC/Ou18gWV6vGo0EyxLTLblLnq3ntqUBK5ySYWNHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926165; c=relaxed/simple;
	bh=Gp2Vvo9l1GHC7VeWXzadyM/sn/iZNA1B7SZjRUJXSjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcl1/SNre8Wr/Jp1C/3ko2jv6ijgwOgvtvpWm0qFgfZyqaI7gJx+AwHcw5CdNJV8AccBCRLBN6og2ys+lTB9BUiKIihPRFLDKvOLFhiH/+CxA5xJWnglO+XRLtS3aPATRkDzO8ObLekyWaz9sKxWOCzp5CUNBGFPBlY0dZBtMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b44dd520ceso4917917b3.0;
        Thu, 29 Aug 2024 03:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926162; x=1725530962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WYSubx7jiUJRK5iuUhENWbYRax9U+a5+NbPR9XvXyo=;
        b=D0QNEX3rFg0oS434ZkVpWQWjw+g9+alvzGex8FIauBLoxoB82Qk7F5atqwSRgicBg2
         5Mrgjmb4mpEDw1BmYRWPqzvqx9oHlSi7GaXneVESh7Fv/pDKmB770gmaIEPljrDFS3/V
         VDbpjrpcGFBgOJVNKGBfQk4d/hFV+tUfxvcLY/jjoCBFuwoIx2idnZ67tuXR2lyUZrSU
         hRW/vFneuL1hCwR2yGujmqEEHNRxaC6Mq5NfDC031d3FlfvYBW/EzpXwXJzbUj62jNzk
         oULQLho2Nsn3+pYf9uB6MTx7aLBHWdbuIpE5foIGfAaC0xe9XRUhblgPVVvFtIJbx86c
         zdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmjINTAE4XyMFvy1tRjR6ceQxCEEmKiviQRCzOxzLQ9iEx9dMJUxdy/Az2KLGol7PhkyDrATVx6otTlFXUMwPtGtI=@vger.kernel.org, AJvYcCV0Y0BQeRgYrwfmafPG2nzOVk6dQ9yTxph1QbDvNQc5S0i24jYiuMRhZaydhne7Jlhv3s1IDT5yKTPO@vger.kernel.org, AJvYcCX0DMl7x5/Q50OMJKHMSDK8HI5t8qrea9SN7QeuomNHQb0bOMfzrLmKE9hrM8ObmS5TEfHr1naWbx/bQiri@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjQv9TWK+K06iCV+lcgzf7xxK1gOXssx7plW+YVEFRIBV8PQb
	jcJDVS/N5Mv83qptOWE9izpr4KGxANZNCx0R9jgzJS11g7m4r21FVWHKBOlL
X-Google-Smtp-Source: AGHT+IGcpfEQY7kn62UFXxzuwEjh8gRBoirWBFXSHshAen++/4zbr02V4GsGCA1azdPeElhfb+Wb2w==
X-Received: by 2002:a05:690c:6606:b0:6b3:3520:a45 with SMTP id 00721157ae682-6d2766ef05cmr23331057b3.20.1724926162081;
        Thu, 29 Aug 2024 03:09:22 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5daf5casm1774657b3.108.2024.08.29.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:09:21 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b747f2e2b7so5015427b3.3;
        Thu, 29 Aug 2024 03:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC0eoO9nZP6ZshVWEw3KysQacH+Uj28aIJ8QjouLr9Q7wm3THtezgS4YbxqrZCS8CXkf9Pc8/hkv0Vsull@vger.kernel.org, AJvYcCVLtNPytQt6feUFNEvyTuP5v9ynAEYbl5zAedJi78PXA0mDxc8cCDadZbz6jPn1JiTsIsnpNLBfmOxPvD/u0//MHe4=@vger.kernel.org, AJvYcCW8RVzC/VIBys16NDFg/bPo+5buP7sQU8+8TfWYv+tvihry7n8S6EnheOnY2JoVEhivVtn4eu7pMoDi@vger.kernel.org
X-Received: by 2002:a05:690c:d90:b0:643:aef1:fb9d with SMTP id
 00721157ae682-6d275965a4dmr26027877b3.4.1724926161547; Thu, 29 Aug 2024
 03:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:09:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpjarw4SR2SwNH08EPjFosE5Z5aE-t_=QzKEbBLShB-g@mail.gmail.com>
Message-ID: <CAMuHMdVpjarw4SR2SwNH08EPjFosE5Z5aE-t_=QzKEbBLShB-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: renesas: Document RZ/V2H EVK board
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add "renesas,rzv2h-evk" which targets the Renesas RZ/V2H ("R9A09G057")
> EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Hi Rob, I have restored your Ack with the below change, I hope that's OK.
>
> Cheers, Prabhakar
>
> v1->v4
> - Updated 'renesas,gp-evk # GP-EVK' -> 'renesas,rzv2h-evk # RZ/V2H EVK'
> - Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

