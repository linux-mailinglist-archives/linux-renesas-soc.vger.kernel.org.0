Return-Path: <linux-renesas-soc+bounces-22441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03600BA90D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17C71C4176
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1124E301022;
	Mon, 29 Sep 2025 11:36:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144A3009F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145782; cv=none; b=DBrjDSaaM34RKS5BT3bLoN7C4Hgz+JuAC0CnmQfGoGFyepMEieqnHb24k+rPh33T5pBBP0hynXA+MWjuTbQc5ZFtShCQjk2s0/U4SqW+LRiES1UlF8jGytBVMQiN1qZ9XnQ1/5Btw8maq//weJSjKvjvv8b8Nwv3CykDfqQcgz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145782; c=relaxed/simple;
	bh=mnFFlAyLIwT1Q5AcB5DFjSNt1dV9nkw1CzOpVFtZBvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fURUmBJr1/xDpkWQfSExNpkuPAbDv/pGB/KK/rgJuUVqQeeCV9ymrn20m9oihoeVbeE85L5BFiUSobIuLQRrRYPe+m17Bfvzj8DsyEBRcNyAcAGuKTC9s4+r/Kv88rsokRk0V9jTDsh5dJvtoH1Y7sgT+fzybuDhkhFZSQnQwhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so1687755e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145778; x=1759750578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wo+c49wamlH5OIn4NEbxEDOQ99erhVXBTj7EjS/boc=;
        b=AOHKKnghBdm0VPSQg7dX2MoWZODeCLQ8VDmi07jB8wVLzkSWS0bgjdtf6+TpnZ6JbR
         LUK7V7X7FFo/9o4NQs3nQDVz5eaPniqVmXeSh2/1ikqz+/HcJAGr0cMhiFbyK1n/5tzZ
         26Io1IOJdET1sr8cmDrWHTyW3YuBXBibozj1GUAVmNxcVaqJbznS4Ny1PV9j3bFjjaFZ
         KnQtTbuYq8QbZQqECu4WyWaso6Jjyk7EIr3xQjTZ2VbGWaBGPfUZw8WUt2Qr0Fb+lY1q
         fbzIkzhOAfvZ+ywsaOOjoKlCnykmzQkkV66sdeOXyi3k/QE/PZeldU0FzwHDTmoZBMLU
         vc2g==
X-Forwarded-Encrypted: i=1; AJvYcCVFcdNbOGHtTiPMfzJRzR3q6m95bCTZH55ceeyzraa7QWOS5RHoGdTy0vKor9g8lp68NE9IZ6EsLfCe1fjUERq6qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7gUqSWKg/NjM1SzM/RNrM6Ttmf2dEQ/BeHSnomuxvkmNvRj3w
	zapOQn40xRv0Q7dv/sdoYOOqOoT872/8m+P376LPCgxWrHujPLbWd/nlLf1ftD5l
X-Gm-Gg: ASbGncsUgHAKg66/6mrB89IPmUAqWQI7+ufQdlChm9ToO586+bZxhGOqWwKhnLlxSRc
	+pnsnZjX+dV+NGK3Dy8J4fQJ3MOzuo1HdN89fUM0++enC2q2WF45yMlkoOtNegweW+wuyTHHEsy
	GuB1kuc/tam7vcHOgMyJwWBDAB+3ww2kyjZJYgMKMqv0WtY//6zPlAGTUoDoCs7XZyvTExlpxFb
	Xs23d4k966b4y+8qISasWxpXw+D4yONbwCjl/glyoSxy8QsckJDvXGSAazpJ48TYKqvB9PGSCM2
	GoiJeWXwmMiE7LZc6GvZObPoOudbZX8Y47oiTcB3bR1/JoFnQy9FficvzysZ94lbJ64uexOejS+
	XBRetzIjBxMun3Yk+RmoIZ/RBb2uWGRRatwnBVbWvlmaeK5WemD/etujuOajTTzDorTahneU=
X-Google-Smtp-Source: AGHT+IFBzuxI1zAlDQ8E2CorCoBraDL7gbhFjxOqnx5n3HPStyvAvZeRGZLgvIgaFzrfxSjjSb2vXA==
X-Received: by 2002:a05:6122:1d48:b0:54a:dce2:2a9c with SMTP id 71dfb90a1353d-54bea348631mr6581538e0c.14.1759145778214;
        Mon, 29 Sep 2025 04:36:18 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8786a20sm2464384241.14.2025.09.29.04.36.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:36:17 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso238250137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN2WdGbPnC5wWM3MwZENg7j9qe2Lkd52VP1GlAIh8JnvN6zy++Gksh27zuyX/9vgRvwzvoBGBXMHEpchdSqPMh0A==@vger.kernel.org
X-Received: by 2002:a05:6102:38d0:b0:536:7bfa:22d7 with SMTP id
 ada2fe7eead31-5accd215f1dmr5953694137.18.1759145777154; Mon, 29 Sep 2025
 04:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917170202.197929-1-john.madieu.xa@bp.renesas.com> <20250917170202.197929-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250917170202.197929-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:36:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfZG=FEMesgTz=q4agJ0huMPFe+gsvX+8-zmKBup-Feg@mail.gmail.com>
X-Gm-Features: AS18NWA4k5X5kIR9EAR4SmDXTePu3QOZUfbdTpezmeEEx4rSxAt1uKChq-x8rPA
Message-ID: <CAMuHMdUfZG=FEMesgTz=q4agJ0huMPFe+gsvX+8-zmKBup-Feg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: defconfig: Enable the Renesas RZ/G3E
 thermal driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	lukasz.luba@arm.com, magnus.damm@gmail.com, mturquette@baylibre.com, 
	robh@kernel.org, rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, catalin.marinas@arm.com, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	p.zabel@pengutronix.de, rafael@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Sept 2025 at 19:03, John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Enable the Renesas RZ/G3E thermal driver, as used on the Renesas
> RZ/G3E SMARC EVK board.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

