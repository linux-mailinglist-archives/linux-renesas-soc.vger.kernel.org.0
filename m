Return-Path: <linux-renesas-soc+bounces-26724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8ED1E370
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 11:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB35F305E546
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E45393DDB;
	Wed, 14 Jan 2026 10:47:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AA393DEB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387635; cv=none; b=PfGTnoYkZ63xK9U+feUcJ+3VNLG37vM1VMd6Rt90oK9S58izB44L3RoE5Oocqkp6knKSQAoGliHRS7C/FpD2jyWM97DhJimbQhRJwGC1L/kN8H5oa0xwfgvIAiH/knFP66qtbKOTkglEFx+lAITtWh51Fw48NcF5sVQE+zg+DTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387635; c=relaxed/simple;
	bh=l7Vms44D7cdWM2JTmvA6ZUvD6bdQNJphB0NNGZJgeu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5mhdWzBIf0FTFvvhklOrkEFng8XbiEKe4rlYWDlUjkrJ3juJnnFdaLdp0FX1NF2FdJy6LnHNNn8SbCzshpNjrMLqCfBrM0QJEEaUVLZ9mvEj3DT6pUHuNHDEVc/D5WXitOFgUoCftzHf+9gIgIvh8YtMmAv2jlPEAbA1/9ITP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636784884eso1524449e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387628; x=1768992428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqj4xnVKq5dPU3hM1G946buXrOEhzZ5Yj8GNkLNrprY=;
        b=tvewpL0EXFpgI2yTeE5DhJOlVSl1Jq+3hiiOTzmvt/v9807bbV218pfTWbjoILWHCM
         73oF61l/QLa843jF/pRldCeuMjWO+SwwyXbCyu5odrhkO85DSwraFnfFY0gMvHiv+0lT
         ZLjvZVWQrFn1tzdOCJqPYRPi+CtUB8kUKOhiVmh+lGyguE5+iyeipCUyxP8rufqm+GR6
         eTpNm1y4S1+E7TT3Qe56n6YXCTIreHQwRrQOBemqGx0AzS8mf30sQDkCbyFWok8gW9bt
         KlUG5XmrCMC87ZLeymxHQ3VIwyUdMRyI8kxqqx1NdiPj0q/T8zf0GzVcK9Lk1Du/VM00
         OHRg==
X-Forwarded-Encrypted: i=1; AJvYcCX5oqFB+TmrJtzx+6g8mNK0YUCG6oiwRQCtRWODvYRD3JRKebv6OedLgFZ+KLpTw8U1sd5zpKrvztXQGWwzQKZhlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MiDP1I2C6LIt13+tK5gE4yMddvCM74xN3uozE3t8TBT5Jtkk
	XyK9brwSG6Q1UJrNmEFfPhRwx4/F3Hv1D/zdkJs93Ab8+T4KHAYNDDnP3g0h25il
X-Gm-Gg: AY/fxX412RZS3Aj2J18x/lsDpGRxP9XaZTOZ1cHBB3CnQXu0D3vm1eVwDFPCIL9/eCy
	uxLMRp3jkhmX+T0OuEIIkYRhxFEsfDxzE56z56Ge6A6VDas8hv2yHiq/HYMPTOtp683GQBuitvW
	1faGD6+tLeC1KUvpZRvxTiZB2ZWdED7nLiFYlo9927FfvyNGWy82q0ztiLyy00RAXFEX5Pi7AaU
	yAbxDcBMxbSoKk6bj9e9z7Ki7w4fD4fFgqr8D7VfDUEsY16pWbfZ5bxoLdE5+aVXtk8kOX6q6XB
	kcovJg5ASjsKzrvLKMrISebdA/PTeSFOVF9jz1DXm48fEHE4h2AY7116z+jwwN+uGyKVSa8G+vu
	n5bnlL+Vvdm4V87XETPzizsaNW/NfXr32lw8ICYfbq9MQGQ830Pb8T/NdbGn28TdbhWe9FAWdit
	FVQ2YhZXO4KpzkZFibC7rRqGdu8Ig1EAGsU2lUmEMIpIDuwLGb
X-Received: by 2002:a05:6122:4881:b0:55f:c41f:e841 with SMTP id 71dfb90a1353d-563a0a6acc9mr774850e0c.19.1768387628338;
        Wed, 14 Jan 2026 02:47:08 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56345043f83sm21614349e0c.19.2026.01.14.02.47.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:47:07 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f5774571eso2846555241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 02:47:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMd8RK2J5VZl7wDpt7cu19eH6yzKihuGWmozFo6+aYzkHxDMj7STn4/LhDQ1rrA7P9tMXVF3qUDqNxioSUh5fnAw==@vger.kernel.org
X-Received: by 2002:a05:6102:6ca:b0:5ee:a094:d4d2 with SMTP id
 ada2fe7eead31-5f17f415847mr755513137.1.1768387626957; Wed, 14 Jan 2026
 02:47:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com> <aWdp_jMVUBN04is3@ninjato>
In-Reply-To: <aWdp_jMVUBN04is3@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:46:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
X-Gm-Features: AZwV_Qhqb9GutQaQvQYv5ThIdOZpT1v0OWVzDimT8VJV3ZwAupoboLFYD3l7moY
Message-ID: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Rob, Thomas, this series is blocked waiting for your feedback and your
> > acks if you are okay.
>
> This was a little hidden between the other text, so let me emphasize
> that these acks are needed. The other option is to send the irq stuff
> and the SoC stuff seperately.

The irq and SoC stuff depend on the of stuff, so doing so would
delay the former by one cycle.

On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
letter):

  A. Rob takes the first two patches, and provides an immutable branch.
     Then Thomas takes the irqchip patches, and I take the rest.

Unfortunately that part hasn't happened yet...

Meanwhile, I'm queuing the DTS patches for v6.20 anyway, as they
have no dependencies.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

