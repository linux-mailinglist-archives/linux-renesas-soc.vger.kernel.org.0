Return-Path: <linux-renesas-soc+bounces-11250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09E9EE178
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 09:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35647188761C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 08:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D4420B80A;
	Thu, 12 Dec 2024 08:39:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A95259496;
	Thu, 12 Dec 2024 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733992799; cv=none; b=tI0jH5PVQaomxQunGjf5eTG8zwP1KOV7jYiDngziAjphW6D0GJvZh6kwqNl9smOq5fKnSgbEJCgwn1GkU4sl5cxS7oCfdauw3H3417wOKnOARPPzEOKdv+9jhH18JLiTWTUt3ZF3mSRp+4Wk67RbNWYJZj/lSNc+C9SQCVMLznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733992799; c=relaxed/simple;
	bh=h5oj/YCgadl4DNWPD+FEaJ5jCAxC5cbl4IGm01tjhn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7qc7S7gdrvPgjUKBf6U3Cq35fzG2Kcraix2RJ3pfTmVDip5ojL0jKYmCAFKt37bCwTKqCUDVip5rkK/fyQMxGZ7j/FVG6peXuXP4nD4ATpBKVf4WtGuJTf4FhVaUd6AX0w967iGptInb8PJYE7HkD1kXOr3hm0sl7tr/vTktUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so195733137.1;
        Thu, 12 Dec 2024 00:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733992795; x=1734597595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kswEXNgu6h6p41UQ2kpE02FUHTphvDII2iRCuGcExDo=;
        b=TDmtPIrr8pSBnCElPIAduXE4yiO8FGEAnHXCVk4GyhoVYPKm7DIjCrq4OsmJw0ip1C
         SZXmQoLs/fi7n6u2b90IET2SQUoC03x03BaJYQ8rSnPfI7Wetgi/ZGW29MNq+o3k31n3
         +Y8p72RnnZ7LWX5loJqIrLqgzbqadq8Foc446DPcWOzmAgclc2MpISGXEMO5QyaGNqRA
         QFVLCM3MNVeENR2DLMDtaO/yDA4rjUTMmQ69Y0+2Y0y8913+t6J8HN8GhcLRw5YzCIsZ
         UIBwBvr3oYwhZZMqt2MQymmg35MEQoiboJfbuC/bbOkvEq2MeYLYICCaF54fnDu0wF18
         YOHg==
X-Forwarded-Encrypted: i=1; AJvYcCVMuQvf8PQwcAYSITb1bxnYwkXnB6E3wDXhrRuBgYrOaZSNk4jq3moZl1mrbxQf+zW8K4MfUDO+ILRgUPr0NwQsHFY=@vger.kernel.org, AJvYcCX8tW39YonRjAy1nC7LuDndfI4E9+v/KCm/m6ZGZ+LBMoq3H5V7wstsVh/sOmJEvhMujfmlelGkOqTR@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqIBWcG4jV+Dn6VAcDJhshJ4kYJ1xMmAuqB1eGbGbZnCJjBPa
	pAZBKAnKSiuMx81EwNmSB3ADESIMrg5Y9pe04W6w71IbRa0CHdKWXU+PEnIBzb8=
X-Gm-Gg: ASbGnctqRablWfgL9l3vSBVV94a8GZZk3lU0Df/OwroNPJB2oZMtYDRu/aZ2c6oL8lu
	wyppzYxN560Ioy3H88ne61XMbFX2lOyIu0xbKMsQ0VUx0ArnNbu9NOjqBf5uaVqQwJN6fSr/8MX
	99kim74gSHm6XAKD/AVv76k/eVktql0tA4ZGx8J9BC5KDD+cnRgfNtiH43psNayIpMH1KbQvKzJ
	YQZOGwr/sYmQefTo+hzvNe3m/ikFZIlufg+tMc3PX3h8dVs995J4D7jpEdfu1mGaiJCvqxVHVKw
	n1emhOaui9MEibzl+Ik=
X-Google-Smtp-Source: AGHT+IEf9N5xWqNi6Dm7ACbkRg9H7cLhPAW9YEUKW9A6W+2NmzbU49/qUDTXJYwnyCQQhtkuVSZKUA==
X-Received: by 2002:a05:6102:4694:b0:4af:fa96:1ff with SMTP id ada2fe7eead31-4b248001697mr1974172137.6.1733992795044;
        Thu, 12 Dec 2024 00:39:55 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afee7ebc1asm1211280137.26.2024.12.12.00.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 00:39:54 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4aff1c57377so213014137.0;
        Thu, 12 Dec 2024 00:39:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvQCaj8J5lQ3TLfvaCjPvL3weGZbEieYGBaNyEHx6u0jUN3IilSdLdpmqWbtIYkeCiw1++MrNJ1M21Er6naK9PveY=@vger.kernel.org, AJvYcCWvpSdgvCDOVPdxvuKX/VGa6HTovhBsR27GpphyvMiM6HIVmmGCEejMr5aut0dxRhddDBGVdssR7aZP@vger.kernel.org
X-Received: by 2002:a67:fa47:0:b0:4af:57df:8697 with SMTP id
 ada2fe7eead31-4b24821132bmr2299129137.10.1733992794465; Thu, 12 Dec 2024
 00:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023154643.4025941-1-niklas.soderlund+renesas@ragnatech.se> <20241023154643.4025941-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241023154643.4025941-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 09:39:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVvF8Qv75mrcOg_O07NDp1SrH1p9AZ3BwAY4b+QG5YmQA@mail.gmail.com>
Message-ID: <CAMuHMdVvF8Qv75mrcOg_O07NDp1SrH1p9AZ3BwAY4b+QG5YmQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779a0: Remove address- and
 size-cells from AVB[1-5]
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:47=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When describing the PHYs on the Falcon Ethernet breakout board mdio
> nodes will be needed to describe the connections, and each mdio node
> will need to contain these two properties instead. This will make the
> address-cells and size-cells described in the base SoC include file
> redundant and they will produce warnings, remove them.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

