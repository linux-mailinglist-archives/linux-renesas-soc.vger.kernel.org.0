Return-Path: <linux-renesas-soc+bounces-26458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3FD05956
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 19:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B53D31DECAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 17:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525E62E0B5B;
	Thu,  8 Jan 2026 17:37:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F72DB795
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893875; cv=none; b=gNtEjZJNmDLA86Ppy9RHU6X2iQifLcCoNjeIuFeEasYDDTbnXLSGvEbuvatljm+Aw92blGIn16pQP+zGxC4NVYwFAR4K763ROb5F4Z10qRCSxYLzUTw2XGT12XpAycv9bfUoVnb+JfW1Iih4j2E6jjedLtJ1zHzQVvtLAgEdQuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893875; c=relaxed/simple;
	bh=9u4IBlqSOQ6l3LSQqWSmzbPOCsn6dNCaZX1o0NoAiOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpnzsjaOPVnqcO/hoESg64iSW6NNpBOD3ZAzwnYTB2nbB5+ot/PTkCLLcK+d1j7bm5xmS8YfnqO4WI2bq0rg/0adz+xEDKxMLTaL4SrD6AEClAUxucCufJgRmdF17OFfGRleNigegL47X7nlMlEsOcOoCSasXeQU3VitHrrwmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ecddf73062so1433654137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893873; x=1768498673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg/FcISCTJfxkX3GTzaYaJZ+C1ltFuSP8SdueGldqwA=;
        b=Ap0q17C8vlxtK15wXAbkKtT9MMU7No8kOmEZx2WT4CzME/djTqz/1YG8pVSEXBDRXz
         KT4a+pnj/30k8k8qG0lqU4TGUXitloHpdT/dPIeSo3XHUOiCy9Yn6jh5eTBmyOHmo2Kw
         q0OaAKVIar9tOPM5clkrHJliLAq8eS/aq59u8FjGKcbuetvLWbdUvWmS1xl5vMZbmY0e
         rAH5anL0BCECqCwEWG0EHZDbigItcOSqcJMfzfUKc31xcLGFfFejEKGzK7WEjr++i4fw
         5XS99cjZrF9obAbUkTIjjv2NSyWJe5bk/TyntIzLEyQEdF5QoS/VvZSbT0Nq6UEAd1DZ
         18og==
X-Forwarded-Encrypted: i=1; AJvYcCUuHQO8qICfh+McXINd2tbcbg7a7dB29z44AyWQHCrnaqC/UQyfrN4zjGmMl7FRx3VwI/Spc7M1KFoQs+aq0bvuFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5KUJBL6+77oJCvZM0+B2zOtWRXPt7toX1OfYC77D1N4Wf5xq
	ZRfOHL6RKv8O8/o34AkSAO2qYnkt+uRknp7T6o6Gjq7hgp4jS0cwW6g5FVqd9rnU
X-Gm-Gg: AY/fxX5ARTYF9R6L8EDWCy5/IfFrJR2niMczH8qApT+bbyNYOnawGRQLyKtLUcvZhrR
	boWRsUW6VuyI8IdbWgDtY1qXaSrDVF3zsWYIkIJ/qfZlQxvb7nj/GFmfAqQaeNF9G3GPEVeHNG6
	x8gCpQAbc1t6K/p18h2Dmok2Wn1wdgN7y5QD/opfl/hUh46vGkiimZIKc616pYWH70ZHFCrQ4Zt
	YmkJiaFWmU6ZLD09MoutqWm/w4jhcCRFLy3hrZII8SnEHRN1BvQVZrzc7U2Bew0tpG6zSluwbhm
	n0w2aI8Lwt1sy3uNcPgBagl/vZGpN4IL+FohZsEZgy5TONJ8ZoymE60X3GhfVMyGor1aYHir+WM
	iHtBQTN7e3cX6CGk3md52O4vPdYQFlvkxvTlPmbQl1Sv3M7HqLU+LVu0fLYI49Aoluw7MUfeoM3
	m35f4sjWUqDUYxBN0aRvqDAxm8Z4Z0TSLs/t6MyZPaDvygcsuK
X-Google-Smtp-Source: AGHT+IHhipuLpLBNDUoMzLtTJiaeZnaCGafeBIHU23FxXr0QCsnJkYoYraWMEAbwXsihb5B/yOGEQA==
X-Received: by 2002:a05:6102:6890:b0:5df:d4c5:15ee with SMTP id ada2fe7eead31-5ec755c7741mr4327164137.9.1767893872876;
        Thu, 08 Jan 2026 09:37:52 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d3040sm6453830241.4.2026.01.08.09.37.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:37:52 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f4f04d9f6so1293769241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:37:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGsfG36QQ0TwyM4Mn/HKL2fKd6ylON7qCCQmGEVEzeHGUiXgIEoimOx74iP2mUhnn+mHcnjl4+2KAzOy863sDzoA==@vger.kernel.org
X-Received: by 2002:a05:6102:5706:b0:5df:abc1:e6b5 with SMTP id
 ada2fe7eead31-5ec7573f944mr3993999137.17.1767893871904; Thu, 08 Jan 2026
 09:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:37:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM62yhXRnQZzyH_1piR9C8nVhPNszc41Z8Q2b7EygfTw@mail.gmail.com>
X-Gm-Features: AQt7F2psJvokOqphYS5ymHo0GIXhtH0aEmkgjppDzcUqWuJACKalFIWERnHzJ_U
Message-ID: <CAMuHMdXM62yhXRnQZzyH_1piR9C8nVhPNszc41Z8Q2b7EygfTw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: r9a09g087: add GPIO IRQ support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC includes pins which can be routed via
> the ICU to generate interrupts.
>
> Add support for using the pin controller as an interrupt chip.
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

