Return-Path: <linux-renesas-soc+bounces-23582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C641AC058A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A533AE55E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78986307ACF;
	Fri, 24 Oct 2025 10:16:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41C53081CA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301014; cv=none; b=afr4vQBy5abNhHL5Ohcpv3WL6cNLDO97LO7zR6IO9Zv21ayHlm2xjCKZyb1W5XJxoNhI+9Pxtb/bLVHwYNxdhfgOPm9X+Ru7mmLNvRIDdF+PC7v6JIjNviG2GuCuEivtFy7DGU9mbqd1bQGIc5p7ecYPjoxUnOdt4WA2PmB9M7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301014; c=relaxed/simple;
	bh=AqiWd9FcEXBjGqvYmjKezWFbcC8LX/8ccSI0CzYf7rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iv4CT+qJgr/jkQIH0/opmGFdHBsmbnxjxOTjEUho3AQR3bfx9OWRa+m1lhtQ/sf1FZLVM4vmA/wI42egWrkpX1JzIPWMnOnpzJDR5douQRl9k6XRK0J2i7ULdDlh2jqY3bKcNCe9xRqhCJVRDTYEayD9JeF10QHZj/2ebb+hxMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so129145e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761301011; x=1761905811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSTLk7b49rZYTSOotXXLR+fnDfbehF6NQgF/VSyM9XA=;
        b=JTke/SOIK2WDzOcefYxTbZw9PSHZW/Mp6VrrU9sTxGKhmW3E7PV310uYK0foFkVUK0
         wxML/88k/yu69uxsuTiQv5wuiczEjyGUuVqxzySNcsplTa+qqZXYPprBRadckhvMTXVt
         3TBUahDQRxIvEt4A7BQHROMwxSnzYSz3o/fkZputwdz4Ns5neHAeDQvT3frP/yHJSIi3
         65cA1Wtmi8BBZFBz4/9nLviACQbDe37XI5Enpo3yoL7FjJKvRnoLe7O7QjW7jgpxjUhF
         Ek0SyDLZn+z+MAtynzZ8n7gp7MfQlBWNPX2xFwEAAIFBfi4DQNV/rnbzhrmCbWfcWtcF
         zAEA==
X-Forwarded-Encrypted: i=1; AJvYcCXBjaX+9BVtmQ3qCAU9IN+d7wZ1+z7QJSEiFmJs+D1AiWV4VPMzgVLzx1MzZiVJOeli+Y3L/gDqJNA/cdGdBkjapw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20XG2EavYil7blfysOnVTopMLZFhyN5Bt8AcvUavnKAZK7xse
	KQ4AmeZDkap//xddnBLtkTDvmT5XBhe6UP6rVDTgrXrD5SSTZBpQaERxyuu6zqaX
X-Gm-Gg: ASbGncuDxMPFj+zrphd+VlqZ4OZYYqyaXQAbD/u2D19eN8ZgTlVggQcUrhVDpVxUcjf
	n5AKcUvfLTk27ZL/mNG8nYjcBIxKTPibMtgkLxv+iLG4H2heYv+/J2mmNz7HmbgHHoKhi5ZWJ+w
	6WejyTj7lipqJl/GdhQ4f2wBoHjthWz8q0RgGEhkkMvklLjxPgRscERezYOipWYuB4Oigk3XS36
	iBFamkidFzXKSDBa/WhJItpYgH9OKo5XoWQch4tIT4gMNVoeEq7yErCOOXQYanASp2EnBsGs49t
	q9KJtpOCZaAf47B6qPy+TlnKK2NShL0UAKwFe4G1xDGNKrBMdVN3XIZNVexsENcr4+Szf+mRwRc
	QGpppaL8WEOokrc2Fasl/wbsSHNPoDMo29B0AHQZUa+E99InxpafY2yjBd2ekgjivWIcUfIh7gM
	jw6kCFeDUYly6uPPfuAb2UnY3qJ689tWOi3vNSkw==
X-Google-Smtp-Source: AGHT+IHBqqSw7rKIT5EkNodmtrh2lLcTR+0uBUySQ6TU3Skqm7HF4tkKtS3yeL4VhVWiNunO/HL8Jw==
X-Received: by 2002:a05:6122:e0d9:b0:557:82be:1a4f with SMTP id 71dfb90a1353d-55782be1d48mr1252365e0c.1.1761301011321;
        Fri, 24 Oct 2025 03:16:51 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bef1ae0asm1830194e0c.23.2025.10.24.03.16.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:16:51 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932cf276843so802788241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:16:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxO/5ZM/QvF5fhWsaB96/bejdCftjpVdmBrjvOAoEKJQU5JP2EGhsXPD8x/sG/i/UKjqKuzYRH7bktt8SiacPCxA==@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5d7dd53dda7mr7539658137.12.1761301010775; Fri, 24 Oct 2025
 03:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023081925.2412325-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:16:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9jkZ16rw90qY-y1JwReVuh9GcoU9590Qj+fnAOBKcEA@mail.gmail.com>
X-Gm-Features: AS18NWAl-mnooV2yE2ZHT2YePMkrfHPFCcWPI_7IIu3f_WOQ-qTqZQdZwGQjyhs
Message-ID: <CAMuHMdU9jkZ16rw90qY-y1JwReVuh9GcoU9590Qj+fnAOBKcEA@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: renesas: r9a09g077: add TSU module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 10:20, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a TSU
> peripheral with controlled by a module clock.
>
> The TSU module clock is enabled in register MSTPCRG (0x30c), at bit 7,
> resulting in a (0x30c - 0x300) / 4 * 100 + 7 = 307 index.
>
> Add it to the list of module clocks.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

