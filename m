Return-Path: <linux-renesas-soc+bounces-14498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA5A6506C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 14:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A5216BD63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 13:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E8D23E34E;
	Mon, 17 Mar 2025 13:13:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA5218E92;
	Mon, 17 Mar 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217218; cv=none; b=UDCwtFvtMewuH7CLkvCXhkFO3Ui1UddOwbSovO5h2NgEipvgkC3Lpzq+JFIHzXEB7KLd02RyNNC31PphSGpUUuiHuMwbB4dJ8zF6ddLhN1pEp4uL1HCdo8bubMTyfYSS05KLQ2HdD5kBu21gi9oHiCw6LaN0QT9ttsBuSC4vl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217218; c=relaxed/simple;
	bh=r1Uulo9BneeJCl55/x23OZpyV6OxaaEjTOqrmwjIyms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXMqJInVK/v47dZHkxbt2IFVDZphLl8mGvY9xXfEpL/oP6suvRr0/NjdZtpa6pc3bKTeE0e/iqka1IE6514N0OXE+dnt9MvkpMHATUqrCuoIY67lLkdt/B+P4+wgAlcM55loSAJSk5TaI41z7eOf7SVldNfjJZXjMxWFavZZhCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso1947084e0c.3;
        Mon, 17 Mar 2025 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742217215; x=1742822015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUpx1jB1JXZeeA5ri9801TgbARX/ZDc7N+KGwBdI8j0=;
        b=QI3RiXboyTpt6YvdpAP2VtGCq9O49CUgbG+y/MtbfiUrD0F6KeT5TN8MzZcPA+2mdv
         tOwNRDzuYa5sJIuX0/V14kCSzYfi52MDUuRTz6xCEMIvTwX/sgrOXd1wXkjynTS21mkf
         F0TzsrbLZBzZOWk8ndwqm6LlHBGz1fkch4Mh9IevK56MHZm7r2DyeO+KEJCNRB7RlX+p
         lvL1TT0ViCWGSe66Nkq4z+p2aNCH92ioZ3nSMTpiaBYax/ts2Q4ANR/dSuUlBgYZCj07
         I9SErjgqVjUXsCvuZpWwCBJLsYVwQVlijOZtBTKGxoBQ2QovETXuWI+YhNqYPbR6NZez
         M0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp8OE9ZeNAmBWiPGPDvHwPtMhvFGDxJcdhzxsNiSQyvsVS8iEauQhvu64bJo2SGhw0Im874giYc+jm@vger.kernel.org, AJvYcCXGSsBQEkJIfydQaSFU/4MI8BNIaxD99Ngeo1SWrZUzrZR8cnriETPGM48ql9osHj0THmhLQx0Gw9kGRlVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+dfYD1b5dFbDP+mkKsaWv7tvmtd1Ugs+N2qZZIrY0er+Ox0O
	o+qNfRHv/COvm5Ewnu8p+sVGq7vLMjXHpe7MH7mJzNTbvXIoIAY56SKacZDA
X-Gm-Gg: ASbGnctrxRrNSQ1EvRv3jHd37hAIM9ziuPLt2hOa85Z8PnruodlQT3zXi8DsXM6H7a4
	/LuSra/bFRTGInEycchbw+Od7U/NiJH46p0sT+NpvSyR13mATVVBcUx4N1vcj1SaZEjCX2OQ7JT
	CcZ/Ipq0EQ56mPiqJwvMYeKksHz1zHilWowK1mDVX1+XjJ48JYqoW4DkZ0XpJcWciEUoXZmTFVy
	gK6EsTZmOVoOWZa7u0MpzepzQPOOBHua09vX6y5wHw2fT2Toum2ZtDuG0ZYgRxulBeETZ3+I+u0
	GwsGueAATXh47qYmdIugITYSY6Ix1XvIqImNE/2no8sj8P5xM7yAphGB2ntVHXzo1HCkYYfR0V4
	i17JVqU4CkRzWOJ+taA==
X-Google-Smtp-Source: AGHT+IGvtUrCKMM+8Reqm3DbXa8jGXUgPeguX2AWyDNWT279amDf1EKv7A8squ1srzSOiBvRUKypsw==
X-Received: by 2002:a05:6122:209f:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-524499ca729mr6989299e0c.7.1742217215093;
        Mon, 17 Mar 2025 06:13:35 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a718489sm1671746e0c.45.2025.03.17.06.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 06:13:34 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso1749612241.3;
        Mon, 17 Mar 2025 06:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1yEYPvdSyQoGDXj79JKhGnSFdVtqGyV3tdyh4n7+zcIcJW4kBKd1uZd3FP4C4NZkMwB78Yn3/ISNV@vger.kernel.org, AJvYcCUiJjqO7PruY7G/frk5jxhUqI8FZ5IxkbB7NRqbeHq66D2yADou7o2D2sU5hPz0vJOsH7mCmjkk1hzge2xx@vger.kernel.org
X-Received: by 2002:a05:6102:8002:b0:4bb:c24b:b64b with SMTP id
 ada2fe7eead31-4c383201fe2mr9114151137.19.1742217214707; Mon, 17 Mar 2025
 06:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317120437.67683-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250317120437.67683-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 14:13:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzjOGVCG=rrsnwDkaN5aRsBiWP7DhgUAHeEfUCz1_Y7A@mail.gmail.com>
X-Gm-Features: AQ5f1JrpQwEPfyCfxnWJDfBfjNpKZIK_9m0NGqg7sH9slyqTu_aE9xKzxpFwp7E
Message-ID: <CAMuHMdUzjOGVCG=rrsnwDkaN5aRsBiWP7DhgUAHeEfUCz1_Y7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 17 Mar 2025 at 13:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas RZ/N1D has this UART with and without DMA support. Currently,
> only the binding with DMA support is described. Add the missing one
> without DMA support which can fallback even more.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -30,6 +30,12 @@ allOf:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-uart
> +              - renesas,r9a06g033-uart
> +          - const: renesas,rzn1-uart
> +          - const: snps,dw-apb-uart
>        - items:
>            - enum:
>                - renesas,r9a06g032-uart

This is the alternative I suggested, which Miquel likes more than [1],
and which I was just about to formalize into a real patch ;-)
I think it would be wiese to add extra logic to prohibit the dmas
property when both renesas,rzn1-uart and snps,dw-apb-uart are present.

[1] "[PATCH 2/2] ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart
compatibility"
https://lore.kernel.org/all/e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

