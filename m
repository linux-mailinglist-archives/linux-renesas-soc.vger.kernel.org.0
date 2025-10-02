Return-Path: <linux-renesas-soc+bounces-22579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DABB3E06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CE923C62DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5F30FF1E;
	Thu,  2 Oct 2025 12:23:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634353101AB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407805; cv=none; b=VHny0SVQyvxCrQ8WcD8UZvcod4utz4fTlNd6A5dKFIq5QiIL/pNfF/gfisIUYSDb5L6FZJUQMW1ZDFpNLR3slMqIc/w85p7jgMLUpsM+x+9iWOTx/qIhrzf4i29PQwo7kdtvTkOmmIMb8UxciIVZ5BMUm84lBq4hqq2Ea/gOY1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407805; c=relaxed/simple;
	bh=gvmbEnM8Xq9x/tMwG+SeGSBdS/Mqy/IpPOizc/FKLiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmo/R+ggJO7IhdnnqCZSTJvSelVIMeD0gpiAmeyIni3d1TlgzvDDPPNaxFuL9V+FoQVB3hnhvUPCa0tUW8MM8Fkva4xmlNnbcteu2TWJMb4d4e3wcpNW95PNUJ4g+jdybjqdAJzYy6gQsPVAMYbcmA2DsGa12PX/TcjHxaFDgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b4539dddd99so198848466b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407802; x=1760012602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQMLIxPrWBfFJ+so4wBwnJ1QOuXysLo+deF3cZFSCvo=;
        b=b46IYAykI7WyjToX6FF/jk0lHCYtGi/BTmSXhVRDguoLy7Eq0nMWwSspKGLfnI8hyb
         51Cmc9Sowjb04qIXyy8BoRd2nWYp4QoEdNEDEBj2GmTdw8XbyThfs+NZAvHjlefIV9gh
         MwY7QsxXAUv/TjbD7Qo8jwBNAVvlEZwyUl5ZxfMRqZXaFBuBWkrcCART4245k6d0lhTy
         h4x15AVylEdkCyXy3aMmIhAQIMe/7owRW2QjNM9cMN4w4LgUME96acNhD6jRhcf/9kQU
         mCHmUCHCBc1teaBBLYOMDflPnbtCQQ4WIor4H0JXF2x1Y66sb4Z8KZ9oPDCeCwiWa49W
         P7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVvD2LulAdTcDzp2tDaUe0jprfwPkD2Z9Z3SwDiBO6LCh+dyhBXVgFW58ZuE+fiKhK2CnsKTG8gkuykXx4ee/21sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJf0P8cuMh4ayaF4wUhH376B41k0chfYOphqSQ5zf2OJ1r894
	FB34kA8NZf1E43aNMAB4CXIcs3RySH5038rteYkQV1jvBTaSp0c5tgXXhunh/LwZyzA=
X-Gm-Gg: ASbGncvyIlrF8fQxeErCDUF8JN/BUD7C1lFFZas7EOW5B2StdXtZwyQbGQgpOm4ECwB
	stVvHUBq2bE0iNV3cHoO90HMU1rW+2AVf6YGosXBv0/pOq5Qw2VckTRsEGFi3J3w+4IzX/Yh+4b
	gWuuUTavQttbExHPN8UY557lpXANr5ThSUop/xHcW06Qy4j92ChEC3xJGLlRHK8Gq03DKaNzNk2
	DFgWyyAd87YzrdeAfeSZ4InBF6k7WgWFR7Msn/pqL6u6Abi00IiAYW1xuTm3+N0Pc+nNkYJofzb
	hjMfFIXBgLxUmNkHe2YRD3oZ60rO0XwSrXtLm7UTkPDPPkj4ex9Z9BNifHL8qqmPvEGEkc1VuEF
	1qa2zjwbpf6vJUIweEpo7xcdI+1KY4jWNJcCdnQOdbZWs7sGZibETlXhvkUesL8HZiilL7rh4OI
	wVI5FFlRl0Hm/4SRd8ZgM=
X-Google-Smtp-Source: AGHT+IFpqyKOmW4BZLFqND3UBjgoCjBScNO2ooSXSs/9mNnIDxagSuqR5QxUtor8FJFz5XWANJcUow==
X-Received: by 2002:a17:906:c102:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b46e2625369mr971846666b.3.1759407801719;
        Thu, 02 Oct 2025 05:23:21 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm201774566b.66.2025.10.02.05.23.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 05:23:18 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so2100761a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUB9mGqTV8W07wUf46kdIxad9pKUPC+xphjXo4zIPZU8DhHvc2vTL2rS+B0MLAeq9z0VyQeFoAaQ+vqZN+82oQIVw==@vger.kernel.org
X-Received: by 2002:a05:6402:31eb:b0:634:cb54:810e with SMTP id
 4fb4d7f45d1cf-63678c7b7f1mr5768917a12.31.1759407798672; Thu, 02 Oct 2025
 05:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001122326.4024391-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251001122326.4024391-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251001122326.4024391-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:23:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD9eUSJGNH0+naHSvf8MjqZ3ctdqFp8wkrMq=qY9Zaww@mail.gmail.com>
X-Gm-Features: AS18NWAfWE-zmoZFShiXGWGVfqa0891jOjlp3tuzjqrJNKFCJ5kcTO_xUtaAquY
Message-ID: <CAMuHMdXD9eUSJGNH0+naHSvf8MjqZ3ctdqFp8wkrMq=qY9Zaww@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: renesas: r9a09g087: Add ADCs support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Oct 2025 at 14:24, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Renesas RZ/T2H (R9A09G087) includes three 12-Bit successive
> approximation A/D converters, two 4-channel ADCs, and one 15-channel
> ADC.
>
> Add support for all of them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

