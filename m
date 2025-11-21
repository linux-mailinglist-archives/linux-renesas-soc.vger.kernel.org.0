Return-Path: <linux-renesas-soc+bounces-24997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5FC7AD8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69FA64E7A5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209E234AB05;
	Fri, 21 Nov 2025 16:29:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3D3446DE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742541; cv=none; b=sKcrqySAlCtDalAE/IaZ84H2Aww7ilLjTxHNtojJdhXl6TZwJZPSWJ1/pGOZvXOsv7gz+y4NE8lt9PSrDbUaq44k9NFpkI58SFPZuoCMFGWws0Yz1XA+ovaYJrwX83RPsNgiudKknNCHOcAXWNi+Fghidvzs8vRj2BLLZsLa7AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742541; c=relaxed/simple;
	bh=NWw8ik16PpwAnJNwq8h3jV3Uy7b4CaBzlirDZLOFbQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+ML3ojMIk5y8NGdvlmZ/pE+8iFvzTlbaUxMRxbHbzc5ARC/Ma/+7qXnynoE5fv8oTyZ2neqlrONl6RCV3Z7ecDYZ9eMUZ5oAIaYYWWisreMdKIhngGdPGED9ZLBb1LgkF9kV+meZFgck0VydFiT12ZCIDVrGJ5tf6feNAVR9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfd2148bf2so1135723137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742538; x=1764347338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA6je4+07ukFpFFywGC1ltUCAr/0ji7NhVbYppEStBE=;
        b=iiid4ShZUs3KJ0zeIOE/4A7lCTb2JqeferVQjOfgpr5Mb7IYluGdynDFQbNtil0bvf
         epqNFy9jyAsE64zKoXgvku5TXZk4JgQIK1qopgcsGDNXCFkzmcoWURJAXdEefUU7Socz
         uYkTWX+TA9EH/vkKmXBl4CD/DixJA4CjmNPSwG9c6sPwOhspQvFwqIOaYmB9oJ6aYrVm
         GddIeva70PkVri7SVK4WaUpeODMYdDtLUFjeMGhYWk2tcAUrxmbhG4X8VMYSDHHpLNse
         Am3gUR0Ggb5V4cqqp3loieJkw+MO9dAjm0UqPpXIMQ6PKxl90BMXchvUzNwoCC847KdU
         hiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSnU9ywN3eUw7nxwvh0qPA1ijdqhe/rK45h5EImig2ZO25pGgeW0NaGdw7tr0Xe1vKQwFqbl/+fAEedvNeBBxWIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEtLl3GR1pOVSVseHtLa4LiwguxX4ZGBLbpbEJGrF2JuSBCDS3
	4OZvlYuyj8iOb7nqoW8tokbOmLEAidycW/rv57jYSEhLrTfwNpB/um4kC7BwfjCD
X-Gm-Gg: ASbGncv6wxi/109b+rk81rYbBZHj9lSGCsj2oixHowdQ4RchD4wwrnZfUVuGsphRfyS
	EQzAoWSem1jGoQz7Ka1YJANvFUWOO+aHIcdQjztVC2RWl7j7slOL98OeI9wEpvJrIS8o7g8LJ1g
	Gm4Jf8v2ByJu37ET3KKPKyQ6KSH6Y9Nbi50KY5WfpLIS8RAIVdzBRlpW7WwsONTSniSci3hOq4f
	JnWksRsTUNyQNUCuTpwd5Ok00jUxXhbLc6vHdMnOpp0UGLo+3xzjnBNOr7JuSMgWcRLB7qYJFjP
	j9qridUauphPo+0t29CgaSruFVftnIE3mmhM/DgoWa30UD2XcxN8EKSGu2NTLWw60nQdhy6iuqo
	XtWEU/daSCFz6q5vI1KXUH5GcOilNM3YgYqDMLdZQ4l7uF1NwwiT8G3Lpk0ehpC0U+N9Y22HmYd
	5/N0PQUwDj6SexIfPnHf499lPikxPQTidBiFHglpm/osT2EhHBFA892wXRpeg=
X-Google-Smtp-Source: AGHT+IGnO9HZB6lMNOeuGwwVwr9La3dF7MMx7t9r24wfgPYcKdlLerRU1moX7mri5rL8+Ejtsxbu0Q==
X-Received: by 2002:a05:6102:578f:b0:5db:36e5:7b41 with SMTP id ada2fe7eead31-5e1de28c305mr1108359137.11.1763742538216;
        Fri, 21 Nov 2025 08:28:58 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c561c50c6sm2437236241.1.2025.11.21.08.28.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 08:28:55 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso540281241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:28:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi7DYYMo/RsYtSnhUnWWGPoDXVGDwxeRYgeJ2qNrXGVE1TQAgHAgi6re1OD5/jauSuEF3hb9dJk68LeUQ6S58XXA==@vger.kernel.org
X-Received: by 2002:a05:6102:5345:b0:5db:f352:afbe with SMTP id
 ada2fe7eead31-5e1de22445dmr947156137.6.1763742533900; Fri, 21 Nov 2025
 08:28:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 17:28:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
X-Gm-Features: AWmQ_bnV2vaF4HR2BzUmue1a6MqXZNYW6rPMe3_j5Cfe-VvhmkJ46vgiHI0AFsM
Message-ID: <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -10,17 +10,16 @@ maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: renesas,r9a09g087-rsci # RZ/N2H
> -          - const: renesas,r9a09g077-rsci # RZ/T2H
> +      - enum:
> +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode

I can't find the non-FIFO ports in the documentation?
Do you mean "Selectable to 1-stage register or 32-stage FIFO"?
Isn't that software configuration instead of hardware description?

> +          - renesas,r9a09g077-rsci # RZ/T2H
>
>        - items:
> +          - const: renesas,r9a09g087-rsci # RZ/N2H
>            - const: renesas,r9a09g077-rsci # RZ/T2H
>
>    reg:
> @@ -42,14 +41,36 @@ properties:
>
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 6
>
>    clock-names:
> -    minItems: 2
> +    oneOf:
> +      - items:
> +          - const: operation
> +          - const: bus
> +          - const: sck # optional external clock input
> +
> +        minItems: 2
> +
> +      - items:
> +          - const: bus

Figure 7.3-1 ("RSCI Block Diagram") calls this "pclk".

> +          - const: tclk
> +          - const: tclk_div64
> +          - const: tclk_div16
> +          - const: tclk_div4

Perhaps reverse the order of the last three, for simpler handling
in the driver: each successive clock divides by four?  (yes, I know
SCI_FCK is not immediately followed by SCI_FCK_DIV* in the driver)

> +          - const: sck # optional external clock input
> +
> +        minItems: 5

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

