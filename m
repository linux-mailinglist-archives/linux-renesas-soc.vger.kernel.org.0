Return-Path: <linux-renesas-soc+bounces-9519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6B992B41
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF661C22C52
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED9D1D26EE;
	Mon,  7 Oct 2024 12:13:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E71C9B77;
	Mon,  7 Oct 2024 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303194; cv=none; b=hHF6YdCEN3YR+Q7W51ltTFggSPFPerlxdOJ/eW2i+chQTWW8VKXM+Zq7gMMPOXvPXMofen9fqyi2jBtT7a8m22CM/JgAjTTY5NVYTrlviXPKU4wT/ZAgKQ4c4bcoVelSq2dPNWCQJb68mBeVUXZlLmFEmSbU/InxzwqAxwEvzbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303194; c=relaxed/simple;
	bh=QnL0ougxUofvW1PtCFIwCAEXQQX8fyRXL7SN9war+Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7Q0lWQa05Uwz2anC6bIv+0pLtA6B8KbMcTfl6a+xqmBFnjR8XW+odLfW6j7oFklfO5A7TPGSHhKg5Yz/d1zqU+yLInR3BJcRdyS277D4G0/8W84H21Al4tY8rwLYTsAclPx5mlIClCVpK6QvhgQR9XGo+dl32BepiVFuhh9ju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e4d1c992so11906927b3.0;
        Mon, 07 Oct 2024 05:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303190; x=1728907990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GLnBrZ5uAk1ruSrYKStYcqnLRtVcYLl+QgpdGzK8hM=;
        b=Bg1oOMg6isI6JNE+rC+tz2W44AiNWZV9VuEFhfVN+i+SOyfGNF7WLknUoL0fp0PrWQ
         BafVCobzY2W6j+6xIbrHAUxugOpGc3gzlRBHKq1YrHo13bGWg1q/HtgTmVYOmWs8pl/H
         NpjXmXOshbPWQaC3uZ7Cv9KhGKmyZ/3WPP9+4/GwtUSW78nESqEpoweouAPFMo7I2Njg
         PRmJhRi0zBTiISqwbMEoFHjxLnrfxDKYiJtZ1a8cwUx91jAqWMe7tn5ckfJE0aZvmMat
         BDnoLTwQSCoqWUnnK8+N1//np0fxkjkxEJUYTZrKirr0jE2CozqmClbMbJmakfU6XqyI
         A/IA==
X-Forwarded-Encrypted: i=1; AJvYcCVWxLAAxveAZZA0sHUq+G0w2M2SaXbtPA85VOSAwKaxkwtuTr5nUGoA+lhwOhZLUhHSndq2n9L94vpy@vger.kernel.org, AJvYcCW74tkt8zgBbLFs8OeHqVDksv5lj1QXh4F6P1T7HcYAafzaltrEbB+Cjkqq886N4xD2d1Ore2N59Z2Ns6Q+WOVVZpw=@vger.kernel.org, AJvYcCX9k3dcrwj0UZwO5CbsULV3Aep138QKGogPFq+43Tl1BjaIMVdj7kPci5SNh3qoWwlJf38EPofieLEyzrL1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cCSJxqbeSA41fcbqKy1OqLuY8qgq/nJI+UvuD1/CmNCE4GKG
	eaR4A2BwYS/8PjF9v1G0wu1iuhmduSrersEQkg5Znh82P8pyg6oY+QabYkAD
X-Google-Smtp-Source: AGHT+IEDQdgq8uYu090CL4BwWYN0uhV9BRecRo19GcJW12mW9q3naW5pAQQkItIS9rYq153XPLuz6g==
X-Received: by 2002:a05:690c:6a07:b0:6e2:2e8e:7a20 with SMTP id 00721157ae682-6e2b5367f0cmr103457107b3.13.1728303190431;
        Mon, 07 Oct 2024 05:13:10 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e271fsm9976317b3.105.2024.10.07.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:13:10 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbc5db8a31so31992357b3.1;
        Mon, 07 Oct 2024 05:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2amnrTNnKi7ido+s87u3dlV753xsN9eEDDnZWt4P6IyHyPepBLjsmZGARsU2SpNYKp1r3rPkSww9LtuibFXc0tDo=@vger.kernel.org, AJvYcCWoDpwwCF4B4+nrD8XE8AXLePfK0gH9iGzbdqI69UbKjOBAW9rvVPJZfIsjvXK4LsLnCMavgeGf43Jp@vger.kernel.org, AJvYcCXfVokXNUOrHXUvvkgeDz4PEg9Wgsfy2epAI3I7tUIxmQFTNlvuN1qjjKwF17hPmCenjXeuZR/sxlY+59a8@vger.kernel.org
X-Received: by 2002:a05:690c:6382:b0:64b:b7e:3313 with SMTP id
 00721157ae682-6e2c7c3d563mr77437277b3.13.1728303189364; Mon, 07 Oct 2024
 05:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev>
 <20240926180903.479895-2-sean.anderson@linux.dev> <CAMuHMdUz2boLeoaynsHHM_26XqNFCJhTLYx9+zEHCG+ZMRwKVg@mail.gmail.com>
In-Reply-To: <CAMuHMdUz2boLeoaynsHHM_26XqNFCJhTLYx9+zEHCG+ZMRwKVg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:12:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCfb5AJcAMRTzDThPz5DzmduFwROob-Y2QO6P47Ry4HQ@mail.gmail.com>
Message-ID: <CAMuHMdVCfb5AJcAMRTzDThPz5DzmduFwROob-Y2QO6P47Ry4HQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: salvator-xs: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:34=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Sep 26, 2024 at 8:09=E2=80=AFPM Sean Anderson <sean.anderson@linu=
x.dev> wrote:
> > Add SD/OE pin properties to the devicetree so that Linux can configure
> > the pin without relying on the OTP. This matches the register
> > configuration reported by Geert [1], as well as my inspection of the
> > schematic (which shows the SD/OE pin permanently tied high).
> >
> > [1] https://lore.kernel.org/linux-clk/CAMuHMdW9LMuQLuPEF-Fcs1E6Q7dDzY17=
VZqu4awKDj5WSTRt=3DA@mail.gmail.com/
> >
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> There is no change in the output of
>
>     grep 10: /sys/kernel/debug/regmap/*-006a/registers
>
> before/after this patch, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> BTW, I applied the same patch to salvator-x.dtsi, and that seems to be
> fine, too.

Thanks, will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

