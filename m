Return-Path: <linux-renesas-soc+bounces-24572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16DC58680
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F1463AED60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EDF2F0C7C;
	Thu, 13 Nov 2025 15:05:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7512F0C68
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763046333; cv=none; b=Ri+9jQT5u94qiWlfz4OpjjHV18Q7B+X99gqUZMV8kwMz4nAr3SEmOaeBiWOYmTWpgg3sB9yv78erREtS07YibwBWJEdPf6wfneKYtXCqIUPPGsIYFg/xMq5xFBAMh6nL/yBgpumL/Cbu/AMe87Q+cdrzN4FPj6D5qOb2A3yEo80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763046333; c=relaxed/simple;
	bh=OulVxmqHukNU8jDi3wbWx/yy4OfpnoJmnUbmnzZwvDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1E7d9JAvWaHTunOHjFkvIBCNjbLDJLzE08kYWgFe1A9+s+MxEyPlV6Etz1iX0CYlLFQsXhyExoHYHKF7983B+6Q9t0ldwnuzsD/XS30/PVnExj26xNsgm16sznMqHLZ2ya5oXyNJG9AKWmJ9TnVTIOWSE8Q2sL8kCKdoBQmleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-557a56aa93fso176744e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763046330; x=1763651130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwlUmhYLedxffSiGPT0olVCco0Fmu8rqsu17IPvjiOY=;
        b=bCQeMjcRqYlQZ4I4UOa+lSRubdNHCnau0d8SUwlusWfW70+pj2dCEh4oVDtLlx2m4X
         okG14dymNFq/7NQQn1J1I+/3ecHBCO7VgP0/QjW2kmh3tua5XXTu8UhsD1BxRiFRHwJv
         vi3PEMddV3Y4+CJy+OsJMdBPNmVGgMCHZqAJatRMf+oR3u5e/QDFyfgZlPTKB963jMrC
         92c8p93j3vH5u7VnwlUZB7+aQbmOhYK6w5aeSyJAUog+RlP0Nltay9EBQqRY3NeZXA29
         DrNzgOPMz5J9/thm4FceH1N3uNh6S+nUXLaz0siGlpIFxRM77HyaGb4bymUfzclirI+v
         e5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWas1UNfH6hYdDzAWQY9+wfu4D+gKdeO7QTHS+dduCKtIHKw1+tRYwsAKt2/tEUGhIpUHBccVK33e65E5FEBm/PNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiog2N/SybCcuR6vKxbloEv804Eo0v+7SQsB9XQ3ghcIiFHd8b
	hTikaMsmiX+P3qe/3eR5LxEEmGvdCjASYlU30tVpoIgMo6pdtPEFo1VzQmS6k4hNu3E=
X-Gm-Gg: ASbGnctCPEfHZ2pHOyIHlMUHRZszksStFXByiZ+BP4iOtJvPD2/Pjf72DwU5dTk+mZY
	U0NK3N+WSyKgnVyv15Nd3w9qE2PUGrcAdmOmIY8tSQeoPEPySIRL6EG525wjHJMxT6CC/vlnKdO
	MWURToRFBmswLzP3uyp2P+8llDDw1e9HXGjHErV0AzjOKtIQZ2ld3amb2kjQ6oHxoIwOnx2PHDQ
	AjSi81OwWxH6j8oyMX2O3OK5Xkvu0QCm/EYoUULRPZfqCOOD9O8mloX5wWX1iptdEVSqzw8HgMI
	p4DbZxXzms3IQTXd1qB7v2eRKylft7GprsBtu76YKATazKcOJqYa5VsrpjGkFKc9d07Zk+v72hk
	UcZypIm+PAcIMXKHDEcYStxxEFUIasA29f25TDGFLf1Ea1lkpzsoXDot9Eo1HaPJbiv0SskC13P
	hETSvVVlnhHvqDdp4wqK9qMyTtl+pYogwK6HCLGw==
X-Google-Smtp-Source: AGHT+IHUVVDbvI7s+jtXdVjl776MaH1vWqyTUh8Mwb/0nhaBtG5z1BDgwjwUDC1D6bzVzX4lZ4+BpQ==
X-Received: by 2002:a05:6122:3113:b0:54a:89b1:2fbb with SMTP id 71dfb90a1353d-559e7d4c4f7mr2935051e0c.11.1763046330043;
        Thu, 13 Nov 2025 07:05:30 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f499b5dsm837752e0c.24.2025.11.13.07.05.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:05:29 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-937262a397eso270785241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:05:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQO3Csqf1fZ5lmpunTK08hS0kZrGC+y4i/qCaSvKaRlsCaczpwN+OHDuD6IHvFrl4f8zXQRQIk7iLgfXRo5PwJ+g==@vger.kernel.org
X-Received: by 2002:a05:6102:498:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-5df098d049amr1727150137.32.1763046328910; Thu, 13 Nov 2025
 07:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com> <20251023135810.1688415-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251023135810.1688415-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 16:05:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaB15yLcGObzF_zuNKSqioE4ktD_u4xkJ-YJuQiD4fdw@mail.gmail.com>
X-Gm-Features: AWmQ_blisT-axhMgcAs5oMipnI2iYyBHU5ygZXj2OjcwlBET81JTXEQGhpMKWtU
Message-ID: <CAMuHMdVaB15yLcGObzF_zuNKSqioE4ktD_u4xkJ-YJuQiD4fdw@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] arm64: dts: renesas: rzg3s-smarc: Enable USB support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 20:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable USB support (host, device, USB PHYs).
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

