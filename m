Return-Path: <linux-renesas-soc+bounces-25974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8AACD5B32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 12:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 903143010AAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C91314B62;
	Mon, 22 Dec 2025 10:58:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77B31354F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401120; cv=none; b=SWwkc32cwELLt19yvRumhWvL4gzg48qwda4NSGMF3DHIbvL/WPa8eGRXziDtTkpJ4l284BKB/ksKT91sIUswTEnRwrFGuX5xJHBMJhmsFtK8zTE+Rb95pyBbsGjucVpB1LrXV0cCrUpKlTiuU0/XJnWNaaef3/LEg5CAly5G4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401120; c=relaxed/simple;
	bh=2RMd8TOLVHxevxDxNC2hXQNvxO8qy7FJKq0tM4xFWDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRs8FK3tivawcNohdWiC2EIXl9NxLh7u34Nklohp0R+odhjpSqoMjyr7YVrbT9AkaBFeI1/xhJjczd+eZLFyWQYf5/TIJn2IGQf5uTdfRbGMXuQllktRz8e7e7wRdSz/14ECTBauCrFMepZqA+9HHK2hDCWIuUkzZUgpgtlsSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-55ae07cf627so991235e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401118; x=1767005918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZvGT0H4XrwC6oZYNGXDbHChZKorQ8JtBsqLTAqv8b0=;
        b=b+og5afoaXSOItQZy7n8NVq5H6b64QiAKTBafAXIinFRvaRuRz3vpaNl5+VpxhcleI
         jOOs7adtzxZ2O7x5mCvPvadO1BqvamYYpZzEa/rJdQGRYAXyMfsOwcyaAfEonwuYxhPX
         t4llU9d3q+RzLTbaZl3S7YOAnbBT/VSEiuVpP3kJ0J57apIBMCyPNCmEs2Qr5xGlFRNw
         fY51KY1k9e/fKaQRWTK4iWxNJU/rp4j2wIkz+1KrLm4IDetSX2trBU0t+gorvgdM8UsX
         vtQkRsBiU2EliSL7v1fYDrgafuvFta1a/+QYqc2x2Esbm02OV5vkaXDv0yG+vkKtWT//
         Uiyw==
X-Forwarded-Encrypted: i=1; AJvYcCVk6rnoYt80//FKtL+7UXczOcEJ3Ta/z1zVsakoT9meLC2xI3H6ulOGTXZvL49ztkAXmTzWIBU5lXwMtBcSOvi9OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQO7Z570GDgNyFJAhWRAWE9NE2D8dDtKWGA6rMrb+AiBSEYMzt
	YWhr4PqHXPFXLzLoi+JU2UHsjid3jdelmOZM0KZZxIM5y2vfnIjGXELXYYSxp/P7pGU=
X-Gm-Gg: AY/fxX4QQPsWnHNDsctuKp9BPS4sVYpI+VM0eOJEGx7b3FQH1/U3yTHybaEBl10eaLj
	OrtTtgucqdP/snmtEywv+7ir9ZDizJ9JwSoFabA1L6jI8AKLVrBCbL7jq8GNrb5uBBzRpEr+jep
	a2TO7JDcizt93MSQVpUETRLzwUVTgw0Lil4blIbGOaspBGwyma/wmiq7xLz6f7iwLgNp2gi5SmK
	ALNxQYp1cw8lqS2CNJVnIvNWqAfK60BEkESMaLbeCBR1hcC/cpQxoWfaYsvjhxJ7TZ6hSxujb/t
	BErz1ioSnbe+CCgstGV55wL36/+sYrk5axb1z8cjMnRGCr/7LpQa1bj65TGEjP3G9E9brTnzug6
	PVbFvRy5awUdPDP5WETFqIAXqcvb3z7CG1yvuXFhHdc+UD/EVySzrg31DTuzOMfJrDT+muMCD7X
	wmvbuBG8vF+nYx/yo7kx4cwaQS72cJjzhyQZ/5YChOeMO7ToZLLrLFTd3xsQI=
X-Google-Smtp-Source: AGHT+IGj/dT37mQ7xzmWZl/25iPsiqiMwALZWRQlZVoi5TrCQGYlh/CEd4ZzopVDXcGImFXchkvhsg==
X-Received: by 2002:a05:6122:f84:b0:55f:f2f3:699b with SMTP id 71dfb90a1353d-5615be1b04emr3159007e0c.11.1766401117670;
        Mon, 22 Dec 2025 02:58:37 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d15f5d4sm3249621e0c.18.2025.12.22.02.58.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:58:36 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so907300241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:58:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHT+f5c+OpWfqV9Hy67y8XYrHo1kQ5Sc1c8hd4rG2R6A5nTWsndzLl37oCqM2klHlJftkqrCuEvF4Xscvb9PNNNg==@vger.kernel.org
X-Received: by 2002:a05:6102:fa3:b0:5dd:b318:8a6 with SMTP id
 ada2fe7eead31-5eb1a656bf6mr3126682137.12.1766401115588; Mon, 22 Dec 2025
 02:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com> <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:58:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV52FEGdW3Jqtn_=yhZ8h1hf5h9nn8d15Pkgmq7VJwnSA@mail.gmail.com>
X-Gm-Features: AQt7F2q0YOJcyHYc-yKCfd0Zxy7zMhTJdHjRwxfC8lQ_tc7MS1WxbilS5iTx4Xs
Message-ID: <CAMuHMdV52FEGdW3Jqtn_=yhZ8h1hf5h9nn8d15Pkgmq7VJwnSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states property
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 1 Dec 2025 at 14:03, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Josua Mayer <josua@solid-run.com>
> > Add mux controller support for when sdio lines are muxed between a host and multiple cards.
> >
> > There are several devices supporting a choice of eMMC or SD on a single board by both dip switch and
> > gpio, e.g. Renesas RZ/G2L SMARC SoM and SolidRun RZ/G2L SoM.
> >
> > In-tree dts for the Renesas boards currently rely on preprocessor macros to hog gpios and define the
> > card.
> >
> > By adding mux-states property to sdio controller description, boards can correctly describe the mux
> > that already exists in hardware - and drivers can coordinate between mux selection and probing for
> > cards.
> >
> > Signed-off-by: Josua Mayer <josua@solid-run.com>

> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -106,6 +106,11 @@ properties:
> >    iommus:
> >      maxItems: 1
> >
> > +  mux-states:
> > +    description:
> > +      mux controller node to route the SDIO signals from SoC to cards.
>
> Maybe describe 0 - state for SD and 1 - state for eMMC ??
>
> > +    maxItems: 1
>
> > +
> >    power-domains:
> >      maxItems: 1
> >
> > @@ -275,6 +280,7 @@ examples:
> >          max-frequency = <195000000>;
> >          power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> >          resets = <&cpg 314>;
> > +        mux-states = <&mux 0>;
>
> On R-Car mmc/sd mux available only on SD2/SD3, so I guess you picked wrong node SD0??

What do you mean by this comment?
AFAIUI, this muxing is board-specific, and not related to the on-SoC
SDHI controller instance?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

