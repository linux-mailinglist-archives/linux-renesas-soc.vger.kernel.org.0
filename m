Return-Path: <linux-renesas-soc+bounces-25893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5FCCC741
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63119305A60D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE82535771C;
	Thu, 18 Dec 2025 15:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2387F35770C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071590; cv=none; b=lItRtLJRWTTpE/x+3hsj45sdK8BxdhGObCKxWCTQyn6Uh2gC5ThJE6lhG3h89ifcqSkty+Z02G/1lYUv7SScFR6B9KH7iXdotq0yvLG+iRt2m6CXkInzMNhNlGjxzcHJz4ErLZTQaC8ZVpsrRZ18BWeficRJk8NhgNmLkXpSJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071590; c=relaxed/simple;
	bh=MZFYNuXybRkvVzjEOIC4+EfAayF8myAFp7P6EDOSejQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZqGyRRFksvOgSC0x84b+zcPCawfipOogNXssmHUzcJ3uKsXLwzmCbLA1z7NKUpJ/xJxkn2Pg1WhsZVj3Yj6SZ14Xto4FzwXbZiEarAVflCCC2F9Qkz4X2suCM5EOgBybnayp5fi65mVlzooIQkji5JuIhy99R0QSeySqhGqXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-559748bcf99so611594e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 07:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071584; x=1766676384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=;
        b=HxuNrTRj78KX57EIrKpDdESH2OfdOP1uGLLoU/pLmU8QAG1dhij+nS21PePUso6flD
         6glIM0Xfp8rAbZol77XjNsb7wQVRgRodU+z4X5cBdkJGPkxcl2/DD4RA4YAMbVxTPpGL
         xzE7T5tUkQDvvqT4sqisB2KDMfz3JIAhtEZainM/xbumTN7pbuDW50aK8Ymvstop766C
         SJfkJWtn4du0ORzZTU9qtvj7DYornm0tiC9+ifCSH1HySDJKG/7+RXE0nTBgNErwbg9S
         gapLkpvF4AufjEQ3XH8INvwPRdtdGhCddFJgHgUNAmQYw/i7Utb1Oah5UaHw5OFGwK+d
         kzcw==
X-Forwarded-Encrypted: i=1; AJvYcCUKyTOhaC0Jkt7R31e9OyN8DrPAd7ohBQIUtf7Rb2evNBlvD+QnxcCB2p5DaZmmY/9vDibm0+D2K362MNKpKlnbog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZ445+HV+t34W1UU0TXJ6nx2C7EtfJB1jso9T33K9+aE+L/nJ
	WNJLrTWhwbwLnMnYj9v4AdMNVrbvIeJKZfdPV0EJlS+BwHFW5yNB6WJA7Vfaf+vD
X-Gm-Gg: AY/fxX5Jhq8zLQBT7W0/ZfpV1QoA4TXz8zPpoxpO/CxWvlJlmEzs+Y22vzRyJywYjyf
	LbO3P/WUQJxTOQwhILpHp1jo0YAC+B8jGpoQG8Swqx3vcpuISDsSBnAKSTKqV2/b4Zg29h2sthW
	/nGI2hHSUgf0UbSkPdG7uOL1j/9k9Bf/xOxqasmCxqWZCFRsMJsBa9OgYnTxQQ6YsRGch6A/s9A
	ApBiBUmhd3fvi5HDup3tgdTulpFRE5bG7NBg9wqBysu+CJAqjl2BYOoAabwG3+NtCRrhgqfhS/v
	kZoQd4TyLP1F+XNW8aZzasZs2L9yzoNKBHpQ+QcHPCv7a6p2KJ70EuojDYJu9LhF3fw+/dAxfoN
	UYzsOFPxQWBhPAFRmtk2M54/3ZUnQ4T9pGRUcdTidn4rJTnxM44K8CAzZff6s02qvi678TOMVOI
	xoE2uYoSrEoBy6SV4hYdRKGe98sg77up2A+RTBRwy/9rwzaJWdUpyN
X-Google-Smtp-Source: AGHT+IGsTKsZRdd+u3IkncxjltqO0W059DT1pHT/0HqYeP1aHiNH1Kb4YRas4699VFc85a7rnpAjNA==
X-Received: by 2002:a05:6122:2a10:b0:559:7077:9a8f with SMTP id 71dfb90a1353d-55fed5887b3mr7054525e0c.5.1766071584282;
        Thu, 18 Dec 2025 07:26:24 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56151041282sm1090365e0c.14.2025.12.18.07.26.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so500993e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5uAyoeFsM9pz57lnqLX87hHV+SYC6C0AqHCXsKIYmHdSk2ag9f3nrz5+cWfF63Ku8UhbOI6NEGpKQ2xxe5enCuA==@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e827475423mr7568578137.7.1766071582885; Thu, 18 Dec 2025
 07:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:26:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
X-Gm-Features: AQt7F2orA3yT0lOZg8JX_FxOJmakbvS5h-4BSNrnlwxZlZ9eRsbqovvybB3Xhko
Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:21, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Add "clock-output-names" which is a standard property for clock
> providers.

Why? Isn't that property sort of deprecated?

Will be replying to the cover letter next...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

