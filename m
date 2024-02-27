Return-Path: <linux-renesas-soc+bounces-3268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433B869756
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 15:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0960DB2A711
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 14:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFBB78B61;
	Tue, 27 Feb 2024 14:18:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547213B798
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709043534; cv=none; b=M5rUZOVXv2SLfPS8Pzs60mqOtjpbUIia2zPda1nEnz1succO2E2GSrpcoTZI0yPCNuPdYABg6rOW+IrpXlrYVh8sDAeDFJigyZ1x4oRnHqhgAjFD0xE9o+v/j0L5BI8X+VVt7nyRUTSElCheELLwv/eAjBxubI5d9Nk5UMkUTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709043534; c=relaxed/simple;
	bh=aA3XTVFSGvUaQjwvBIYMrfm0hP4sdZQEaT9owOdAx1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REPMxcu0INGn7Ad+oDZwocrHB4dK9RyUa19kzoQgfSuAH52X7ma7yooAtQkGNMtuaC8JuA5iguDsrhQHdWgkKGcy7zfUUZiAzggWO0KKiMTFbqqJIT1AaUMEgblEUGb9krZp00Zak9pTdYkKnBJRNAUhE+mrF1tlMPhekqbftOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6092387bdd0so9267957b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 06:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043530; x=1709648330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwn/nQ2MEfVa6AgknD/cKeP82yicaB9ZdfUhpESvE/I=;
        b=VmbqaQhqgCGMx06e9wuPYwCCMcc5NV7YlafTcyi7Z6KJLT9AO2yGprGsW5/h5AyxpN
         8MOAur4NtE/Y1uR45JCtNFK3AminSPxEnX6cA56VxjXDY8nshjockErv+16k/z6EIVk5
         KNUT2UyS56qtIhRIiaFilsTOSxQsouqzjnH5xLVc9Et3Re7cmYRFSG9dJSYyRbLv1PrY
         9yTPCbBz+or2daqfkOD5enGkv9CSfKYW7cQ4UovNUayeqzTpBPhRavgE/nlS1oyFIZAO
         UVJ9jbpwgZr8cUGgurUszvTG3ym8s0F7rgB6iOH4NIOlxT2Ir6JG4LwZi9tgoH6wampC
         B3MA==
X-Forwarded-Encrypted: i=1; AJvYcCVKrTQlSO4gcsnruHV/MIXyaVcOUq8yAXqJX2SPpMvou0rVe8Dz1Jspvcj7V5fp1h65Rbl88YQlyzsIXspfa4j7cGa5YkQxEI3om4lgi0qKl5w=
X-Gm-Message-State: AOJu0YzpnzY1nIL2viZGi3NX96+3tkd9I2HX0RpUJpEK/LQPo2tm1wqs
	UR9xlRAQl2t/dBPNhDyOsTGci4/0GtKdzoITXKzenQKT7T7XCfT+ilVRTo+Hrhc=
X-Google-Smtp-Source: AGHT+IHu3lkYSoT1TSYmfOOaVawcJZXZTl+QPf5ZKsvnH+22vsej2ljAHLBea0oE+Bs8uDjGLLMA7g==
X-Received: by 2002:a81:7285:0:b0:607:6ad3:8746 with SMTP id n127-20020a817285000000b006076ad38746mr2320697ywc.46.1709043530473;
        Tue, 27 Feb 2024 06:18:50 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id g190-20020a0df6c7000000b006077f869225sm1794032ywf.73.2024.02.27.06.18.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 06:18:49 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6092387bdd0so9267427b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 06:18:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxVOGcQdmqt6YiAQ7dGc3Q/dO4zJeiw2w5m9fozJHmNnSfG9YjHqr7LGPkh71E7x+d681qqvhST+gm+fQJHP5qqklvTmD5poHzcm/UfwqeP6A=
X-Received: by 2002:a25:c50f:0:b0:dcc:9f62:7520 with SMTP id
 v15-20020a25c50f000000b00dcc9f627520mr2135310ybe.59.1709043529638; Tue, 27
 Feb 2024 06:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227130010.45361-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240227130010.45361-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 15:18:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkjpafZKMfsqr92=gSoAnRPtDx5Hq87J3k0bwN71stKQ@mail.gmail.com>
Message-ID: <CAMuHMdXkjpafZKMfsqr92=gSoAnRPtDx5Hq87J3k0bwN71stKQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable Renesas DA9062 PMIC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 2:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the config for the Renesas DA9062 PMIC and built-in RTC,
> GPIO and ONKEY drivers as it is populated on RZ/G2UL SMARC EVK
> development board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped RZ/Five from commit description.
>  * Made CONFIG option MFD_DA9062 as modular.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.10.

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

