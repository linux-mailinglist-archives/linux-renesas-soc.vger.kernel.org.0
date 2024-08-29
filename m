Return-Path: <linux-renesas-soc+bounces-8490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6F964209
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DE351F24CEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FE2194C94;
	Thu, 29 Aug 2024 10:28:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2698194C96;
	Thu, 29 Aug 2024 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927316; cv=none; b=QH5ux2HRiCrATo4FvA5rFB396oZZvgdvlj2oKXaQM/PefpGoeJG1ar5c4Td3rmA8lb1tXcftCbYXxsC8o1lSyxBYBAULH4MQtD7WA6UKFGFqDCRUcdl9xd2+oyXwfblp300CTgGBFdTcEFKzYWjTq1RwgCRTyO41f47+GIMw7EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927316; c=relaxed/simple;
	bh=kGKixAvMqg/YT4b7ZF1i8fAhvuV8TjpkWW7Ve1FJ3AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2ca5HeSA1z9HkoEHr4QV5ot1SxQqODT7IUDuTee/rWmTloIXmcNccN0nMkOE9v67yVe7P54EnqXHk1p5+Vog01rx38K0q/TnpExYoqhLt8Hc6A7GHXRnA1vS9p+/FfoIjTc43USyZ6C9HueGMfMil7xlZT/IA+6YZ1zRJFu/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-699ac6dbf24so4883577b3.3;
        Thu, 29 Aug 2024 03:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927313; x=1725532113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iybCc4zZgKXtGotDUGTWZKPqJCIrcEfsWk8HvPOHsV8=;
        b=cFeZYpewMMah5Q5O1jbE7xwKQ1fok+SsL0uAl/PeAS74sUqXgn+U4rA8OxVtPZS4HM
         7WgK22mniLD5ue9mG+pT3Ks5P7fMye5b9MOfeSwx91/VFZr8zWcol4lzy9E+FrOO2kXS
         3STov080y6Cj5egmuwDflEFkG7Nk/+iLNHU7MXhpAaQec/UVVpayXJe/Xu5HQppkzY5I
         YYBrLqotI5ZM/9r0asnGVkP/m201sKFZv5LzuI80qctA+9myPBNmHsFojfZvjiAulSk+
         3O10s4rJ637Fvh7rdLS9Vrb29erJ8T2Zekt/7H14i45jP0EZ1Ya6iHEvFmiK6hMJppSf
         Fjow==
X-Forwarded-Encrypted: i=1; AJvYcCWrHsxwx3D/wWl2OW92baOCpMS2NsFupByRHfbrzZ3R6tQZVa+J9wbrt2Qyjaoct2LWUvDgZ4dN/II5@vger.kernel.org, AJvYcCX+BGUupGYcasgHwE0J4ad+M79y5co9DTWlApxB2eTE6W0GJ/S5yR3tTcVeqMN7AFZakHvG2nTQFsdEXkrl@vger.kernel.org, AJvYcCXnrX7TKUiYe6GyrXIC0+VQ2K/0RBPlwITBX+3/KAWlJvyau+/X2ljuv/wmB2cmbHiHGmY9tzc6RgdtrSmpS+pUbNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OCCM0lpdgd6Aht0ZxF1JW7MU0UQEcoWsHW8HmQNL7SkR9hi7
	+tF6K9soTnYuAS5Lf4uftwq2BD7LbvBinL8ZJSZj2OPCGYNci7TyGb1MEDZY
X-Google-Smtp-Source: AGHT+IERRV7m1qXO7+RHC/S9Jy4Zn5Ueskjz7DTXLzcuY/WsMMCUB8wBU/4+OAjO+Sj6DISMw7Co8Q==
X-Received: by 2002:a05:690c:ed5:b0:6be:28ab:d874 with SMTP id 00721157ae682-6d275d3e0e1mr22965607b3.2.1724927313048;
        Thu, 29 Aug 2024 03:28:33 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d58d3cd6sm1835027b3.102.2024.08.29.03.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:28:32 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-699ac6dbf24so4883477b3.3;
        Thu, 29 Aug 2024 03:28:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/GmSkINTcbwng65NCgtYc5Ef9VDouG6qzv5cny9u9hJEz44lTu2XDQ8ll7FP+U0aG0cRUUktWDNXDD4Ga@vger.kernel.org, AJvYcCVtgKHTgQ7pybV2U0yvgb6rbs63Ms/+20NanOrxvqDSKw4F9sGnI+6dpZR4txB6de4aATkvEgcmt2G5@vger.kernel.org, AJvYcCXyTwIbNnizl0ObxaK/nQwygnDxfR6EhMvNHUfPEmQyHt6/T87O6oLwZy3JutdVqOOENeSD9hRHgF+xzgGXMaa50Xs=@vger.kernel.org
X-Received: by 2002:a05:690c:6e10:b0:6b4:b45:2f1 with SMTP id
 00721157ae682-6d277a7a8b4mr29356747b3.34.1724927312524; Thu, 29 Aug 2024
 03:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:28:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJ3etwFe1jYd1LNnpVZjcb6qrYi1FKkTiF81Okfbekhg@mail.gmail.com>
Message-ID: <CAMuHMdUJ3etwFe1jYd1LNnpVZjcb6qrYi1FKkTiF81Okfbekhg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable watchdog
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
> Enable WDT1 watchdog on RZ/V2H EVK platform.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4
> - Included RB tag
> - Updated commit header

Thanks, will queue in renesas-devel for v6.12.

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

