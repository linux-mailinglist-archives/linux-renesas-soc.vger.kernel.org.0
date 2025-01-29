Return-Path: <linux-renesas-soc+bounces-12690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD36A21EDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167F7188ADFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B7F7483;
	Wed, 29 Jan 2025 14:12:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA31A9B40;
	Wed, 29 Jan 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159926; cv=none; b=MAD/o9iz0L1y4lpepB6ERzCiVCGcyM5v0lkSgrC0nrbPBRoNtdGZ1wrkXv3IebBsASsP4vxYZ5uZUSmOG5ZowJmrvMLiHFXIIoioyYecBF7o5zVsk/frDMs35qazWEkXjYbUyyNmYtxAU0FQF931gStLwvQNTvNrlpFjDRt/4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159926; c=relaxed/simple;
	bh=xSx59Q6WEQqOAWtoPWzR5q+90R5W5HaYyo9/T5UJWaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNNnUUZV7EHDYxjk56kn/nH4uQX9LPyZ2qFQNcU28ps2p6HbrVmLTvmdTQaMl8MZY+pdJQ4aTFrz6YUcI2wGXZeAMYayHgZyhlj/Yz0RNawwk8tP1BOCQXgcZv5B7aiiYjue9kPkw5VbHeQrBoSZCaSE/lQHpXZ1F2uNG3eFWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b9ad0e84e6so814251785a.0;
        Wed, 29 Jan 2025 06:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159922; x=1738764722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+weLzFaF5oAKZl3Ty4+8MGIrOzE6JXEBRwSNs7JrGZ0=;
        b=VsHmt8E7BX5JKlPHpnuaf2rB/xctp3XYMrHViCSw4tFuRJ3RpD3R0bui/tytF51Gmp
         MMSZranO57slGjDYwg3y+6YnfTvBFfrbQBXNmalse2jsW/SoxTe71lLtZ77ndmsAFHB7
         pc1eEw2PiHJ0xYwPpXaoC89H+2/WlArJRMT0gGAB00ejKoxhJxiHwCn/y/o5X+UMyDwq
         SvjFilSCYBg0bvqbG8rsHImvU263pVfmaUX1EtLQkjanJiSfHQOpRTDDKx7y4lQAxPsr
         yObw3AEP2G5z/g7iXtTDsFKaGnLtEEkZ+IAauczWgZanB8buHdGK2iLdaSk4U8HlHinZ
         KOmg==
X-Forwarded-Encrypted: i=1; AJvYcCVA5uHqxM/3RlF0+azuBrMxwmOzSYoEKHflq5HsXwuGZjhH27JQXWP5G68ERuA/ON3c8BFRQ92elTrmoetc@vger.kernel.org, AJvYcCXMcmKFUmnXJWSIa3DuniaezunQdkB2+F+HWdt8K46Z/pBhD6fODaKbUqryWxHTwygskmGporFgRSj4V2Z0vOGFcCE=@vger.kernel.org, AJvYcCXa44lWV6pvfw3Tlj6zSdSDyVMUgYwRJaALsrCBSZq93JhChWnLcb2uD0eTygL8gZTELd/OpvAtL1Gk@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNm2G9ctKm/lht7wopKUxI+AtS2YmCxB5cpL093AhOFJpwIcV
	X4l3IcLIEa1IkJ03WlWBtDmPvV9zKFyXl96UQ8gbMQ6SZhp1mGmPKvfXyxjc
X-Gm-Gg: ASbGncvmBraSWcrdnZey7nQmQXZZA/NRrwoQRla80XncB1Jk++ghz5iSTsEbi89UEBi
	ZR4GnNYMl0L79XygwkLHNHL1q0q5UBHoAANQZ3oKVieU9ZXwwjPZ0qJnH43+vygaqhAeib2ZI6P
	dK0xJ0YIqgskwLOiimZXcwZOOkp/dQ/JJU0ulm6Rsk/haroWZp+vOijx34jgxnAB2s6PBD44LSE
	TjbrhVOYAkZW0ADWxCwNnWqYNWdPWmyMehePU7HdGefyerNd8leNB7CVMSEUTCltVD1u34jmPtT
	v1qxvtTDZNtkPlDrfT07NilQMKIFyeOGJWkVEqWZYAtegfC0C+1ys9fPbQ==
X-Google-Smtp-Source: AGHT+IH0q09grcyj8PXi65l8085890EiX2QxIEm/9I+GJE/1NWlNSDgR+zTX2ZUgdEZwNq4fFFKdDg==
X-Received: by 2002:a05:620a:44cd:b0:7b6:c92e:2e83 with SMTP id af79cd13be357-7bffcce6156mr405603185a.17.1738159921725;
        Wed, 29 Jan 2025 06:12:01 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae7dcb8sm626689585a.16.2025.01.29.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:12:01 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f8524f23so860580385a.2;
        Wed, 29 Jan 2025 06:12:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR9xplH22vM/P06Em1q1471rlvZpf0lw0SMhpYN4mx3CDwfo0nWSSz4iqC6HCIcX1hn0AlMxh29qec@vger.kernel.org, AJvYcCUY0z2wJgXqC5rsqrvypjODJOPwGaX7RfDw4J+D/ldhUAPGLbGw8MCIMfUP6BA2HphSo9yoa9UIAqNb7w0u@vger.kernel.org, AJvYcCVllfbuzryikoWi8b+OEPiF90Hb4qlbboQ+OB30z2Why1j9FGLSeEWRPC+als+mbgh3Km/NsK96FFAHZHbpJbXLOm0=@vger.kernel.org
X-Received: by 2002:a05:620a:258b:b0:7b6:dac1:cb73 with SMTP id
 af79cd13be357-7bffcda901cmr486250485a.56.1738159920967; Wed, 29 Jan 2025
 06:12:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com> <20250127-myir-remi-pi-v2-1-7bd3a1c62752@collabora.com>
In-Reply-To: <20250127-myir-remi-pi-v2-1-7bd3a1c62752@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 15:11:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW16Uf+khp7viesn7YtZXahCp6QuOHY4bnp2DG_KYee9Q@mail.gmail.com>
X-Gm-Features: AWEUYZntJiJkFgyWpag5HwiDlPV1JLWaFN7LGKxrQWRd2iuBsgoREfw36a6PHvM
Message-ID: <CAMuHMdW16Uf+khp7viesn7YtZXahCp6QuOHY4bnp2DG_KYee9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi board
To: Julien Massot <julien.massot@collabora.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Mon, 27 Jan 2025 at 10:39, Julien Massot <julien.massot@collabora.com> wrote:
> Document the MyIR Remi Pi" which is based on the Renesas
> RZ/G2L ("R9A07G044L2") SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -491,6 +491,13 @@ properties:
>                - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
>            - const: renesas,r9a07g044
>
> +      - items:
> +          - enum:
> +              # MYIR Remi Pi SBC (MYB-YG2LX-REMI)

What is the correct spelling? Your patch series has "MYIR", "MyIR", and
"MYir".  The website seems to use "MYIR", except in the graphical logo,
which shows a dotted-I.

> +              - myir,remi-pi
> +          - const: renesas,r9a07g044l2
> +          - const: renesas,r9a07g044
> +
>        - description: RZ/V2L (R9A07G054)
>          items:
>            - enum:

With the above clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

