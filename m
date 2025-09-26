Return-Path: <linux-renesas-soc+bounces-22410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2ABA33BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89947383A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD5F29E11D;
	Fri, 26 Sep 2025 09:50:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C928E5F3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758880212; cv=none; b=IsHADf810Ht3+P8t0vnKU/RjAnqTtIS2ziMlKhIuPyaAxrlX8/RS539JJ6ybIykkkfVS8Up0VNYDqJf+xI5NkiR6Muq7Rsl7aDSV1w16ZFk+BW0RxpQGPqZ6F4MM8XyjKzRJk602WpmCLLWkG7lhHu58FkK1+snaC2jnigvB+YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758880212; c=relaxed/simple;
	bh=9MP05zHbL6Vtrf5lONjgCVq9CWhR1Q+9cXrMd2Yezk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBPEIf90goQSZbgInLVdYvsGR1Lx625xF6t+E3WodOHsu1C0RBJOHZ6iNwg3tgYiWIBHYz1P3XVTnPy+piNKeWqJGWBsdxbUkBMY7D/sdfTkzrCquNZEAHPh/0Vv6MXA0A2nvd1ccT8ycEK7oS91egb1iNBH++HYqvaj/lveLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so1142733241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758880210; x=1759485010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcBsC1askobQesMf5dT3EOt6tZwDclh2s0/BCRcco7k=;
        b=wR3JB4GK7I2VNuDQtAQeD8bNrxCW1aBCRjtI0FeNLEPBuljeDATVkse0Z4wSWzURxK
         abR2v2ubzmD5azmJhcfiYBSbACFxhjqag71GwFVT/b03xrjFdpYryLOyC0ezgLiSh5e+
         AsveF4HwTvlYP+UPaEd7LXwBgyP3ZUQ1S0QP3A4aA2Bh92HLb4Pdrgi3goMV8TS0jWTX
         X/+76bgNYtQiPb2Z7IOZFXAyTIrrKYnkH+9pysjj/Ym4QxRt+jQUH7jGgJ04mUYokISO
         Dl/EyKlT7YTMWDifJolH0mPspnt1s56uOdezWfORIEjuey8Vp0gLDBO+MtYZ/9fpaebl
         dsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC3H87/vG7IAXgz8fIzRIXb93Nk7m9kywuIqxO3GeD6cR29rIbcGhQsEBvwv2U6j4AcVFTHivr5IURlVrfgWOi3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Y6pOYaWgEakdjFZDh6DnOUSqXaWfrrSdVCzqmG47zS8NX5du
	9/eQNAUyl9dfj+JmWx7yJwfarZ6zdnKLUBN9QlpA81j+LcZQlEVVyqft8Bc/mp3w
X-Gm-Gg: ASbGncuahIKduViVeFt3OwnONcUn43F0LQNgvlkQ2kfKnxVIwAo07y5MI5yNjH+kCcP
	OBepDwj/9INnGmNbFQ3bhQOqQBsJ25T5ZmRtCn9EW1+cNQMzz+MHjtnhZneHLbTd9MX97mDJhGT
	YGQdfEBKoTAk/OqQn9UhhPiaplZTlXPEUwsEHE89CkeSpy/xCPV8Sv6aXRXYA0NtCVBY/FqC3tt
	wHGiF6LGZJZ+4AXanrigHK1NaqXlNPPIlNiEqRGgCMczLe9sEz49BbeXaqOtp4Gj9k1e3Q2cabF
	r99VNDOiZ2y4Zvvaq0xRUyWLs5zQb79ckKTmxudNPoo7/VplkPx/f9Ieg4/4DyyBOCYPWaOF1VW
	tdzT4prhUXuy/bkYgaTMVkuhMP9cmlpHSawfaGjXIsXuiPX1nYz7Zf3tFl6tpqyuC7sZk9LGrJB
	c=
X-Google-Smtp-Source: AGHT+IFCKJI5+Bl6u7SiPLG4vrDckd6aYIDxCxEbif8QNbvOUXzbVVxpUYwQpSIZwchL7TWh7RfnLg==
X-Received: by 2002:a05:6102:1452:20b0:58f:1e8b:a1c1 with SMTP id ada2fe7eead31-5ae14991836mr1931743137.2.1758880210057;
        Fri, 26 Sep 2025 02:50:10 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916dbc64911sm830268241.22.2025.09.26.02.50.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:50:09 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54bc6356624so2102365e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQfACdRvbGHcPgOuN+g8uwgQ5LcMdI+KLEYUZs+EcPO575ACzKICcjcwxLqIDNQYbAyFiKggA8K5dylIDVqnUWhw==@vger.kernel.org
X-Received: by 2002:a67:e098:0:b0:59f:54cb:205a with SMTP id
 ada2fe7eead31-5ae1f222b9dmr1619909137.13.1758880208278; Fri, 26 Sep 2025
 02:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com> <20250912122444.3870284-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250912122444.3870284-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 11:49:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn-sd7CXgxRzwfHQFUUxzboyYP-2eqSTaVgmh5hjT_xA@mail.gmail.com>
X-Gm-Features: AS18NWBXsS1FJ_qFsvTSOsChWy-NgmX0zNmCcExyFfSBImph2esks2SOJO6KK2A
Message-ID: <CAMuHMdXn-sd7CXgxRzwfHQFUUxzboyYP-2eqSTaVgmh5hjT_xA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
> support.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

