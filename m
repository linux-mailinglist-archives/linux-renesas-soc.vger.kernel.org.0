Return-Path: <linux-renesas-soc+bounces-516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A710800BBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24EC02819E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1222421A19;
	Fri,  1 Dec 2023 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdzAAwsA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E0210E2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 05:22:34 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d34f8f211fso19472517b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436953; x=1702041753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7vbHf3J8sbJ3NXvRWx5w7Zh/yrl1LIRE3Tm8q3YHeI=;
        b=hdzAAwsAJ9UOMkIrvpIIrGV4x7KG4LeySVKktoLw85F1pkvD/15T2XDVX9HFnq6Pfl
         TiGHk0UfHUKtDmTxVxgHvlw2n0g1z1gHafGcs9cgq3XjJ1yD/RYwJ/bSd8BNjg7iRqP3
         IcTK5c9LiwNuoHdGDCWuu9PC4PdFHDm+EqSIQkS2qqQ8g/qSbM42vLZ0mEW4ncCkxIJi
         N8eiqMYwoLk8ZobWYRAf9BqFSswm5BMXOAz605buDQrrGTY67ST3xSfBd21Fm68FXAJg
         eTXtMlLMIZgNlDCTavia0vfFuBOjGtxz7FtsHlAN0ePdDdw1/XyPB1SxmSRwy3FkXmmS
         cY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436953; x=1702041753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7vbHf3J8sbJ3NXvRWx5w7Zh/yrl1LIRE3Tm8q3YHeI=;
        b=oYvkd033OZJtzWmkhXzk8pTsr16isLzzQjTOjFNauCaVeKtgzDQcmwZxrAgv9aYnNn
         BXoe3P+WjQiRshBAdM/9hcbcnsvlr0OtnCmMIahk5+e5EPnJfcgni9TSIMIBlSiIQU/H
         VuvqSeT+76iiXp4ndFHz4nhulYjr9Nh/TVDYetiI1zlftj/A8339Bp++1QiVWfNkKamm
         qkfGh5b0HlGVGvu9YekkWa2+khyKRhSvTcxShFnUso968MMsKK0moU7IdPM9pC+V5iYq
         eIQHdnz52E5BEOTUmYrj//CTnIdfj1U5114qDIQOcof3GSTMjH9J1nEYQav4nGSbitHT
         emyg==
X-Gm-Message-State: AOJu0YyT6H+6q1As8VJFJjp2h3ie2gaZzAX5nTj7NLzLG5eiH1uHmLJL
	v2TT0ZbszX+jNJhqCQt4P1+MmoAx6+qqeUWET6eJDg==
X-Google-Smtp-Source: AGHT+IEfp8HOE1dfuYBXgtJ1ILn/FD4wsDwjp7SWmZjETNIt1tnCNanGAmThGjLaWsfCvU4zFVII9cQ47/r59+ugEHI=
X-Received: by 2002:a0d:e254:0:b0:5d3:ad38:bd6d with SMTP id
 l81-20020a0de254000000b005d3ad38bd6dmr4499520ywe.2.1701436953510; Fri, 01 Dec
 2023 05:22:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1701434258.git.geert+renesas@glider.be>
In-Reply-To: <cover.1701434258.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Dec 2023 14:22:22 +0100
Message-ID: <CACRpkdY7FkFPC5q_AsGmsGprf8_ATOS4-oEo5zE=rU0+85EO3w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.8
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 1:41=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.8-tag1
>
> for you to fetch changes up to dc99d4c8ac46bf533b9519a53795c4cd6ff0fa39:
>
>   dt-bindings: pinctrl: renesas: Drop unneeded quotes (2023-11-27 11:12:1=
2 +0100)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij

