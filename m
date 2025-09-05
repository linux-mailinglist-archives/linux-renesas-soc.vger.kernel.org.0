Return-Path: <linux-renesas-soc+bounces-21455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FBB4531A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE7F160E06
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1D427932D;
	Fri,  5 Sep 2025 09:26:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEAACA5A;
	Fri,  5 Sep 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064364; cv=none; b=u4bP85Opse9ytgcwDD2iwjhAWChtTS6tbR7+JEZjIoSSSeALYaVlS753wYEZSzAtEgPqwAAQBiNYFg98pNaj+Upux05f/1Mx4jSG9OFCcoW9hziawSltLZrgOtc8nBUS+wluqBsHibTRspULkWuwl2l0VDM3JSw7Fx8mI3tAOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064364; c=relaxed/simple;
	bh=WZlVQW0wFEAPllA7nimICp6msX9IpUADYDmFHA1nNQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCRiaNqiiOQ5fiNAS8A+ggbBsKofdIkuwNxoELoC5fyad4+82o7jvgygwZc8tc4tZtandIyoaBfnSr3ISm4uQE+DJroIQzuKLH4hP/OyAaR6DZgdPugFnK3ExLHAI6GCP3iyz5H0UWSUCI1I1WkJAQULSABrtCs9qYxNtIz7xQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5448514543eso1403889e0c.3;
        Fri, 05 Sep 2025 02:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064362; x=1757669162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2r+MVGxsvpDAeyHZHUlx7hLWMPN7OTvRNOzrF7TMbU=;
        b=PF2Ik5AfDntiQRV3w5Aevxqkn+ypstXVCu6oVLQHq445AORpk/dKERg2vClqR/iN4H
         3C8I5A5XV42oFfntBTSDh7L+nqbg3+qe2jAgy7k2g+Y+UzUmYbmDkC5ty6YLu0eEAeO2
         eOPD6AhQ9WbbVuIAGbZu5IXbWq/6odpweCVXBxnyeaCVllxZOV1QdQlN0ppBSmJHQrgD
         bi5vIMIO7QIF2WEFPAOtEVKgvvHmqJca0Dk9G1kUeug3QHzrGsSqPhL0RlS86zkyzCnu
         dKsx+QG246RGnYhBqDY7odTxK3qYrbtkqA3GjfRAxzShvLS9NuAtv9Itfp4ELAWOiY+e
         TFBA==
X-Forwarded-Encrypted: i=1; AJvYcCXGsGhDwzjc9FXfEAXRL9Jan6Riei6+Lc6qGC3iWY8KDL2LHX9p0czFOzB7UAgRWeOmVxU/c4DAfW/s@vger.kernel.org, AJvYcCXLIgtcW/8YBtt3sBFzD6Ai+jjSUw5PBVnOhh9JRlQHHARwxz2CxCocGQhYyTYfKK+6B1heaI2Zgp6s8QUjc9ASmnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBae/g5NEfYWbBeXqINpw7smpak/dzn3o5mRm63lMeBAo0DeTE
	RrFftBob03k5hoY9Sd9xXcD1SClwKt02kvyz0Me6T6BjE3tkQNEcCa6JNXDwnetW
X-Gm-Gg: ASbGncv3ab2UQ/wQqrfByXk1jjPZ53mhfX6akcPVn2rXGmKuQ7ixI32nGSWOicPcM3O
	62AZ5ZkAXqIClnOSDFodIfJXrEf1AaIIgdQkv4AvRsd/E9VWeJZ9gOA/cSWvoDcWEYa0udHKTrf
	OQePl2pPQICRJ2MzJubMPi9+F7f9+FgbyBURxGe010ZdZkt98X4O/ye2sdr1Xo/8rrjEJqviHFH
	3w8RTgObJKsKsB90hCaU1yCW4W0GJDdPU1Bqyv0oeSBHCYr2ybH44WIxVEsN6bMAg/H7BOaUN4x
	mPy/oBgUOS9PHJNxhRDSiAFfbViUJyay94j60jTn1nvPT3eOKTrckzl5BSGfehzAGcSNghfDjoO
	57U8BuxsrQ9C78x4zYGR2yfdgPa+J6AJeQl90cJxCwyoKmmputXGkof2fxRqBLvek
X-Google-Smtp-Source: AGHT+IGjeXEroH5T3nHxw3JHQEopa1nA/zgLhoMNfVzs/tMI/1CqVVCUdZku62kr4fQBqJk4RBr06Q==
X-Received: by 2002:a05:6122:1805:b0:544:7949:d36b with SMTP id 71dfb90a1353d-544a018ef4fmr7280510e0c.7.1757064361569;
        Fri, 05 Sep 2025 02:26:01 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-895fcca1250sm6104581241.13.2025.09.05.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 02:26:01 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-544af5b745cso1306356e0c.0;
        Fri, 05 Sep 2025 02:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3970gKD3DAYcpA1czTBNrhE8CnCDS9xWc9mDmHVLJfYy9VU5Xc3tEQ1PK0X8kOGeezvnCtqJHLZcu2SqTtNUyz/M=@vger.kernel.org, AJvYcCVdkfppPWJV8HpgIYqNY27Vcm0U3CPYdXNuBpK30UVkj8u3x5C738knzdQUk/zfAK7Wg8FC1A0d+MmO@vger.kernel.org
X-Received: by 2002:a05:6102:41a8:b0:53a:fb09:5eb1 with SMTP id
 ada2fe7eead31-53afb0962c2mr13472137.13.1757064360704; Fri, 05 Sep 2025
 02:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 11:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
X-Gm-Features: Ac12FXzdkPSCVU6vCiC34INdkoMu_EvqBwzp3vW9OTF994jOdqdC1bw5gHNe8Ps
Message-ID: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 4 Sept 2025 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind RPi Display 2, both 5" and 7" variant, on
> Retronix R-Car V4H Sparrow Hawk board. All of display output, the
> touch controller, and backlight control have been tested.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Build also the plain DTBO for each DTO. Each new DTO entry in the
>     Makefile has three lines, the DTBO, combined and DTB targets. This
>     is easy to miss, so note this down for myself.

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso

> +&i2c0_mux3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       mcu: gpio@45 {
> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> +               reg = <0x45>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               #pwm-cells = <3>;

make dtbs_check:

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
'#pwm-cells', 'gpio-controller' do not match any of the regexes:
'^pinctrl-[0-9]+$'
            from schema $id:
http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#

I noticed you posted patches to fix all other issues in DT bindings
triggered by this series, so I assume you just forgot to post the
fixes for this one (which you authored ;-)?

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

