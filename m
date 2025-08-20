Return-Path: <linux-renesas-soc+bounces-20762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3AB2DBE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 14:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 598165C4621
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7C52E6110;
	Wed, 20 Aug 2025 11:59:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A825CC69;
	Wed, 20 Aug 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691199; cv=none; b=PryBG0tpQza5xJbcF1/nmepT2d3OZz5k19+mVxvNSIFycH6w2dc9MLxdxT0Px8EBAT6aFB1lOWlkPxyVDmKwfnT8OCcOOQPxLO5dfnjljTH5p1an0+KHI/ZPcHgLz/ZPwZwa8Wa+dsNlczBiRPimc4uX7nr0a12A2TtnIFfcNhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691199; c=relaxed/simple;
	bh=M2hB6pNmoMqvUPr1Va96Gr6Tr134bTqaxtQY+W+FRE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hvxg8oVWyT7KXAqcQt2/uRTcWL6EGBkIHeWu6ioY7o0Fhz4SQvNyypMfMKyFT3ZZjowX+kmYavWdtvIH8CnvKmVYNlADpIAC+t//z6B7kKPLZ5rdVsVTjcqv7sFx9ZJtErciE9ZUhttznlavXeyE1Ip5fhEFquY5PjhpQTtcgGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53b1737b9c8so2251420e0c.1;
        Wed, 20 Aug 2025 04:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691194; x=1756295994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJVHbSBcqaUv4vT1SZtH6tlwqFg+uAAJIPCLfR+Kn3c=;
        b=g7EZEibTJ3w+tSNa3cA/ibpM85KRgRkXdwcZiCfuFKAoTPMu5oTxQfIedVcf2lgYsA
         b1RxjLbSwVQU71bKhUnYRSpFc+MQdimL7JFEuxazdrpqpObtNk/2M42H21by0WnS/X9A
         vXkT5RO0hefa7OSdgRZ7EqtfU0F2DrYh5LWxnMZSOht0ViQPBqN3M3QtYsYkoS5w9XZS
         SDB+nBlMgtmHgjEiAR5pkzXRDrki79SxfuB54JXn1UR442JvhoPHken5LUj+lW2SeFRI
         J1LxVHpxgd2WsG1uzZ959xd+GofOKIdqmh5klrBuLHcKRjPdZqL+Yr3uLv3yM2GM21HB
         ZUzw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfz1zcsZUNEgaju0NApyQo+M2VoJ/tsPlfUQ3sRl53F06qt/r1WBB7ye7f+zHGFqyC2Rli7MlvN1Lb613VN6pEuU=@vger.kernel.org, AJvYcCVqteYxjcrSqpC8MOJtvYcY51XDITk8XDCIOPm2nnfkphi8n62WHOyV1zTG5wUIB2gJxFddhyjMOuhpRLj8@vger.kernel.org, AJvYcCXxRtrfRNMaQM7aQUqm1adlq9j8eiBjYQXi/F/y+bA1dORkMJtN980mup1X6MzoGYKKa9Yc/CDT4gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZiJOv7aAZIk1WJhRSviLfRzWmbU99+sJhPk771hjPQyymI1m
	MjOV8uF+9dkCVEjkC0lMXvXmcW1IXq7V2/DFhl13rO7wg9uqRx9Fj0pv12mUq8Ef
X-Gm-Gg: ASbGncv9vVIxA8BZ/1jW5dfWyVbUx91xVYcP5J0XnEoHZy64LiBe8lm69NHHamFmA+m
	eDvq0yQJ2hexhpSrRZHz268pgGVEUKBMJA5qG0HIGgAa0ab/+ZcabM1FI0LMeJUT60UGIBCu7c5
	kzkHWUR0WxoN5Ez3GyWNypoKMcAnBH0pOtHZwQv9tqQ01Uot08qtUIeLokhWtYGO5Cwlvbg9zq2
	fXc6HMlAR4SjvkITRfeyuMmxhn8Ln8WqUZE37Z7tRdZqG/Moly2eDhA22olC7KDCyT6ggunBQQu
	GVrb4iXdCiNDVshGg96eaAZMFfXwFdJqv8Q/f3/0eBvmWbopev/OcETwnuB03Enp7rrp0gUUDit
	+VKxb/CLP0ZALBvKRuicHbP85Ha8qRRer+sVe4xvHvTYaQoCj4i27eq/xEJ3E
X-Google-Smtp-Source: AGHT+IGJIiNbAVc9OfJvptvlOXo+4R1fC5EM9l3Z2TaM4Jna09QOr+DKNF6kuxvTyQlqL08/UZnMEw==
X-Received: by 2002:a05:6102:5046:b0:4fc:d0e5:23fe with SMTP id ada2fe7eead31-51a4fe6a603mr648531137.15.1755691194550;
        Wed, 20 Aug 2025 04:59:54 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f81a7a9sm3404238137.17.2025.08.20.04.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:59:54 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f890e3df6so1802439137.1;
        Wed, 20 Aug 2025 04:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcVtBKKw7rbtj0G+sTxBevzugQcSRayFfAAelo89Y2vnzUfRosLNY5aHY4NMbtFw6p8hIW7xW/Lngn69mG@vger.kernel.org, AJvYcCVOwndBXFjY1ken5afBgSF0EhXCbFccMtMhxE61PUqC8GIkH/GLCY0qGMYyPoO+PH1VTsq+fDJAvPU=@vger.kernel.org, AJvYcCWUv3uGLAfJv/Ffl2OOKDxRtMcgiBFucU739nY/52BYbDLENTHKXcSxOwZEgIM4KJ7nFgjDUu1wagYv7IhXnu0xXMo=@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:51a:4906:f19a with SMTP id
 ada2fe7eead31-51a51eb9ca0mr629864137.34.1755691193932; Wed, 20 Aug 2025
 04:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820103053.93382-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250820103053.93382-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 13:59:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRaOgCgLRybMDwkdi2McATzkZDePoAOv=c+YmQMCd46w@mail.gmail.com>
X-Gm-Features: Ac12FXxeV7rl09VD8K-pSwh_bJoYqatKUOzYO_0Tk_-WGFnSfS6O8pRaGHnRErg
Message-ID: <CAMuHMdWRaOgCgLRybMDwkdi2McATzkZDePoAOv=c+YmQMCd46w@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a09g047: Add GPT clocks and resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 12:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the Renesas RZ/G3E GPT{0,1} IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped the series as according to the clock system diagram and clock
>    list sheets, gpt_[01]_pclk_sfr and gpt_[01]_clks_gpt are really the
>    same clocks.
>  * Dropped R9A09G047_GPT_1_CLKS_GPT macro
>  * Replaced DEF_MOD_PARENT->DEF_MOD for module clks.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

