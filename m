Return-Path: <linux-renesas-soc+bounces-16819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618DAB01CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 19:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6117F1B62F66
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 17:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8AD28688F;
	Thu,  8 May 2025 17:51:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5E1F5F6;
	Thu,  8 May 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726666; cv=none; b=J9NBrTMzpNrONUeF4ucT11LoRqIzJ71ArNQd957vYHTwHq+jYMj5hC3NeSMZOS2HHPyTnrvsK5+BCnrhKrKeNQgVjeZds5g0zLFkrQRsGi27C0NFZeHHB9XInJ0DTN981dj1rg4LdQWjPP4Mm5VX3R5rvqbF7Ih31mD6ZfLco1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726666; c=relaxed/simple;
	bh=Rf+6GnCyjkKQFa9eUjIHfRDTtaEWgUBekAKydOKCqbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDYH5U2p+WpPxRj6NkTSLJGUSzxrS5pFWPdhMue1+l8niapmrubnGJFtUb7ovPEdneCnHePJYW3wBmLAFma0C9NQccqADH5wmYxCrL6DXBvkZIEt/viz93TTWMQWA8MWl63mHWzSkctj0E7i606b7hsHVJWZGAS3ORvUYcc4XFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4c2ffd5d9f5so785986137.0;
        Thu, 08 May 2025 10:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726663; x=1747331463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XjIFmtIKUfBvW3ecAfnniok+8Q5OqIzJH+RPzrZa7U=;
        b=dyL6oQVUMDoRU6PNxqLjKTE5vN8xIogHmmzpNgKZ624xzylTy40/M3Qphh/AiTJc2i
         LffuiWm5LKAGRlumoMGPMMO5lJLtUcWiAUh/XStq2emvmHuIOPFFWiy0gK4cRIumpaY/
         wjHIxaiSDCRRx8V2cHKa92jUWkjwUeAjjIEOOxUs3lOmyCUOIkH/LT+Mqo7qGwWGUiQG
         VaBXeFq6kvs+WmnV8Vb2inCnGYO9CLHxpbUJvaF/vmPEX6B8kr+B8pXhUN726flAJDaa
         Wdj077LJ4ncf/YhnCO2d0WX8oU6bp+r7QaYM5E8A4KZZ/E3A6K0/AgEOeML6lUoi1cDF
         cQHg==
X-Forwarded-Encrypted: i=1; AJvYcCXzS9HtJw13NC7TqskTPtBFbyII5zyGbr0+dOSDHQe2uk9WBZu8ce8LiM3/379ZS+vH7u7kdN0Phgnm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mrZzsZPPFoGEP3F9QzAF4l+sKANFmR7riWK5zl0fdvGJNmvk
	vs+4+/5tgYyYplRUma3JJIpR+BXVY5yEZOoLfDCWgK8f/U9HXLyRcYhLnMqX
X-Gm-Gg: ASbGnctFRnlvIwWUTC1DMRz5MIRD15Ci1XlZW0nckkD6zpP2YKsR6b6sX+bVCbeGG6h
	G8ua+eai8BpVARnMbG52O5j6RF/Qt1+F8hvWLJhG/5fKiklm7n942gc4P9HXtkvTsdFww2UQj9U
	3l3cQBHgJeR77juRBAK4IMf8yZD9TDPq5Z17JZSSLp3qiCMca3iTnXu2ZaVaVwbBjQnwQf+Vs/d
	eI/hYvkcjKo3+gEob6UunB5NC4dwd+1z7u+gi98Od8aaP/Ojx3IKtYoXwvLWFQlVG8nraAkZmXU
	RrRvqqjQvuco6e+ZawXb84VPsh1AFrrRHe+Goq5IJBNLpDzeU4oP3baT1IOMtnYSInx0Lq3D1uE
	jRgzbabRR0obiiQ==
X-Google-Smtp-Source: AGHT+IGuErVAbemAgdy5E4EEkzqROBpQyL/MRWqjPl5yAyzmmaTKSSZlBjW7W2v5gdsPQ7ouhxrIsA==
X-Received: by 2002:a05:6102:3ca9:b0:4dd:b192:960f with SMTP id ada2fe7eead31-4deed3707b5mr376065137.13.1746726652618;
        Thu, 08 May 2025 10:50:52 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6298ebasm110741241.34.2025.05.08.10.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:50:52 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4ddb7ddfb76so504377137.1;
        Thu, 08 May 2025 10:50:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8xmQ2574mrwbPzxnPX9DTe4VHclhyUY/b6LvYvSDp4hu7WCjSGllEHT3ig+l78EMfobF8COvcKTko@vger.kernel.org
X-Received: by 2002:a05:6102:91a:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4deed3ec749mr210009137.21.1746726652243; Thu, 08 May 2025
 10:50:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508074311.20343-4-wsa+renesas@sang-engineering.com> <20250508074311.20343-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250508074311.20343-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 19:50:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6S+N1gOeuLv4TZD9kQy_=C87VEg8x5-Rpv8voh1O6gQ@mail.gmail.com>
X-Gm-Features: AX0GCFscH6fIISyddo7obb3Me9Cyl9g-y53DceMyFvfobcAGnbMOKJ2LDLgdOnw
Message-ID: <CAMuHMdX6S+N1gOeuLv4TZD9kQy_=C87VEg8x5-Rpv8voh1O6gQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 USB host port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 09:43, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Can be used via the USB connector J20.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -238,3 +238,7 @@ &uart2 {
>         status = "okay";
>         uart-has-rtscts;
>  };
> +
> +&pci_usb {

... with this node moved up, to preserve sort order.

> +       status = "okay";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

