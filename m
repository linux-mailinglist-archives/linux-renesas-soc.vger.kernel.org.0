Return-Path: <linux-renesas-soc+bounces-15832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF95A857FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26AB1BC2133
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A0829614E;
	Fri, 11 Apr 2025 09:22:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0A28FFF4;
	Fri, 11 Apr 2025 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363351; cv=none; b=KHNLXKUWUXh00Dq8HIdDsMkjMzWFUQvrtAUkXJ3gDt3jvFQ+j2KsWqJ8SYWAqYUJdOekFUp6d6VQ8tYryOxZ/Km0CuQxvjVAqFmd0iBSM3t8SlRp0w2Do9UNzESdONTI3Uwo7PlJdJiQiqY35AuPFUSpk0CU9vZBMIxA2d1QlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363351; c=relaxed/simple;
	bh=likaUJuWpNSdDZN+Ugp+pjMUjHOFjoZA/wdsHcLDxG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1pDK/LJn9t1mNrFFF6Y+OCsKiPyHorygUSB3nAWhPZcUQ5Ql1lyToIw3L9Gr1a0u/0OxcxUUlwtR0Zv+KIHGhYeIp3DoGdyYL6/zVrNxRsvbFdVqRF+Os9CK9CIN7P6vY74zYZIp7I4VXAZgwYQmvhvGhC6RjL2VcboDF3tV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso1616617241.1;
        Fri, 11 Apr 2025 02:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363347; x=1744968147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U41yywiSmwQJLBztXS4J7MpYe+8XTmcAGE6uWiEM9aw=;
        b=S7qFYTef/a2p3qnqxGzoWYePLM+ByivVB27KHEhggSDtoS+9GYPiXYPoUo1YhDAxpX
         0cR7M+qdYV7vo7c2TPHcivMxcYVMnHRRGVN+w1lEEojDl/Kl0101CcRVwNZXr3WpgMbb
         JvYqEk24c/MrBcjxJ3KI2kHkTG3RF4ihxHwO0PWaWOP6oUY6hsYF7V/LNN/ZVk7E4IKV
         BQ0+WrjcVhDHNMqz1M3Zk07bn/L47QGxDXLxha4QuLtI06rGakcVz+o6PzIQwwPYn9H2
         lLEUD05xFgkyK/Pe2yBSS8ZOQ5ooW52rq+XEnh4DSqXHnznWPKLK5jusPeqdKbTSwTjb
         0R3g==
X-Forwarded-Encrypted: i=1; AJvYcCULu3Jx7aUK1HWdDrZTW1IfGeGNvlSHR4iJEP+uPQ+eRBOYqBK0+2jKYQC9m/807Mp0cBkZVTIFyuBe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtae+Xlx/KokRZvaGsw10gQt+CjFPIrGfr1TFU0gRWf6BrqXX/
	EUARckeFPaXQcTRwms0VTAqKifTJDlaF6HQzYiesDKfP62AHorqQE/AAdpB582A=
X-Gm-Gg: ASbGncuqleMIoppvy64WH4YWlWAuA3469CR2tcSXNZayqRIFf4e3DNUZHTi4HtyC6cE
	NXEvuFEf/f2v9U9TYZaMTUy6dc3DIqJhNm7F4wAdYS53s3kHbg873yBt1ONv6GxVFMiObt0eh9P
	p4lm1p496biicx6h25xvs73mJ5MCY5rTNF777CqFAX1KQZcW0ByI58ejqU2dCchRc3JSgohgDQK
	Gjpudagsa26pLnzjPfx4gqkyA+dwvejVfHtyw4s0OyYVPjggP6RUs8mIj0ed0jLBXqUpSmyfjvx
	xIzw4S5Atm4eDHs6j7BN2NoTDdruY+isOeysxagRW27TWFZ1so3pWytNPGtt8gu+ryX+SVfpygD
	xKm8=
X-Google-Smtp-Source: AGHT+IH0fdH8sVBCBzCow4B7mEOOT5d/kpxyX7F7zOq0FdaxumkQT8GLmMsYBV6k7TdXOXl6csl3vw==
X-Received: by 2002:a05:6102:3e0d:b0:4bf:fb80:9429 with SMTP id ada2fe7eead31-4c9e4eb73a5mr928943137.4.1744363347704;
        Fri, 11 Apr 2025 02:22:27 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738083sm962599137.4.2025.04.11.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:22:26 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so1577882241.0;
        Fri, 11 Apr 2025 02:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXm7RfPvVC7VPFnFducRT2OA59a4SpY6U7h2+x3J1Ijl5K4LvQJmx2tiRWd+EnC9xB5Xz2IuuFMi17D@vger.kernel.org
X-Received: by 2002:a05:6102:330d:b0:4bb:de88:d027 with SMTP id
 ada2fe7eead31-4c9e4ee2280mr829250137.7.1744363346428; Fri, 11 Apr 2025
 02:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com> <20250328153134.2881-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250328153134.2881-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 11:22:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1VF1aNQw041h927c0V-AVhUXDB3vhFY066fWORu66tw@mail.gmail.com>
X-Gm-Features: ATxdqUFQbKT3320XUM2zc1124xXaR9H457HLE20EoslGbGpYsrN2Psq2tvc4rT8
Message-ID: <CAMuHMdV1VF1aNQw041h927c0V-AVhUXDB3vhFY066fWORu66tw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe
 I2C bus
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 16:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The actual sensor might differ, but all known are LM75B compatible.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

