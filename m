Return-Path: <linux-renesas-soc+bounces-26747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3446D1FAE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F34CF302084A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082B31B82A;
	Wed, 14 Jan 2026 15:15:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28131B837
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403721; cv=none; b=oWUb8qDnX91IZ0pxszFo7zdBJLy87b5dFYMbLrUtmUZ/3NSQ/90gaSyMtNUZcJ6c4QJy45/gugzyNVoJOh6Fehp2cNMcrZA2F2v99bJU5GTUPuspMRrxcxldwK2PM3zl1sVDS82X7VPwlpZkpDCpG0vugrN0YqT6Ri1XoJaZL0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403721; c=relaxed/simple;
	bh=9Y389q+RPnEEFphYgapGHzjctMsxb6JLwyPIyYhxWDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUAZZMMHEZtrVVjJJuNa5AGpMBBpfQS7VKzb9t/dnhuK+UF1D4EkrKITfSmNM/spr9UeVwZcxyvCGk35rZfue20lxtcypbYVADKRMqOwkIjbCDbTsS2jX517wNv6YZpDaTMttt+GL+SbohNl86btun5BH1okzWa/KKnD8BA8Ylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b219b2242so628577e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403706; x=1769008506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIOeuRlphqUpkbTygl+t2fPPcrL2rPHxBDUM21Fb5rs=;
        b=nvfMMm0iPdfZDTZwAbhzafRHhaOQbHDa/L+4fDObT9sf3qHD7mVjIFoDYAe/ujTAj5
         Wv1uMGwTBXivaNzZCCwBM09dE5MJ5PUeN+3GbtUt9kcEZlFlGl5lRoUsuz5u9ltEdp7u
         dpIMogqdEvmS8YF1KFnxRzOWjYEIKVZnSSUQPHtpnmzfDYtnXrsOhnZB6sKGi16FZ7v/
         C4/8KVhc5bAznhE9ycQEPqu2cavovqZn4s5rYGqIq43SOJP63AD2es4kZXXH40zmRn9W
         f6X11InJdaDHrvuhQmMy/ss6j8ifQlNbe2/mUAwTFioVQg6tDb7q/caSo3OkLEDueZ9v
         V4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDIbsyDpN3f/UPTySFZgdGWjlNTv4jrEe3/WpuaMCTZI82PFBgt8R+NV9ibJlTJcG5WPiItdkS/OKoGQNEfiP+1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/Kn3ZmVBBW4cWhliOqMmt++9khm9ti5t7iPHjzr7SLmmXoaD
	rJB+/NkhN3UPXM7i3Swra90J5D9LtTMvmARxYSDJjVD1pETdRuWqUg81GpTReRz4
X-Gm-Gg: AY/fxX7InW9VQ9HGZtLzMSYWB0M+Yeyx+xzV6Fk8oJe9tzoJO38HcLLdNEYlf7G+t7v
	pCcTP1Dh5hZgy4XTpxfoptUhxWb5Ew7NUeJYK4VMj5RLMrMrCRgmoHHOi8DMJ7P/U4aR0GNi1s4
	PxHzCQtw6Q6ePvwtUS80FBjqTip/YDif/HUnVMYrUuJQNVNgoj7GYGPTpz3ADQD17j7KNVd+x/1
	YKFyfBmNrwpC0100LlhU6yyh6zlGuBALA5nF5BJ3emnm7jDBfMFbP2Zk73tXahKy8c+C8Rt9BjM
	nfC1Wzkak+m1BQW6mCNUZo2IiJxdBY1KGirxPDogRo38qnQXVZ+Dp5rypjCxLsEqBg8+MYfhXH3
	GDilFlpldeHzMItExlIrXQfkXxW3HEEvE9Swh+v5dHFnTpL3yTgLmb5yPrHz5kJhJbIXFnOzxJ5
	KecbKWgsGEVeaybrK1YoWZqXzjpqry5jLVHNfD5G4odPr57uVW4uKC
X-Received: by 2002:a05:6122:c94:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-563a0fc161bmr1174550e0c.6.1768403706099;
        Wed, 14 Jan 2026 07:15:06 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636f19be3csm14376090e0c.4.2026.01.14.07.15.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:15:02 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5636274b338so841932e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:15:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmhIBK0Sgd1lHUkBniJYzZjwyK6I5dsXI0sD6OFMUgFTHmAFlpiUtEOzN8XZLqUpbMSvHdN0lmYa6RaY4O/OOymg==@vger.kernel.org
X-Received: by 2002:a05:6122:4896:b0:563:466c:2 with SMTP id
 71dfb90a1353d-56395c42437mr2778733e0c.5.1768403701354; Wed, 14 Jan 2026
 07:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg6hyecIyDwZwQOALkySZLKoQ1lcKWx34cwqlLRfGv4_0uRnV7x2Fxw08k
Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: renesas: r9a09g047: Add fcpvd1 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add fcpvd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 17/22] arm64: dts: renesas: r9a09g047:
Add fcpvd0 node", i.e. add all FCPV instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1207,6 +1207,18 @@ vspd0: vsp@16480000 {
>                         power-domains = <&cpg>;
>                         renesas,fcp = <&fcpvd0>;
>                 };
> +
> +               fcpvd1: fcp@164a0000 {

Please move this just below fcp@16470000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-fcpvd",
> +                                    "renesas,fcpv";
> +                       reg = <0 0x164a0000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
> +               };
>         };
>
>         stmmac_axi_setup: stmmac-axi-config {

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

