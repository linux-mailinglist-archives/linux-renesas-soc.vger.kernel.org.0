Return-Path: <linux-renesas-soc+bounces-18788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC9AEA07D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 16:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5D73A33A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811612E6123;
	Thu, 26 Jun 2025 14:26:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7EA189F56;
	Thu, 26 Jun 2025 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947994; cv=none; b=TOf0NfxilciQnTCxBwlHp2kYXoCd4Z2lbud5NNUmvhF+S8HOAS/iva48srYQrC1Vyz/ie0tsmuWnivHFMZb1boTiiphc5eKhb3X4UpvNfHKzPO9nZmpQNT1D2/ycoTPnW9YKg0Wc7mUfqI33QWBvHsNNYwRX2Aof99+i2qnr7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947994; c=relaxed/simple;
	bh=IfXQe6zEJBES3XiIeEzrlNiwfIi/pIPES8aPJRshAs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRurzqnxj7TZ6UndSFEcoqoU/cjQC6QEupAnaoGlxhQJhogu6vzpkfs1wys/mmHqRp+4RenIM8qiKlfnY8i+LP+qnQbjisE/LgCk6YYncjAD64w+KLyUJb8FrAeb9WPd25X8jMKm5CHq7MH49pSvtvCyL7OdP8hsiZ2ajOwkT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so1711002a12.1;
        Thu, 26 Jun 2025 07:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947988; x=1751552788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6/Urr4LgtMfGK598+6Kg2sO8wwpA1xAhI6zdBJTZWE=;
        b=GOwMg53hld9EVzK164WlQzyhnobY0Grmmb0kFFUOOxeJc4hj615qfhWt8xq9SyRhX6
         FVePqx8/p4ZdWZyII65ltYaXUVVsVXhx+thHLcSRjh8yU/P4yMcgSYjYetcncuib9GJ8
         ouRZ4Yh+rTdwbQrWSBheJPucs81b5asq8/FKfKMnlH/Y9Y8Sad4ivqHRv381NfZC8aGj
         UgckMYjln2OTDM6mKeWR1Yvcf2fxymkLb7g8Y73JYPUJoC+AdtTYAM6Yyl9Nn0o6j3b8
         n6cZ4FRL35xjsJ93ypCbDQM5UsrVpZWL0RixeMYnrHAzt3uOGRLyyPbIMXMyDZ3xoMay
         JEKA==
X-Forwarded-Encrypted: i=1; AJvYcCViLnqxzVfHXceuOcb0KZKdjO8HCCEjHW2FJTwJPjZF+wb6DLM0Y8GFzxro7WbSLxqahRlUAEsi+mbPDb53@vger.kernel.org, AJvYcCWmcHQAHHinpLsMzKniJCRR20V3avSWLI8Le7Mn0tGxQScMbbSX/IHlKbNNbHC90HRwTp2Lf4vd6SUq18OaH18z4zI=@vger.kernel.org, AJvYcCXN/wa29BeoWnMQqBX18Q2glfSAqdP8Tyd3e3dQIrKQCb3X9zdiNsJpo3nVMLPbVIsGSm0/nmqBodwK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyol59ruKa+OM1VifK9qRIR+DYTsUfwGKSb39mkp16EtNrrVKRm
	Yay9yrjKUNbRm3AaclhCIm7Z1wVw4Z4hFQK6Z9nCeP9EKcVm0U5V6KXFg8f8/TABH74=
X-Gm-Gg: ASbGncuht8nMfFNzvPeUPBfRqeSL+GY43RFeKzc9IAtF+6CXlnRRtrSbxtYOlHUxk2/
	FiyXSG2Bj0K8vM7MECEbbTku7U3MW3WqRX/PsGxhKzsLTU/zvZWXaMJqDfGnCCcXHuLnWIephpj
	7ovxbhgtAcFQw52jF54tNDraxO+A72W81HjrcoYdldgvBppFpfGpwHt4XiEb7boZYcD8XgCnwp9
	5n9pG4SO8TB9NzisHrWFPsYh3P6hOmwR1CxUbvEXLmjHVnflCokq5E6mAwwBjoWerEvyJ3pYmBj
	RY2LnPWlnX8A2oBVWPEjG0N5ulEXr+RGp/xQyE2AmDlJ+kI6JDNlB1h5ZuYk2EicGJ9Jgrg7tai
	JFxDA5clhUi9l/bEA6lThpYK0
X-Google-Smtp-Source: AGHT+IFD4zXKPOg3UWXugbXrqVQ2eBBah55WPk9glKt9Wn9Q8UEDqmMUFAi7PctIpPf7aFBfvvjoaw==
X-Received: by 2002:a17:906:b808:b0:ae0:b7bd:34b2 with SMTP id a640c23a62f3a-ae0bec26b20mr677503266b.27.1750947988187;
        Thu, 26 Jun 2025 07:26:28 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d971fsm6831566b.109.2025.06.26.07.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:26:27 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade5b8aab41so220121366b.0;
        Thu, 26 Jun 2025 07:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiGT0t0Sr1lPDT3P8H7jiH9jBe/ufDxs0TEsytsPY7CEOeU12By+ZmDNKEDy3NBDowygC2cUhcSjxM@vger.kernel.org, AJvYcCX2vWvyHTy7GmKSuwzQ+bwlgwf70DDAb955lTsZqnMoSy0p6xhdxsNESFUfjD9tJSSY2P8/PEugP7uB0el84CI9Pgg=@vger.kernel.org, AJvYcCXpUB7kyG0HVQjsxla4jfEmbymtBduahCBTcRzLWe0363ijwO3M4tojSeqhqahJjwZ1MAtAHnwDa59URmSh@vger.kernel.org
X-Received: by 2002:a17:907:7fa3:b0:ae0:daca:f087 with SMTP id
 a640c23a62f3a-ae0dacaf37amr246458866b.7.1750947986686; Thu, 26 Jun 2025
 07:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 16:26:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFvRJoa9uhmUKYaMTB=eAYURfSJ6ebekDornY5O5aLXw@mail.gmail.com>
X-Gm-Features: Ac12FXwl-EmMC__Vh6Jw9JlmexA--Pci6FnO3QxvA_F5WT7SFu61Bp1e61232Tg
Message-ID: <CAMuHMdWFvRJoa9uhmUKYaMTB=eAYURfSJ6ebekDornY5O5aLXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: renesas: Add I2C and SDHI nodes for
 RZ/T2H and RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series adds I2C and SDHI nodes for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The I2C/SDHI nodes are added
> to the respective SoC DTSI files. Additionally, user LEDs are added
> to the RZ/T2H EVK and RZ/N2H EVK boards.

Thanks for your series!

> Note, these patches apply on top of the series:
> https://lore.kernel.org/all/20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> https://lore.kernel.org/all/20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

FTR, the LED patches also depend on:
  - Adding the pinctrl nodes,
  - Including dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>,
  - Adding RZN2H_*() macros.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

