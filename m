Return-Path: <linux-renesas-soc+bounces-24565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA8C57F28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085643ABD9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F0C283FD6;
	Thu, 13 Nov 2025 14:19:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7A26ED46
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043553; cv=none; b=l9aOz9MPhH8uYDGySKlol/yDHWFgiTszWjD07PwjSpEeahqkzwr4f7vQ/IuNeXPtNJ6JDyAmdCX3qSG7m2bEAOHzABoC31Dlsa+svD6tLp449h2euD6/a1SLVKWwtK3N2REmrbNxGRxrgBnimmJ834T7mYnHVMvoiMO2Fh8FwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043553; c=relaxed/simple;
	bh=vJVdsmeHsUXqAeVRdhsj7TQml+wrLBqo7mPbRPjpD20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjzQqcuXdBM2O9QXFyy61wg5eafee92TrFdBdMcxonhueR8PR0MODr1XPcGUtf9co4O1W7fTszz/rLV6y4IgZYf6xBvNqz3Hy3fnZFcnBfrjayosVDHEb97Lz5tZqNy0XwNZ+XXvM83Lo+I83LxhTRqNj6LvZJAekOlVvOaCu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5db308cddf0so443928137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043550; x=1763648350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icPVrj3OePZGMuahj/4/ViTGnP1F/ipWE8Dz8LO0Hro=;
        b=BJCDSidybYVlStjLsp9cgDlQb6I0s7zgCBTd0qo+VHfeDMzOMxGfAUP083hEAq3/tP
         xY97XLdx+fLyFldL9Rd0hxinFbhJJe04LX+ZWMaGUOKmyGKls6U25mAGEOjxQ2eyp6y4
         h8LcyCqRkTyI6799i6Pcgj7u5k+vZBKxfuCd6ES52oL3H0dzW6vdA0rynRl1EDpEcBEt
         RpRaXttiFwQoL8kUdunTiLK7neI76nsQTGW/mpsiPQ0s30xI9EBAXNCkQd6KxK15tmRO
         Fg8zBFYAHXy04LuxvLG57xkvRGcF5Wus3SjMGRWlcCNcKi2hCxs57hLD/EoiDxqMZbTN
         C66Q==
X-Forwarded-Encrypted: i=1; AJvYcCV74bmjhx0O4J3f7LKoUP98UzrUXsg4PMrPia7v/H83q4KjEenRxSwccWP0JALZj3r+GhPzsDf9WJToN3ENqyggOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1yy9hubUzORxlXzm+Mrm1kEgqLTb4k/lL1croPR5NWvABJLt
	79SJLV6Iavr2zxvZNZqer+PoJTmB+ypJDAadYdzHaXq5MOUGlBuVfUz1BcKYUWSO40M=
X-Gm-Gg: ASbGncuVxHw+UeBJqIqWmMuYxZI28UJKMj2R4SQJA33D+K2REP/UTEisr3F+Uztnbj+
	6B87hC3YJKz/F0HLT2AwCf32Y8FToY9QFwl9LfJZkI9vh8ku2MUvt222D8Zpes4JDfztzg0+I4k
	DGjLGfDdeORZQZdzDFMBrH6AB6HEMFntm25Gta3DJU5kU7J+AIIes7jz9riqr0FMAEkRnha9UTt
	1gQZhnxCz4ndqv5TCAV9aQbI+uW1ThsQjHVc2ZdnaMtSUNAg8jCTA+ZAUrOVyygmqQ9af5fsaHQ
	o+AIxj8uUTt7aFVYU30bgSLON9uDDXG+clWVYtsH1Rjfkt9Z1Ob4XRQDNGVpWGxjVS6bNI7ViQI
	4Q0fficWgcCj3gH1J1LUT6ubRyYdwuOlgOPA9esZVUR1+lBU6SEMVo91kVcT/RiFUDlst3B/toP
	c5LZrbmrarKB6Pv5Ay49L/P4Mx8aI3U16QSI/YJg==
X-Google-Smtp-Source: AGHT+IE/OUjV/q0aI53JCYMHLMxF3PBC+7SgLEjnUrImDUDh/SvrAndKH1hM7xkZb8DAfxrGScyEvQ==
X-Received: by 2002:a05:6102:2aca:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-5de07e4ef5bmr2641379137.29.1763043550411;
        Thu, 13 Nov 2025 06:19:10 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f499dc9sm698087e0c.23.2025.11.13.06.19.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:19:10 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9374ecdccb4so495027241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:19:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXulQ2PedAsHvXbkhjAhw6E1qdk4d5qkE/uF17cvSauLctYTO8B/I+vHtX+A52XbmuG1GwtrUz39nbi8QwYZUyBAA==@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5db:d07c:21a9 with SMTP id
 ada2fe7eead31-5de07e67bc0mr2364221137.35.1763043549851; Thu, 13 Nov 2025
 06:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com> <20251107210706.45044-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251107210706.45044-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:18:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSgpJ3khJGFn9__BW+W+zM+fgrEDFKuAZgQeXyWa6w-g@mail.gmail.com>
X-Gm-Features: AWmQ_bnydjHxg_KvXSzY7Vjv_ur8bfvy2AE8JWRXR2FRDM9SQFjKqTqegYDXS7g
Message-ID: <CAMuHMdVSgpJ3khJGFn9__BW+W+zM+fgrEDFKuAZgQeXyWa6w-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Nov 2025 at 22:07, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Enable RTC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

