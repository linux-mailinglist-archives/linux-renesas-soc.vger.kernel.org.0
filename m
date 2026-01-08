Return-Path: <linux-renesas-soc+bounces-26434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51BD048A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B0A03192EEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C969D334C1E;
	Thu,  8 Jan 2026 15:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624153385AE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885984; cv=none; b=aaKARs+0NCl1jNEeaaPVHbdrz95tJIS19NoyS7/lsogTID9F9hT/t0B6UxStLWGIAPjWgmSkD1w/vLS7Pfmc+wY4sjkw/csZ3zdONb4nGjJEyGyq2d1lTieH80HPi4oRDItVkN/OKyG/uS4BLlpRJJsyWUW1Oy42zZZTD1v07EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885984; c=relaxed/simple;
	bh=yNc+RZIcdJZsg7frmkaxTdR4O9ZibSMhT8YbzmZaH+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCWSv/kSa8zhdjL8b8glZgGfkAudUeviMzc8DCYGqgIEAhPKxM8qsqhbafLgRNEqxu0nsOEcYgJ9JqVDrC3Oqx9DoNZIXqw1b2wQ6WDz8ZyNrD6TOfKANtrlVbhmrhn/2yvzU1Eg1fcW0U9ee0zBfy2yy4Pbfcm4ILCgwAFSzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so2316161fac.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885982; x=1768490782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4XQkxFWUsqFw5LCWwjeRiyAv5WyIL/g3rRuvVx2lSo=;
        b=GI7UVZnla9awyfF2d0GyGEzmcWYJA85LB66qUCTNrqRv8D8elcNO2jmP7sVouREd7/
         T5/zUEAUq0wJETZIEFe03kzl5yBTZlf3bUn6aU+u5Om1PAoka9uztcQ74LMRHw/6xLp7
         J4w47fXNBvoX4Wz0OGzkac1/ry+ykQZN5dmWfPxdUkBiaV69EwPMi7RxGh/OMttYZrBz
         cDu/OAEYQjI4KJcHtfqstv82zH8ZvFYgmUxgwqm3pL6Lovql3Sz2XJzO3TZI+PztyJ6t
         pFn5DqBfzxAVGqxRYtFe2Ou5miuJX2FM+Q4s6LUw567qW7/hwhl333mDHcdhZGZlrQiL
         SZbg==
X-Forwarded-Encrypted: i=1; AJvYcCVphNVwGYgMFQjG3hZxd0rSJbXrMS46ljvuAlyHYLf04zUg93hijpI4/1BhS+mTglsKVKQkDRtNxn1MOYXnsOzUGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mh0FJxNVmIdZrYqHqWF9pbmqU5L1y0Q2r8ocgkHUbrtulxg5
	lGgg4CDzsLFqIEHxH0u3Z13GGfLdzyc1RoI/JFNjjokisQ+zpQHJANZx28IWgmFa
X-Gm-Gg: AY/fxX5mXyXhXt7AJP1N3C9bjUVwWgwjSKNbvRFhHJLwxuqATMaFQsm2KdjSAhK7bq5
	N6soqBDdOXHR+prwVJcWBw+6BTRaat51/biH8FQYFzXYZ9grZYTzpqQLEZU8M9RUlYDZ8DPo9tC
	Zytngk6futgU0ew+bptFIFaO66ulEHnl0CMzK0DQbUBRZ4wZt98SbaW3SYeKjEAcWb8q6VInA/u
	AIldZBUlYkT9PTlNVTK/d4U031PTy43OKz541wfQ6LJxbiMSi1rWapyrjpJRtPSR/in0Pssnt+3
	xnhQeu3Vm/nv7slzVMBUkvJYsdDZ4eNib3mwuHqllAFmkZIFzxO4JuvtoVr/3uK9FMy2iTPrXKh
	rpfi1q4CWej+XkH9FjwXfjwHy2dFeP98/U5r22tDhdR32+elvhoNjVAmXJx7ogFvuaYUJ3TsYO4
	Ja7yu5h8lUN5mNyqEI93kVfP5fIQah7ijIiq0UN4oUmSX1oX+U
X-Google-Smtp-Source: AGHT+IF6QWSjkpfjLmx1ORnmS0KWTsUSAykaYd8hYTOFF37X09VsE/4uzKkBGyTYNSk91VP9BhN2mg==
X-Received: by 2002:a05:6871:6908:b0:3e8:8e56:6750 with SMTP id 586e51a60fabf-3ffc0c3dccbmr3153140fac.52.1767885980792;
        Thu, 08 Jan 2026 07:26:20 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa5161468sm5208149fac.22.2026.01.08.07.26.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:26:20 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c6dbdaced8so2740903a34.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNJ7Mj8bo4+Q9hdKCTh2yF3AFkO2cMVyXru6n74I7kOFGbzZvYn4OdNzJay73b6HMkb4lf6C5LzpqFMKFP8TSH1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:dd3:b0:5ec:848f:7673 with SMTP id
 ada2fe7eead31-5ecb1e8e9ebmr2504240137.6.1767885649941; Thu, 08 Jan 2026
 07:20:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:20:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSJbbRxoY1=U5KeYHm-Ahr8fU_Qzt7B9csfHnSe4UnLA@mail.gmail.com>
X-Gm-Features: AQt7F2q16aDcyNINlNDKVAWHLex5gQZCaSJCRmvbCOMq8H5xzOXqPJrqo2w-sOM
Message-ID: <CAMuHMdWSJbbRxoY1=U5KeYHm-Ahr8fU_Qzt7B9csfHnSe4UnLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] thermal: renesas: rzg3e: make min and max
 temperature per-chip
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have
> different minimum and maximum temperatures compared to the already
> supported RZ/G3E.
>
> Prepare for them by moving these into a chip-specific struct.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

