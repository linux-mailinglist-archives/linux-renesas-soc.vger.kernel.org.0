Return-Path: <linux-renesas-soc+bounces-22739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A9BC0C3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 10:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB43A189EE97
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 08:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D882D5412;
	Tue,  7 Oct 2025 08:45:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48232D47F6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826710; cv=none; b=BrCp5C76WcbykOJATWqDcc8RIj1x94k7SoA2+0pf9VuPo3GVoWtQ1dOEj7ZscMU83l0egw1VtESJNGyBw/ze3MCIgYYob7IuyuKv4N+TGBbO4rS296lgqGMn3W9N/tM1/uJp+2cA/sG9Zp8e1MOJjycDImlkY1+4IPHY02vBcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826710; c=relaxed/simple;
	bh=7HNOoQVw8YG5z5v6c7sWMWYBWqnFnOEjwJXCKJndxDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdzLGORgQzGhXZ9HTaw22DGi6tOKp9BsBAAdOM0mRbZ6O5A2M5ZFzwVWL3ggEGXpV+7texh1ENeUIKv6RECypAAGY/J/nwT5bLs115JcJ/MPm3vnEQPzjo05DdaaoE10BGgDgec0cu4NDAqVvfrHTuCuDoKgkAVIqn9rDpsgh70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-890190c7912so2532061241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 01:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826706; x=1760431506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQSgaEnCuQkYyKpd7dFZWet/o1KtZrc3TnC6bn7aOH0=;
        b=klBVvF32O/COyrBiaeWbJve1Wv4gaLA2VWxqxtpukqM2JtkAlUUcnGlEC8nNM5nYmh
         FvH1kSaBzJO7nOFkCpb5skr8pE032MWF1s1FIJ//G/CkKcKBKuPVihGBzYXGWviPAmht
         nkgJMcGBbnjvfXYYWqQ8fYXTGwWTon90uUZbaVmV6Ty3R9EF9GWF/kjiSh9ls+un4J32
         PRzeE0Nva9bfMnjARgXm6BoeIWNBemVFut/m5XXA6hKGXCefYgsPp+EG0Uz1BMZXxXKx
         nffP1KCkik/4T58JThzMhz7pDN90PSJMsNEYZODbzFeDYEqO6ZgtfCDUePl2bgJEgrmd
         lbkg==
X-Gm-Message-State: AOJu0YyWvpNoF74nqKhCw1LBJaEdqJRbrUhNgtj5cD1RsE6M+2PmOeB2
	6YkTWYRnIODHBxkfyldce6AE2dPwKYxbAxRcGn76Kr0f9kKPZ/V2E15n2BIUksoJ
X-Gm-Gg: ASbGncvAA421yJA7wmjmEzeKKjZgXYS5qHvus9ifbrbL+REsIPUUH/M0IysaSCIUXqX
	WCUCxkH4JDHIMpQQbr++2SoNd0TiLjVZ4S2LMc39KL7UjPnjUYtyMZFb/le3WM6+xAgK5f7nLil
	RWcbXiJOWi1Zcx7Widmy6nK6jQTJgN8n4iarM/xW91mPsgi+KpbhigvIaVDuNr7kjZlRmzwRSvc
	4nU0NRiP9fZUZe4LhW0GQs5fWRFmNDXVFVVTkSUJT2ovSrYVFFaqS0bcdAkH+kEAzqrPl4SsPpO
	4dG6GoR4NtNx+3G+N4sUls5SD6K3HWDQb3BjkvbL7Y7k0EDChDVkr3L/aHMncWSp5et0Id9RDGi
	Cciz8RTQ3XPFAVIOyDlk5dQbnzCeBlOf6JNEkyicwjJAs479OEbSDSkjRnAeIsAZf2Hc+nOSiGS
	68ms2RL+ee
X-Google-Smtp-Source: AGHT+IGpy4bTNuG0ATwKzHsv0eC+CuVlxo8Jfn1zkwzAYhKvAHtaE5wTvnDXJ8MnoFs9vWDRaCn92A==
X-Received: by 2002:a05:6102:512c:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-5d41ce388c5mr5774008137.0.1759826706371;
        Tue, 07 Oct 2025 01:45:06 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4d83b81sm3476365241.3.2025.10.07.01.45.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 01:45:06 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso1952997241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 01:45:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:522:194f:fcd7 with SMTP id
 ada2fe7eead31-5d41d07d7bfmr5217235137.15.1759826705225; Tue, 07 Oct 2025
 01:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Oct 2025 10:44:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
X-Gm-Features: AS18NWCnRYJUVTJV8FR89tG1mXzK-9QzVHwHqrU72-Fmo1xtJlFHb9IaRUVrY-c
Message-ID: <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional properties
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 05:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Allow additional properties to enable devices attached to the bus.
> Fixes warnings like these:
>
> arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
> arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: bus@fec10000 (renesas,bsc-r8a73a4): Unevaluated properties are not allowed ('ethernet@8000000', 'flash@0' were unexpected)
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> index f53a37785413..24732c5e24e1 100644
> --- a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> +++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> @@ -41,6 +41,18 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +patternProperties:
> +  # All other properties should be child nodes with unit-address and 'reg'
> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":

I take it the "\\-" means escaped dash, to avoid it being interpreted
as a range? I usually put the dash at the end, so it needs no escaping,
but I am not sure that would work in yaml.

I would drop the "A-F", as upper-case hex in unit addresses is very
rare, and non-existent in *upstream) Renesas DTS files.

> +    type: object
> +    additionalProperties: true
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
>  required:
>    - reg

I guess we can indeed have no child nodes without reg properties.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

