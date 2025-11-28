Return-Path: <linux-renesas-soc+bounces-25330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B0C9273D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3563B3AA59E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 15:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA5527FD54;
	Fri, 28 Nov 2025 15:23:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82523EABC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343385; cv=none; b=P74HVAEE5MJqRHq/gFmqcCYZ2XiqvZbgUbRuccD66FinsKaUNxVQKqdg7X4/YpbZfABYjuax0UYpMyalNKjH+4m2PuXuchWGh6vd0SlKwq32GN9M+Rpyb3OmtxkiqQfIAcEVYnO4XTyriQ0SXvjBPOwKP5PWqyXk30jPfQhNdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343385; c=relaxed/simple;
	bh=xGb7W+NMwzRcrT9zxij5YLN4R4sOpAUKVyDvdKtijS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMBk2nZXvGPd8wmHqAemeAOD6h1OMaMbfAXj5fBKZ4Euf4JPB/zEk0iSIpOuSr/fjCeiGb217Pgq/FrkTEgzx0y0WmGXkPwPzjVoXGy7N180YGOZ2Phgd3m1MGVDV0IshLKDerKyZjn0fo9PS968b+0aCVvnWgZ+16N4rwsRhwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55982d04792so1431330e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 07:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764343381; x=1764948181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaRd9+5Gnqr9XLwdxnI+TeUBqhhaQUEYrbZmEOL5EOw=;
        b=FmmnH0e5PeRbI/dhgSDbn6tEn5mvnWVG3HTHI9qw2744imb2xy/LyQBWxuhk++reCM
         2AJmetxRaps8KSSfUYtjVduzEdqPqU9eP/Ku0G2FgsyWmBwv3CZjtuSl6kjkOuXbKWjX
         civrDHYQCiNkwYw+OHmM8jiNjrs5/974Xk9kS5C0AUbSJP/l7/sE88dQpDs5lbZ6LVz4
         lZ7C8Nkf0uXvi4BqG6arnww2vU3sPyuIHNqMiCFLXn9MwXerDXzKytVwriPsr5WoaukM
         kJaOdSfkpwarRAE6Lq3v6w8fbsW9RP5D/ZHlyl/K6JBEtntaFAxax1MtdhZWTk8qv8ok
         SlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqZKtXf6vMegU5X6a9tSxHkqTAvO1BXRrgfI4R6vts8y0XHTBpY01MZ8At1w8edfzjNN8vvtehlfluFMlhi+M7CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe08IUB8NU9T5zuu6ILcMGMw7os3VBkpWlf2cjqr5Rs0m5In+O
	lJr4+IJTF0lC4Lge3kTfYdr+S+QZWN6TNH31635athQPtrISsXzKb2KGf5XXrMvd
X-Gm-Gg: ASbGncvCFrj0GKrDcEhCHv9JmjHTMgGLo5vImAqHJe8h4dl29st5AJEgfYzrI6dukgv
	1cbdERL2PTlMx+NQH6Kb8ZDsk1ZGVHyUyDikhnuBXYwB7U3o0m4dyvic6XQa1O4Q61Qk+hZCyfm
	wOb0P0WwYoH+6lJCf9RZkBTEfIy/xtOT38xpoXVP01Cg3SpCSC4fZwg/HbPUYsDKQXfKUS/6Oce
	cq1MxnoBY0tfOzdnUKeGp0sAQQSB1mv20rLdnAQbiNy7RDEFIjAz7kSEmZWJTYJKvEVVbt52pY0
	LouMsRm5ZYrekzD5SC+ouWkx0XKvTSEpQ67kqQKsLOPpJUMMjtbd3jmJVoecA9m9VowXZN1kTJ6
	7sumYXZ/B1A0EdG2pX/qvy8LvvtLJsbBfP89GNnlNDmku8oRBrJvaQ4ddupGVCSXy2Q0IxktJ2z
	HpBapx5fz5XbLT5a7ggnA9UJvrwppRv4msSx1z4U9lc69quxOYLd2HSeXYL8A=
X-Google-Smtp-Source: AGHT+IEot938iAASTZSdgq9ytmF3RuEs+37nDNilgVE4ko+BUTbsrs97upXOF7zUqmDSkH09yhUAWw==
X-Received: by 2002:a05:6122:4fa2:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-55b8d5cc1d7mr10527783e0c.0.1764343380700;
        Fri, 28 Nov 2025 07:23:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e44a4esm2028264e0c.6.2025.11.28.07.22.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 07:22:59 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-935134ef989so1168436241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 07:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQtYwb9jtZWom9t7Sm0S4A9ArOQE7FvClEvE0B792K02ixLmZXEUeHA/C/UsmT6glfBvIRLMaO3cj6skaojF1WwA==@vger.kernel.org
X-Received: by 2002:a05:6102:54a6:b0:5de:736:71d9 with SMTP id
 ada2fe7eead31-5e1de273d4emr11133048137.28.1764343378522; Fri, 28 Nov 2025
 07:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119161434.595677-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251119161434.595677-14-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251119161434.595677-14-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 16:22:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHMMtav5Ut3E9ZLCn8ctgKPrDNS1+VH_pcAE7g1wcDnA@mail.gmail.com>
X-Gm-Features: AWmQ_bl5PKL50rYW4UUIsJnuWXmjVe8JhNsQZw71eBLgtSZKnqiykuu2HAMxZ-s
Message-ID: <CAMuHMdVHMMtav5Ut3E9ZLCn8ctgKPrDNS1+VH_pcAE7g1wcDnA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] arm64: dts: renesas: r9a09g087: Add SPIs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 17:16, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Add support for the four SPI peripherals on the Renesas RZ/N2H Soc.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

