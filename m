Return-Path: <linux-renesas-soc+bounces-16687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC42AA9493
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EFB9167176
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500AF42A82;
	Mon,  5 May 2025 13:30:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67E8494;
	Mon,  5 May 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451853; cv=none; b=CVSvYmesLvx17KE7tfASA6eD4Ij32gmtk516Qu6YUAYmMEcJO94Y49rmojuA4RiDtBqW44ThTUjcrdZXS1MScxafsRIQWGh2FFF8ZwJy/8vD33qmQLbKn88gcizNnD4gQftmOTFZarQ7CYnxqHtkcHY0OdFxtw6+70l6kNS9vLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451853; c=relaxed/simple;
	bh=JvKghcmKnjMhoG5LFd26j3rcP2HcpNU42TYq1hdEfNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iwc7fImJmOZWXk0HHDWuYxMT3QfFTYECNgGG0+Dp1vALVI2j+/Tudpsg+38RI+fN7Jkjw+dKY53kJdjnvbMrw1mkyIk37zXwWxQcu4aEJh06Ja6L3HMaz9nWZBGLyO05W+ddCg4YJoXCSMhnnIIWu55DkZdcVMKHm24jFUytK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d377306ddso1044919241.2;
        Mon, 05 May 2025 06:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451849; x=1747056649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuh+CdOn7uD0LZd8BALHSrSesh+e5Elj6fD2f7bCbWs=;
        b=TNLzsM7HApeOauYyA+EwRgA7hK9nJsdkFO31XmqGFY/M6kR/I0YuL7FZjIjtQ4M6YR
         EauRd+8P5zNFazLMzfld7Nst4OGCCrmsEJMiEl91abotQvppURECBZ07p0Chdp5sYAVZ
         LL2h5AbmSyRJXH5FTG5ruknVfACyj285I5NBZDeYNZ9Vc94hgdVDq1vQOfQhasixN5/T
         cAn3MzUdv88Xq9LDTbuR9BB/JqKkbowxMIuUtAk00BnNLygN3h7yYN/Lc0DWAbNLMiJB
         /PSMpKh3RM/yjRzHrA7FHabTvl9EwacSqbi+QMipczU/dgUq1GipSeNibRD/EkvE/y+h
         D5lg==
X-Forwarded-Encrypted: i=1; AJvYcCUmnmHlnOlEdi+Ez25M5dhtMxgJIy1Jn5MzUMhspLO8MHn/BzsJz81ROhq2lfk5rxXJQuNgKKtizVCu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+SilinCB/1lOhhlrDFqLCFGaYP8FE9k/t92LR4Y1FBa10h4IR
	k6RvFRqI07dWKUZQ8CB6zofW49o2Ne9qhvVsaJie0and+wbAL9Z6LNHks6Ei
X-Gm-Gg: ASbGncu3J+BevuZ/tJARRxggNcqQJsCdAbF8nu7nhTBCgv+58JcKenT7fW5ct0cfrnh
	Qtc8ADTGOmPS8KsXfUdeW5cDRCgwmONMbdhoSW+3O2tH7h6+rUEWfLVHTPATCxxbWCd7WdsBfm+
	WFRpCagEzHIGPWEN3EAMje2A/m6lZ7DtFq7KlY9kvTlTvdlGend/f0GTIbUF3M8qzHEwKQDbvXt
	Ndy4G8Wu8HI0RNQ+Nx8eOeOIeXV7aWKuMpqKLALDJibMfib7rwWuZ7GLHup7VYBYAdYVI/AbNBl
	cmbuDu4OzHx5dRg3EX8ohuav1GOqmmjJ5EqFX9J49/aBbf49O4hOdrvu1lD56q0f8WQ3RrUSVWo
	3JpI=
X-Google-Smtp-Source: AGHT+IFGzMetuQVy6FW0eg8f0/nYUdd8AKs4UXQuL95kiUTnl3EMElZmEhY2bWaawUw3LEt81XZ3TQ==
X-Received: by 2002:a05:6102:568a:b0:4bb:e5bf:9c7d with SMTP id ada2fe7eead31-4db0c3de417mr4046455137.17.1746451849356;
        Mon, 05 May 2025 06:30:49 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf234a8ecsm1435092137.14.2025.05.05.06.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:30:49 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c9cea30173so1097476137.3;
        Mon, 05 May 2025 06:30:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNgNi0dlmoWfhPKweeTZpxJUogz5Vy26EA7hxS0tWuEYw1DQyw/7Xl+4y7ZT9GZEZ6UM7W5e2C0hAm@vger.kernel.org
X-Received: by 2002:a05:6102:579a:b0:4da:fc9d:f0a with SMTP id
 ada2fe7eead31-4db0c302d5dmr4283329137.15.1746451848733; Mon, 05 May 2025
 06:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424102805.22803-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250424102805.22803-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 15:30:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXu9G_C5GxotWn0Oy7Yo=oJo7RcfCioPV_tyihqr8e1kA@mail.gmail.com>
X-Gm-Features: ATxdqUFipEIjMm-6Ipgsls0aNfTqXlrE45k5Yjd7xK7rE120sihUIVMsItK0_Wk
Message-ID: <CAMuHMdXu9G_C5GxotWn0Oy7Yo=oJo7RcfCioPV_tyihqr8e1kA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe 9-pin
 SubD-serial port
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

On Thu, 24 Apr 2025 at 12:28, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A simple CTS/RTS capable UART on a good old SubD connector.

D-sub

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

