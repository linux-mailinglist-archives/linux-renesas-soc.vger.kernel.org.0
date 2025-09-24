Return-Path: <linux-renesas-soc+bounces-22313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63751B99A62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9E0D7A628E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339B82FE052;
	Wed, 24 Sep 2025 11:50:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8361E2834
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714605; cv=none; b=UD98PziTLquJ6QdHZsztIIe1RPgbqVL6u3oZHhNhYAXhuRoytny2Oki0pqSB5IOpNRtsG/pIgqOlhP+vFalHtMdXlGpSxmdLpovt6Rm3pCUhw2AEJ0IRo32CYYLCYaE36gzLCDrHguYBJ1Mq5WdA97Hmu9L9lhUsZCwVhjeQT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714605; c=relaxed/simple;
	bh=9tehMRz08WQLUJ/smHN3UjG/IZMKp1SRULcKii4ippo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOO2yd6NuHEZe7zJ9arcohVouRsnFMdK9T1fQu9iMURO3CWxN0Ic93B5TYPZ1QSY3p+VtV6esACzlq68DbtwoWm3CXFO4hHpKt3sYpLZTNUn2C+JKAlTDj36TwdUcyhqlaFp73FCaHtiPs4r/VX0xJqwR1WXTNTfa3Y+yIJqSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1712588e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714599; x=1759319399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UvM+/QBcNnuTK2u1snMXMO5HJEe0Z5rWe+7sqxETZ0=;
        b=c4YtNTyS0gh7fakZ//46F+M8zkeAq4BE0N5KshvXK4/YgLvv8DSn9D1X4kOt/RhkFj
         L5wobaqx+taJDK572cUtdl0EhejO1MH/i6JkJ5e3/w+/rGPsEvLSIHPwvEZySOShy1p+
         8YmSerY9xupXSj9ooIG7S+/FetEMdxjTKTFUaTCEa2cazPTDb72w3zIXgOZtwG+kNB+g
         B1AuyCaCV6JKR+Q8JOSFNzaFqUXUVpgwuzgfsNPooW/ue4BnzlMmFENcFN+D/No0cz+T
         OTzTvfzVB3tsZe5oEMv3kA+yKHAi7tCeFHYG0GnQGc4ayejqYQMkDh5wFxcWIAsktiMu
         kCMA==
X-Forwarded-Encrypted: i=1; AJvYcCW8v1YwgmojSMxn+mzyeO64mG2qbX97YvM8i/LQbpsukUZJ5RBMsU3+L7w9u75n7PG3fUKBVEAQcNn5VJxszpPzAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrAMwEr/IE6PNF7gOXHiwmMDyVpNnVBzFxiTskXoZM3YhCW2o
	Js2/AG93VxTUNjhlOIGLivAXyurpt0hyuF/bEAEK8QRqmVo05j/agM7BTU5DHXxW
X-Gm-Gg: ASbGncsDXHPKTyDa/s6ScNkSPZvDPuUcaX+qd1BrpBVqnNwFBXlY/asa1vzlhxJzDW2
	M3nE/Ve50vT9nF10AkTenyDOJ1Q8cN9LRH9ioT2Ong/ej/Z82g62ipIQU85+SLXZ88jS+GBAJm5
	Ndg163DB5cjFmeOMfMEnjR/O9sadQo0iO+z0Bei1kvniCrcBaCL5oPZx3wMI7b8H+6LQvB7WqG8
	R5ZRd6O9kxYAXbuRKJ9mCp7rnsZ2I1Elav9jvLbFqwDCSOUQscjc3WLcNhEC3uSFc8O5OIR4pHL
	eYJsl1mSEHG1QY1u7lsDaWSeWnDpYZDgZWTINGxRPFXD0n4V3Wdb0VV0SKbT4uiOvIFQHyo47T/
	bHwIp1bc4J34f4nMZkLrU/82hOHeSxtAn5XuEiVJZQxp33lDF9QSXQTZrk5J+JuyjT+Cxwl8=
X-Google-Smtp-Source: AGHT+IGCBNS4lvH9oLS8YMIb82t/pjnzySTz7KvSfusvyEn9Zjtu/r+HgZ4wa/GQ8ne5ori/Im9LVg==
X-Received: by 2002:a05:6122:31a9:b0:54a:9fe8:1717 with SMTP id 71dfb90a1353d-54bcb1bb614mr1910800e0c.9.1758714599111;
        Wed, 24 Sep 2025 04:49:59 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a729c444csm3877028e0c.25.2025.09.24.04.49.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:49:58 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so1083290241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeRQXhT3nIF5q7svvl7HWctDIw92k7sHwtDNulrLW4Ds6EyN4biL7vc9ac3tE8kBX01TdsgZZ2hjc1LZx5hnmmQg==@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:533:ff66:698c with SMTP id
 ada2fe7eead31-5a57e77391fmr2023739137.2.1758714597528; Wed, 24 Sep 2025
 04:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923160524.1096720-1-cosmin-gabriel.tanislav.xa@renesas.com> <20250923160524.1096720-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923160524.1096720-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 13:49:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULfR3PZVdh4=2QQv5N3-J8kH=3--mPS5ckkd44Xf8miA@mail.gmail.com>
X-Gm-Features: AS18NWAd607zcV9Nbln-a-J8dRoED1AjG1taSvoUWP2QDMqIsRBLiGt34BtVpEo
Message-ID: <CAMuHMdULfR3PZVdh4=2QQv5N3-J8kH=3--mPS5ckkd44Xf8miA@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: renesas: r9a09g077: Add ADC modules clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 18:06, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have three 12bit
> ADC peripherals, each with its own peripheral clock.
>
> For conversion, they use the PCLKL clock.
>
> Add their clocks to the list of module clocks.
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

