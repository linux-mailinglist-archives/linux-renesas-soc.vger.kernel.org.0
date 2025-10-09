Return-Path: <linux-renesas-soc+bounces-22814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725EBC7A98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 09:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE623E7D23
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508AB298CA4;
	Thu,  9 Oct 2025 07:20:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D627E1DC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994405; cv=none; b=j4AsL9C6MnEblrhtiRfEd+d5EKdiMRciAuT8fmcN1dgbILUlYxsNvyvmi9jt8qf4gctn48dMCxY6W+yxZQ3spWyu+WUBxBKYWdYWOvohnlFNluSdiL/uiWuyV6Bewm4bE6NPf1T8qY2cHZclNR8qng24Nh1YZOPI/QgdFYXj0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994405; c=relaxed/simple;
	bh=pXo1Ih1CCf5gDF12vQJfgh+QQk2GshZgdDAJPzo1xkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEQeVuHkIvirCEfZcZwnVBYe8sdhpHHugNqqCuDvDhnR9G206QFIde9K4X09m6PRuXiKTrmexTfNyAQs59ed3TZay3nR1/kKACxvPGI07WaW2A23/92brM+6YWuxpr4A4YDaCDf1XazrnrPHrzQ5QPiuOoWhvH5r/hbA0qTqyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so270040e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 00:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994402; x=1760599202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTd3A9N8Fr7NQsplF90FqqVbDNPwdHs5HoYAo5GAllk=;
        b=A3Zeov7X1U4IvlYbRWh891r23Xu+1NQroXUWf3j/wKoqFuaeGZPM/gabZZhcfbaF+a
         OEPqhYVU5Yaw4E9QUK4cq1Vv5zrlY5biYUlEExUq/kmKIPVUuwbhLGMXfrs2wKeCPH6T
         5JIfqse3JuP4dNRMa1KiNng4dXG5BM3pfYWlk7egAORhjUvMsqVMLQi2Zpm3IhIWaxPn
         7pkybvXWJvScwwj/fYA0FB9fH2hR4YCnsvZdIarzskKBL3fN1U6vs+XVb6EtT0n3O1h1
         MdpRUHCJdu+64S5yIbJYgQddYWnBqhNxLAX1u59nd1MgPF/HxfQuUmAuKfF9UgclmWCX
         7nGw==
X-Gm-Message-State: AOJu0YxUP6ixmI9Dd9SlosjMjPOJNJW3fzKUpyFZptsrYYxgRTqORjg+
	uwXojWith6A82K+F3FoAVJByxJTqWB412ygQGWORqsoSwE+5+OjhOpKmfUEWvmHF
X-Gm-Gg: ASbGnct1QPippoJLJ6dSeaVLA6ZQTaXGxM59i3/xKEgFAh3bWuZU1fp7Wsf/q/mkiqP
	Q09jPP5VThsZi82Ic8kNkbbszVZ0Dhu+vKXGK8UKLzgIHpx/uspC6SH1gP4nVVkAfoKVpBX6yf0
	8YOpeywHqVtgRHk8YF2EjQNWVfPSShkzDopi1MIqyZFzXfEYUaFw1Bx28vLwNubTfN3uWR31P9E
	Cxp0QPry1aqFK5YIDSxgxHNuO3s7pY7bkxAakSMbJL4Ipsz/J47Q2d9xV7JJ84rkXPk4tvd4/yo
	QKHlz8uSMnLo1gO2mCCITGrOWwv8YwzkYawVhmvMUZLWAY7MDK3j8VAOfeXivJdFfhDJOdm0r9t
	pebQPmsSLAIHENENS2vV+Kbm7uyW+x5qX6KjnkLeu8t0Afe+mwfeSIoh4RAaggsIHRvKPqv6TfH
	WIsfCfi0QP
X-Google-Smtp-Source: AGHT+IGf+zai2SA0hQ1+BblGvqBJ6CMNKmnjtzhLl6H1ADBv/aKtRQooDpj+9V6Riw2u6jlh4GUygQ==
X-Received: by 2002:a05:6122:8c5:b0:54a:2600:bf86 with SMTP id 71dfb90a1353d-554b8b97c56mr2800640e0c.7.1759994402220;
        Thu, 09 Oct 2025 00:20:02 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e0fcsm5117946e0c.17.2025.10.09.00.20.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:20:01 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so121834241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 00:20:01 -0700 (PDT)
X-Received: by 2002:a05:6102:d93:b0:5a3:60ba:9e4f with SMTP id
 ada2fe7eead31-5d5e2270f9fmr2840499137.8.1759994401534; Thu, 09 Oct 2025
 00:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009071033.5378-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009071033.5378-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 09:19:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWowar7aD9+og1GXY-gaUuewSjnxqLH0KCFrdpeWvCZA@mail.gmail.com>
X-Gm-Features: AS18NWCO2IVX03kpbrCrBlZzTqUTmdMD219vjt8gLFEQ4TfPmPbOnCMyqQMpVDE
Message-ID: <CAMuHMdXWowar7aD9+og1GXY-gaUuewSjnxqLH0KCFrdpeWvCZA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: bus: renesas-bsc: allow additional properties
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 09:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Allow additional properties to enable devices attached to the bus.
> Fixes warnings like these:
>
> arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
> arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: bus@fec10000 (renesas,bsc-r8a73a4): Unevaluated properties are not allowed ('ethernet@8000000', 'flash@0' were unexpected)
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * don't restrict node names, the core already does it
> * drop A-F from unit address pattern

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

