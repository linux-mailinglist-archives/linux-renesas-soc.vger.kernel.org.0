Return-Path: <linux-renesas-soc+bounces-21212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B7B40907
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CFF16D3DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8134431E0E0;
	Tue,  2 Sep 2025 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMednwyC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72825EFBF;
	Tue,  2 Sep 2025 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827371; cv=none; b=gaspPLphEKwqndvrgYKvE5bfC2C+pKRoV84x/4PtWSFPZvTklPVmMO0/g5qlmQIhq2LWlJ/DjiIZxWe5NSOETNVxfaOGsUV9LwsxeY7yFcLJsqa8DQQpZNYpPUCO7RghQGTi48ga7ucT7UZIXDbRAwEzFISnAESJD8K2w3kC23E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827371; c=relaxed/simple;
	bh=sMiDdjyy6ydcJt2oQenHph+e3YVv96W8mqksnm03lZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXC5xCuk/AYiOPCK5zqJCwUng8c4/ik7VtFhVe6wXihHh2GtxvhjHF8QlnyqOZD+D1FKnAxYVXu3pfYJDmNRZRazbhnm3n+9GHJZWuS73cxtFMQf/q8kfQ8TdQnx8BI1INXjRP5xMEdYd7zfe2/1gxfVWW0o/ZLQ2fBfGzqIQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMednwyC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so463663066b.2;
        Tue, 02 Sep 2025 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827368; x=1757432168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
        b=FMednwyClEyNngB8OKJ1kWSnqmnupcVP+uRFeEVpR3Z+fRKSaDvSMLJtEakU7VLrsA
         gY+7yUawBF6IytHzqyAzHjVD1hMb++AnkYrhR5uNYlG8tNTwVPB2Cf9zvA+m1Xy0qt5Q
         46JYPIAzclNe+XhLAHWVaTB0qouxBylZynYY/xdbk84jXhc67GTMvGpkyXv6y+QdaBOo
         J4E6WWxAuL39RpZAWiYHcETaAAPIqx6NluJP5ARbjjpCDaAf4Za1eNCbBzgcKYV2jSci
         WYIZCu5y7qC0blfj0pGWphWKCwPIt8r2q/KM4oBswqQln6PjYRBLe01GYAkP9imUI/CK
         iWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827368; x=1757432168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
        b=gQFUB3/kYvZ+yW8sbngqNrIvXrTdj9FxcDumSYnxbCa1FwNa9yb/rL1bJW5tFOsKyS
         shIigCqjqV1U/hZrZG7p3+o7L6gS+dkE3u+eRiTAmag3JlcdPq21Hp7URvTXo6WjPg0w
         mNwxd+58OQkyDZ3sba5DJNaY3a1A2+8tzLhhLcNCRtpZxewK0qgwxLlnZtTkvv0T+gYw
         xwidvfUA9hdhSakyLWEdyF8KaeBM892C/bhmd2htrelCjHn1r/Vq3PGaBdGAMNyGSTtP
         D59kzzl7T611Jx9ZONKOIjkFnGGgpFT3aa1xE9AcqgGrfYqz+Ij6+Dp2YItaevhjRmk4
         mvgA==
X-Forwarded-Encrypted: i=1; AJvYcCUgB7lVVQp3TXZ3ToTFVUM/xZvtr6eBWf33/5Vysqx2PQIkgxc9kg0Qlokl5lBQU6SDIS1kWYWkI9+3@vger.kernel.org, AJvYcCUra4T8quEIh42aaqnEg/9NGvgJy1I5sxZgoQ2nJLJlhaCR+Xpdtsjtd3G81MMUlVb5OgpX71iPze5GVU95O/1QFq8=@vger.kernel.org, AJvYcCVB8NteUtXtg3fHag/OWIxIx569HVK3P4eKehC9Zv9+iPl13T2I7fQ7AWIjSiDW869PaIxks2zkYUdO4i+/@vger.kernel.org, AJvYcCVUJ9mjpaijXI0zqUf+3e6DxkYpzIjiceZ22YLk5UnzO06e/2CdFbNF7XnHpDdi8mq0wE+HZgKe@vger.kernel.org
X-Gm-Message-State: AOJu0YwcXRklzh9xHy0ija3bdeMEr4p8FN5eO5Kg5W/m/NczKyv0pqGH
	pAFlvGaZBNHfe1jPsm6Oi300yHspd0W4poNPE8ZN3Cmn/sZypGgNOaeEpVxzM0Vznuvm7GhmJmc
	8BqhPfsVHgDz9dj0qwRrX3CM+uT0igfs=
X-Gm-Gg: ASbGncsXShv8lVw7VDk8d+797vgfEDE7f8MzmP1b5omarwmNZL2i+QXIZmHZo5e45n0
	eV+9ucr4qrkdArvw2HCDIxLDG/rD/ju10nO/CXZteysLZBoKZZItyRPhgL3G9LzlCQXHNfC8hat
	plu2nmjyzQCBWj5VJYYq0JhPy0z1C2/4tnxBxji5+j0DCAmSZ72Xa26oKw1j4T0kIBG90sqWzJr
	298uJqn64ypZfxCu3HbxZTKoBjrdlZWqMugeNoM
X-Google-Smtp-Source: AGHT+IGvRWgNdy0fihhRjw06pq2Hs9JGdwVs/5subwnKQbYsRHg2GMq+oZlBiYJwTVV3dKdKs8PeQUmCZrUBILuRg+I=
X-Received: by 2002:a17:907:6090:b0:b04:2cc2:e495 with SMTP id
 a640c23a62f3a-b042cc31af3mr770379366b.14.1756827367715; Tue, 02 Sep 2025
 08:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org> <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:35:40 +0100
X-Gm-Features: Ac12FXxX3Y3vXxhmR1yHN5IR8o_v2hNrvGyoSHzsymFzxbirriBpH1NCmvMkVvk
Message-ID: <CA+V-a8s2H4UzovMqYJ15nWu1X55dL+7qJWifHxMEkqjtTzigzg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: renesas,rzn1-gmac:
 Constrain interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the patch.

On Tue, Sep 2, 2025 at 10:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Renesas RZN1 GMAC uses exactly one interrupt in in-kernel DTS and common
commit message needs updating as we are describing 3 interrupts.

> snps,dwmac.yaml binding is flexible, so define precise constrain for
> this device.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml=
 b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> index d9a8d586e260..16dd7a2631ab 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -30,6 +30,15 @@ properties:
>        - const: renesas,rzn1-gmac
>        - const: snps,dwmac
>
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +

Changes LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>    pcs-handle:
>      description:
>        phandle pointing to a PCS sub-node compatible with
> --
> 2.48.1
>
>

