Return-Path: <linux-renesas-soc+bounces-14563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634DA66F41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ACF919A30E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FB2204F81;
	Tue, 18 Mar 2025 09:06:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3321F5842;
	Tue, 18 Mar 2025 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288768; cv=none; b=HsSKbueUcQOwDSITSO02TvLehFk2IPiG2QLTzloK+9dDaQJzDDNW8ai2g7l9RBguXX8y3xajgfLdvEw0VdCHD+DSg+UeQwgbghVAeMYCubhsy8NkyrzwbirYR5jBu6hvw8/eJclahAt84o+rely03skwD33lyKkdo2YV4g6Ug9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288768; c=relaxed/simple;
	bh=PTagmbpU3XF5H/sYqjJomzzmYuqGWjWIZvOG/uueeIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq1c6fc7K8Hnvb1eHqfx9Ezordksb20saUOFbfj5ZLvb1TUf4TVYOhNAyEoFsRBf3MCW7K12ytYAk8ZjYNtLshfY3vCe0ju1mP5H4tNT5anTqkfKaN8yYGfe7tQUWv8GIkbF6JfBQYTK0vEJjhnnEPo0/bBLe2/XVa7bKtpGXMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86dde90e7a3so221211241.1;
        Tue, 18 Mar 2025 02:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288763; x=1742893563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lblAmMwxT4LQJ7oZOS5x8MeQfBd3ciA47yMs9M9n8E=;
        b=Y27a2+T/jleNUHPKRXRC3hc90IRXVsOuhc+RvHyCQKze4i1tcfVbIflR/VVH8/KfgQ
         ehtCcriKA+uq/uCwGsM9GD5XnU9czRYY6pOWVIx82go79AIIVDlFiYqNZfDnGhNkXVrA
         ic7vUFb7PuYhNyxSKiJKOcJ/obATE0U40fdBPpOBkM2vjjZ+GXzTvl+hrKeWwANnTKIU
         gITt7kS9viH9nZiv75jrPT8yQcCIQNXL00RR7mFzW7u/SZQt7lz79EfHTxU236l4HjlF
         +ho8KevD6rzv/Fu9DcHUEHRhXGOOJ/a1S8jz0TkIdQo7JZ0G2w1QuL0JPWEX9P2HdSS5
         Bo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFZg83BgsPfy5zSgC4q80QLUrQmsM3DpcfpWoY1C4VDoE8X6GZEUOy/hs+g7VQJ66ilswfYot5uIpkfj8F@vger.kernel.org, AJvYcCXWKCucCMRwdUpNXIdFU0TN2OvOOKa6djeOMQc7c3mowORRpseMn60liX0Lwe7V9h/jSM5oUQDA42wJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QeA74z3lEntr2H0lfxz46Mett5MWk0PjeJmvVRmIdgbDsozI
	gUctHJHlODEhuo/ytg8ZFIqT/g2rpetFwJgnt31PBfGq6GcYpsaOr2b2DeQ3
X-Gm-Gg: ASbGncsSEJFwMz1HnUl+poFqFDSWn0hKgXbgINaZQ5OUkNvJU4IFMfOsUntYHcOEP2u
	6o9oEi+hbvygKiRzZsnNp9nJ/l4RcyhqDgw/ISUlN8Ul0JMor4TTf71bkTdFU+9yaMeuz5RNLy6
	PKLK8fG/2gw4XfxSKi+njJFtIyCp7/o1ofYlKQWslMIaGrwYohm+rCZsPSTatVtWqhLNT22iIkD
	QEQwipuOyJIFiKQwhvQHSF45cTv0qx6rtDBB9l0uabgKQkoTxwgR4AEvyEKNtC25ElqpW0/gqs0
	tFjdNY2gmlvPGH93t9vbVJe2wwkflavRgGHS7cbI2ZKW+B7VNiZPrcHfXwCk/cBzFNDUAzfNRRY
	E2GhoWq7QccI=
X-Google-Smtp-Source: AGHT+IGlhLH6aKfdEVTCF1JqUHlH5ZDsggfkMDFJfahuYVcGI+ed3icY0UP02FNHiciSybMvAO1RDg==
X-Received: by 2002:a05:6102:3908:b0:4bb:e2a1:183e with SMTP id ada2fe7eead31-4c4d915ecc3mr2639910137.18.1742288763488;
        Tue, 18 Mar 2025 02:06:03 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c37513df2dsm1811746137.23.2025.03.18.02.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 02:06:03 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523dc366e42so2067106e0c.2;
        Tue, 18 Mar 2025 02:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6FL2mb4V6smD7lMzqtlzKFv9DfZN1gyIio4u+jsraOtS8wWZyB+ERatSBdpTsmdA97ECUt8/0K/aF@vger.kernel.org, AJvYcCXZ99ZznbTfdcMnoBzhIByMMNBegx6GF1zcb7j0jVvICuOlBjCfo9LdqK4X1L69vM/UonksRzzDR5QsJzKv@vger.kernel.org
X-Received: by 2002:a05:6102:5492:b0:4bb:dba6:99cd with SMTP id
 ada2fe7eead31-4c4d9032809mr2176944137.8.1742288762977; Tue, 18 Mar 2025
 02:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Mar 2025 10:05:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWP8a5eR_1sk2oUe02KdiDaibHnqAHbn2mSyBHzP1FNJA@mail.gmail.com>
X-Gm-Features: AQ5f1JpyJMk16UbgbB5Lcp9JQK_N1tLC5wrggwzoADVVJsQawPIxoC1UstSz0Nk
Message-ID: <CAMuHMdWP8a5eR_1sk2oUe02KdiDaibHnqAHbn2mSyBHzP1FNJA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 18 Mar 2025 at 09:54, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas RZ/N1D has this UART with and without DMA support. Currently,
> only the binding with DMA support is described. Add the missing one
> without DMA support which can fallback even more.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -13,6 +13,20 @@ allOf:
>    - $ref: serial.yaml#
>    - $ref: rs485.yaml#
>
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - renesas,r9a06g032-uart
> +                - renesas,r9a06g033-uart

I think you can simplify by replacing the enum by

    - pattern: "^renesas,.*$"

> +            - const: renesas,rzn1-uart
> +            - const: snps,dw-apb-uart
> +    then:
> +      properties:
> +        dmas: false
> +        dma-names: false
> +
>    - if:
>        properties:
>          compatible:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

