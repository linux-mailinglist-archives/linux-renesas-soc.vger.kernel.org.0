Return-Path: <linux-renesas-soc+bounces-24970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A829C7A84C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C43B334D362
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA734FF45;
	Fri, 21 Nov 2025 15:14:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFE34EF07
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738087; cv=none; b=anIfr/AxM1yYeBYEDTdU9VEL4FcqN8DKZp4KPGhQ4mZOHaU6tAQyXDq9fujHwgKRsjba18UCfG8B/shg6+sJxjRxXxUoalQDaQEOlKCsj+Q2lL5+ZMT0YmXZEMlwdnJ+IBnQ6dR/XYWh8si/M5FE+U8HNmjryP6QiWwAYGBCQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738087; c=relaxed/simple;
	bh=RpuNqsSj7Kc56XlifgXqnEt5UzwwZYKGCkCdReC7HR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln4heRMUdOmtuIoD0NxR66ab8LpfuSNLAOR7JRLIbWRCHv7LjDulgxcNkerTEz3Ew+K93GEFj1ng1VEMI0LjLxPq5+UZgZqSH9zWh48S+qMuqElydB8O/PBhbhP5gDTCqqUcGf/hgB8v+gtsbsP7l35J3sybp6wXxX8HLCQnP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dde4444e0cso729866137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763738084; x=1764342884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y56A9w+ayETztMmsAhsdSXSsWoHRaLyp5EoPWD48iM=;
        b=nxcdN/9w4JKmNpfJEZJNjc/CP1QSkgtUsVAhp2DFoIlWILxj3LvrFRGo3b+bJ0qjrK
         2Yx1nvf1sws5momOCDGDUX2V0HBMel4Ichx3Tf4rbrUXkqgK4Pt/obVZ1Qjy8N1YgNp3
         +K/vSxE7OaTesMFmwrkDHCH4nYnMWvQSTcvcNjAzsJg+qCAsG3qdLsc+aYqA9bL/N6Ku
         lkJFx3HWHchIAppRjL3+5oimOstVUtgQQhcgflee+1w4qvBBsp3dD3fPc542VHj1DjrZ
         a+FlQokDR6eVpqNNbpmNXTfFQDbbPjRR8tPEpg6PPBFbQr/OIWLHa9eCHsnAwVxlgh2F
         8bLw==
X-Forwarded-Encrypted: i=1; AJvYcCXRPILqf2U+h9GIXAJnTaHHWW/LD/3mvbKBzny9/nobUyZLYTCxntLYKQ7RNiLD88yTL3ZoKI8VTZoaTLrSL2AZFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXOivE2MQiXOJC3YO+w6CD2vvob+QHtRzlBOKi5Z423HD0ijI
	qH5UYBNbiQwV80e00URl8eBIVzSw+snx8c4l0Qa/Se8DfMdl/3iEYl8UukRQeJkW
X-Gm-Gg: ASbGnct/7/UOyvYdSgjanlmz5kg7+hJdVSzcO+2k3/geLgUo4sBENgbO/hkXh4xS61m
	jPMQGuHsF2N2DhZ4l3fFL1d3yFVSJ/OBWu+nn0SSdOtEuq/lpdz8x3yCv9FFsJO+sXce3zjzqCn
	KRsKtNHyJHECjoSyWP5eIc5bGTVUL4VcnP/uhKbfoY68spCLph8dJZXRai2j9x8DJByniZ8KQph
	sukypayHZrohGLG/JbfBzAX0KjlRSMWp8PtlbtnKkHqQGvQpz65/3Z0KkLpQeBKGOL/3TNV+oGf
	bKHMkIxR9NMMM4ZpTIa/ihB9GxgayH7LxmTjaTmwdzV064Ib35eLEnI3VBpkti17xc3PdfLC/3c
	uVssFwcHbLS8KqR9/ZCQ8St7ue8JO8QloyFQFMtIL8r8RjKy1CUWTXu1+omAVTQD6ws5V48jmwu
	TBIH55EaLlagSp3PQoOF3iTyvJsVpTASKxqHtMqiyYgCG88lj8raXartIilb+S4VY=
X-Google-Smtp-Source: AGHT+IH4zJZMdetawWdEyqRcqPWOg3utiedhq7Rjna2BJBZGOMNvWrsRb21gjfQbwQbzRdUDIJKMdA==
X-Received: by 2002:a05:6102:808f:b0:519:534a:6c5e with SMTP id ada2fe7eead31-5e1de2d11ebmr845459137.33.1763738084230;
        Fri, 21 Nov 2025 07:14:44 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd8eb291sm2242767137.3.2025.11.21.07.14.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:14:43 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-559934e34bcso603134e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV98yVs3xDePKn3vRgv6lZ/ydBOLCIHzijgJ+phQ3mxDN5coMyT/zStL+nnDgrZNzyCBbRIGMy4rdZ8BQ5p1uR11A==@vger.kernel.org
X-Received: by 2002:a05:6102:5109:b0:5de:6dc:2296 with SMTP id
 ada2fe7eead31-5e1de2cfa42mr755696137.31.1763738082352; Fri, 21 Nov 2025
 07:14:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 16:14:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgYD2wfC3Z=3CAR4KVaMh_hMe09KEjg+NeEwu_DN1i5g@mail.gmail.com>
X-Gm-Features: AWmQ_bmqxyLYxYHgTtODb61giIoyovXVZpvdWPsXqQFHa3nh7Q7VbXNAXdTaohI
Message-ID: <CAMuHMdXgYD2wfC3Z=3CAR4KVaMh_hMe09KEjg+NeEwu_DN1i5g@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 14 Nov 2025 at 11:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3E RSCI tx/rx supports both FIFO and non-FIFO mode. It has 32-stage
> FIFO. Add RSCI_PORT_SCI port ID for non-FIFO mode and RSCI_PORT_SCIF port
> ID for FIFO mode. Update the rx_trigger for both these modes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -8,6 +8,8 @@
>  /* Private port IDs */
>  enum SCI_PORT_TYPE {
>         SCI_PORT_RSCI = BIT(7) | 0,
> +       RSCI_PORT_SCI = BIT(7) | 1,
> +       RSCI_PORT_SCIF = BIT(7) | 2,

Oh no... Anyone who can reminder what is the difference between
SCI_PORT_RSCI and RSCI_PORT_SCI?

And now some RSCI IDs use the SCI_PORT_* prefix, while others use the
RSCI_PORT_* prefix.

So what about renaming the existing SCI_PORT_RSCI to e.g.
RSCI_PORT_SCIF16, and adding new types RSCI_PORT_SCI and
RSCI_PORT_SCIF32?

>  };
>
>  enum SCI_CLKS {
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 78fb3b6a318b..66ab85571230 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3326,6 +3326,9 @@ static int sci_init_single(struct platform_device *dev,
>         case SCI_PORT_RSCI:
>                 sci_port->rx_trigger = 15;

Hmm, why is this 15, and not 16?

>                 break;
> +       case RSCI_PORT_SCIF:
> +               sci_port->rx_trigger = 32;
> +               break;
>         default:
>                 sci_port->rx_trigger = 1;
>                 break;

Anyone, all of the rx_trigger setting for RSCI variants is futile,
as rsci.c does not implement sci_port_ops.set_rtg() yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

