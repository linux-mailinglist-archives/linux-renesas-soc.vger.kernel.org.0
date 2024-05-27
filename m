Return-Path: <linux-renesas-soc+bounces-5486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB58CFD29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2551C2182A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5727313B2A2;
	Mon, 27 May 2024 09:38:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B9113AD19;
	Mon, 27 May 2024 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802688; cv=none; b=sA5M+CmBrXzVQi2+AO0VPlXTeRi87VihfYw2atw+dwgT9j8ulpLbGCRkZcH55xDQQP2txyaj2ZSMyLhZmoz/4JvKrGTE8RZBlKWkCIspIUB5qx69fJykcTVFasUhxWRnOOU7Zc4POX8J+aXNlQfNkBT7d0Wqw8V/GpmG/CsFKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802688; c=relaxed/simple;
	bh=AaUkQ8pDeuAEp8+3Xu/tyLCVDBbvBx5r5jAdpJvPdCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozvNFez76M+gv9O3rJgQIVY0+XAZu0d8DREeYWA8PF89vaQBvN8Y+jqEGneYw1USMuTLejfO2+sdWGxYxpilsHwbTR6/EDtLpodirNOxorHHNtHeQqcjDR92XFXeoHKCBabvGwtOU6VSjU8XbF0iqrAEpR8Lq9o+RXixRy4nkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a2a6a5ccfso12171347b3.3;
        Mon, 27 May 2024 02:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802684; x=1717407484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnyhroto3kN7360rxTyyJBrUP3/gZ81k6C7b/zWIvq0=;
        b=TMvdLK9MfmLTmSmQafx5r9hRtlkmaGZevnx7k44v22vk48XLyz3vJ2Z32YAJFtrZ65
         UuyQj4eSzH2BovzI7KpYOYwYvct+S05Hinl9HsfZjYW2SRObp5iyrk1JFDN9D74GvKtB
         sB5GDlyPB2fLEU4hmlh169G25tBZ/Q8k4PDaH316rFR4jfg68RZ8a4ILWteewYVPSCX6
         efFzJVMTle29ikhpVRw33EPirOl4V2ft3O9mdK+JMhtpvHyKs8k74Wkhw3j3Oj0p/Zwg
         IEw4ZY3SC3quugiNPmN20dlx/GnA+bQFKtipVcHA3q3IN+q5uBg3BXOM1Xbhj6cqsM87
         2mOg==
X-Forwarded-Encrypted: i=1; AJvYcCUNuxWx+D0ATYuXUp0fQspDEB/UNPq1RBQg6X95fRsxVMdGcz+iQGa764JLorErstGp+cNvDZBz8kMBx8B3+TQyV3Sd+AeVGhLXceio73OgooSn6N0HFzkCo/scHsClxbWg6PFDNVcGEA==
X-Gm-Message-State: AOJu0Yzz1wXrf0HMVjcoFwVfDegAA2G8lEEocY5Sl4f7T5ovqwSmElSr
	H8n6EuqWmVu42dpQV20RjwyfCot4fKs4Az641WjS5SOGDXObCQcTp79kRv26
X-Google-Smtp-Source: AGHT+IFmhWTcSmaphRjDAOPV1CuhBuyQB/5Do+hiFLiK0Ml6ywI+vQboalqiUFUaVHOI3FXVzH6idQ==
X-Received: by 2002:a0d:db95:0:b0:627:9804:3c44 with SMTP id 00721157ae682-62a08f0ab73mr90127587b3.37.1716802684534;
        Mon, 27 May 2024 02:38:04 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4f87e0sm15804387b3.92.2024.05.27.02.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:38:04 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df771983aedso2831557276.1;
        Mon, 27 May 2024 02:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+UwvBkmeg3e/RSKcBeRz0k8mDfBgvkjkoh6j5YIMNsNzgZn/ZsRpXGma9Sl965iojQ1iKe6u5duKxgC9pkWDkz8nMNuqZIRxq2U2qGDz03J1F/fc7DrYxIl1j4oEdU6Ko14dJ+fSEWg==
X-Received: by 2002:a25:a426:0:b0:df4:476e:7577 with SMTP id
 3f1490d57ef6-df7b2fafcc3mr1290371276.60.1716802683654; Mon, 27 May 2024
 02:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523205041.7356-1-wsa+renesas@sang-engineering.com> <20240523205041.7356-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240523205041.7356-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi20TXOb2pUE9MWCk68Ua25-pwm6KMJ7HosjVhKkjr-g@mail.gmail.com>
Message-ID: <CAMuHMdWi20TXOb2pUE9MWCk68Ua25-pwm6KMJ7HosjVhKkjr-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: white-hawk-cpu: add aliases for
 I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:50=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> They are numbered like this in the schematics, so keep the names in
> Linux the same.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11, with s/busses/buses/.

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

