Return-Path: <linux-renesas-soc+bounces-22832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34542BC95E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8BB784FADC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1E22E8B6C;
	Thu,  9 Oct 2025 13:48:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288782E9EAA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017704; cv=none; b=lysIkpwLIakdrgcoiXeBBd9XEzvaih1PQysvRaTqbz9ggNihrjvHnMYEQTRNKHbRoDYEb+3LCbH7qM54Py89D/zfOOysqpOAQGajwMfq5Ein9kl7nhkXDk1ggrPZEBemQZkJotQelL8kejJ3BYqIeS6H1VBhr+fby+OdZrU1pgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017704; c=relaxed/simple;
	bh=JjQpoyc0JbwG+FEvkuaWThczaXfrHcuUfCyMSt2Iwi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlYfqVITcB+v0HcCd3+EFG78sPigot2wXU1e+5FQl1iI+kk4b6okAuBHvMCndmvIO8+bHyCREuK0Yd63lCOEA+MMRC5wo8TPcnlxVZjdghh5ObLBjCXJTq+v0c0lhKg8G6Bd2x6Jzw2im2J5tYeLZfyw65P8GQ53q3WutyxkSNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso254960137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017700; x=1760622500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8nqM9b1HtBdmvYyNLXKVVMOUuh6yunOxpZ3Ex1Hy4k=;
        b=j3ktiw30jP5ZoSFoA5iISndvhTXRlmfTrlBtJr5cit9Yih5ZZWPik+ekciYtqb91gX
         mBpaOpPnSJRIrCtjVxgflPmOokpTb36XaFneXIii/pMW78RZPEoVCEboUt7owsOYGukf
         ofLv97hTG68nmNZk2Vu5feQAJPc007DzD18G+60zqfHEfJebN3Ld9yN66XWNj3KqB2jk
         78VWW/HjglxofQ6SX/TEDfGl84+nXPiJlZO0ywbw/9Ttxw8yr3SiYtgiyWxHrnRRu8Rz
         yVx8fhZA0vrAKCt7w3BLVRWTIcwVWbqZhLxsAZAfC8K9fOmX4kvu9dNzpwALzN2P+uVC
         UKlA==
X-Forwarded-Encrypted: i=1; AJvYcCWVykciv/5pnOdFQ1LV/1VZNNzHmwSXzWpdn3Svx0ZDMQ/DhQdIB8RkvPB+4VSx+gBbeJoB1oLleLGydrhITTu04w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx0qYcorw2mNOTphT1D2skf0dSyTyftNH5kq2AMoCBCjjqwVE5
	7FXdfJ934KBqRYQO+jJuMe/fVj7TZRCcEaQi34VDTgrS/uL39txbF+lJ2/g2h+B7
X-Gm-Gg: ASbGncsRGGfH58XrRrf6yEqwyGQkGPhzMuXhAq60ndgD34tbQKahovFRQwLRpiFscTU
	Yb/JVcTsOyVJA6xkplqwec0f9Qdal/lipYJoXi3+RTQrtEobivchhpTnqdJielL9uysirBGBTt1
	K3Zuua1SVJnyAxGLM8d7SF50wfdyoet6LBWQi33+haUublfO6J8JvM6rGW7MzDqPJ46dGduXzPu
	n8LBLmq6LbtgCe4SJJ2AomxkLRc4Eof8BD5SOZ1aKkDREUKJnkL2Vb9bPDaCii30P7xtGjLd0gW
	1nErlCtQZj4OQXe+qJMquvl+ds8sSo1h4cNWePp8bKtU4zH0thq2UbyOzHP/XHQvABpDNkWij7O
	796/8bx3g0G0UVuvCbFBjetuaWl7QokQ7f9dSh9UpJCOf0svMWQpsAXD8jorULe6npoQ6h0CUdf
	hZ0c8mdwREBSGTRC/Qn4c=
X-Google-Smtp-Source: AGHT+IEwRPAjXP2XSomjBaqg1NxpbIz8yXByOP+Fgh4ivMoeFfg9FjEF+d3rV1gguyGtH6GfnvReNA==
X-Received: by 2002:a05:6102:598c:b0:51e:8f20:159b with SMTP id ada2fe7eead31-5d5e2357302mr3359635137.29.1760017699765;
        Thu, 09 Oct 2025 06:48:19 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4eab863sm4849607241.10.2025.10.09.06.48.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:48:17 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso254920137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:48:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHsRVTweYDzEJ1xVbnhJhg92UvHliCU3XH+h+zyTMKx4UrztoES9AqNohc6nOd4vUj8fPOrrf8tmBQbvr0UXpZ3g==@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5d5e21d04b4mr3948255137.2.1760017697372; Thu, 09 Oct 2025
 06:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com> <20251001212709.579080-9-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20251001212709.579080-9-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:48:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHe7KWiUiLLTYpn2xhq9B-xUoZ6pdnTst0NTMMwuKoow@mail.gmail.com>
X-Gm-Features: AS18NWDDR7-ixkdtwTI6rYs3jroTCBn6LCN-Tix-imcePNZM2CXum5UmVX7CU2c
Message-ID: <CAMuHMdUHe7KWiUiLLTYpn2xhq9B-xUoZ6pdnTst0NTMMwuKoow@mail.gmail.com>
Subject: Re: [PATCH 08/18] dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2
 PHY core clocks
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 23:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add definitions for USB2 PHY core clocks in the R9A09G047 CPG DT
> bindings header file.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk and renesas-dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

