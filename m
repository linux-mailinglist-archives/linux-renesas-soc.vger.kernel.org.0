Return-Path: <linux-renesas-soc+bounces-24980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2AC7A83A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A023A43C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B74B34E779;
	Fri, 21 Nov 2025 15:17:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531B2DC790
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738257; cv=none; b=Phe8MabMAI0akvteFJ/IBe91KQ4rPi/EwujQrPiyo3a6cohMEkkRqfkl9h68pQ/aiwASAcyFeVxzB6F2EM5LhzTpE6zAURK0e0uGIVLddVuW1nGPjJlQB5c75ws+XuH5AOCtFlBVECdmaAik+PSaP/ml5XcYYiy4pl1Ld2Riy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738257; c=relaxed/simple;
	bh=5eBeEdjkR/Hkm6+xplE8icfNSmSd/34vcdQdGK2qte8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugAtqx3PR7xgHYIYbKFy38sUTskyVS86q9A3mNKbj1QrZkTqNcZoPa5MAOp2xx5BuLKg/BLDUarRt0iQVfUI/JsUAnc8SeLFSQ2qmtlSxzBF3AdEqUg7tarbmpGdVEO8pdRk67jCxjBvkeGUe7Q+U2VYs35WBlXOi6miuypb/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b265f5122so570389e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763738249; x=1764343049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIua8RfV2AxpUiobTVSq3dGuqkuUf86Fn/APkM2iKmk=;
        b=c+6J9G8WT1gSeEkTsSNSZ0SMeXM6YeoeazKxRZf0ym90nNAx0aw1TrIYXyAmB22SJB
         hUbaZd+pnX8xjPBECbpdEt8WrwMI/NU1V0BT8l9U/ZzxQbuELLOXEt5eeWZLB2Z+4gI6
         OOY5Y6U7wmgegwyTs79Ti4SWiEEOSC3ZUzyYNCB+rgjIpp8w2haKyvNFLmKzZaPOXSPH
         9BaY1kwF2CWBIFnrZPF2IfYUPIYUfpIDg6OhWQnAwyNFh5BSr6YSDfyEdbynFQuIR3Dl
         4zsP8ckM5nBl1wVZtNyxzwXiqFvjFHKnqnH9l4N1S3C1zUMuwwPk7IUUky/4UtujpJWg
         ld6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5hG62sF/cJ/A+NTWb1H4Mo6ZP5d7O+lQc0P0qDKve0aqA1LbaK0FP6awHFPjestHwzUNEo6YVepsKATV69ptVhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVk0lOjYJzim+xTCg5xea9rpowgNqQAH+1rFSmSb3YMtQF6lu8
	1p2QYFe+MxNubM2o2/hOYrEX/GdRXZZRLPrpE3UJ47hghzJkjEmrHFvXNWUX+syb
X-Gm-Gg: ASbGncth/s37RoRMEAQQffr0L/6c7SlqZos1i3BFOKoU56TfqReiCWMblc9+rwxtQyx
	nmFkj4eM+tqSie/KyCWGT0AEG3x5RP7p/fW0HDOYJVoi7Eyg9ekVQfK5lFItvk/Q6Z3Yy4spWsJ
	U20mT/1ZjeIu2mUqiNiLuutdXlt0I6YWaK0cHGrxei8VyuzKGtlq1V+9ul/WBJIlFd9ba3F8Xe+
	q+0o6c3d4Tj1YnhiAPQNYsVd6u5kgneoGEkJra0sHL68Ra8e/v1bSxIAi18QYv5zP0W2kwgfPVB
	xgmn4YhyWNxeyYbeoMXuI2F2fh6r/TzA6UVp/YCaaNhf4Bf7E/OM3jL3x8ZggQe0uVX/N+edDqb
	/i2iosiBOMKBc1XY1hN/7NIDIkJmJJgSY7uGQFi+k0XXR50cYEX+ujiLMtivNkf178tdVltH3Bm
	MyyL0ZQ3h4Cq2JXZLFqIAs5I2GvQzsmfoOfSA+ayN0xN7bzmcQ
X-Google-Smtp-Source: AGHT+IH7JSdLKP+Q7T7Nh/yCMx6AUPJEAnk/brpo+m1S39X0T6BxQyX/OfRmbZObxDfCDqcrOa1UQQ==
X-Received: by 2002:a05:6122:1829:b0:55a:2b12:8022 with SMTP id 71dfb90a1353d-55b8d6bb6aamr764477e0c.2.1763738248801;
        Fri, 21 Nov 2025 07:17:28 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7d462fsm2536422e0c.21.2025.11.21.07.17.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:17:28 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93c6628c266so362142241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 07:17:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDhUpOpS5FUrXhszjBx3fBBSiZlJKJQW+e9TvKrm2JEQHYeyRDOn9w464j4UbTqLOACfx+RSdhYnwtFjWJhiUmkQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:5df:c1b5:82e0 with SMTP id
 ada2fe7eead31-5e1de36be43mr798925137.32.1763738248035; Fri, 21 Nov 2025
 07:17:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com> <20251114105201.107406-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114105201.107406-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 16:17:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2bougdWmD1CpaKDKe0iVJD-H03qbNhhLgyfSpsxp15Q@mail.gmail.com>
X-Gm-Features: AWmQ_bl1HYrUoeR3tLvRWfUvLCultmhzxtsQnjvLxVOOYGWOny4VgM7c5de7q4s
Message-ID: <CAMuHMdU2bougdWmD1CpaKDKe0iVJD-H03qbNhhLgyfSpsxp15Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] serial: sh-sci: Add sci_is_rsci_type()
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
> Add sci_is_rsci_type() for RSCI port type. This will simplify the code
> when the support added for RSCI_PORT_{SCI,SCIF} private PORT type.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1182,6 +1182,11 @@ static int sci_handle_errors(struct uart_port *port)
>         return copied;
>  }
>
> +static bool sci_is_rsci_type(u8 type)
> +{
> +       return (type == SCI_PORT_RSCI || type == RSCI_PORT_SCI || type == RSCI_PORT_SCIF);

Would be much more consistent if all port types would use the
RSCI_PORT_* prefix...

> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

