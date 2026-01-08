Return-Path: <linux-renesas-soc+bounces-26457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC812D05950
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 19:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEBD63098BDA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 17:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511B2D7DE3;
	Thu,  8 Jan 2026 17:37:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E72D0C7B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893849; cv=none; b=mRCZZBhyL+MYknw2e2lOnyN6zPBbohwp3heI0LusVnXs3nMYEGglNnTdmBfSh7AKDgxjw94CAG+qpNdQLTas5CgpHR+e6BhQtdRIGYhzhUrkgXXiCBzpMEH2XFmDDxz+L0np5YdYjbbMfjiHy5k9KoE5AaLteUK4IrH1Lzmis+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893849; c=relaxed/simple;
	bh=kxt8Z/eOzDR8QTdq82tH3tFzi/nv7joHVar+2fJEnGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcX49II1RficaM/B1f6XqUt/9cUjA9WtE6Zkd/ZxPo9nswHZ9uLxTWIeNVLunAHlbDXuBaNYaSgIx4xgupsLbrmheHDVytKcPR+GBpfZV+MTc/KTFQdxFUxN+ICbAR6v5fwQbuGfoZDs/SjLaJizDjpMqNnHMDjag9GM+9qx0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso1950575241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893847; x=1768498647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuLxhRuKEoA1AJQlWe0gFW11le5QfNFd2Qs+Txydjh0=;
        b=HFmAcBP8HJO9h7TVIX3PhoDYvT28NluOpxBT4aboTtNudarEQ48hUWVOboqMlbrhq2
         nsQlrT5/SDDco00dpbEsHzvNdkh9M9yUyLv5tdrEpp4MOrH6e9I0dF+GBgkiPLj+Om6G
         G/Pg4Il6aXPmRAb4HnNEZJhxLoRj/9VSIjTb2pB0QmgnFQ1ajQOL0uCuute+uSwBlslb
         44sXmLnMP+VGNt+zI0rOvcq0FO0U9zdcYPvoCJWkaWV3g971QNT4Xn1A08TznN81W9vF
         C3o7nFOw8fZni0KSiv1K4p7H/DkNZCfNPRQEOXGXzlAg0qb9wYvdH7p8RdPO5xFN9bX4
         +Lhg==
X-Forwarded-Encrypted: i=1; AJvYcCXL5dodL6T6tTfqgKW5BwpqnmuQJPkjMvxu4KBg1rkDdRKLWqLEbtvpjC2XpmqVEzKFC0Q/tTLoF+/lVrGPIWd6JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8BpzA28f8MgWoaguAaKhDR0PgCayl+upItnNn5n5eg+vRjZf
	ewoXytCiXHGJ8vgG12IApn+LddJ+w9MpOWHdpoFutzT27JoltNEzk3kQcmULZPQU
X-Gm-Gg: AY/fxX5PZaNO+vs4D5W6C4kGoXhkHM7KRwfOFxkcS2Uiq+a4P8+sflYbw1cwYErg/eQ
	ZbsGhBXSb8T6UyDvFlcoEPGJX9HNULur7aCXgHpNSwdXuX4g4Y7rToQQW4avP9ToEOA8xbnKsk+
	Z2LKm4AYX2vCC+LYtvopEDx1rpwh+cKtM3jsR7kcufvYYtwxiNEkMnyf2VzKQwmRWIn86W40XTm
	dLXFhoTeVijwnxYI/5djPVkv2Fu8qpl79GXtt/HNjIyzLpQQcTT408QXcbOGRyxph4a7viHSvlZ
	fVffGClyRAbkKhndM72oOm+BzbFZpCD6UAz5puSW6p+Wh8yAqd7UUcI4/ENXY6C8/nLHddFyKz0
	pmXTGQNcucxV3jL7oMV+Ic881zLhX+hzcz8NgMNIFZbBUmMftdCyKD5yBJ+O+tmWbEC2jMnomP5
	ASfDD8t+VwseweLz53mRL1DuPEH+M02LX1ye/gd6ADfsBnYH36xYJO
X-Google-Smtp-Source: AGHT+IEhuqVQb4nj5yhx2zAFkT5zuMUjq8SDQHjEgI3C2CzznsrhTQQPxYuBpXL40jIIBHnJXP6nzg==
X-Received: by 2002:a05:6102:e0b:b0:5ea:64bb:7787 with SMTP id ada2fe7eead31-5ecb6962700mr2958293137.32.1767893846896;
        Thu, 08 Jan 2026 09:37:26 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122d6132sm6822021241.5.2026.01.08.09.37.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:37:26 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5597330a34fso2485600e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:37:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXuEHBqxoYerOeq1tYi3qf+Gqxv+cmuezVq5md9vu8iwQDnjRp7lv68Orr1wkv3F55oGdE+ZLMQ1eRops2eyzWiQ==@vger.kernel.org
X-Received: by 2002:a05:6122:8c8a:b0:559:7077:9a8f with SMTP id
 71dfb90a1353d-56347d6c262mr2090206e0c.5.1767893846038; Thu, 08 Jan 2026
 09:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPjK_+skP+3Z+Z3azGbbjX9QdtyMDzFY1dyMMG1iwvTw@mail.gmail.com>
X-Gm-Features: AQt7F2rvp8fYlEdhIV5AAN3wwbhpTmRyBGJFshTlAJaOf6DVMaGa6UOwj8MFm7A
Message-ID: <CAMuHMdXPjK_+skP+3Z+Z3azGbbjX9QdtyMDzFY1dyMMG1iwvTw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: renesas: r9a09g077: add GPIO IRQ support
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
> The Renesas RZ/T2H (R9A09G077) SoC includes pins which can be routed via
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

