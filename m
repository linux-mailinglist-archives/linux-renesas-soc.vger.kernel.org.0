Return-Path: <linux-renesas-soc+bounces-11260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 003009EEC09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3FD1881D95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67714215776;
	Thu, 12 Dec 2024 15:28:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC4748A;
	Thu, 12 Dec 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017306; cv=none; b=U7EHM0KxounJ9SlqURF3Oon3OAZulOmtVCi1ydVZKJXd/UzA4W6OUT3gc4IDUxtekeYnZzqI961UvSSknGFgiO4SuygO9MmLPnBFp+4HFZIXV4YDfEfhlUfvlLsqRQBuVlr2Sx1ZZzIaZafgTjIXB2R81eIEjrv+IRQArxqVzc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017306; c=relaxed/simple;
	bh=0Zee+I5cqFD1GBJ1TH9LWJrMxi2klW+BqjRt2DUjgrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGUsd6iaNAKZ/9WLkYIVsy+84W6p9lFAm+YHPSJtgIyy6xcqWuKR1y9fztupybIbk1it3BnURiHP+e/V0aL9y6jN2FX8CjREMrlmcw6vmaphawkLPm2EMda+EhiazKxUv4quFU7lH14fV6CmUe7FrAuGo01ho14cSKyRM+YdgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6eeff1fdfso53572285a.2;
        Thu, 12 Dec 2024 07:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017301; x=1734622101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UxZNr8EAPeUna7cGiyyzYaRlPaezHzpLDNLw5z8MwY=;
        b=a8c1DOHvS7PdQqUXOl/YgeeOXCnLSaJdu/G6WgxlzrjJxctIRyb9Qd+oBa4A7R2Yhm
         uJ7IpR4I8m6UOAnOrUtX3F0+pL9dDyYNpTfQfaL1Wgsitd/l6s9QQAq55F2h9Fm0jjGH
         AgtTpI18kvbMtM31gUZxJrRV4MIbg4Yt4wPxhT5tEBh12uVUgghSetbZRQBvP10wTKPV
         o90clG/hQdqxS+cmKZnI2z8cXiuPCaWQyAWV+ImDWYByxd/u9W3uAw4PB8zgdzApYXXQ
         Kn6TIo6GDRqxSswS5YMdsK6rX40kLXktNBjAEuNLZeS7rC0yHQ/WBHeymVsMDSg73gtl
         TJKw==
X-Forwarded-Encrypted: i=1; AJvYcCU+FSIIRiXcgEjfOFSp0a5f7by3y3hppCpGoj/v7Ntwokv57i0RiGkCIGXwlAKuysauhRryj25bvOmei4rR6SqL3+0=@vger.kernel.org, AJvYcCV2OKMhfNgfHc2bxAjLxEJZGWlAGZgjr4pTCjO4iqf40iLhJkELgzkncMUtn/TmIlWwl6M2MLPKDR1x@vger.kernel.org
X-Gm-Message-State: AOJu0YzsAEEA32ue69SQlfg9dQX4K9PjppFkR0lKKMD8wiHs+YuH09Em
	yrRZ0AVsGGOEs+YdyAUicuqRViMbCnKCu2QwBlHhAN7RYuTs8xeMoT0sKyU10ZU=
X-Gm-Gg: ASbGncswci11smEHDdw2LCO/9Bdn26DCpXuA49sgAAPR779gxvgqCFLVD4H2Cm22h7Q
	wXIyZFel9ZztuhTGo0XDLDkvV1/PppRKFY+p9qmHSdqqnhCstVRVD7HeitwPK3WQNyn9MpjFhGS
	Eo7k5VfpnjlqkhXjCP0hj/WtzzIatZEJdZgGsbDMSI9CHvWswZ+foOp6PZoG5jhU04i7E9DRng+
	5gQqCNjXfpg7nWIRXOKm9zQgj/J4HItBNNRq7ttMuALHs9/5NTleKEhpT9r6tjilNEnSvVOhdxY
	aZ0IVLg1prQfYt1D7bU=
X-Google-Smtp-Source: AGHT+IHSkjuXFBBNKbzM9V9761Rb2Uv7qEll5ttf2XxjHG7NSxJ90i0WfxwrQa8yW4B+W2w7Zl5YlA==
X-Received: by 2002:a05:620a:370c:b0:7b6:7863:cbc4 with SMTP id af79cd13be357-7b6f8953c73mr92879285a.18.1734017301187;
        Thu, 12 Dec 2024 07:28:21 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4678986010esm20369661cf.66.2024.12.12.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:28:20 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d884e8341bso5463656d6.0;
        Thu, 12 Dec 2024 07:28:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFPdkyHmk0sJoB/7RMYs7mkHoCVtSYJvAIynngCVSTRljibse5WCnafMAVJnxmhNxOrx4VsW74KZom@vger.kernel.org, AJvYcCW/YiZ57UKcVHUq+lwFXAOdXzqMubzQJiyZmJdZEQ24Raz6BDGSw6EnqSyYEf3QzmF+AK8ofreOUCqygocarqgfwFM=@vger.kernel.org
X-Received: by 2002:ad4:5be5:0:b0:6d8:a1fe:7293 with SMTP id
 6a1803df08f44-6db0f82ef34mr7650886d6.42.1734017300325; Thu, 12 Dec 2024
 07:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:28:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEobZDBuG1FJCxMheXg42KFwYrKeMoR6FegE0-Gihs8g@mail.gmail.com>
Message-ID: <CAMuHMdUEobZDBuG1FJCxMheXg42KFwYrKeMoR6FegE0-Gihs8g@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: soc: renesas: Document Renesas
 RZ/G3E SoC variants
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document Renesas RZ/G3E (R9A09G047) SoC variants.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -525,6 +525,19 @@ properties:
>                - renesas,rzv2mevk2   # RZ/V2M Eval Board v2.0
>            - const: renesas,r9a09g011
>
> +      - description: RZ/G3E (R9A09G047)
> +        items:
> +          - enum:
> +              - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Et=
hos-U55 (21mm BGA)
> +              - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 + Et=
hos-U55 (15mm BGA)
> +              - renesas,r9a09g047e48 # Quad Cortex-A55 + Cortex-M33 (21m=
m BGA)
> +              - renesas,r9a09g047e47 # Quad Cortex-A55 + Cortex-M33 (15m=
m BGA)
> +              - renesas,r9a09g047e38 # Dual Cortex-A55 + Cortex-M33 + Et=
hos-U55 (21mm BGA)
> +              - renesas,r9a09g047e37 # Dual Cortex-A55 + Cortex-M33 + Et=
hos-U55 (15mm BGA)
> +              - renesas,r9a09g047e28 # Dual Cortex-A55 + Cortex-M33 (21m=
m BGA)
> +              - renesas,r9a09g047e27 # Dual Cortex-A55 + Cortex-M33 (15m=
m BGA)

I'd rather sort these by part number (i.e. the reverse order).

> +          - const: renesas,r9a09g047
> +
>        - description: RZ/V2H(P) (R9A09G057)
>          items:
>            - enum:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a shared renesas-r9a09g047-dt-binding-defs branch,
with the sort order fixed.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

