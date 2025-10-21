Return-Path: <linux-renesas-soc+bounces-23356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33584BF510A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A9D34E8E9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF8A285C8C;
	Tue, 21 Oct 2025 07:47:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771EA28469A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032860; cv=none; b=IOARmZMsgsScUlMDhOWFyP9Qmh5NnJ2t/AuaBZnm1Bo2LuyDgwZb7MUvgXqbQsmLWXN1y5pxMtf51idAhLVvZzfGLO73JwbKmn3xinjZF0zlEWfUQp3iRUX3pKyfkPlhmxQ2CCLtK+HYlGg/J2e9p2kjqpNWfY4fhwzXQlQV9Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032860; c=relaxed/simple;
	bh=LgD3fmQmo2Vj3ctKAuzbU8OX0SkBcW7bbU6i+teUALM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMpu150ZY2GHMdK938BTnrKsSsDz1UqYNlQY79Wmc1Vi1uUIlcdckPGBgr2h7+K66/DhmG5+zLdfVl3Dd3bWznffzFvQvU/NV/+6jCCD0vnCIfJQ+uAt//dpCVdcWTu1/P5sEMDlf+73rXu+wtNWVJqtJkRa48M6Vv4SbYqgAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54bc6f33513so3901290e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032858; x=1761637658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RAzApxyYEKbjbp0xhiRiTTYJ8A63jge42aUGr1Ascc=;
        b=PPshZx08svmGx4bzqo026nVi5GlzoIKLdDYyVJFvSUjjFsyQtjctHeYgJImu0ax0Go
         WR8O78M1rE+xu9qn2b3AO0X78NozbPa5XL55D6J21Wk8vbiExmD8L2xPfzzqbv8aOIEZ
         I4nBXpzI3l1QI+9GfRWQZ9TwZtFsB5qvJWpdxevHvOC/hWQLmCZ2rDIvZF7ILqw1+/Ki
         UGuT4z4XekbGWKCGfVjjTwiCPT2NpWOBvE8K6dGjy8ivsJQ8r6T9FeH+Xx5MxfmpC/o1
         a7V26hysMYkba5J2IVsrF+R0pTRfXINsvGywz4NFsv1GC5UXeqP7mIZ0U1aiDSUKhxfu
         G9sw==
X-Forwarded-Encrypted: i=1; AJvYcCUA2AUEy3VcWUfMU2qwhSARXLmH//xSHrf2N9+0vS8TCjudhemmVGTRV50fzf9nk8x7ukwXY00L25UZdtvgYQgSzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwceRxszmY7CbeLBLZxKVGRcUXgFJ678ZXv58Lij8aWJ9cvvSnT
	4Yt9itya56ZoFtQ0p631I6AH1HaKLCLQyUzviXCgHLLKUtH+gjoiimpA8i3ePQ1c
X-Gm-Gg: ASbGncur/LmQxYaaH/g+laIaaGXLtm5YBIZ9sRRJWVgJPwOQQC0ucwD25eaYP4aTelM
	zJTIGSc6RQze2OWfYgjs9YZD/DR6QeILTrRhGkrs9eLrUy+3aPJmvDavfGvM9QmLbkOth5iJGM+
	Uqo2Xispo9f0AiftTqRtS/4p32O4B4QsobOpqTreq5xmRxjvsChPMnzsXFS5/CCWuzHvpnrDQBN
	+Nt30DOa1acQjzDrYnwwl6EiaafImmW6Jj+WLdYU9riqRuDurhhBCE5pksYpO7R1W2CZksJl0I4
	yYijpXdVYoDzbzHCrA5ToNwhNgYD2S9CdlMByIqCD3TZNnB5R1kVgmEpvC2a+5qbL8TbkbP2FmM
	zZ1ZZwtT4IvXf54WXB8kSkOjrEcoJD+R5e3vyTcApdiJ4/fhPTvZHHUs1S6ooP8rFy02s6EvmEV
	qx/r1PLl5Hesr36ZTviYnqzozhe/5JpTkQz1kQpMEfD80uSFI5+YDcjTlaiic=
X-Google-Smtp-Source: AGHT+IFU95feQVYqL47zq+84K1xzFsCg16bZdFxicXSbQ53y1XBfDB1h8nKUQxgD+rh6/J5UfECaow==
X-Received: by 2002:a05:6122:4584:b0:549:f04a:6eb3 with SMTP id 71dfb90a1353d-5564ef2d464mr5084365e0c.9.1761032858169;
        Tue, 21 Oct 2025 00:47:38 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55662117c75sm3108525e0c.23.2025.10.21.00.47.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:47:37 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d967b67003so3365372137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:47:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyNDdFaeWweOeL39hUgBh3+CqlDtC4qWRNVFukXQWBM4MmLj2zvUTVaAFPlZKji7hx+hXdj5esDrIVroWUMBiP9Q==@vger.kernel.org
X-Received: by 2002:a05:6102:3594:b0:5d6:218c:c737 with SMTP id
 ada2fe7eead31-5d7dd55ac83mr5106961137.7.1761032857706; Tue, 21 Oct 2025
 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005111323.804638-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251005111323.804638-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251005111323.804638-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:47:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU7dxJdZ-Fc0+KtH=vXt4iTA+uzEvAxu3xRR8KSVgg6A@mail.gmail.com>
X-Gm-Features: AS18NWDjbmYiPPiW4sH01TT_kOMR7nPnFgygby00VrAZBRa3sfL3fwyjeGQ-q4o
Message-ID: <CAMuHMdVU7dxJdZ-Fc0+KtH=vXt4iTA+uzEvAxu3xRR8KSVgg6A@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: defconfig: enable RZ/T2H / RZ/N2H ADC driver
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Oct 2025 at 13:15, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs include three
> 12-Bit successive approximation A/D converters.
>
> RZ/T2H has two ADCs with 4 channels and one with 6.
> RZ/N2H has two ADCs with 4 channels and one with 15.
>
> Enable the driver for them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

