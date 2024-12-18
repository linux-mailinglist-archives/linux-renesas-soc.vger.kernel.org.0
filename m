Return-Path: <linux-renesas-soc+bounces-11533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C19F6654
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFEC16F816
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 13:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAF31ACED2;
	Wed, 18 Dec 2024 13:00:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858811ACEC9;
	Wed, 18 Dec 2024 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526833; cv=none; b=NAmWpbHBnslXHMFYKZn4I34Sto2/N53tGbMrQmKUcn35bL5ZCELdbUfOkwiN3dLqT8dNUiO554F+WSJ0xDJEdmSr/ciH7hW1UEbobZIAi4lOAUL7fp4QNCBA/pMNfMrTwPB7rr82zBpLxGT9sRWMDdUutw3c0Vty9PtPPvrxhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526833; c=relaxed/simple;
	bh=XscMD0R8+no5CLR8+bdgBVFN+1AJEBBMqkYfvWppGyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRDouo5YYkjbNjIxG52uKKzihzN63cLg4Nx6eIBrPN6Z5WpbTi9jqT7w3KrNYvyA4hr/350tIV+rp4FOL/78U0uOuq7lYj5gfhB+yZ5K+KBJIIOyeF0decRW/iZBliExTX9MaAul/TJ2z956k+hHjvxgLGB7TquoMBNN2tYEKPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso1227721241.2;
        Wed, 18 Dec 2024 05:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526829; x=1735131629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMCiguYSzlD8GeIibwL4MJrSGzVeSKSCO4Lqnv+ofeI=;
        b=YVpCDu0c42a7FKlwgsuqGzo98HBtzXdQ6yzJwCfKSxQAyCQCLFgQCr7o4xvjl5QI2U
         BPBU1mVW92ObjZHwDIaTcSS4bNTChWpuNaT+3pGdCOdgyWXNuJNFxxCuiHIMgAZATv9l
         2GdULnLSJODj9j5aqkPGnqYwWwSB+LuQ0TnfV63E1c/kkSKy1VQV733s9L/SBtyFstqY
         sg6IrwDdIePJEE0FdPRbdjkLOky8SINsHphoD8+5EvbcxJxPU9Oq5nn+7o6y1d0nrATk
         DYdR2xIcc8Uz4mfnOOy2q9Uq6CjnfpCRO3wb6KqrEkHhTvgPbibuxUk1QbnPNNvUMPj6
         bK9A==
X-Forwarded-Encrypted: i=1; AJvYcCU3O5ssgN/aprvRR3lSYnIHWlqG9QuWkVuadvTIKIZEvpi6l/EmpoLcKY8STAGP4/a1fejhiV9HUns8@vger.kernel.org, AJvYcCVcehPbjPgYkL259N9IVoVAiWJKavVDtHzdD/ogo9xMzV7NNp2od/09mtZ+OEdK+JVN35HUSkSbAv1YudDb@vger.kernel.org, AJvYcCVgGGTKp8MBtsZ7f3IDdPa3f4BWrzJHv7KoDMkq+a/140xca2rugmZD9hmkWzGLepYIA0At6GA98xiq@vger.kernel.org, AJvYcCW2D3Lrb+u5qQrLVcazJkVf8ZpikdDkc9ZnvVNdxbIAcKwEP796jGodzPFkBDkAsYTX7n7anWR7MeThUJphrs6LuHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw/e8luu7BNLUd9fQwzONLZTWafnBZA1WF3nBru880UT9UETmv
	qRy56sNw8G65UqeJeg2N24Go2sjdlTmb3WVS3aiioE3HmsoIYOy3DeNK0HCY
X-Gm-Gg: ASbGncutUgvSbDhC2ai7IYt7IlIP6CEpjB4lNLdUB7IYlTeR7p3k7iw5YAb9vo3V145
	dilsnc2NJMHimtA2+JbdBpFog1vo6geLxas9IQVkYN5UbFb+mUbC6za3NSmFGXYhbWP+iQHMOFc
	rPX70NfEzmu7995WqDQNTSetNbj2OcTT6ndROMrfONB1x5D3hkSxYQralHSEuq3OMNuy/+y5Dte
	TZdEOs7Bahut7/RvHo9OxlPCQPVa9OOBFwrkRISUQFSdfgXB4MV54DyZeg/FFUAFo1P+y09kjSz
	A/gxYB1deWckRKXwjr4=
X-Google-Smtp-Source: AGHT+IEWMlTEmq0gRa78Fd550pZh1nr9+fLPyhHfjrLXC+OPkM85UqrenZy6iFOrt2OGXRwk2PU1Ew==
X-Received: by 2002:a05:6102:8090:b0:4af:df15:7d6d with SMTP id ada2fe7eead31-4b2ae8250a7mr2183488137.21.1734526828711;
        Wed, 18 Dec 2024 05:00:28 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b27039071esm1467238137.21.2024.12.18.05.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:00:28 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff78a39e1so1684812137.1;
        Wed, 18 Dec 2024 05:00:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1maJH5QNK8LXEpl8WktE+uV55y5TWehNNa4xxxvVvMQB58gbx+nLIL/ShsMNxTbR53Rho1GYwCrZR@vger.kernel.org, AJvYcCW8i1ElXcyhy0ey1KcUxh4Ek8mre6SG3zCCw5JmDPs2dHRlNW3O3Vh/OkwqB2LlDF/tqGKem0csIeBCgcNMYzXe1Fc=@vger.kernel.org, AJvYcCWP3WB4bgTcizIo8z67lvWLM9m9D43mu10hCgvQCrvlz6BwMYQvVUKuaRmHLdz95VhGJbWinyngLV593y5x@vger.kernel.org, AJvYcCWXDvj6r8X+q66t3r/qKxfMMO3/+CIa2uftN3nYtFZsFwdX7OmU0iqbf01wcL0Yzi/gXTJ8vbb4V90x@vger.kernel.org
X-Received: by 2002:a05:6102:c90:b0:4b2:73f7:5adf with SMTP id
 ada2fe7eead31-4b2ae7314a6mr2182447137.9.1734526827914; Wed, 18 Dec 2024
 05:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com> <20241218-rcar-v4h-vspx-v2-1-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-1-c673647d96e1@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:00:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN6qYvyM8JTAUm=UCR5SF5FQ4V93PESY9p9S+wxJZMTA@mail.gmail.com>
Message-ID: <CAMuHMdXN6qYvyM8JTAUm=UCR5SF5FQ4V93PESY9p9S+wxJZMTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:05=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

