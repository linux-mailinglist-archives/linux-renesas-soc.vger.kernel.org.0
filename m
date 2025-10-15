Return-Path: <linux-renesas-soc+bounces-23048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C626ABDD979
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 11:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B063F4FCC2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED213128C0;
	Wed, 15 Oct 2025 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4x1AhMp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311E30BB9A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760518946; cv=none; b=Ag3mY/HN43U0DKoGuZHya8urUwqm4BjoQc/RxPNS4EK0hBgmNBtoEED3r8FRKDVVZ90glXdKHNMsQFKGQ0+8+h+t+X3FONbYEHcpv/b+xTj+3+TTxlyev8L2gKrSpK3zevccwN9/SMdweuGllLaLKkqrjuJ7vuwNAWTc5pPWum8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760518946; c=relaxed/simple;
	bh=RDZfPG6F9pZtmU8Gkv33LWcmNPlLhbwFu6m2B9/1zPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBTeMJnAbwBi024ZnjXQq1BcSlzI1gehynVou7OPrsL9UfRWMOCZBKbYYiMpcTPm9Ah5n3/W9vMYJI3MlFyWk/4SOcTfSCGrkUEO6w8pIgwqdnD7dJkL+bI5PiBniutWbJf9bvZoF3YRnOeTj1zemV/P24A4zGSenoLkQL4IEMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4x1AhMp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so1938865e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760518942; x=1761123742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV3KRblijrAdpwToi+Mhyrh4bXSjZg3WfC9q1tzKT4E=;
        b=m4x1AhMpzxLo4XqhN33wYmSjmpWeUVZKHq+uHpkOKkh6a66fY1eRip4bciSeUfd3uK
         jzT2cyeYO3O22V6xWYiGnYSqbYkqk/2+gY63QePf7MxxsqzBZtW5H02P5yYOPwXWm7Wb
         Km0pndtn+3nN4qG6SeHrjklg0VI+B8YXiTaWl6r5a6s+TMOiEOsqaq/r/Ub/7dqEwOIS
         jvUmM9bor1t+bG0xkVY97kwMokT/tKlBpCEqVL85t9YAovyIfHrKqg5UhIh1bn3GDWkb
         QvPeNnaasmN8xvf3FTIS3NQmsx4QGWT1+0LgJkxoYY4oA3/YvETdBmkw43qlANM0AdC+
         Vosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760518942; x=1761123742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV3KRblijrAdpwToi+Mhyrh4bXSjZg3WfC9q1tzKT4E=;
        b=tuVINq84FlcGqD/QeMc2qYu4rLe+kR2U3G85ROSkuBOinMHxsI0PlnEt0/xmqaSt/K
         mvimSwEOPXgZdPqevb139uLZR06jmb+ON0gIo1CKXUHgRlA58FDioKBqRmMrvkI8u4WY
         PPALsrLY/Ia8mp+xmb28z50CSR8BiGxaCBIvRVUesixoHwtMxv0PFZJfG75RbiDeUraY
         fn8lGptdBmTWgK+sO9TIUTTQbnT3UCc8IBCnC5464xTWTJHkj69g19GHEzLCrQQiSffV
         CtWdUbHDNA++SV5C7QxUMQ5gfID0Tr/vQTQ/6EY/Y65Xx8znkoOFYSwb+0N1V/WETORJ
         bSBw==
X-Forwarded-Encrypted: i=1; AJvYcCXn58wk7hIU9x77NGtCB6Df2rzkb/TQghi3O6nxiEwYTgyNRyioTiTzRRbnVuTkFiE/P1aG+7+sLIHzl/L336GOIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+lEomMbmbzid5ZNOPwopbGeuTjQvAjNlMFNaEkrmAMgiG5/8
	4nJKqYeBxSvmmEwXSrVHRI1FWcSRy/ME4grB37qHpHdbzznf8NsjnrcymWe0TAdSfo8JHxE7SjJ
	vWIzi2GFoiNnFYITZkeYUc7XU4WIBwvU=
X-Gm-Gg: ASbGncvcGLtxZM3hQL/uixyW669O7P2KPjc88OCGWelvJrghwYTA76u/AGeyBQ30qOU
	jBO96dZTX+ZFd18RPsKeeereO6v+6DMNmRRF6vfzQYqWy4+WfDSQs8+IiSw6SKInahunQH4+beO
	BTXmXpEe4aIoJq1IByYNuh+rGa4R4BmHmH/eqRomaWaZdtT4PGv5Ic4Q4f5sfpeFWm0gNae5ke8
	9cNUpUt4DmgVUSuhhO+/ZXwRHByOR5/hEob4+owGYCPJeXysBSbbvV4SqtQ1siT93v3kUpphBy2
	BhbaCA==
X-Google-Smtp-Source: AGHT+IEUi6z4S0evmQA4TnJ5mnhm76pyPFHvsITlzTuxuE6K5zX96wi7FQaogf9E9nYcIF1iq0Qp0I3dtBxgjiZTR7Q=
X-Received: by 2002:a05:600c:1d9e:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-46fa9ebe0dfmr172293935e9.10.1760518941308; Wed, 15 Oct 2025
 02:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014182035.239956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e97327ff-9dca-4764-9973-8223d6b50fa9@kernel.org> <b8137f4e-97d9-4e10-a80b-51ebacf3b3ac@kernel.org>
In-Reply-To: <b8137f4e-97d9-4e10-a80b-51ebacf3b3ac@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 15 Oct 2025 10:01:54 +0100
X-Gm-Features: AS18NWAHDgRSntGqFSxqj0ORtuvvZPtf7_9IZdbAJmgCfonQpX7DDGGK4szxB_A
Message-ID: <CA+V-a8t5x78diD4MQC2P5vhAvKNOi0Y55nQZz3kEHy6rhSGGUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nishanth Menon <nm@ti.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 15/10/2025 00:00, Krzysztof Kozlowski wrote:
> > On 14/10/2025 20:20, Prabhakar wrote:
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> CONFIG_OMAP_USB2 is already enabled as a module in the default defconf=
ig
> >> since commit 8a703a728a745 ("arm64: defconfig: Enable USB2 PHY Driver"=
).
> >> Remove the duplicate entry to fix the following warning:
> >>
> >>     arch/arm64/configs/defconfig:1705:warning: override: reassigning t=
o symbol OMAP_USB2
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> ---
> >>  arch/arm64/configs/defconfig | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconf=
ig
> >> index e401915e2f2f..478ca72c0aeb 100644
> >> --- a/arch/arm64/configs/defconfig
> >> +++ b/arch/arm64/configs/defconfig
> >> @@ -1702,7 +1702,6 @@ CONFIG_PHY_UNIPHIER_USB3=3Dy
> >>  CONFIG_PHY_TEGRA_XUSB=3Dy
> >>  CONFIG_PHY_AM654_SERDES=3Dm
> >>  CONFIG_PHY_J721E_WIZ=3Dm
> >> -CONFIG_OMAP_USB2=3Dm
> >
> > I don't understand. There is no such line in defconfig. Which next are
> > you referring to? Was it just broken in Renesas tree?
> >
> Ah, no, it got broken by Michal. You should add proper fixes tag which
> results in automatic Cc.
>
Sorry I missed that, I'll add the below and send a v2.

Fixes: 91fe3315cdf9f ("arm64: defconfig: Enable missing AMD/Xilinx drivers"=
)

Cheers,
Prabhakar

> @Michal,
>
> Are you sure your commit did not introduce more of such issues?
>
> Best regards,
> Krzysztof

