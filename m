Return-Path: <linux-renesas-soc+bounces-21611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CEB4A5F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8924E4732
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303CF2737E6;
	Tue,  9 Sep 2025 08:51:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671C27144A;
	Tue,  9 Sep 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407863; cv=none; b=kvulyknuxRdSuNRURdQxnSLFRH0cODBAWXQwLRIx8VixBSxAq2oYVigX5r98oYQT5BHf89NrcokQhOSoLFEs5iAG0vXpXhNOGklWmEC1PLf0bOq/rQvfYAJSz37v/HG+flQxsv7KLD5vsBdNM+UX4FMYck15O6kVxvmTeoTQXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407863; c=relaxed/simple;
	bh=oXI5NNqZkYQCm/u7n/ukm4R+mLuIcKnlQhoACRUnzBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uec7DEEKE3yJtQythqVABz0dsoYT0XBz/8aL+J5OwhR5j99IY0/7prWicSXaSkDYRzpUVsL9wVYe7j022PbifYaoSqsmqMhYjqSL0uW8ZDrzR4pYDXKzCLbcYWyvaG34fvO79YSQhr4T00nIbQoE6KmV2+1PHZchIaVBBSuN8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-544c620d486so3547124e0c.1;
        Tue, 09 Sep 2025 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407860; x=1758012660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdcfZqS9iB3O/iqg68OVppVJ6FUG/QnpVMsyxDD3tY8=;
        b=maM3KB0bvT+hMaq5BuwYLdh6qZ/bAtaTiun6J73a07hQF47ahooXa756QxSZ2o6nZ4
         CVIhsJBuRBO0zzc6ObBgT4h8W5wqd5O0FzzrZQm+tJKKtUaorQD2VuyImFLtfvB7EFZc
         DM4SCcPv13Ch4kRb6QsFz2kQ+7UDme9PFefyDzil11A5sHvlwSA58LogK5+aoMMTfmib
         JworOJ3WunXd/U802mAwmJrRpg5JyrxcXW/fNFvp/t5rfk8O4zCzrpAipPnfF/sx133S
         96RPEQjAr7IL1nMD0xazL6OIUwpm6NtcPKfdRoVzywlDdNyjYCie2HxRh0daIWunj0Zk
         JkfA==
X-Forwarded-Encrypted: i=1; AJvYcCWhAmD+WTBajNSA7MPf8iATkLwIX1M0VVu8/6D5V/VmLy8Zrl4S5QeFlQApCNL0B+9p9zZNb+stEBs0@vger.kernel.org, AJvYcCX+Nr6OBptICAUYiHYW1fXR8ZRbYD7ZI4Ye2MPgDiYzDfwPtolckkt8kasUa0mvA4K+gbbq/RT6tDN/UIAYuZ4WNqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8uNKcHgb6SSOZgZLGZXab3v07U0Yo1uQCD7hOTyr7XsOgOkw
	Bgdaw09k5cmtwe+22/EtLePhSgwFDQ+glxhaSjrifSU2dcQHMnqgKTOt8i6JA9yx
X-Gm-Gg: ASbGnctjAmC0YZdMNZ9SnrWtKnYcdwyXtV95gRmo+6bixCqG2Jt+bdqyBAlcYW/zumj
	UJ+40pOil/ok860cjW4gjB8QS2rQtcfr/4833SFVC/uyca4uoqBN2Qfukmni+aPdcngSH6bXaIh
	H//JwXMckMgQrLftJqpHKtBVi+Yl1xXlWLwmzeIiMQXjVWVJubeUPefMPCQ455CEJzKVFmRvvSF
	eTP1w2jUAdhXhpJcMxLogW4exRe19S4hOXOlEXLCjQ01AvHAbep2Xyif5sJvKnq1HsA6jTMppW+
	X9i7+1oS5QrU+8InElOJ8m0snwBnDcZf/Uo2wejgbWXJBuW3esFhtFViCO4J8Ose9Q9qPyi/eDV
	9KPlSQyKQlgK6fazS965Bzf3h1CitVI4eW5LxXhUrOSEJGKRJGUcowgkS19uqizLZ/WNP/1g=
X-Google-Smtp-Source: AGHT+IGHaym5+aIiq1Fwb1M837wbKIr5FGzqK/gLH+6xHWignnltM3TjUaleSBSMasx0g8ALPitdeg==
X-Received: by 2002:a05:6122:e44:b0:549:f04a:6eb3 with SMTP id 71dfb90a1353d-549f04a706emr357437e0c.9.1757407859873;
        Tue, 09 Sep 2025 01:50:59 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464b0csm12818311e0c.18.2025.09.09.01.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:50:59 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018e9f902so3063069241.0;
        Tue, 09 Sep 2025 01:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK/vN4EogS31+xY7Zh8hn/l/VgdVZyAL4t3z0yb2u2Y9epKldsHgRlKH3QkjR7fnwx7wSSpLAZ11XyKFeAsr+ZcQA=@vger.kernel.org, AJvYcCVhdTBqDZezytaJKTDMOy+tE4dQc+5Fs4JL0v3Y/CO/bvjxzC35xX3NRyedzD3mfiy4L4kOVPCNXAww@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-53d13579b34mr3248861137.22.1757407859410; Tue, 09 Sep 2025
 01:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com> <20250909-woodlouse-of-authentic-fertility-1cea2c@kuoka>
 <CAMuHMdXd6yhi2SBHBvq+0LF4kBnjm3igVb21TYaKoWSvjPGcEg@mail.gmail.com> <df2dcd5d-bafc-483a-8ef5-f58ff225fc91@kernel.org>
In-Reply-To: <df2dcd5d-bafc-483a-8ef5-f58ff225fc91@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Sep 2025 10:50:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVM64FD_ObmkUpzWrr3eerM1w9hBZpsVde6Jf27xjuHOA@mail.gmail.com>
X-Gm-Features: AS18NWAsmqbNH3OvseZ4z41pwnjf0gMcu1uQ0RCtMahnSEq1S-8F43CpMV9PuL4
Message-ID: <CAMuHMdVM64FD_ObmkUpzWrr3eerM1w9hBZpsVde6Jf27xjuHOA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 9 Sept 2025 at 10:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 09/09/2025 09:51, Geert Uytterhoeven wrote:
> > On Tue, 9 Sept 2025 at 09:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Tue, Sep 09, 2025 at 01:45:09AM +0000, Kuninori Morimoto wrote:
> >
> >>> +     extal_clk: extal {
> >>
> >> Use some sane prefix.
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> >>
> >>> +             compatible = "fixed-clock";
> >>> +             #clock-cells = <0>;
> >>> +             /* This value must be overridden by the board */
> >>> +             clock-frequency = <0>;
> >>
> >> Drop instead
> >
> > clock-frequency is a required property?
>
> And it should be provided by the board or fail the DTS. I think now it
> hides the dtbs_check warnings for no real gain/reason.

In this particular case, the clock-frequency could indeed be omitted
n the .dtsi, as the extal clock is mandatory, thus must always be
augmented in board .dts.
In case of optional clocks (e.g. serial, PCIe, or CAN external clock
oscillators may not be populated on all boards), it is different.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

