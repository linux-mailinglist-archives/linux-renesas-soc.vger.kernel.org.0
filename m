Return-Path: <linux-renesas-soc+bounces-22455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF715BA94EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99BA9165D29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E796F306D2A;
	Mon, 29 Sep 2025 13:19:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED8B307484
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151941; cv=none; b=SM8d5uxHSNtufgS2hRVSyzO1A5+Kzu0mMIaFaXq5l0JAc2P3yFYtwtqOPBW4aAI3ZKsdLaFBg+U+vFynag5wB5JhaSSOOThIV+C53IqvXys9F2Y3Yv3m7MnSxY2AxhTmUFSDhgQOo3ANdmW7MV2KUu05MfZ8WQrgITaGEXsPdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151941; c=relaxed/simple;
	bh=XI4WQm7gGIFXaYh8DfxF/b4f0tVnA8IxTMlZYokkIMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTeV6WP8r7380WWuckK27gG8C6HLBYzfGFLVKBdZseKm0STS4M+AKHk8+T+GRMkpv3UApvnORf2bFenH6fAr0YTr4L/BluGnZFOLw32MxbhvquqzdBsP3Y7yHaeGNNOEdjUCD4vK0EKFdfKMI0MJv+yuKWlti9pnZfAbYPRXDY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5a392946c4aso2650924137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151939; x=1759756739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdSWk2OXDxNVG2w+TrLN0xqawGUa3pPEMijCIv9j0o4=;
        b=NaB7gc/9b1OlOCRbCeZm+naHttQH1/UzA+LSGD11kK76VDzdZVUbIS1cb7gJT3+6Mn
         6rpIVv+t1v1nlyoXBerUCScqn6j1oHxY5+rFM4xekDt6U+P1tu+T7wI1HHStjmFHksoe
         fIa9kCsS+QinzDefj4v/pT0yF+a4sxbGtnju21wjfVEUFnyoqmK+tZBTMkSz3bqfGG+E
         qmsYG1qE5Fr40sgrGYu7agsX+77WRoZgeSnf8xq35RSHDod49h9WV2NQsPo6vRB2lGgQ
         N2Tk+LCwZrl2qSwv1PUDMzbOi37QyHBTDtISjLYkr2eqVIdH+B+nowbc6noihFXluOsG
         54sw==
X-Gm-Message-State: AOJu0YxOd7DAdf8bkUipo3AvYhj4y/xWOg8APGW8seNIrb0LdZcGRJs8
	6Kb2MyqGvRwgf+IMjLELyhNNmKA3y0/GBuyLHEc2P/9z7KGsVYETuoBMGKh4co6o
X-Gm-Gg: ASbGnctbFSTT2NrOJd4Nko2+u0EQQlu7JeP8unqD0jk5vCl2DNTUaBNXRnXiyiTku/S
	VYQeZniKHlUnvlTEzAcqT7h8KIlcuAwX/vWk2inORTcE0W0mRqZoNg9BmPShhkUQ1svAoATCsws
	eeXhsBVRgzgtT56/y5bL7mHIBGXak3zdNigvh7K81JexYSnZwuHviYDGLJ6coF/Du9ZITWyAuLt
	BUGrrnCMBbBOwHRFOSkVBrCdCIlKdj2+bNffuVSWQOV9RshMctOntesom6z1r6wb+cglPoehrRl
	UC+N7FCxKBuOqE10AUAL58Slz5XGyzHQ/VNSKF1aSuGVh3I0OGBcC/12r1Npr4k1CLhrzG1jhut
	iShcJOpr+9N/NZf3t3gDXqQospBP+mgWGtibERGTN4s7scd43aJqF90hXzrTrSY3e8s9Xbi+3cH
	4=
X-Google-Smtp-Source: AGHT+IFagy1qTqWzgW3sDPupnp06yDphs0NYjqk+8SXLUPHlwpbXs1zlGNKwFI0EdpLSRp1QFHEVMQ==
X-Received: by 2002:a05:6102:94f:b0:525:9f17:9e63 with SMTP id ada2fe7eead31-5accf6d82e1mr6752028137.29.1759151938956;
        Mon, 29 Sep 2025 06:18:58 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8784984sm2276135241.10.2025.09.29.06.18.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:18:58 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54b27d51ef7so768527e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:18:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1826:b0:54c:45bf:f46a with SMTP id
 71dfb90a1353d-54c45bff790mr2168126e0c.5.1759151937696; Mon, 29 Sep 2025
 06:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-23-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-23-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:18:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeWJyp9-_6ERhwmr95kP+NTc7FH91qpdkMMPM_ih3G4Q@mail.gmail.com>
X-Gm-Features: AS18NWD05VYP9c8qfs8ZvDaGbSCzI_X3AZpykIxSu7kdJsi-zLRmU6CPupP8k5U
Message-ID: <CAMuHMdWeWJyp9-_6ERhwmr95kP+NTc7FH91qpdkMMPM_ih3G4Q@mail.gmail.com>
Subject: Re: [PATCH 09/12] arm64: dts: renesas: ulcb: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> ULCB boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the RFC is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

