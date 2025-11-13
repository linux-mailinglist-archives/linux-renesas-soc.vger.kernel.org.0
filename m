Return-Path: <linux-renesas-soc+bounces-24566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC7C58012
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B42A24E5EE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBC02C11D9;
	Thu, 13 Nov 2025 14:35:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE154281532
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044505; cv=none; b=snigD84L44Y2HeKC2LaGEZnFFvZgyu95qjAZ//gSfDYW+AdGRjNWaMhxZ+1kDH8HWO2OGRKT2CSPAy5EF26mtr8OC1UE6fY96uXUX5TERn9BVn59HxslN9iSSnz0024T5MzKpB1RKFBI5+NFRd5DL2W53u6PXFw/t09oqgEAfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044505; c=relaxed/simple;
	bh=A55pVaLB1a5M/183qzOCCCtVLqILltVvYYcujE/3gBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePmuXgQAUD1ifFwouW90JtcqBFs366qdgS5v4PP0T+nPy+9bHXqpnMJqJzP39NYFjAYYuRGvRr7Guf3CYRzxz0oKrGpycMNTA0HTsj9oH7E4OR150oP8wvBwjnHiouNRobErcR4XpFb2+JKm18PJlTrzeCTXlGnEqtjZGOpSzfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93729793469so520938241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044502; x=1763649302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPVdv+Cr3ZbcMU8t075Et/PpRUdOj7rpDshXN3z13xs=;
        b=M1sROA0vJaL767j+XonmTKrSIqSZCj/jjlkbL6+V8lpUNUPFCxyCcACJRfYnFxv0SV
         YwxAH9kzM2+NFZZag9PGbqpQobgGPmHW0uMuYs5CX0Ac9/lEKqdsuEGRC/Pf0prmeDjJ
         ZHxVDj9Vwl/kjwqprmQ7AqQKKKa0irg3ZGGGjN5/mSxntgY1ApfTv/Rj4CR8e25UApwe
         1jtfzPQpboLiNcYu9bIiQeCq8hhYT24jEIfT11aVZuYmJhE17D7GmfvG+54lu7sza5sK
         mS8EpTA7YUNqOsdkbNOd+2v/2+Zw/2m2k6RRwvRcMPLzvM9D4s+NOwrllXRLHVf4LzrO
         vNWg==
X-Forwarded-Encrypted: i=1; AJvYcCUa9AE/CD1eOqbEBXDSf2qmbRDBpD2iTdQhf1kEuADBayzIu5WWrVcLU1XqXaBZaZ/yc6aBn7Ecvu+RYbxyM8Rqog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmliCNb4d/LZLWycEUGgMKgW/dXphsOz6TRGXxTGg8K15PlyC
	DniI4v+ybgeicKMTi1W59tZIPHTF596GOj4JOaIOszzuQ9F54wGEbSdQTnGrt+Kmiv4=
X-Gm-Gg: ASbGncuQ438crQC1sfEt8DpNJPNV3GLYaoPcqvQ7Gj9eagO2C7mfNaeIe/cvG2cWsxX
	CaHcduIZZCvmC6nb+n6ClAEsB0FKcOXGiLW/M8W8uOyeBEKLCT7PO7Pv6+5kmIj+qGUJfIwvYmv
	U9UOPsNQ7CrLDUaLuhoFOV0f0YIYly+6vFh28pC2PPq+WAGWiEjHhVZr4xwFJeNj6/EyZt97Fnt
	cEPnhrqb1np7MMRPysm+kyScJC7ZOx211KpiiNcbXcUumD51OYfel7NX9oZkqAFNJ5xfbztK+8D
	9Ro+sTZeW1BpPmeB1u3IV0f7gT9fl10s22JbCqkHpuH14pE0jr8qyWzbQ2fcGCZyh7k4KmtfrwP
	/40I10ZrKvk+IzbaCS9RdCVlJuAsGYl0k336w6c94KsKOOUrU7TrWi19EuKYBFUfsHFk5GA1Qxt
	tdHajpuKXoJ8o6CfZKT6L7L4cZJL//midfcwRxO5Gr/w==
X-Google-Smtp-Source: AGHT+IHi/EvB9tCCy+QGN5tzH+2JQjAh5IXYIF0PDcUhR2Jhxra6wP0DwNxs8Z8dja8kkN1WFdl9UA==
X-Received: by 2002:a05:6102:ccd:b0:5d6:12fc:76e1 with SMTP id ada2fe7eead31-5de07d434d7mr2774153137.17.1763044502348;
        Thu, 13 Nov 2025 06:35:02 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb70b2640sm689400137.5.2025.11.13.06.35.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:35:02 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55953d7486cso527258e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:35:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUG6nXOjkOhFV8po3fUxFu45BMiY6K9toBxODsv9WZJ7t0OifIkuMWHNsJ0tnyIIPn9KrtH6ax0fjxcMrRaa/PdDg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5dfaf0f34c8mr2015901137.38.1763044121413; Thu, 13 Nov 2025
 06:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com> <20251020143107.13974-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251020143107.13974-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUz=f5ArCV-w7dcyEdqhsZJrKyf=KwY18mwOgVdt5TQDw@mail.gmail.com>
X-Gm-Features: AWmQ_bnUzqLPji7mNY2mLpWw72wOSZDLLWSl0uz9lB3HUP0ZZ52peqFQbz3UfMc
Message-ID: <CAMuHMdUz=f5ArCV-w7dcyEdqhsZJrKyf=KwY18mwOgVdt5TQDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g057: Add TSU nodes
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Oct 2025 at 16:31, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2H SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing:
> - TSU0, which is located near the DRP-AI block
> - TSU1, which is located near the CPU and DRP-AI block
>
> Since TSU1 is physically closer the CPU and the highest temperature
> spot, it is used for CPU throttling through a passive trip and cooling
> map. TSU0 is configured only with a critical trip.
>
> Add TSU nodes along with thermal zones and keep them enabled in the SoC
> DTSI.
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

