Return-Path: <linux-renesas-soc+bounces-25067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C9C809C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 685534E13DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 12:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEEB2FDC3E;
	Mon, 24 Nov 2025 12:58:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A2381C4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989100; cv=none; b=BNV7UTccNDL0nx6n7X6rpPSDMLkRq2FQxW+cRQ2ZYc8WuUeUzISCqFt3yBZc8mVfg7Iq5/w1u5KO8qp/NjUSo0u77CPUYdVp3J84AR9+V7mRi1NPkiXi7qGuocAJprgtgJt3qbIqumuSvG1Z7YTBjQbPnIKzWCgwndrdpZ/3cmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989100; c=relaxed/simple;
	bh=juEwwBHwWVxDO9we5PhqbI1FUp9575Si/nd6yLinO7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/k+f4FgR6zmursux7gWUUwnpHNn8E/06jL1UtUs2uPlJ7+MssRilvHMvmDwsMYAcXB5xoVCeNn4ZcbsdrEa/6qYsDYjHCkvTzyRBPSmT8S1wA36BY31l35M+pQtIe6zkMB7EnbbhyeiEK0E8MIsB28QiGStDQB3RBsDwyWoYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1529218137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 04:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989097; x=1764593897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6ZohreewlB1g3ntJmej8PVH+g85TvJ2XqeezukQsPs=;
        b=h0vbR5UMDp/DTatWDzjasMRM6/5/J9EQV9rrS2536Ys71PxqlVZOQqnvFSkBk1jgfz
         IYUP0fRG4Phng+fSMRh3yk3bC840U7heGmdmtY/2JvmBMFM0DSHRxdq61oX8vgLHDATY
         EK+6cEo+97zV6LmCT97EmnX8a2UlFhr5Gm5mCH1prg9hmSzNMWRdj+GLdcIs6UHSZFgZ
         WsE5i7MorGvV58CcyRNvA3Stlgmwo8OxFxuUhzHr9PAtYy3mLDfxndHlZGqV3YIq8TS+
         PFf6D4JRQBju3E2hCiw5xXM6hVJm1yVcuFmp3uQTOAhU2ZONwPASALE5j3XE/P7ao2ho
         0CNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnNASjDOu71JimfRdxoGcpVFlhU+JWMIwtjepFu1C6RAYF9o0PZ/+ZrqHLAzXUwRb/zow0tGq1lZKBlFaeWVAqSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyZHhZ46B4WtwDUOvvQZW/RRaUZmYeeRY3WzlFm2D5Oh0OEVv
	6Wq/m8y5LKPS5RMhsyGCMQ24kpr8pJDMVMuaNh10UECv36uIwchUuCrUSCYxCzZ3
X-Gm-Gg: ASbGncvy9r/3i+G6ZBJ4lR+yh+B19f1tZQ8ryHPBjPGRcZX68quYJ8S6gksSTHZmnMh
	6/lDUG++EFiNT4YclYEpGTG925GqyQUKxUNLdvGyeGe+7ufz5BaQJeY7Y8LR4ehFYOLBChOxuOY
	0lNLx1Q1p9tD9B6nmKqYdtZ9HNVfDA/VMRpk5n7VHJCH/4slWUTWmtIMAovRnliLRX6wea9A5zQ
	bziD7Zh8B8oG/SMETg26iOiViskm++goMM3vZ5g/UMhtbrEMRiBbVJikEA7va9U0y7jQxsfd0eB
	fOE16GrHpf0Kn/Q5TBqAhIB9/wHQeTb6xJ5cYgRm6+fZlh6TROoQ9Y2pF3aBGjmoMnL6aMkVKNj
	DWX0HTZ2SHNMw0zDBmabFsh5rRJyNlqRGPCCi0ecvSxS9HZsTMcBXDtOBRvi0VYNhI4qtm+G56a
	iuouXoYHd6DPxZJYZduz8nGzb2jmVFoFUOcVe9BXI+0OBuhI0w
X-Google-Smtp-Source: AGHT+IHb9I4GzPz7aLMoHCmD/p0/uC9Qt+fayw6ENmqT9jm8DR8xnflgpT/eZl8pU995gR3ATZ4Lrg==
X-Received: by 2002:a05:6102:41a5:b0:5dd:8819:e68a with SMTP id ada2fe7eead31-5e1de3a6b22mr3159682137.36.1763989096971;
        Mon, 24 Nov 2025 04:58:16 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd27f22sm5074167137.9.2025.11.24.04.58.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 04:58:16 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dbe6304b79so1588750137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 04:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrsRkNLLTxcebyO5TxU748AfLLr1v0DLU0UB6Y7xfeFWaGaSD5qWGhirTnej082yn8vXnkuV0i20aUNdPQm2jZbQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5e84:b0:5dd:83de:badc with SMTP id
 ada2fe7eead31-5e1de4050c3mr2748242137.38.1763989094662; Mon, 24 Nov 2025
 04:58:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-2-biju.das.jz@bp.renesas.com> <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
 <TY3PR01MB11346D401362BE3B37564C28586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346A0864AF1CC5A3807E40C86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A0864AF1CC5A3807E40C86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 13:58:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwn8Ad3OYRX9jB-gFKskmwYwTna882d4J=28+zra=awQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkJ9yYGno433AB6_f4xArSaLX1y3Xoz8TuybuRBTCsS8wWuv5G8ykFxnzA
Message-ID: <CAMuHMdUwn8Ad3OYRX9jB-gFKskmwYwTna882d4J=28+zra=awQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, "wsa+renesas" <wsa+renesas@sang-engineering.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sat, 22 Nov 2025 at 15:15, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> > > > Add documentation for the serial communication interface (RSCI)
> > > > found on the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC
> > > > is identical to that on the RZ/T2H (R9A09G077) SoC, but it has a
> > > > 32-stage FIFO compared to 16 on RZ/T2H. It supports both FIFO and
> > > > non-FIFO mode operation. RZ/G3E has 6 clocks(5 module clocks + 1
> > > > external clock) compared to 3 clocks
> > > > (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
> > > >
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > > > @@ -10,17 +10,16 @@ maintainers:
> > > >    - Geert Uytterhoeven <geert+renesas@glider.be>
> > > >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > -allOf:
> > > > -  - $ref: serial.yaml#
> > > > -
> > > >  properties:
> > > >    compatible:
> > > >      oneOf:
> > > > -      - items:
> > > > -          - const: renesas,r9a09g087-rsci # RZ/N2H
> > > > -          - const: renesas,r9a09g077-rsci # RZ/T2H
> > > > +      - enum:
> > > > +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> > > > +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
> > >
> > > I can't find the non-FIFO ports in the documentation?
> > > Do you mean "Selectable to 1-stage register or 32-stage FIFO"?
> > > Isn't that software configuration instead of hardware description?
> >
> > Basically, it has 2 modes. FIFO mode(CCR3.FM=1b) and Non-FIFO mode (CCR3.FM=0b).
> > DMAC can be used only in FIFO mode and there are some hardware differences between two as FIFO reg
> > block is applicable only for FIFO mode.

Still, sounds like software policy / configuration to me...

> > It has to be either a compatible or a boolean property "renesas, rsci-non-fifo"
> > Or something else
>
> I believe it must be a compatible to support non-FIFO mode from boot.
>
> I maybe wrong. Please correct me, if it I am wrong.

Why can't it be configured through e.g. the rx_fifo_trigger device
attribute, or some setserial option? Any guidance from the serial
experts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

