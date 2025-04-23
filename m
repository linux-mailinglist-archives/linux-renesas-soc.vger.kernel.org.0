Return-Path: <linux-renesas-soc+bounces-16253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7DA9890F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 14:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52CE75A5278
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 12:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425DB1F0987;
	Wed, 23 Apr 2025 12:03:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054019F13F;
	Wed, 23 Apr 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409819; cv=none; b=NlmU6WMK4e7GwlUZ5wII91SqlhhQVYjp7uOlcic0u4x+hpxkYH9yHNWvUsx7e8EVAEUoDavZLoFE/x+NcoVB/ChWapuoamoaalNC/18WwG2tK/ZFt6PIB8ja+J/mf+MKbVcmgzH/5wEVEeU5C57LvYvMtTEnS5Z4nM13vVVFo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409819; c=relaxed/simple;
	bh=T3PQexam5Db6nCc4StUo8hrutlQQIQwJ4aMiz/VGOX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2ArwdqAD0IjroZFB2iR+YL4ASZ51BB9icQci+mkDL9uoLgYOiZedOmu8VmfvVb5UTpgI3AsVwxeC9WEyePZho+tduK90g7shgkv8O4VNBuHz7aHijc0rqq1XorczsHRZV1Jo8EE5CloUCM4eJUhCWaKF/6iCS0XmhpBz2WvTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60634f82c77so241249eaf.1;
        Wed, 23 Apr 2025 05:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409815; x=1746014615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxC6S0GTlaJA0qu8SIUpzqMr8mvbvfTNBZT+acF9Ajc=;
        b=YUuIiFN3PAJj73FPbOq5TeaAMjuJ53KuGD0xZMVlV50obtBS+vVP4aaYpMoCoID5N3
         q/H3nkFnEey0M6YDVkEIvZdnB8weVEx2BQlNv6I2ulXb/U+iubP4oDgLGOe7uCwActmH
         AGeqspPgeT+UqI9Sf3vC0+pUYvdGn5FBf5QhO4Rlv4jMIG4l5nJwVZxhZqtrFGuMYh0C
         KQWZx3b0v009l7lyUo2YwA0vr04hgOF+p5BjQApBoEy+yf7WOL5fjGTms3mxq25Q1PnV
         qOc/BMRkCmvxsqN26byJuqTsxgtSlyo5sKeoCXRZUzEQ7DD0tbe3IOnuH8WAfYwyVgbf
         mFEA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ADy1okgTwUbagLGmpooMB0hIe21fTvmWRvUhskpxRfbePHVGiBnECvwYwo8B6yjeVbvNuSX0zS5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/H7NQXUgL37wcdgsiujGkes1kM7rW95absO6YMGmraOTuqdA
	qAozgCvXS8VjdoNxug5yRYe+D5yQhuv47jzzpPvM6atQnT7EsbhO89nQfH90Yrk=
X-Gm-Gg: ASbGncugcZWOw8jeFH3uE2bLLOC3YM0Iq3PD9p+3WufoR1Un4ZDxhF5HijffSe63NVi
	7qjQHIT+iQ9RWxnKuUUqqdbPh8vygXHSLDTMvCOuzcw6/IYucMZB3D9R0hay0vfFHSeWzZbiysq
	svO7vgLo1qJP4W4krmeZQbnMqrKWf+TRfGPA0TXiHo4wGJcC8jnx5h/GX+BoT7GVkNgkAiPfx+E
	9UrelwqL5cBfWDc91J0i9vdEBaoIC+h6rH4a5Nv340AUlJ8bq7JIlqeLzBHloQThibFWwNo9saB
	/3sDdrcDcs6wLvWBAaVI6EViwEELrpzTqjw/2buBdxwkMn9NBcRT8U8UM93zeqM+u07+QD/1QgN
	crgo=
X-Google-Smtp-Source: AGHT+IExTeBmhwEff6EbSJjZfkisURNVtsMLsv5L7UVWARm7QzgaeKgBzhFDgu1ypciOp+elVtkgMw==
X-Received: by 2002:a05:6870:611e:b0:296:beb3:aa40 with SMTP id 586e51a60fabf-2d526e0f283mr12619011fac.36.1745409814809;
        Wed, 23 Apr 2025 05:03:34 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5212c9958sm3178445fac.7.2025.04.23.05.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:03:34 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c13802133so1662995a34.3;
        Wed, 23 Apr 2025 05:03:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtfSgRhkIVFoX8OlT5D747LbX/K39D6QDMyB9RdnkbfYMiE8amjAgTcwuxrD4zKLjLpAjlb6uJNewN@vger.kernel.org
X-Received: by 2002:a05:6830:600f:b0:72c:320c:d960 with SMTP id
 46e09a7af769-730062298f4mr13397958a34.15.1745409814095; Wed, 23 Apr 2025
 05:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 14:03:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVqCfFQn5tvONWqmz-NerB7aVqj2_jythEPW51wEN3jQ@mail.gmail.com>
X-Gm-Features: ATxdqUE6fPhXASZ0vNck-4XXPMY5Bf3nRF4stJGpGmXup6cyjp5EH-_qan52vQM
Message-ID: <CAMuHMdUVqCfFQn5tvONWqmz-NerB7aVqj2_jythEPW51wEN3jQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] ARM: dts: renesas: r9a06g032: rework UARTs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

CC Fabrizio

On Mon, 14 Apr 2025 at 13:12, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The intention of this series is to enable the UART attached to the
> 9-pin-SubD connector on the extentsion board (patch 2). I got confused
> while doing this, because currently the uarts are counted from 0 in the
> SoC DTSI while they start from 1 in the documentation and the
> schematics. Thus, patch 1 renames the labels accordingly. However, the
> series is still RFC because I am calling for opinions if we maybe also
> want to fix the pinmux defines like this one 'RZN1_FUNC_UART2? to the
> official numbering?

The pinmux definitions in include/dt-bindings/pinctrl/rzn1-pinctrl.h are
ABI, so we cannot change them.

If we only renumber the UARTs in the DT, we end up with a mix,
which is even more confusing:

    pins_uart3: pins_uart3 {
            pinmux = <RZN1_PINMUX(105, RZN1_FUNC_UART2)>,
                     <RZN1_PINMUX(106, RZN1_FUNC_UART2)>,
                     <RZN1_PINMUX(107, RZN1_FUNC_UART2)>,
                     <RZN1_PINMUX(108, RZN1_FUNC_UART2)>;
            bias-disable;
    };

So I am in favour of not renumbering the UARTs.

BTW, the RZ/N1 CD contains a webapp (Toosl/PinMux/index.html)
to generate pinmux DTS, but it uses (a) different properties and
macros than upstream, and (b) the numbering from the documentation
(i.e. UART1-8), so people cannot use it with upstream anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

