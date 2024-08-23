Return-Path: <linux-renesas-soc+bounces-8125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3395C91C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AAD5283168
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D16414A0AD;
	Fri, 23 Aug 2024 09:20:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A713D2A4;
	Fri, 23 Aug 2024 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404854; cv=none; b=B0m7ffl8cYPIBpSyBHSScqTMlnNfkSprD+mJkRbFKnwq6WQ+vS5UbZ5ulsNS86FnX1HLa1GOdkLzZElzOm+07DFPoTcDtJPi+Gwn4EFc2MuzAoWqQyeQEThVLtmx3xuO7kfZa2CDIChP3JlUPJvt1VVXFp/tsb/ba/wUzYC4KC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404854; c=relaxed/simple;
	bh=xFtq7QeEwgD2qvok2vQnG2iAprUceZxWken4WChJ6Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLisMnxBoyEekaFm6iZdHfo++Y/9Vx7W94nPRpjqoyDCL0uISHVUkZAdyLgcNum1AS6pI/+Af/dSUgYIwe2uhjJb5oT9/KadPmr7V7/n9uKoyh9w50jVY5BgCOOis8M5Kt5cnY58c1O9fpof4MFgbJeqAbzP1t2x2z5a5yLxjHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-699ac6dbf24so17404377b3.3;
        Fri, 23 Aug 2024 02:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724404851; x=1725009651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2ScnV+wwS+7I+lqBK9JTv8VTMQNtsosc0DpVVDpiq4=;
        b=EYIGmitqOeuv3pmnxCGUd+gUXrxDEtHy2dgEJ1cL+PutRL+FwXS60qgwafERm2DPkx
         r8bjFnHUsXx3eMd+o+3PnV61/Y9B+jXjXbXb0gB/z75kuttbhOt9LxLAissmu3DSFOOk
         t8dale5YVczMTD341xKyQeKjLRCUkf+RJKbh82RuOBzDpRTGnyaJWWFeiVmPUyGEoSMa
         tPbiTV2c1NiC2mfUJzcfXRzczPOyK4loAy4fo1rst76R+34qlby+k5z1y6E8sVFmsozQ
         IJDojNLGxAddbXRkRkSDt1ttDnJrlnfnuYsKFFLVCZvMFuVtjpu11pzbRql0T2kzNwLR
         /Gpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Yde+Cd4zqbtNMevke4ldcEctoRxeHkRkGX3kYXMg/hp+vGZCG70aAsGq+7a5wWvW/GmJgAQUVKMLsKiAAUxQhlU=@vger.kernel.org, AJvYcCX6Y5xGvgYo3jgiZI8Ondwm91MjF1w/l4EFW7Za4eBAflIZsoP4CiJ/Om+msealwCeTmW96j9BNP7BD@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNQd/2nEGiosRU8MT6RJlpKsFZuLJuQUd3M5Dq2lqKcwDT0ey
	BchIfnVgaQgJvknAoZ8lPcc/tg+GYa137MTvgfWKGM+x3yC8sN4TLnhl9MPU
X-Google-Smtp-Source: AGHT+IHgwFvMeba61OBSXYVbJS/23a5xRWtjYFFHVM99YWM1etMPtCI4B6BR8vlqXIS6SSX5EluJ5Q==
X-Received: by 2002:a05:690c:2889:b0:6ad:feb0:e6c9 with SMTP id 00721157ae682-6c625f1e713mr14647467b3.23.1724404851218;
        Fri, 23 Aug 2024 02:20:51 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e50179bsm4861977b3.138.2024.08.23.02.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 02:20:50 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6c1ed19b25fso15686307b3.2;
        Fri, 23 Aug 2024 02:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKZOuzDLc0PmN1Hl4RJTHLotFtEPEWcE8qo0W9WHBTxz/a+yZeVzssAnTlrnoXrr8anRklhwSudrNbMG4hw6tq0DU=@vger.kernel.org, AJvYcCXePjik/0ufE4Ablmpseo5szZlXxMmzsuLxFTiMp+5/QuEixazZVCbm/2fXWqAMHwegroDDlnl3Q2/f@vger.kernel.org
X-Received: by 2002:a05:690c:2f05:b0:62c:dcb2:a75b with SMTP id
 00721157ae682-6c62943b023mr15447867b3.38.1724404849962; Fri, 23 Aug 2024
 02:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805131709.101679-1-biju.das.jz@bp.renesas.com> <20240805131709.101679-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240805131709.101679-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 11:20:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVRC51Kmcw53fvDshST2aV6DTAy+sWANGuoyjBx8-8_A@mail.gmail.com>
Message-ID: <CAMuHMdWVRC51Kmcw53fvDshST2aV6DTAy+sWANGuoyjBx8-8_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r9a07g043u: Add fcpvd node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:17=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Add fcpvd node to RZ/G2UL SoC DTSI.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Reordered the patch as vspd needs fcpvd handle, so added fcpvd node
>    first
>  * Added Rb tag from Laurent.

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

