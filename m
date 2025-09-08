Return-Path: <linux-renesas-soc+bounces-21550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0017B4879F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 10:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846FB1889316
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 08:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230B32E174B;
	Mon,  8 Sep 2025 08:55:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E59F510;
	Mon,  8 Sep 2025 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321721; cv=none; b=ta3WScQG8j5FbMkLvtyxsrLBXGnEznxFjSJxnGzzuysdH5mF8T9H5xjg0rQYH13g8YqJHN837hEdPo8Chj5wSGfwHmxvvbeyOaQWghZizy25YQzNn/sbnmx5h5dPtc+iVcTPy8vCnNDItpJolOV5UVfSTO250kIGf6VsCXfVW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321721; c=relaxed/simple;
	bh=8G3OIm39+o/bYEOP4Oo9pc5m9/EoJdYKp/BzGkotJq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htzZbaLqPjqV76mD8AlsY2YmOObjszug3UVAUWTJEafYBYGyH6LYD6M+4XypVrEYev7AN1/rbqYyCCNVT8cnsqr63+nAENp1h+6AHWU9Ro24+5Imu7SnJez/zEK/BghRR/rWbW5PmeVDarJ6Yz9Iw4lrVNcKCE5gX4famBXnTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89a079e029bso1274219241.1;
        Mon, 08 Sep 2025 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321718; x=1757926518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kntqtMNQTPE5WXx6NRncSYTTSp8VosSFmryh1S0y8rc=;
        b=X/0W9ajphimp2S0amkTWnykk7TkLuFOe6APZX06HtMqgMgoK1a6zlwk+ur2dW5z36W
         3W6n7ML5Z5ePqPZ3nggb4O2d0h6ZIqT6aSNNR3Ilfo+Bvp0NXzcnRFUWKpTcDLEJD6xh
         yAhPP7Dg57UBZd1iQbP3AaonAC4HVS5TLK3uAcwL3wMTMZoZyjPgYwZ71Pw/s+TsSXEA
         hUWK97+ndeeGMMInUy8JBbiFNJsq5hIJJKa7l2sXwX3hpw39TmHnoCeppS0glBxZtIpu
         6isTBkRLjxT5ITMpjip0k7RjQiwug7IPdRymGBJMy+P6QRT1V/HfJyFkftmbsShqkXsE
         hW3g==
X-Forwarded-Encrypted: i=1; AJvYcCU6XiANfbKtd4KFQlVc7xHzopnwX3L0BjwX79q96l7gFx/iyrGP0AUu8FqCnHWiOqtQ9ya4Y9WesU1+bUqzy87lt7M=@vger.kernel.org, AJvYcCXPSBq3WXEB3G+RupK7B069Cjgm8baUw4ZvYeyR0ZhojL9qjeVqFkkWPRFvEBbsP7WQMIfLK1yjVBo2@vger.kernel.org
X-Gm-Message-State: AOJu0YxAX39rV5Gmb0cJNaRdeZRQXrGjueD8SthmrcA/eFFqF9zfdWx5
	4+TMkv0ATsIg+gAysjHWKvIXz7lNsEMp+0xF8gSu4UfC5NCBgqcOsoLlV/WATHkS
X-Gm-Gg: ASbGncuuKF39Jo5iNU0Z6syBaRT3GgaSCHyll2xLo+ogVDe0/DY8QAUyCpsqnjIyZlb
	bjiBdvj0G65l6Nak+AsDgUyQ6o0246/QpZiVzsR3EGega0BSiUTU+qymughQiKFmnDhHl9FbWoA
	+XlYJFhB2u2eEFXs7yEfjjT47w3iUhMrt+SX0u+qwo7YN7d1FnN0gFmqAT6BnTAB738A7aO64ei
	wcNWBSfbhfvYTajtcyBwlA+/ZtPB4y2Q0vS0OsDErJhmjmKnkHA6Md0RrZQKgtq5iVxAtWUUMcl
	X8vi+1xcQTo3uftRGGXGai6DBwHv1r0F6BDdojZs+U6bseAIECQBWmPllMCr2McOmi1qmtG6fG1
	Gc4WxQhJdNFC5RLn4+899WiEarcBUg3b0CP8+KYVa7b1IAWflhS4MYlVel9IfDL+IBAHIyuQcra
	h4ZYqpRg==
X-Google-Smtp-Source: AGHT+IESFikChON9z5kvJldYUAuhOQO2lw8PmX6g2Dncvez5ZtQMMEwHw1Q2FwcH2ioWhbeAfYvrgg==
X-Received: by 2002:a05:6102:cce:b0:521:b9f2:a5cb with SMTP id ada2fe7eead31-53d16b67308mr1974876137.33.1757321717695;
        Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af257c3e8sm10594158137.18.2025.09.08.01.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-52eb6872bd2so1862222137.3;
        Mon, 08 Sep 2025 01:55:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV39bznH7wNie0TKj7S4X3n8wX0OX24LMG/7aZ0MWigRsgXNCFeaTycnpi0agnUKXI4ayqOwF8tKJuR@vger.kernel.org, AJvYcCWpVU+7t9Pz0Wq2iY8bsSrVcaRbWTPxPyTJZMIsnxbcg4gO17vpa4XQwP0B/5WQ07QBSd7VhNvDJ36Tcu6XVDIe0a8=@vger.kernel.org
X-Received: by 2002:a05:6102:944:b0:529:ee6c:6760 with SMTP id
 ada2fe7eead31-53d0d61de0dmr1869888137.7.1757321716959; Mon, 08 Sep 2025
 01:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com> <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
In-Reply-To: <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 10:55:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJt7My-rbU=HGSQ=Fh8fs5DCZYJ-CGQFU+iWEYKEUL8A@mail.gmail.com>
X-Gm-Features: AS18NWAKLUWdF2nbnVFEPQJMLyA0fOJUVEIjxGYDljAdId_DpkdilFusWria0ns
Message-ID: <CAMuHMdVJt7My-rbU=HGSQ=Fh8fs5DCZYJ-CGQFU+iWEYKEUL8A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Sept 2025 at 13:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
>
> On 9/5/25 11:25 AM, Geert Uytterhoeven wrote:
>
> Hello Geert,
>
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
> >
> >> +&i2c0_mux3 {
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +
> >> +       mcu: gpio@45 {
> >> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> >> +               reg = <0x45>;
> >> +               gpio-controller;
> >> +               #gpio-cells = <2>;
> >> +               #pwm-cells = <3>;
> >
> > make dtbs_check:
> >
> >      arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
> > gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
> > '#pwm-cells', 'gpio-controller' do not match any of the regexes:
> > '^pinctrl-[0-9]+$'
> >              from schema $id:
> > http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
> >
> > I noticed you posted patches to fix all other issues in DT bindings
> > triggered by this series, so I assume you just forgot to post the
> > fixes for this one (which you authored ;-)?
> I think the following patch handles this:
>
> [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
> 720x1280 v2 binding

Thanks, "[PATCH v2] regulator: dt-bindings: rpi-panel: Split 7"
Raspberry Pi 720x1280 v2 binding"[1] does.

[1] https://lore.kernel.org/all/20250905191637.147141-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

