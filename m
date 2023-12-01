Return-Path: <linux-renesas-soc+bounces-521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BAF800C61
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 922471C20B6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBAE38FBF;
	Fri,  1 Dec 2023 13:41:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A53D10FF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 05:41:37 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db539ab8e02so528628276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 05:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438096; x=1702042896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OwpIL5+sJiXGO5nfScYyjfsO67stfy56QYOXQq/vD0=;
        b=RnkPcCVcESydSH4z0DGV6w+ii+KjdUagZH5H5gXnAbJkauXDy4uQMP0hzMWy7I2egn
         tVODHKj/dMl3NUI8D5rY+viMyFWRZC2UbP+0W/KXRMnjVUK6yNviHsaNPAYEZmkweSq9
         y/qllg+bpch0527cAMCr0gzwEVPowGeiZxHluriG4UoVkujRKqXAgaLx/XyVFS5VFdVy
         qWSJs61nRpW8gHmre5cBodmwQ3+T5dRBb0q3ghEvvgV5ndIn+fWuWp4/EhCHi1REykN7
         SCau71IxtnaR6a5/yOj4oHc10AvZq50LIguzhF4pAGruzS8kfA1Zc7b7qkpQE0X5Vk9V
         pDWA==
X-Gm-Message-State: AOJu0YxrlMhw2WMdGpRqsr+x4RY5QI2b3QNob38PBP64IEduiRLGhAeQ
	lZKWapZ8rPg2A98bxCOPGj0RH3tgPIdEng==
X-Google-Smtp-Source: AGHT+IHTdbJQeP7RqMSAl/rYoCPEAuS26J2iorudCyZ58/DW/l//adShGlyyfFBGHJbwYlZVUN42rA==
X-Received: by 2002:a25:bc1:0:b0:db7:b6fb:7446 with SMTP id 184-20020a250bc1000000b00db7b6fb7446mr760991ybl.9.1701438096362;
        Fri, 01 Dec 2023 05:41:36 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id r11-20020a25844b000000b00d9a43500f1dsm361533ybm.28.2023.12.01.05.41.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:41:35 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cfc3a48ab2so23185717b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 05:41:35 -0800 (PST)
X-Received: by 2002:a0d:d40f:0:b0:5ca:71fe:4d03 with SMTP id
 w15-20020a0dd40f000000b005ca71fe4d03mr25825054ywd.3.1701438095635; Fri, 01
 Dec 2023 05:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:41:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
Message-ID: <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Udit Kumar <u-kumar1@ti.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the config for the Renesas DA9062 PMIC and RTC, as it is
> populated on RZ/G2UL SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

LGTM, but I would have expected (at least)

    CONFIG_INPUT_DA9063_ONKEY=3Dm

too, cfr. my comments on patch 5/6.

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

