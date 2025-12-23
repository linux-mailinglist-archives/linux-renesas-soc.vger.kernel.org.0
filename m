Return-Path: <linux-renesas-soc+bounces-26069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE494CD98BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173C13040676
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F50F23AB95;
	Tue, 23 Dec 2025 14:04:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE62E6CCB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498692; cv=none; b=pxAcQHgwfukIXJMs1T7d557Rj2JEUMXeuJJAVgEsFGRziHPjbPh4LNr74eW7BzPxX7TUTxMZyC6AEcHLFwZQXp/PbWCTj8s4oN4bLCvGpyJZ/WMN1k+y25kkjRUH8X3EyncaXmtOCEnLhey3g2nb5oO0FoVKVsfAcabN+F4Cc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498692; c=relaxed/simple;
	bh=+jtPilWYFm5ncAYTgsqlqGBVAaL3UvMzNugfZf9EGfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/1ICI7bQ3pRJJHHOqM8X5vIpRF+s6KemUORCnEavB+lzT48cLu9Mh0Q/tPrOl0+4Cd1gMh0l8Ha2xQgJK4CdIhu2V290l0+jEVgEWQueuDzt0NyA4t5E/1Z3AeH9s5MOgkcgH1lASd5RQWm6RQkTCXgw4m8GLzgeF6CD6ClMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eb3c50c688so1969668137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498690; x=1767103490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKvJk7e7tJ7TSRXYxuvnx2VLhgvs9PdFoo0OZwEpm8Y=;
        b=JCqhXzPTa0J52uCjv1R3CYHEn4dUqt9jQVZRa8ZxNVo2ZeItIz42+kL0C+7M5r9OJE
         ijJ4dNaeuuilYf4wwC+0g71P6nb0Hqe/C7ITGe1N55YafZw8VfT+kEoL68sHN5Tb2RzH
         0FzaIj24dhXdPqS+SYqlJ0HXXpJjlrbWY2VqGpw5mRB8OMspmcQN24wD106ATHJLZoj+
         mT4ySfzHsn48RTFD2zxzilrZY4G6oCwOwSzunWaR4Jk47xkbXxvXxXggbp4IItz6sqF9
         KIXZZMwXn22JEunrMTR1nepVgulKiDTZj9rt+zlKMRuGk42mKY7SKcVoGebabO/hl3hb
         Ae8A==
X-Gm-Message-State: AOJu0YxTpDeAHRxp7kp8XqnVCwhd7uBgnnoDLI+M+qU9IuJU4g/JTWfq
	THTt+XGKsWex75G+M17ShjhppfXk6vjv6y4im8/XAYg60loO4/QbA5Fg84EFVso7t3k=
X-Gm-Gg: AY/fxX6G6lepC+eY53UpaZdQgys2x4+GjljInqPw4j1sPPQ4ACD+tZdzgU0DrkqXy6x
	W3rqVxqOp7D6PfYcEuGVmD+odVsknl7aC3WigFkRBGiqHFpp5SSo/lu+XTPQmDJU/SKjx5TgATU
	YRnnHui+btgAnSppQoukYf7izoyYoVhw7WG+bJSu4BwvE/BFJVKQM12Jqh22DCo/K/e/YmjVuvv
	AkpC7MCllvjluQ+/hWk3LDURUemra/fmEZndgkk7JYRsgwIIv6zeN4o6Qa31CX5zFx1bxdFYh+y
	MDdNw/p2Ax+QHXyD7wK0h38Iaz9a7ns6Gyoi1y+m+RnbpJAZJN271SCuXiIpOF6XgIpUHEuYCIu
	kDAH3j5txj74AxgxhaI/QlZ2lF3Qo8iOCdlMx4fjH3k0pAJQ9CmjNhE/Dk/vLonWEyLdxgG3QvM
	8+aOJgNs0uTQGm8k1Qz3B2HfoZHFDx4pcHHwe5gVtT1jCZXfUgxds9LWI6yDWu8SQ=
X-Google-Smtp-Source: AGHT+IGF51bq/ifRVRjXe2mrbT0mppFMs2kOdsDurDNtkJCSeq/Fb/NCA+AEpq3RLehOIV/hxOyRyQ==
X-Received: by 2002:a05:6102:6442:b0:5db:d2b7:9511 with SMTP id ada2fe7eead31-5eb1a8530e5mr4605737137.40.1766498685184;
        Tue, 23 Dec 2025 06:04:45 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa8c858sm4550993137.5.2025.12.23.06.04.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:04:44 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1767998e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:04:44 -0800 (PST)
X-Received: by 2002:a05:6122:50d:b0:54a:9fe8:171e with SMTP id
 71dfb90a1353d-5615bd7271amr4851900e0c.7.1766498683563; Tue, 23 Dec 2025
 06:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 15:04:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-VrUZMqqsm3pncBe2uSeyWf4fhHYvSFZAR7-ZYpvYEA@mail.gmail.com>
X-Gm-Features: AQt7F2rWqSOe9yoJJys_EHyj7yyYop8naN2ynk8rs-UVLuhu64ORSSQGQUuxfgM
Message-ID: <CAMuHMdU-VrUZMqqsm3pncBe2uSeyWf4fhHYvSFZAR7-ZYpvYEA@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a77980: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:48, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

