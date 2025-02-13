Return-Path: <linux-renesas-soc+bounces-13139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C64A34B63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 18:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCF5A18845FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 17:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A29201271;
	Thu, 13 Feb 2025 17:07:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248E41FF7B0;
	Thu, 13 Feb 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466422; cv=none; b=OzHBSsokjJaExIYLMFIxb3bJa+JjbHS7Nf+MEsauLhxY958XocNgV7WkkLUriP5paALEOh/UPbyYwaecY6+8qmyPQEhrx1vcoEtOO8+EpCt1J1pNmbtEgNoQbHT1zjIbYL0232qTjrtkVkXwxtUXB2Wy0xd4JewR/sZC9rdFcrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466422; c=relaxed/simple;
	bh=9OZZS9cRGpm80QHsvhNO3U2VncDvKFA706oVsF0GWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TX8kVWYFQJKKZGzgbLZKJEG0vf8TG59a2M3h7J55U/xRgPWmqP3GHZser4cHqiZqkTJL1W7RQzgBQHQAFJN9DZE0LLVuyCNX4BIaB2vppA1/EFy5qQ1zYNU2jJbYznewPv56WoDcTBXFkCNCPtYrGyhLAU5U8GFCqcytIth6vs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51fd609388dso357782e0c.1;
        Thu, 13 Feb 2025 09:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466418; x=1740071218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=;
        b=MGZb8bm99OaA8S4XwC++DWnMG8ibOSWZFsunZwUtIXzVlK96MKs871bpv1Qf+Evmbw
         7GHdJuIFbemASLSBHbPDCvgN9DIb52vuI5efvJ0hsEzGXTLJF0HKvhPS2OgOb2IS/4qy
         BQAOzO8+crJn9sCLwDWYf1NsbyMc47hUT+38iLWsHBxfylgDnOQeacxJOlEhjsVjNQwW
         1P5m8+CKAipnQ7wb5Mrs1zLqxQSNSf5LABn65nVK/fdRl0MkAuk4TkbxiYcaDSnsetTf
         hjtTTU1we7o8YqIQ0Gaf4CxViJVwRaQ0IFFtzhifcOh62xy0vXrv7/2mZBtXzR/xWFfu
         DZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoBf5CGj4zqTSOX3Y0wylDLehv9VrrRPhmMy1R75tVrhCQpKioaXJtxqbuJiXsml9CZ35HfqwFTf9X@vger.kernel.org, AJvYcCV0vcD2pEKixzHIIxredqm4+RF1+3A+QLIHEEsk/vPIsvvQvMy/38vMyUi2lSqO7ejWpAVC3bg+izFPVht5@vger.kernel.org, AJvYcCW/U6EVNhDx+eKNZECWjBo5J4/EUZe/Mq4NaLYAgpWCz6PmiNuYH/Va/9Z5KEUmnXhIFZQo2+pwN0D61TQBVVj7/5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gc6L6p/ftbpSD/F6jrwmFPdzt5xdsjIcoWke1l694mV9zFwF
	m+FQ2drmQR8ZHAvujGQix6farSbyZU9zXcgD0PmDhMsgDRXDaJMQWzAeT01oLZU=
X-Gm-Gg: ASbGncvDyIS3s57w8l5m/4UUY2Fad7Eha86KbN9oYBg5kjUWNm02dKtaIHvY8NK1RVX
	gRpaADiUHhiroIzJpDTZziebXM6Y3TPtsYFHRBoN7pPs2qjoxjwaWSgu2I9uUQPWRvZBxXKTLyh
	vwCoZR4uON/yVGHnqXZYb8Z8rEg4nS3vwPU4VpGlh8rkSrD2vTxrbJ9Dzi3dfh6sQgjjnUWwZpg
	cynALD64n110qgXE0wlQFa0hIHgi0PYfihMUXDJhXA8mBKNeTtO5zPJFWWzZV4Wj3YXPQdRQDDK
	gD5QYvelfWGxxnHq+SWFEilKK6PTumzN/SoRktP8lHny+pTbArKpUw==
X-Google-Smtp-Source: AGHT+IHtTWvpDlBDEAdwS6o/Jej8zQ73EJ6e6qtYedGHXpsYMRDsgVPKYGVTQ3mC1NU1Jh7BvcCrhg==
X-Received: by 2002:a05:6122:a17:b0:520:5185:1c77 with SMTP id 71dfb90a1353d-52069d7ea8cmr6725984e0c.7.1739466418377;
        Thu, 13 Feb 2025 09:06:58 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa40088sm220702e0c.10.2025.02.13.09.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:06:58 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4bbc406499fso274777137.1;
        Thu, 13 Feb 2025 09:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUZCsSPkkv1nwPZza91a4uGeUkTm6mKXwSS43JjA1kTf372k5k32uQUOXgv74K2hZYlowSvIaRcyzfUDeUv/OX1f4=@vger.kernel.org, AJvYcCWVg1MVRH35NUmvErPKQnpcC/8y61M6p/egM8yDcpcvyY8qQPqRtzmz1EH0fWjmhIGYyYX922aimKsWX1Rv@vger.kernel.org, AJvYcCXaL2GnFE+otLPKSBu/Dj7ln+5iNPDO1RHc9uc90uV9hDML7aVNKuu55p3O/qobLWaqxFXYWPVPIOat@vger.kernel.org
X-Received: by 2002:a05:6102:4191:b0:4bb:c24b:b623 with SMTP id
 ada2fe7eead31-4bbf568bd5amr7299920137.19.1739466417907; Thu, 13 Feb 2025
 09:06:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:06:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRu7Kp+qF52ApYYqdHg=tV5WTAOaG-Vi7Vqj5786Us2g@mail.gmail.com>
X-Gm-Features: AWEUYZliYRg_sys6dyhouDCv7ONlDd2mFCSmyYehrp9fFQVAs0ioNoeU0iPhl6U
Message-ID: <CAMuHMdVRu7Kp+qF52ApYYqdHg=tV5WTAOaG-Vi7Vqj5786Us2g@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: Add boot phase tags marking to
 Renesas R-Car Gen2
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 19:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas R-Car SoC.
>
> All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
> PRR ID register access during all stages of the boot process, those are marked
> using bootph-all property, and so is the SoC bus node which contains these IP.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

