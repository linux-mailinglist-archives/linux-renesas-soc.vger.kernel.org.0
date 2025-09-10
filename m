Return-Path: <linux-renesas-soc+bounces-21695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8580B51252
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E5F46780F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE6831283F;
	Wed, 10 Sep 2025 09:21:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5030BBB7;
	Wed, 10 Sep 2025 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496106; cv=none; b=ZOHMzIO03JSuj/6f5kNdVS24Hzj1oyiMQP4p4Neou9siWid6lchLW26hEDBeHdSlkF65crs9X9JpghyIE1d/4MkkpXQJlyxqycimLN9kG5xXeFxiODApaYAZQrO1xugvOJrH1i9jtsczBvrGFSJQxpRm/8JkbX0uN6b8qiBr8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496106; c=relaxed/simple;
	bh=7OEFVnHe4YlEyWaSYy8lXKm9Z+SLn86GNHr9Gmmbsz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNWnONcYGEn3Xre7ZVGuWRRzE1MmO80caHhDZCb7njdTK3ON/FQEA5cCm1r0O+mofZM3E/ZwIf1YasCHtH5uiK7Lrnjs8p0k/2fYzydF09kJd5w6D5TM0Chl41zwCSwm27Esu5gl0RDq46bg32ALSLph8NUIKK0GMmyj6xBtyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-53042807be7so4767466137.3;
        Wed, 10 Sep 2025 02:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757496104; x=1758100904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdyKRMHpAuu3HaQWjL+6fWVbChCcQy/Tsqxhv5tvLyI=;
        b=RwjEbtnthdKsjK4xjuOD6vfT8EHFzCiBoa/iYGStbDGkDIMmzbQYxz4DhPTDl2rMrP
         SW7HQ2RzsGnf8ULlaMUOMpHfNdDJyvesTeZwn6WG8cEZQboXY4W0TMtkgWby4JpGiLjE
         tXcCMANAmsoHc6SF39tl+0QoOFIqtduWIm9vqyZcGUjk0JPo/UdLFzzVCJjvl8EZZ/Zo
         2eJ9ORg74DR43eocQTBv2of9M0o+K3OfuJKq2+sKv+Sh5MpVJGuuL2AieE1Zj8JLLxNE
         Tc/Yr6uOo2Xadm/MuvRnJSJUMr+y+Iskk7Rg+eezzxJOXRuMMIaydZmoqDjI/x08x0AG
         U/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTt5bzv6No+X+wSTx7Kq0ZhlmSppaB650HKO2IMsNBzYHKFR4L72J+al7+ch7aOj7QlY9b2ngJI0KE@vger.kernel.org, AJvYcCUbDKadr2KYgNPlU1yAvF3Niky+KVJoZqJZBOuhVs1uX5WLv097fmJW22kbUH6/c52N9ddc8CPh/x9v@vger.kernel.org, AJvYcCWBhwxfW5hmiQVtXfWE59TugV2NWZJ/VNIEBs5kitherItG+ugEuWUNGetTUHfpUYt7zJan1xJuXrHxqffV@vger.kernel.org, AJvYcCXyN0uKzPcqHUbteMK0Hi/nfybFpUN8HnuRX/kZa9CQyYcj/3tWwR5wIsj/zgJcoSI2X9WyatZ7F5roSosZAwEqDoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJkRGXa9gkwzs+mDnrUUD0R2C0fkOMRi1g10ACaQRpStY5aUm6
	OAuxJjLCoY/FT3uSa9e0C+/qPiVyz0OtvgVuzENLZY5FkxhiqYduJVJHbyO59eKK
X-Gm-Gg: ASbGncv4v8gKSRuaHa9rhHg1bZErsW+QnZIkBwLft0wuMV2zLTIvZMYh5NwT2H6PHcG
	m5yvRj8xkjdRwU0OHddexWa4WUY46n+UdvkCVtfMs1qZ09yvWST8LjaQhXCEf635/wS/7H2yzkF
	AZTUCNUrFEX1Ywen6GW556O3CS1HnEezovoLwFy9cRgW5IIKdcyyO1KtiPT2Wch+PxRrEts5bPh
	ku7s53rt6la3bQrpYlnxDzVDCXl/jpOdTF0zD/IFm7GRo4hHn8rSSk879Luh9ssyTz55nia6KQO
	SEQ+tEE0t6+hUJMjHDlIpjonpYrePN3lk8gQHX29gtaPQZc+VQelJPy56PWBR1hS5saqBjQtUx7
	lJAcPnpIzFqhpGH3TChPD0MHPjnDZjQkUrKW5qWGyy88stk7/DRwHekf1MIf1KBZv1Vs7zgC7RG
	ibql70Eg==
X-Google-Smtp-Source: AGHT+IH/8sTgTJDH+6grDjkiwiCk1aCIn0GyouZHX0xqyU/qh4V5YAyaIRnFy8wg6LPoFE1ybBF9Lg==
X-Received: by 2002:a05:6102:1612:b0:524:2917:61aa with SMTP id ada2fe7eead31-53d2490d7a8mr5250182137.32.1757496103729;
        Wed, 10 Sep 2025 02:21:43 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458ebasm12474032137.4.2025.09.10.02.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:21:43 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52dd67b03c8so4642363137.2;
        Wed, 10 Sep 2025 02:21:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1etOwUurqBtToZ8Q2dyH9L51v4R6LqcGZBOtMf8Ljw/nG4iu0hd2KqHExU7D49iSaoGsl8VJDQBWEJvIsQpyj330=@vger.kernel.org, AJvYcCVb+o1xBHFKsHmhtoO/P5263KPqNV7EO8ZQ1pn9Ez80NUNq0xNMmxIoGl844wYX5GEusglMLFPbblK2@vger.kernel.org, AJvYcCWS2Dg1jp5h58UCTBF0WfcW3FE4vVLD4q+21MtDhyMlw0+mn0AQETwY0iDkFwGcKyeTfolihZGhYK61@vger.kernel.org, AJvYcCX4F5auMVuDe3zaIpyC96PJUFhc7fE5+5+JI8JPE7AoBp0pgDc82KBOjaVVZXv83syZgcUFmXm9uWVh/Rhh@vger.kernel.org
X-Received: by 2002:a05:6102:688c:b0:528:92b8:6c3e with SMTP id
 ada2fe7eead31-53d1afa24d7mr5249377137.1.1757496102999; Wed, 10 Sep 2025
 02:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com> <20250909180803.140939-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909180803.140939-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 11:21:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_+LcV8RAnc_=SANUi2stzOGmyY3Cf0u9H4P5dXR7PiQ@mail.gmail.com>
X-Gm-Features: AS18NWAfM8YujtH91FxFyPet0z11UNmtJsu3JK2AKWVeld-ja1-RWegx_fvOj_8
Message-ID: <CAMuHMdU_+LcV8RAnc_=SANUi2stzOGmyY3Cf0u9H4P5dXR7PiQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: renesas,r9a09g047-cpg: Add
 USB3.0 core clocks
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 20:08, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G047 CPG DT bindings
> header file.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in a branch shared by renesas-clk for v6.18 and DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

