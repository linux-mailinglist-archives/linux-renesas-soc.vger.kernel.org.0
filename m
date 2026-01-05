Return-Path: <linux-renesas-soc+bounces-26303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985ACF4A78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 065033004EC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4AB332EA5;
	Mon,  5 Jan 2026 16:24:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1E333745
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630263; cv=none; b=rhzKr+jFp5E+POCeRDb6tlSwWp+Xuk+sfk8JTPdre5rqtA5YBcPlCurhHd5RNWEU3bNkOgZ80eRb2WLalR/6i83xgLPX6rStEBRpQu+viqJSL1esCZ0WXAMobazRH/uzuO6yrWaDGOhAtOxzA61XM/lSTiceFVQDNlQwJadTTwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630263; c=relaxed/simple;
	bh=MQJHVWGVMvEgY0pTCRXhfF0hcdx5A6vuZ3OGEmwJLyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2kzPi/bOlrovxJhOCSzgs36JM1BmqJgLkd0AxG78MKByht1kpaoaMgXPt54LUbP8mQgiWcVttt1HowBHZG+rSZ9iwMJjiPwn4MNVC5pVsy0yBUVpmLaezbF5RhNX/apRsocU7GaiigM8tWfaox4ZcyqcXCBJrwgIUpN0Dpd7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1244551e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630258; x=1768235058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG5F5JQHgu2xOW906W6PARHJHbrMbK+KGI+iRwpYzNQ=;
        b=umD9OezwNmGTnDdxgoribbdl8HfVWuzoVgm572pSY4HYCGDaPf/fwncUWdOtOqERsX
         u0t5opwQLbTuKQ50H/5sBHrZkO/NWjuw1VBEd6YM2YpRr7PjcTvfX6VituFzYqPT0Xiz
         jZzMBcxLkFykbASFpjoH9xb/iDw69Qdve0DaEfdyJXjfFg4M0/vA++VnpjuoUM4+TCxE
         tTSjJ7QhjaUbasiJfXUURIhs12T0YxXZjoDkjak5FbZzW6fZVXevQc5EeCQKAa7S0M22
         7PCYbWUHIB9ouJxm5HpF5Z22PBRearVlp29tnnLPKjk0+km9oRZVIzcm71zRdjHAv67W
         8h6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5JqoVE/qrjLw+8foKqt5YccU/bGsdsZfRcAX1IvByGOzQuJ8Fe5sLo4ob/Dlq4O/PbPW/KaT4AyTgaUFnSG8K8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa5PTm8KW1QMG6d6QTaq0lVz7UdNibTRiBMO+x2BghKbUPpoB8
	27SOaZZDwubxsC9C2mbb+ms1B73vg36HwZJxkd3lr7RC8tnrgTWij0iKFg/bsDmt
X-Gm-Gg: AY/fxX4z9MOLb07b1KnjSzxARc2fOfK/tERFNscfiRe1JiOqm5+OS6HMc04Us5XqmOD
	52MKbMvTW01KYUgzXwrsSkcScGC2qhI/Ve/8V9yU6c+SbT9jpl+PLsnETJgnh3JfVle1tFoXBRJ
	vsnIuAIcM6cg8Av9WXZ88+ke2VkOcJaelSFxpppPlUFv859oeGnfA4QSQJnr29Eyzpyc81Fwb5m
	WGuN8p/6K3S39+McSaoOg/5nwDDVc6NODmyhBdmN2o7nJsq9sjiY6dW72+8K/eWCxJxdQcxZwqO
	54gasKqBepcRuTzH4bJcJjQhMJPmINzu517qNzs4Zpdb/ySwoSAfGJXcenWbsa7RpEvbwkd3HLs
	5UXn+QeYb0LBJFIo0Wv/q58EkF5pfqT9lMQcmXqQh+nDRYP5Y28tSNUfQeib3RZd2scackaHVHi
	3of2sUft1zjkns9v1i2r3IHd9hO7NXYH151T+dVGjGOGmJITk5kOQWPl6u8XE=
X-Google-Smtp-Source: AGHT+IEjf3mGxCIpzrjbSLI0TFU2su26+7N5A+JrraeLmCihGBZUPDMZylqemUh21kwGakEe7ARNuA==
X-Received: by 2002:a05:6122:1e06:b0:55b:9bf6:da7d with SMTP id 71dfb90a1353d-563190444a9mr2490804e0c.2.1767630256967;
        Mon, 05 Jan 2026 08:24:16 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563384f7bc3sm111790e0c.11.2026.01.05.08.24.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:24:16 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso57290241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:24:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVqu4MfaEZa58V0tyPpdoO2okTRqMeDlN0x6RPx4ex8MQUWIv5bQLqNc6wqP3J1p4PuTMWjE164sP8EIIvVQr89g==@vger.kernel.org
X-Received: by 2002:a05:6102:5544:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5ec30b2d62amr3150905137.12.1767630256405; Mon, 05 Jan 2026
 08:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com> <TYRPR01MB1561941846EC8C92EEB39E1278586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB1561941846EC8C92EEB39E1278586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 17:24:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnY2D8vLMd0Y2ypeSr_nm6ziiyG57sUNqkgNM-Jn-_OA@mail.gmail.com>
X-Gm-Features: AQt7F2owp4Lx4gxw43Zb9iibAIGGiEAsj4FfeLdF5mBM8hUhf0xrJMxP_puaoqc
Message-ID: <CAMuHMdVnY2D8vLMd0Y2ypeSr_nm6ziiyG57sUNqkgNM-Jn-_OA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 5 Jan 2026 at 08:42, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > -----Original Message-----
> > This series fixes an issue when entering s2idle on RZ/T2H and RZ/N2H, as
> > the register layout in use by them was not accounted for, causing
> > aborts.
>
> Hi Geert! Was this skipped intentionally?

No, it is just suffering badly from the conference and holiday season...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

