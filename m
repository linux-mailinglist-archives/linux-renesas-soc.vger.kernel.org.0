Return-Path: <linux-renesas-soc+bounces-26443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD9D04953
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D7313040115
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FEC2DC32D;
	Thu,  8 Jan 2026 16:50:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F02DB7B4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891043; cv=none; b=LpgNwOpoImg3oZ8b4S/LMh+63pT/B/yVizBS7l0829PGGglTIlc+s5HvaNRYAmKP8U/V+7vTdpHsHx66qdPnKgOAM/aDccCJG8hVywCa4fxWU7J9HQtzzb5Jaifu0aFhDwpEo/a7KokZyuT2zy+Z4qQm7Rp4gw9EosrFepyZ3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891043; c=relaxed/simple;
	bh=7/Taf5CwvaYEOCNOJhdbHbsMsm1VSLNTMWyH4dTVXlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDtz8eO8Xo5wj8QUokFn+ds/h/N78N1nV3xcTUhG7oWJ6EilzuYo60Zo8IwPEaPb4m+fNnf9ljpYg7qOThjDdxG9iBUv+6DfZIl6PGKWCAix2nSlVCynyCKsujJFiJi6rQDVWO/Ekox6ZE+NlmMCAn0KVycGFGz/tAkjc0ykrPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f5774571eso1092428241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 08:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891040; x=1768495840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjpM9ymjUwivlVyTiA/MPU+wu4L18L3+Ii3s1slBXsE=;
        b=TGN0u7cvA7ZIdbt5QyD3Q7Cj6/uDVLIlzI0k/34382HwkCeZvjImlG1j1TG9Wyg4DD
         z+pPyQlBm6+FBl4MuKM2HRSIz/uoVt5/GMmsTd+Tw5ovUtB+ZSRM/ceM7NyIBnZAa8wd
         obBvsRa1OHpSPU6tBpM+AyCoMyRz6li0vklBID0G6rbf/wZ/p2ZVaJVH1q8kVQ4Zo9u4
         7UEtba2sdQLJ20PZOCxtWXfaAFTcui2L/hOVIHwUisLGSSAUVfvhGzdbCecQuUU6zgOF
         FxKRdq2M5J4W3X/AQ/e4zc6DLjXZNiazLsQdJ2TdepHHxYMRxykGFOImsLQwwy/o6Ex/
         z2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqEwDZ+5K7DBm6BCVcltOlKIogyhh31zmGUJc9A0AO8Al2wXHxnY1u8tOT78qgFgN0eC2WWpil+2V/DoLgz6rtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxekaGYWMdmdKNTphSuPQS4nxhaHm9Mw1SoIkOy0bTnTdXz0GYx
	Q05U08wQqfE3dC79OD2CGlGPsKE3e7lKvZAuNCI18k7jT5JGXpKfpeTqr9f2hntV
X-Gm-Gg: AY/fxX7MuRWTp24BsHonPV/Iue5DZ9onWoHQf15XiEz10sYWvW1kWwwJGThgL4Ag1JW
	4S/x/hzH7Lu5FJHla7M6wqkm1ccRBg/mCg4ecN8xCGjVgCgjMhBF18zAL3I1fjIteRieMMk9K7G
	gpt6j/QTo5+5M3fRDbNJz83t7pNZfjUQmonnLunaslFKJFsjMJI5uACP0waJ0327JRUEay0CJit
	InPqdCQhY1k7YlF6fOII2nC9OgndE3RO0LXw5b3vZ6EfmOTgYq6kJeKuU/2Y3lFfa605MsQEDj4
	JnPQOXgI0QzG5GLr67dreLSUX28xe4jyaK1/wWEg+WDn56bjHM+zGZEvK1c7qsV70eHly7dqANL
	IXdq/TVR81G7sj60KyF4qUNkkEF/fphILUd75EWA9kjKNaW/DHxH56fwG3zDQNMxMvgnA5tbaO4
	Z9hkBvOHF6Mjllj0BzAyerv3a0CMEwHkPYxeN0BR5g1lOAhaCNg8AIWUI7ek3LwiY=
X-Google-Smtp-Source: AGHT+IFgTFysw69hiXD/8OBAaWK2b1D5KUf7uXvk7vWkbft/DaMEhcQ7H7w9RiMmpG5O88rWruRJ3w==
X-Received: by 2002:a05:6102:2b90:b0:5db:ebb4:fde3 with SMTP id ada2fe7eead31-5ecb6875afamr2637276137.16.1767891039702;
        Thu, 08 Jan 2026 08:50:39 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a074d30sm6711108e0c.0.2026.01.08.08.50.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:50:39 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5635f3eff8aso184063e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 08:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbIbI7cu27gPJAZK8PkUuUNgGXod1dmb9S9yr7j0nrrPt9TJOUKTE952QlQPrWqT2wvVtYIR0gdy/xKfvDdovUzg==@vger.kernel.org
X-Received: by 2002:a05:6102:3349:b0:5db:ebb4:fdcf with SMTP id
 ada2fe7eead31-5ecb687b063mr2554646137.17.1767891039245; Thu, 08 Jan 2026
 08:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 17:50:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTKVzB1LhOp2jHima+_ZWHCZZYqrExpLjfuF2KV3QZmg@mail.gmail.com>
X-Gm-Features: AQt7F2qEe-jh4MC04jZgvw61EVfKsP_55-29gu7PCGMB9-MBqtO4ZeaLC4gjeeY
Message-ID: <CAMuHMdXTKVzB1LhOp2jHima+_ZWHCZZYqrExpLjfuF2KV3QZmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] pinctrl: renesas: rzt2h: move GPIO enable/disable
 into separate function
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
> GPIO is enabled or disabled in multiple places, simplify code by moving
> this logic into a separate function.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

