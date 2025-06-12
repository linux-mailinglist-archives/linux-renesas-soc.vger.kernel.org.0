Return-Path: <linux-renesas-soc+bounces-18208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45BAD7701
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 17:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBF53A7808
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544B0298CB0;
	Thu, 12 Jun 2025 15:47:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE5298981;
	Thu, 12 Jun 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743226; cv=none; b=XzUT1zmoP2R77lqZulzE3xi6oQ5r5ua3gm6hyHMkoHa/L8aenwO+7hIwXkRH4tK86bwf7LrsUkfoH/qwX6g2ntMM6fLPwtNhkaU0wuz0C3zRRSXw2TM2VlcvNbp7GVbSK051s0OKGlRqjiqelq5D2O/V1xq7vDfjEI26EIvd2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743226; c=relaxed/simple;
	bh=vNcsy78aPJRMhKatRWi9xj79PLlzWbaRLkahV7pD2bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMukbNv52fdoi9hKspfuhfPKnyxdhP84OKU6AAHvVfZ9YZt73dNmABugMWO8jbdAuOOn7I0WOOWRBZACSAzubPCJ06Vlbxn7eeOV0PLIgqwztZXE0caKi+cKQa8Tj2LzMqGq6+tkX+YqaXqqwOqmQj5jtjpvJlvSbsRzNy4aZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735b2699d5dso622014a34.0;
        Thu, 12 Jun 2025 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743222; x=1750348022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3v8mwRDyh/Lxs2ZLJeteIKuaFRTtoVQJYNHS5rfYrc=;
        b=d+ZYoJ4Jhw0gVrscxXoQeDET0Ec+9EBdVBm3Q8iHGda4KLk5iy4bM0Cr2w/wCXWM2U
         j4Y0M5efV8bGEt4hWyCglZ31lEW9ofGmJ3SsNUTfEaciF6f2obFGeIj2ueIY2whR8a2D
         fcnwte9EephFED/NqqKXvdBwG46aCp5xkpVq6O1s5EO3TPMlglhhLrs2W0UpbXF/u/rI
         ucXPh/wyq+dVHBJcR1ted0NV8NDlG/0mFJ+yqSL88bNW59Afai6nCTmsJWPcshvQ51O+
         uyh14tZKowvkgOdlBc/mmUQXn+w5Dc5AU6JumgBUxXTrdDr9SVrHhgUwBmcdh5sIiKzA
         Ma+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7hhKxwyNNYTKZ4v4USmC1Z/x3c/tZR0euxHEhNMldOfFh9p6afzPclO+I5Sx2saBxEMjK+hkg6gZI@vger.kernel.org, AJvYcCWZenJa7g+4Imu+t5HupbfOmwhk/dzwhsKI9U0kFu6XdLr/maxhyWKlc2KnqGzU8lRaMW+oOIDCoAZ7z8Pz3AeQM4E=@vger.kernel.org, AJvYcCWdIMze/wsIcOEFYkXThgq5o4IP5auELELDOwVw4XWbBVYrFDg2M+soF6kbv12olrz7K6xyDKS9PJNkAv5F@vger.kernel.org, AJvYcCXhem58xFIbfaM5Xi9OAaI+4vXHEr4cmjBWQy8DEYpKihOu09pWdXXtfpDPoHRhp+pCUkYfNlEwKcHn@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQTM2OR9ZRfd0MvQqC8DsOOfy7N3UI0Mc4PpKg9AGEHgdd11v
	nC9ffY0LPhNSgDsBM3VNcKpjnVXRrwX8vl0ZVn61WQoHCcaRRBjjQA2YtrngzqRy
