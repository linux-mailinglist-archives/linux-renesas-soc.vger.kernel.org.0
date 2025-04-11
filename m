Return-Path: <linux-renesas-soc+bounces-15826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C56A85726
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5E71B61EED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 08:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823852980D4;
	Fri, 11 Apr 2025 08:59:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D5296169;
	Fri, 11 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361970; cv=none; b=kGVKtuTuQSv5ZobQ5LKSGxBHk9Il2kq/XJBq090f7Oc4eabwFf7WAq2Ybg36WAZ5wcm0VCQM1b9vfRHryS3CpXL07SQJz8m0YbNVkepW/3HHlviNJt04LD/+VPBZ50QSSrAsMhoMjMjnzB3RfjllJVBecB5a02LWQkbKpKWgGtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361970; c=relaxed/simple;
	bh=7WWhpA0niEmA3SQEBftLXWFxTDbAES9dhpsZuMVl3xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+l27ANX90hv+P4DT37r5OODE+Ewn3HvEurzPyUiCo7D76qiI0bYHvU2d8xA3pBwFecDE5864yGCd5XnYe+eG/8WMaDXr95DcIh2b2+rnM0z7TAI7EeTmh+eUHuv4ruiOJsQpPcMv741MHmQeWib6O3HK/ktEVMolrPtEUli7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d30c329f2so1713526241.0;
        Fri, 11 Apr 2025 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361966; x=1744966766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR1Z3w6UfiOAg4MdkMfM78ftirJsFR3lfrgwalISkxI=;
        b=Z/XDvHoMyumeY6xMqCLMhOAC9jI+sldCcoKfodlSxwSD3JmurmPHBwVoUdSjEpp8aX
         gHfrEHO4LOvFU8q6lEfilWePgEH/VAApBvX6YnPGrE8Dtk/4BnLTQfSByF3h9pNz7+Xb
         aAceifmRzCCMBl0kqUd0l185qC4YRp5F8ZW7oP1gR7HOo3Iss1QXhEyIynjTA8iG740y
         u41EFaB9/v9dPWtPGr/spUQ+rfd10WF5kuS2lj8Viuf7jHd77/jiKEdQDUGm5sSjZrf1
         NGlFeNNRquRa1euR8RvIqdJM28PW8HKKe8lzBlOqXWStY7iipjvhLT1FAdsaj7n8Iyag
         qEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1TnE/yG48c0xALtqB8/9V2q83WzmAkaXEpKb2dqMo7iGBzreEuHPDB1XWiNpRyGpZFK2gux4NOzGg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Nbxlk8DrKZ8UgiqFXfm8BB/GmOW64aHh4lggkoppQTwao+GY
	1TBtzl6sP+VCSfuDZ2A8w2mHW07ZCg/0wIzwQFfkqeRe8rDy6oVOGYRrLAMyCe8=
X-Gm-Gg: ASbGncsv65YZo7aq9QIQ1ezjSfzdG6zMfgHtT2sq+Q8Z7XsZhikF3c80gDGvZ6Q2as0
	0uI7DaO5IzWxRbGxYD/LscZLO71SZFMGXM6U7QEDcOLQB8vXmihOQsLVfz+vz9Wph4nhzloI5rW
	uKnmPCMCeYAMtEhFz+KBWbur7CNGuxpSSCw7uE3pKqQzdJxQu5ZooFaRoaEHT/Bun/DiQnVbUmF
	DYZ65OCSaw6UZQ8kBeyaXV9pMjcbGOA7gUWm9qdDPm+M0fNe+v8gePbBraM7UjpCeOLxXjnZ7Am
	zmluElbLPVGDPwqmUQGi7keSu08W1/ZGv7Qu2c6RDH25mZiSL0XT3K1f/B7AQgcNanVSR+WCpzH
	5CkI=
X-Google-Smtp-Source: AGHT+IELCYmQYlkIOojfdo5XOqNZ9w1m9D9sEvq8+Q5EMdfpMqdKrKdQIpFtBXw+hxgVzXPfhV1xOA==
X-Received: by 2002:a05:6102:3e01:b0:4bb:dfd8:4195 with SMTP id ada2fe7eead31-4c9e3c71cf8mr1476425137.3.1744361966459;
        Fri, 11 Apr 2025 01:59:26 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98afcddsm948634137.19.2025.04.11.01.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:59:25 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso2648799241.0;
        Fri, 11 Apr 2025 01:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXje1fsGVAW06CM1VecLeZX+TxO70Yuze2hJe+0nxfOoPHlqOJjsLaHVZu5Q9s4qi33j8kTi8Ea2RNr@vger.kernel.org
X-Received: by 2002:a67:f5c7:0:b0:4c3:b75:16e6 with SMTP id
 ada2fe7eead31-4c9d3fc4c38mr4487960137.10.1744361965571; Fri, 11 Apr 2025
 01:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com> <20250328153134.2881-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250328153134.2881-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 10:59:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO0662Qk7BxgMW8nr9OpP-mjPSxYKT6Z-pp+syacrtOg@mail.gmail.com>
X-Gm-Features: ATxdqUGXPpuYF3RjE9LFc46_2mwgVf55K0gvQewj05T-6QGlCsKAGqC_pCNCfXk
Message-ID: <CAMuHMdWO0662Qk7BxgMW8nr9OpP-mjPSxYKT6Z-pp+syacrtOg@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 28 Mar 2025 at 16:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -24,6 +25,42 @@ chosen {
>         aliases {
>                 serial0 = &uart0;
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-pca0 {

These are called LED1-LED8 in the Board Setup Notes.

> +                       gpios = <&pca9698 0 GPIO_ACTIVE_HIGH>;
> +               };

Missing:

    color = <LED_COLOR_ID_ORANGE>;
    function = LED_FUNCTION_INDICATOR;

Perhaps you want the first one to be a heartbeat?

    linux,default-trigger = "heartbeat";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

