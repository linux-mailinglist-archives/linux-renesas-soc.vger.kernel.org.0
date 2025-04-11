Return-Path: <linux-renesas-soc+bounces-15834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA65A8584F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E591B1891879
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D858E27EC9D;
	Fri, 11 Apr 2025 09:48:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99571E5B72;
	Fri, 11 Apr 2025 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364894; cv=none; b=s5ebH1q6/7aoVWNNTWsQ4R3Vd12AKS+sAFnY+HslC/AEJADZHGLpglYzgiGCfmjb+d8eDUGIEDpkNNl0WL23nKKW3zf0xJeJfA5Ott7SgNKifc555Id7KNCK+UIHevTWHwtmy5dpUKvZYSw+HFJ7JjRoONxtKDJf1rN1k198CR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364894; c=relaxed/simple;
	bh=U6Si79Y88heqamUetDBIH6ET81fKD9pLdiTNDSAk2M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vz7QKMrSF+ku+BqGOu0c5CWMhL1a9+VH+r4MfN2nRNvTKtjihc8J3J7QEq9FhXl+hqiP7wCKCH2P8ew/+RWm4U6exQ8MnUfdmOB/h1ITQelNVG9Xmci+vQMTtfZSalPPp8Hg1qE11knQ6mpwxaKwnwe/L49mKB64uuMd016Enng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86b9d1f7249so1539059241.2;
        Fri, 11 Apr 2025 02:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364890; x=1744969690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdE1hhNOuESCHtAmgCpDp8nijxyr5RGVT6tJazR6aJA=;
        b=rzWNpw+O2owpSCQHszHdeNSPGLGj8HDNPhcNwgnR4WbFVWYKKxqVD3ftlLvYrAxjJO
         djD90MLxMs7C3U3fZ/XEZEFLNWjhP9Ux49KlygU2uhPfDb3RZCwj9PR+Q38MLJYK90g1
         VsAilWl7aQzO4Peg4kqVeS1N49Dzniy3RamUiUpjDGTWyXZ/EWbupa0T+uUWABXR1ofz
         +UcJa7ziMprJJnTJD3PVgyBhCc0PWcz+nOl07lZXdQyFdLmCvmJX/IDhSbywJXMcem4S
         NPGBe3/S2dOJ0uTxrXPkNdnVipe0SfPNwmtry0kemGg4NmYy9DU5KqNrYMlpXiFCJQdt
         BSOA==
X-Forwarded-Encrypted: i=1; AJvYcCU7PgqRKC5haRFVnMy0XZ1BNVehWlrX8EFGxGFisF3oYuWmaa3blVRwx3s8Q6jfEgHr/Rz9Ang3SvWw@vger.kernel.org
X-Gm-Message-State: AOJu0YysktIDhZ7ZG6IxqdOuaP8AGEDJK1Sti0mkEFbsRdH36YHYKL8n
	Uk9gF6575tZUP1u42CbMQXVs7OsomTgFunKOyrqB4AeiVDLhU0lYo7d//OIK6bE=
X-Gm-Gg: ASbGncs2/C0fNjTsyVk7IrsUD/Q3O8Ql9Y5PuKpZggXgaOqkJCpc3+Yf29rxKT3J4+9
	K0akfR34iYsbgeeyjDeKHzyjrkgGfqGhEMQoMbMiwbYi+HnDiV/1B1jL4Y1h8UV1Vxof8lB9F0D
	ck8g2U4KcmMe8LF1Aylur89wmuiLYeOrPCBG5SDb2F3A0OSEBeAQuImctXcfnfEUY3QjJs8dPsp
	/swDsKxWlaLGVzEBSGe5coxOyl/zp0gnpC00ol0shHKwQUwxh/oaYyscen5Cnt7Mj8JmUui3cF4
	faHKCFFOhSd28e+au5mrTKhpiIf4QHWa2r9S4oYcoC8qllQosy4osdsDUscrpr882hC281ANjSV
	85W4=
X-Google-Smtp-Source: AGHT+IGkE6ftXPo2jHXycgTwrWEXL5IMmqYGg8oAxsOXpKD/WpTgGdVcl26Yj8Qw2623woapJVypdw==
X-Received: by 2002:a05:6102:801b:b0:4c3:6ba1:3aac with SMTP id ada2fe7eead31-4c9e4eb769emr1026035137.3.1744364889691;
        Fri, 11 Apr 2025 02:48:09 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b2b05sm993925241.30.2025.04.11.02.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:48:09 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86b9d1f7249so1539025241.2;
        Fri, 11 Apr 2025 02:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqU3hpIYEff1+JXqPfM/dS7M6JoAciNJUcq8mGzGYhUZj8iUpCryIE7M0TW+88Bms7kxxZQeULkUXk@vger.kernel.org
X-Received: by 2002:a05:6102:5785:b0:4bb:e80b:473d with SMTP id
 ada2fe7eead31-4c9e4ee1b17mr890790137.6.1744364888631; Fri, 11 Apr 2025
 02:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410071406.9669-4-wsa+renesas@sang-engineering.com> <20250410071406.9669-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250410071406.9669-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 11:47:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgWgtNGUCsuRuGQdtwYEZ3H3+JTfMATsCz53WeuOVw9g@mail.gmail.com>
X-Gm-Features: ATxdqUE6aTFBMK3rvsZphcSJyjVHu_q3tXsIj6GAJSU7Wv3bIM4wk7Uim-h9jkY
Message-ID: <CAMuHMdXgWgtNGUCsuRuGQdtwYEZ3H3+JTfMATsCz53WeuOVw9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD
 card port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 10 Apr 2025 at 09:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -66,6 +66,28 @@ pins_eth2: pins-eth2 {
>                 drive-strength = <6>;
>                 bias-disable;
>         };
> +
> +       pins_sdio1: pins_sdio1 {

pins-sdio1

> +               pinmux = <RZN1_PINMUX(95, RZN1_FUNC_SDIO)>,
> +                        <RZN1_PINMUX(97, RZN1_FUNC_SDIO)>,
> +                        <RZN1_PINMUX(98, RZN1_FUNC_SDIO)>,
> +                        <RZN1_PINMUX(99, RZN1_FUNC_SDIO)>,
> +                        <RZN1_PINMUX(100, RZN1_FUNC_SDIO)>,
> +                        <RZN1_PINMUX(101, RZN1_FUNC_SDIO_E)>,
> +                        <RZN1_PINMUX(102, RZN1_FUNC_SDIO_E)>;
> +       };
> +
> +       pins_sdio1_clk: pins_sdio1_clk {

pins-sdio1-clk

> +               pinmux = <RZN1_PINMUX(96, RZN1_FUNC_SDIO)>;
> +               drive-strength = <12>;
> +       };
> +};

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