X-Gm-Gg: ASbGncvGcoqNqAYN+RzeEtpIFhvrqcn99LOtbBVy3idmebpt4BemXw53P9LDvhhJfRr
	aa7YhVJ9DucgrREMN5VoNRCDeOkijWwQEqhYhr+I5v/wwUSNPXICz0i9cPgx68o42+fRf+3Ri5o
	6SEpOG0uanmfzZBLOSUJVqLi/INn5VOiyv7YtsFX2rVqbMv5escMFlB3N96gsnyvxL4IkHGK4HQ
	5v+VtHyvVy5ekwL+JzilhTJ6wWPbHCAfp8pVDiq7UaQW2OH33BJM/5eAbOb3JCC6FGXQa443uzt
	3RZqcu62Fp3iKe9Ii3FgZeFuVr4rPMVZeAB/fGWBjMVd+ueKaIh1NDSsXYT19cfhAvESQoEVmD7
	a2ely5abmeH4Zwv6rx6SgYfJ+
X-Google-Smtp-Source: AGHT+IHaUEuGSuWlDEqKkub8wpW1ucqoVPR36bAXR7DPN1JzMYcRMRfW4XQgABqAWuk/PME9Rgu1Dg==
X-Received: by 2002:a05:6830:2716:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-73a24d3790amr179457a34.17.1749743221978;
        Thu, 12 Jun 2025 08:47:01 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a16c2519dsm307286a34.32.2025.06.12.08.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:47:01 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c172f1de1so717681a34.3;
        Thu, 12 Jun 2025 08:47:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI68FGmBnPMBi9QXzSe+jQ2kp8R27+WHQxerOUfHD5Y8qLWC3Zbu9rzqFByQh/U/9o6fqXbt1bUXzr@vger.kernel.org, AJvYcCWemWIl9T1miDc98IhshcDk9Sqix3YJxIG0Yp4us4NZ9ZdSmCKQEpHTI3PeiYcfyIr8Vf+/7t7EgYATwKwoMCitFjM=@vger.kernel.org, AJvYcCWkVJWbc3wwPbdusOuvmUATcL4mxR+4vrVyHiF3Ei/UVoJySCC5WGVdZ7MIduKlNkJxnzFOHpmteCos@vger.kernel.org, AJvYcCXuotu01c+/plKmsrSsPdeqk4prcXN2pDa+WOxQyBACzkEdS5GWFdMPOhtwG1ns6TP2Vzf39if+GlP2DJhC@vger.kernel.org
X-Received: by 2002:a05:6102:5e96:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4e7e10f50camr349416137.15.1749743209891; Thu, 12 Jun 2025
 08:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 17:46:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com>
X-Gm-Features: AX0GCFtB1-0j_AdqxYDoMV8XG5IqGj5fPflPp82t1i2uRjTV37hMgoSfJPN5Lrw
Message-ID: <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 10 Jun 2025 at 01:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback since
> the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> allowing reuse of the existing driver without modifications.
>
> Update the binding schema to reflect differences: unlike RZ/V2H(P),
> RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> single clock instead of four.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -129,59 +131,75 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - renesas,sdhi-r9a09g057
> -              - renesas,rzg2l-sdhi
> +              - renesas,sdhi-r9a09g077
> +              - renesas,sdhi-r9a09g087
>      then:
>        properties:
> +        resets: false
>          clocks:
> -          items:
> -            - description: IMCLK, SDHI channel main clock1.
> -            - description: CLK_HS, SDHI channel High speed clock which operates
> -                           4 times that of SDHI channel main clock1.
> -            - description: IMCLK2, SDHI channel main clock2. When this clock is
> -                           turned off, external SD card detection cannot be
> -                           detected.
> -            - description: ACLK, SDHI channel bus clock.
> +          description: ACLK, SDHI channel bus clock.

According to the documentation, this is the SDHI high speed clock...

> +          maxItems: 1
>          clock-names:
> -          items:
> -            - const: core
> -            - const: clkh
> -            - const: cd
> -            - const: aclk
> -      required:
> -        - clock-names
> -        - resets
> +          const: aclk

... i.e. clkhs.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

