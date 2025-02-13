Return-Path: <linux-renesas-soc+bounces-13140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 486DCA34B4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 18:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B29197A3C1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 17:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E300C201271;
	Thu, 13 Feb 2025 17:08:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC611FFC41;
	Thu, 13 Feb 2025 17:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466482; cv=none; b=aWT0KhmPdPr0t/3uGl+t2yUKF2P7Lx7anSKcxa4/Blhhyh8pSRFaA/Sb5N1DSoAu8RqOhiFvjE3PMsUjfjdHS8Pio7+yWMMMuk31Hk6j/1iDo6sQi3UOXveYkLlVdxxHVq2TPZaU9wTYO/rEbhCH6JxteXj21/gbModYpCuK4EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466482; c=relaxed/simple;
	bh=9OZZS9cRGpm80QHsvhNO3U2VncDvKFA706oVsF0GWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYddq46DsEJME+uYO4y4dlM3wq6F52sfK2/tQq1DJz+0eRBcBFaiFiML4UbhCLMfwpg4qv6IMH7GaQa1lYbKd7Yxna8z8kWJqjyWpdqAdESC5oy/m1ySTl0EofsONNg0io2dB9UQ3UJQHf2iYNvXQisq7xnrzOYamCzmJ9tFwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e65d6e1f12so11272656d6.0;
        Thu, 13 Feb 2025 09:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466479; x=1740071279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF3/2kfrsJYjoCEIlZrwDWAfYUEZcN2JfotI765XeoQ=;
        b=CzCUW6ONt2mbhcBkLI08cpk30u/NYyChHoJ1tq66FjTqzErnN5GFG41wQCJakSlMiq
         DTVJmVLf9RyJOJWiA+QPsik/gSxtY8qt5q9IErRRUSb3LWzCEdL5zZVtpSIJ2HMBKpoI
         kYKcnR4CpuOLlsqBNACZ8Ls7lRjXCpwd2dyPwTDN/7rMJbbpi0QYS5brERz7RAhFD14n
         P5pDiK+rlWqvtGD71ghLNnktgupxJXwI0uHDgjlVmMob47E1q7GVTX/ujlKu/uTh6YCo
         tulIQueuSci59j7SjnNZ0R7EWxOPiK1vk/fqBepbJcHbNhIFF1v8gPyG9I48ypyhygQk
         S5IA==
X-Forwarded-Encrypted: i=1; AJvYcCVDP47OLnvVtSH4PggN9AEqB31RJs5MhRiLJds2397q1XZfyeK6U+MfdjbOKBu+2+SWyME7dp/eUNWdEcFHBXsD7mA=@vger.kernel.org, AJvYcCVDlcuoxNrguD8/j+I3CgGJyl8wief7Ev4wka2+DnuqA1V8SG39nfokPi95JwkFGtLW0fbcbZw2+aO956Ic@vger.kernel.org, AJvYcCXW8iMGasXG5DDdLF8toM+hqw+V+5rEhSWzk2dHxbrWySW1tx2l/bxYs7hWq3HWS5VajpGLAQonV3+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3t/1Kc55WdcarXttJ2UPyVuzlvpa4hS8KTPJCFGBPa6rxW6K
	OsOzDRL9hMMqAxGRp/Myhvmh9KUIwkIh/hLUrszdYtJP9jQ/SoeFtiKlVw+aGLk=
X-Gm-Gg: ASbGnct8sRr/nHY1+eYkK1m2uZrILUxFY8B+ae2f+aHDSbCF8xESBjRwYeANdnvLNb7
	01iNg9saRP3s8cdSDfnOr0M/65Ix+Bha4IBxcUTiqECtUmzAtc9X+g9+0CNuGclZS4jfbDKK3XE
	EJGTiC++kXpdq/riDXLFXnYvt+OEDzATrJ5rbKd3IdIqFLV7BlqPynO4W1BqazWZhW/ZaiwTpJr
	WxwkTZuvNUB1m7ICj+9C/x5qsT6355Oa6Dw4BZW1Jcq7QFG7O7rOel8HZ8C//RMUDC0DSx7X5J/
	0XkaxkcBzhiWS0GCiNsDcmXAtxtvrb+ZisOdJ6d2+vP2OXtTRoEbq9t2LQ==
X-Google-Smtp-Source: AGHT+IEy+KunYZY6G3NJ/O3g9KwQRhOSkcsMDPpxHa4PQpQ5+j41Tr7Cbb1/wezUefx8Iu9l8gEOBw==
X-Received: by 2002:ad4:4444:0:b0:6e6:610d:a4e5 with SMTP id 6a1803df08f44-6e6610da767mr22842896d6.42.1739466479450;
        Thu, 13 Feb 2025 09:07:59 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65daff735sm11364986d6.105.2025.02.13.09.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:07:59 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c07351d2feso167913985a.3;
        Thu, 13 Feb 2025 09:07:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDeBjanXw/OUvd29dwSZFJlCgp2Zo9nhbOjFA15LfdnXxD8hn4mo/Kv/R2MvyFlHl4vOnN6O46nGbZ@vger.kernel.org, AJvYcCWi6ZeP8ErchvqgaAVqdrRWUBaMIGYUOFzIWUQwr5y11oDemVUs+qrScb7No4Xs2QxYgqWQsd3/t/Oh5K4j@vger.kernel.org, AJvYcCXZoP95oKT5J+Lv2rnITB8dR/y5r8bv3byKam1b6tfQL83jKVlw6mR8rcwffrvHh8vVjIaDqvhH/kSpRixQYIdmz1s=@vger.kernel.org
X-Received: by 2002:ad4:5e8c:0:b0:6d8:9124:8795 with SMTP id
 6a1803df08f44-6e65bf20a4dmr62008406d6.1.1739466479037; Thu, 13 Feb 2025
 09:07:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org> <20250209180616.160253-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:07:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBNtxfQiOK-KMsibdKHyr5mN9N+hv+c1ABaiEZSPbWjg@mail.gmail.com>
X-Gm-Features: AWEUYZkos6MVmaIXRjsuTUlAMc2WWtF5h5-89JnjDflsSFca0ymwfS_ZVV3LF2E
Message-ID: <CAMuHMdWBNtxfQiOK-KMsibdKHyr5mN9N+hv+c1ABaiEZSPbWjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: Add boot phase tags marking to
 Renesas R-Car Gen3 and Gen4
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

