Return-Path: <linux-renesas-soc+bounces-7900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D7956C4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9663F1F21919
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0584616C44C;
	Mon, 19 Aug 2024 13:39:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105DE16C68E;
	Mon, 19 Aug 2024 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724074745; cv=none; b=N4cdQ9HLDkk+8GWPasMldgkMi7GxLMXWNDe2O6yEHl8NACzwGciLiHjAj8m76ibeZq0jqZYBo89ldq1oqW0W59HvdYusmMpFJPRw3aDmPJdeJDGBgMJ9Fo+o4f2kfUHSUojCRo2OdWvS8JTglhoQtEldK7LWA83ZGCqgjJjpXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724074745; c=relaxed/simple;
	bh=Dn5X/Rbe4qEZx4tYwaZ22MjAOJh5R8ic3hzcjKEib38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbHVNuSgqom64cDeH777v7C2jZUv6WArTXekNOBPdxzLiNVZGTftftjdrQmFDSBWeW2Y5OmGThEWruSZRssmXqN8T7t05pKell2ozTZV0f4vvaJ4jK37fGj2gr9Yw49pR/6+iGnw1gjeb9fEMCseOz8TC+lZSqUL+y0sXy5rABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6aab656687cso32916667b3.1;
        Mon, 19 Aug 2024 06:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724074742; x=1724679542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJXbsij2gSSJxop3NlYZ1IKN8Y1fPN3z13PwAIfyEvI=;
        b=M//1x1KTkvnEOzRTFJCYJ1CnhCTMv8Xc7W9hRXkmU8igWKJXeOTcKQ7jBuMOa/ccnj
         MW4nwosQJti7HoWfJY8CpD27mhPb4VnG8agaa7MzumfPOHE6rfHDezNMVjUGqZKd2xis
         1lUyEKtMDIw/jiEuSS09QDbwAe61+u7ohOLOO3GqfX7ajRxc9oyHf5NRjkQvVCe3K1TX
         YArFTpO9trMXGoLFA4p05EwDaPrjI0vv1DV459KstM3PaQFBTDyrCJgdlDnh6sVP0Tkd
         SkfDid4oVaPRZgPDga5hCrT//JyE7BaoPDpdYQH9MTzlHdYvIz1Q+UtFIN1EOEHy27tu
         aGkA==
X-Forwarded-Encrypted: i=1; AJvYcCXh2uPnVWlm1YcyUV8DTrpXusbChMdS4yU2DmuskhY5IE1y7Ie7yxd0ZhqEOOGMRgN+In9esI+W2DBjLAk2/xrPVzZP/i4zznORtBXu7M/JwpLwPqstnOcKwyWkphqnpFigCJ3AdiXZrpi6uVci+js05dyK1zUqw4Z7rObAoTJtsyj+8IXGjhG8RgVcfLZkKuhRxjni966yVxDjH4nyLeMvgx4TQxON
X-Gm-Message-State: AOJu0Yz6zJIXsY5BXyKQB0lgYGG4HaYkRvD928NePF8IjTJt1pS6fnzG
	JigPz3RHAFOZveWp31Fwy6ynHBYzFNc9dUxHmKEQugybPc7OpuikfGkQR9cq
X-Google-Smtp-Source: AGHT+IHJZZyJRDasdzStIpxNjuyoVReu2yPCDTCff6C8Wi0tnYC0UZdZFX3bh8xj/N/10hQm6wWhTA==
X-Received: by 2002:a05:690c:3001:b0:62f:206e:c056 with SMTP id 00721157ae682-6af1b832404mr120463767b3.5.1724074742006;
        Mon, 19 Aug 2024 06:39:02 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6af99f9e061sm15898977b3.53.2024.08.19.06.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 06:39:01 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b3afc6cd01so17579087b3.1;
        Mon, 19 Aug 2024 06:39:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEqezLooMdoeBlHHbcdLHDFjfPpjPlaR3UQzfnFk/ZIgsSmkljxtXqc9yOEaY/wxyR+7b0tgH70PXTWOIVc6XPj/EewlCKF9hTtEMCqJAdLc5lKfv5sXTF3ORGAwrAaJW8FRplgyxPlRCe17aNo1FDf4/tMgiE3WWPZ17oQIshogssO0+zQjHZoisuPsX/rWzxoZ3wC3IAWlil+pbmZ4GYOCwqqiqU
X-Received: by 2002:a05:690c:3001:b0:62f:206e:c056 with SMTP id
 00721157ae682-6af1b832404mr120463467b3.5.1724074741182; Mon, 19 Aug 2024
 06:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818172923.121867-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818172923.121867-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2024 15:38:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3V=ZO6me5LekUQN4NC82yw5_UYNd23gZwctUa-GiJ6g@mail.gmail.com>
Message-ID: <CAMuHMdU3V=ZO6me5LekUQN4NC82yw5_UYNd23gZwctUa-GiJ6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: add top-level constraints
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, Aug 18, 2024 at 7:29=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -77,9 +77,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>
> -  clocks: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
>
> -  clock-names: true
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
>
>    dmas:
>      minItems: 4

I am a bit puzzled by all these add-top-level-constraint patches.
E.g. this file already constrains all of them below.

To me, it feels the same as a patch for driver code that would do:

    +   if (param < 16 || param > 512)
    +           return -EINVAL;
    +
        if (hw_variant_a) {
                if (param < 16 || param > 256)
                        return -EINVAL;
                ...
        } else if (hw_variant_b) {
                if (param < 32 || param > 512)
                        return -EINVAL;
                ...
        } else /* hw_variant_c */ {
                if (param < 32 || param > 384)
                        return -EINVAL;
                ...
        }

What's the point?
Thanks!

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

