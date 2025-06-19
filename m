Return-Path: <linux-renesas-soc+bounces-18546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FFAE09A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 17:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B3C4A3653
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7766A22FE10;
	Thu, 19 Jun 2025 15:03:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7342264C1;
	Thu, 19 Jun 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345420; cv=none; b=oLgxCMbnWCb3XuC8iaIG5npMxry03ifaoyqVqBtboY+kNqQ6ePaz/Lr1d+6+qqPH29UV3Z0VFBvbZjiy5mXXPjhyo/TS6Hk2nutoNSS7tjnal0rFENcrdELnpw9prDSop5eOrP0mqIH6lD67MnxeW+R23aXQrZ2tSMZMK5g/YjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345420; c=relaxed/simple;
	bh=lhnecZIv4IpNGXxzx5OwOtUkh8BF2ivVIwF9/oreJKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OuRrt5cxleGPTfl0c52iO2ofMwa6SMyQcyrC1pTAso1Rc2+ZuFcxYMi9RuCtiPT6cwrXyCOa4hYwz0eqJNeFXeLYvletO5xt6nu3EdNHCrN0fiTGaxhBCb17mjSIhsS+Ri/PX1wsdATAxPUnhrEWGnDh5+PqEKuQ/Fu4hSi+moE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60d666804ebso481913eaf.1;
        Thu, 19 Jun 2025 08:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750345416; x=1750950216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGE+bLLiWuowNmkwJPliCykoBNi2rFTJe74W1S8LNCs=;
        b=ia8c1h1Ci+2OLIAz4vx8hanWhc9gn0bBPdA/l7t/BhW/WzN8XIGfME/9SOP4ikDf9+
         yJRy2zOaiIPhzDjFNJAdKXRhxYROuPD/2l8T9QeYltmFgJcrN7vtIGj0kQanWIhsCreD
         AtF17VNzNaXndGj4ELLfV0/hABJ/apJJghRsms0XcFX8gmRAR0JrFQYABVJDa0gSn80/
         2ONchinrahPq33zO0WnsNVdp9liDXINzMtaQ5zHTutFLT/0wq3Hw773Y5tOrAknvctkx
         qt2sO5UjeaZDywL5GZUI2awQMjwBSAJLMFXgMQlMbFYZSVg3hfvei1zDz0Dha9Frv7+y
         1m+A==
X-Forwarded-Encrypted: i=1; AJvYcCUHiI3NM+/QUsGDnYi1i/ZGAThTylQab13vfJKQ+tyCZA9wRgalEImIjmzxc+uWCSFN0ReS+EmHot34O+mb@vger.kernel.org, AJvYcCUdB93brn1OOYakfGdVrP1INEKCCP+EHkNgSKb0MPEQ+quAANL8quhyYI3wBFkLNBLZI8Rk9hqvfSev@vger.kernel.org, AJvYcCWTScnqbzRn0xkPizQWEUqYmNQqIio1xKNCSm3H0a71zgiYAuwUCrZKx4kxJUoLclbpVCEzKXWX8XOME5nWr5QSCw4=@vger.kernel.org, AJvYcCXJOgrXNQl2ZzCe2W86KKahFB/o5PRH5arxb/M2JX6T3wFU20xKGVqBxIoJDBYxppEfj5yFs1rWI0Id@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FEELYHJTB8Hv86BwYd/wE2oXLBkxbcs/NGgbEUFFOImKPBpb
	BJI44EtidPoKm5MFjExCVzeVLPO3bN6R3/38eh65ftmqlxuHaJ0VdT5jiuLZIK3e
X-Gm-Gg: ASbGncsCGRDFnoxb9NFNRqCvBj3T2/cnj2rEKcsPlmp7+JiS1tM8pewSHI+iwVUJ03C
	+kp8HvvkMY0UvVWRQ5o5EFqB+2d0DO8h2ED8x4NtJR2/3lsdvqixvkk8RMeSeMSocgkcT+M+t4K
	8oa4KuyDPqABPJTigbsOU5ZOs/14pRIgQYPPY91Tq0iA0pDzbHtSyQjfB4YMENU9ojyZg/ic1Cp
	9P5XHRGthoZyznJNvvb4l0cpSbcYnxeP6dikNpowFIwWlxS7kXas+quQYwv3vy962ULarq4kmQE
	jtknvgEgmithdP/UJDuy38jVuSoSNg6kvlI6MirYrAxov1FYN8UaFVjNxYHtAovp3kZug5XIzg0
	VG6/I/WLABGKalBEo9WejbauR
X-Google-Smtp-Source: AGHT+IE+ZqbXUCr3wm3mVRpBbJAtZWxstXlvXpCHOrPhpbqtV9oOMZ9R703JmX+5MMSAIzxM3dYyNw==
X-Received: by 2002:a05:6870:d0cf:b0:2c1:4827:c0e1 with SMTP id 586e51a60fabf-2eb9ec42cc9mr2184001fac.17.1750345416282;
        Thu, 19 Jun 2025 08:03:36 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eba6055aafsm375573fac.23.2025.06.19.08.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 08:03:35 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72bc3987a05so530773a34.1;
        Thu, 19 Jun 2025 08:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ8NK++eA4EbSYf/7nTItMgynnFsNytOWAlfO8BNqOyzZuVwOaP1Yd3bp2qROPL0MUgy+sZEXFzqPT@vger.kernel.org, AJvYcCWEIvpphlC2UevN0cA3ppI75uomyZ2Z9/sR/wZkr0+HJUZr6JJxtMhS+j7v53Q2NZnWAH76ZUO3DLrR@vger.kernel.org, AJvYcCX2NntSRwrNDqQ9HEk4THK3r3PfZ/jfc7x24kmz12H1i3FZvG6jJ8C64vEXOwFUHVAlNBdp1V29JgCDid6oDqoa8KY=@vger.kernel.org, AJvYcCXKCH/8xggBJlLXVn2/cZ5FbLIhGIKorZlHUiIeynhoU12ky85Jq2mOtq2Hrle8WfVzZ5EUoov6pMPjBO4N@vger.kernel.org
X-Received: by 2002:a05:6830:618d:b0:735:a61d:5764 with SMTP id
 46e09a7af769-73a7f6215e4mr2586600a34.9.1750345414785; Thu, 19 Jun 2025
 08:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250617155757.149597-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250617155757.149597-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 17:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNGPTNMw=JJtoy02kEEpzpRTwsjfdnFe1ffevNmJb5dw@mail.gmail.com>
X-Gm-Features: Ac12FXw66JyWmdwhaLv8CShoOpXIaROIXMqLGf2bnZe9iRec13aJ8_fgvGxRqJs
Message-ID: <CAMuHMdWNGPTNMw=JJtoy02kEEpzpRTwsjfdnFe1ffevNmJb5dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: renesas,r9a09g077: Add PCLKL
 core clock ID
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 17:58, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the Peripheral Module Clock L (PCLKL) core clock ID for the RZ/T2H
> (R9A09G077) SoC. This clock is used by peripherals such as IIC, WDT,
> and others.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - New patch to add PCLKL core clock ID.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

