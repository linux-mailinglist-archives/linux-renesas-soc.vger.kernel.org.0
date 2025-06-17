Return-Path: <linux-renesas-soc+bounces-18462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A151ADD3AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436603BF0F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9E62DFF26;
	Tue, 17 Jun 2025 15:51:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213C2CCC5;
	Tue, 17 Jun 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175467; cv=none; b=TzXsZmRzqJCAjL8afTnZAQMOrv3BIn5pQnobibY6tt08D5bIpoFisJBzP5lKwIqEWScoHYMNJUUD5Zuaod+kcniUPUVR0NQw1+c2VYgJgrM3rhL/vS4F4GZsQnwhTfsUwU2HR8M5ZxNqs0CEBRyOmYCqI3mhlBCoKjUTULqi7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175467; c=relaxed/simple;
	bh=5RqjtlgUUeuy/fAmRiej3LgLEt2jOXDeeg6BVuZlz38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3UNBpiMWqNJDRxTHvO9s8lvV4/Wfl8ksPOJpUnAt9v/x06KofgwzVQLPMP3+WGCKbe7IOS3XdA4GDSbzKJnyHVwptUu21p6fOIsfYXvbNBEdS4CyBJRf5+NdtQyR6snpMdwqLB9R1Q509/4EvaxjANfM9eH9R0oheuyY2U6+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7fb730078so992295137.1;
        Tue, 17 Jun 2025 08:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175464; x=1750780264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWqem8pDRB+jdxImbAtTRPgwW7lDiNsUzIpmKoUsHz4=;
        b=Px+MLzP5um6MdMYgFr4ki2uvKKHACV5fxFQj6z3je4MEwrCNxDcHyuaAjVmRbIQxEw
         PnJmqE4UQ4e9YPD5fSkFT3X04ozAj0vYkzX4UEUggRB3tXb4s1rjG6PGwgUW+udiSwVf
         zj9/aVZvQ5Dq/dx0bMgJIZrQfo2mpoPSb5kzJfeVKgz6VVsOOdRKkq2bJV40kHztnKHx
         AwTP6iUWp6ScKliboTjRC+biLQbdedM4cvfSJ0xNUdcFy+v6OLJMQTT2EhXld/TRXaHT
         GyFOoVrWqkYBZ6tWmGF+8Rmit8XNcD9XzGkRyt6Fbxz+msEEFyZl+f4MLwfrM/qlWPq8
         HxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTG1CTCZnidGAOuHmC7eecJMQVykufZQ5O7yaU56NByzwUFeMp1fBIQNydy36cjt6U4HCcOcaF8mS1@vger.kernel.org, AJvYcCWanNbcH+Pq4P4F+dfxVdlz6lmLPdbNGJ0fa7mik8YV1w7XRju5OlW0l/IlK3bUiFJoGZN7sD76GW4RL1RrA660H54=@vger.kernel.org, AJvYcCXfNHX/HpgmgK2wFvAd6ZIZwJnI/e3N4C37h/l2QU/7XZbFTAtMuBlSOvHm/UD5e6rXsyaajOCBh7UoPu86@vger.kernel.org, AJvYcCXlOSj2FS2ZPqe2UEcXY71LmIZ8ndzvklWoxjdLnYo4OvYCIvQOfdgH03CL71NDkFaqn6kXXlFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwuY3JHfc4ONEoV7m5cxuwwDU/oUgWDJsduGJiazddNkxo91A
	mDPqRHMgXeWu7QKaKumvfRmongzTMmkcnxUaOtBTPmxTz0SoZ+Jr9e3FNzKW28Qb
X-Gm-Gg: ASbGncuhAsj0T8IwdFc1Cye2nj9iGBG6YSdX71n+r7C53pWfkc8XPKkBqeddlsV7Zv4
	5Lqf2vXXKi8Xwj1HvagzxbpAVYGJEgSml/FtQRFthsLEwgSEwodQVuZzObeZxx8hsfasHHztz7j
	0bNP9f9NqegR1G9AYXYzsAeSbdY6a8+6X2xpddU9LQwks66ll1NqvcWmJziE3SwmlcmJVPTFrZp
	k6L9eY/mFyGd8TtasG9gcDo0tFHhZfmJYw9/cfB2RSNszaAhZ9tcn4uOAFaMOyXhl/k1h5xvLgE
	T2PWPsLE3FPHyB/xuNpLugl2LhV9Pows4rCop+KQ/j56jNwspysMvQ56EdnN3LZ3RfyHuoJAwjS
	FQVdr9t0j32TpHU+Su4gGKysw5A0a2/lgwSM=
X-Google-Smtp-Source: AGHT+IEYnm3bsCHqtvQsTtYnEmS222ydUHeJsXfCGfB3ygwEnvT/dNNuIa75K2agZgGorXX1wavBgQ==
X-Received: by 2002:a05:6102:2927:b0:4e6:245b:cf5e with SMTP id ada2fe7eead31-4e7f62a5240mr9649994137.17.1750175463588;
        Tue, 17 Jun 2025 08:51:03 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0fb54157sm1590908241.27.2025.06.17.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:51:03 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso642533241.1;
        Tue, 17 Jun 2025 08:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4U6/pXgl6a/mYaRWTLR6HdZJmqXd792SUhqQRoaLS6+MHfA2PTTwObHRtpt/jwnitpC0/K+Skhg4w@vger.kernel.org, AJvYcCVqvROObTfYX3Mme6oKGX5eJXs6KYHk6tQaLzhHFJjk+pgTV2ChY6XZb7y2VOaUxnsRU5ICWWs54yECJlek@vger.kernel.org, AJvYcCW+fMuEPqamnIHccAoogjdEjZD8IlrQsuiHFMFn4EsShJHN+ZyZ+YiFA+KRYQl1yZhePYKL0DFJ@vger.kernel.org, AJvYcCW6Vk8esDhWSmEUgBG6zopDrDLdBDFQ0m5SmZMhiUUTREhRaBruhMVdz1ECtpvuF0nWQjxjI5resd2bl6RaXKdS02s=@vger.kernel.org
X-Received: by 2002:a05:6102:26c2:b0:4e2:ecd8:a1f with SMTP id
 ada2fe7eead31-4e7f6186014mr8280933137.1.1750175462827; Tue, 17 Jun 2025
 08:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com> <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 17:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJNCSUj6mUweKtXycHNNok4L=TFQipVO8n9g7DiU=b9A@mail.gmail.com>
X-Gm-Features: Ac12FXwk4GGI8MpQTiHifAVx3-K2qs_irp8n-7ldxy3kuIQEgMz6LOdOM9uXcm0
Message-ID: <CAMuHMdWJNCSUj6mUweKtXycHNNok4L=TFQipVO8n9g7DiU=b9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, krzk+dt@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 11 Jun 2025 at 11:00, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SMARC EVK
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

> @@ -77,6 +79,74 @@ &audio_extal_clk {
>         clock-frequency = <48000000>;
>  };
>
> +&eth0 {
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-id";
> +
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       mdio {

&mdio0 {

> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "snps,dwmac-mdio";

No need for these three properties, as they are already present in the
SoC-specific DTS with the exact same values.

Same for the second interface.

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

