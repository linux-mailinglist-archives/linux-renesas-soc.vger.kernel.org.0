Return-Path: <linux-renesas-soc+bounces-23319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC9BF16FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 15:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA44406931
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 13:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15801313297;
	Mon, 20 Oct 2025 13:07:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13210311978
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965670; cv=none; b=A+lcSg2i6RTri/v8IQQd2eVifst6dq8PwsTClBY64oha+TRl239KqRuBEiwDFaqNnHC0vMfjGHADtATdy0Hu5pBWJQjfuz6TXdVSwFlsEGWNMxyIvt4rCK+4xJ4y7eIl4MhhWrr75fcnpJmIr4qjLLLJefsaOI6qfeJV+dX1z6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965670; c=relaxed/simple;
	bh=dAbVNg88swjocVMCZUUHDps5OucsSwTiQ9hJKF1NchA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZ8krwZVR4xydE8u/FhUdQLi6LFSjTF96r7KWjBq5W6eksRvZiZT5qWYa15EUVxlbqn114/0/kkW9zZEqsEI/pydlwjSlJElg19cwiIWzkO/EYFGRmPb9DgEFC89eglILd5VNO7aWBE3nfTs+MQysVl+qXjc54UV7YJFkgHAKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-554a627a257so1563780e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965666; x=1761570466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXVN+mpII2pRWCaxr0ZfVEBInfT9+TJTHMYjyKOc5sw=;
        b=YbOKjUsPM8tKFwBWk/UJL3QSrkWWfKeS99VmT/g/RfXenvlmgjQCnw7mFs6ktSDT5X
         gJ9FwlrFT2z+uEA3J9/vhnC2B5RBFmnvy4idnkWYfG4nwi54WmhUymKP8nyixD1pNKoG
         3eB1J70ewOE0UkkYpZBqLsrKDyygDXS+zXhPsT2cNEa6yB+KFDy7TFmH9OGM0bAECwH6
         eag0eYfVIkNfImLxyPafc/WsJmieGnpthEzI+ptqDQ5zQKcwZtzr+Kbjn8wqJHXdYw73
         8LLtxn3qkc0cAx6NXO2frsOZ0TWG1it9dNudpCEKzlheH0GWb6JH/j6E478Tcr2Og1xB
         lj+A==
X-Gm-Message-State: AOJu0YzEaC4umjkNxZluS9pmhBT8KrGq8KFlfiUaBGg5O/MOFqgRh76n
	Q5DseWCrYDhvy4ZsdO/0Riu6BteAECr2ACxsQXj/HrwN24o3ZO0MtRZnl8iM1C95
X-Gm-Gg: ASbGncs+eDRbokfeJFPByIxQYQqDnY8V8UzIqctHrk8aJ48/tjGCzgGricbgCB49KZg
	dlzxgADO1//VtJgZRo648npe9mNAj6tZSNgNJBjBG0baLDIz6tG1V4yxhRx8sOA++Jf1t22WCjQ
	cD73h73U5ihhXPMu9pEyin50KJVPvWYW/J1XlchHgv8rW6yVP4P/tNNPmAryupW6uA2s3JmvaNe
	jSl6jZ2PIzeHJesfWsG9DtRCOkSOGY3oIu1J3ZWzsI0SMrLjWzyVZwLxDnPDKWGOuYnCjUW8KXE
	V1xmvYUdhlW7MVFGU8KInBoAw7WyDe9Vo3gHwwXFROe7528+apgBM5iwruCEraXtHSbRFMhRT2z
	EpLJoFvo6vSxqSDnSRhr380n7DnjuZFXKk0lfXjMklns92rAtC9wvHM/dJef1LAWsmiMYLDTwvo
	YKVrpN7erKBgc9p8nf4JI0Hy3FrSs2ox2YJNlVwodKul3mP/zU
X-Google-Smtp-Source: AGHT+IEifi9dRXrbg45J5Wy9oRlldbJu7H/u5foctah70SkNzyWLOqJDAI19p0ZRG2rTHT5Ikr6PTg==
X-Received: by 2002:a05:6122:ca2:b0:54b:d7b6:2f34 with SMTP id 71dfb90a1353d-5564ecacb02mr3185024e0c.0.1760965665529;
        Mon, 20 Oct 2025 06:07:45 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f6ee6asm2239769e0c.1.2025.10.20.06.07.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:07:45 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-932c247fb9aso723062241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:07:45 -0700 (PDT)
X-Received: by 2002:a05:6102:e12:b0:5d6:155c:33aa with SMTP id
 ada2fe7eead31-5d7dd595ebemr3927553137.16.1760965664847; Mon, 20 Oct 2025
 06:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 15:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
X-Gm-Features: AS18NWBaj0Ncc4JCqJYIUdGqwh9pKbZJtWMsWVEq3_uOLf4LF5a8xi1mMwIZr9A
Message-ID: <CAMuHMdUCSRKAbD=DfJxfFGpfKTRkt=a2BO+HnwTqALBeeECOkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

On Fri, 17 Oct 2025 at 13:51, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> SparrowHawk may run without ATF but with U-Boot SPL which does not
> reserve the SWDT. Remove the default "reserved" marking.

The same is true for other boards (e.g. my SPL-enabled White Hawk)...

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -942,8 +942,3 @@ &sensor_thermal_cr52 {
>  &sensor_thermal_ddr1 {
>         critical-action = "shutdown";
>  };
> -
> -/* Firmware should reserve it but sadly doesn't */
> -&swdt {
> -       status = "reserved";
> -};

As commit c38c85613ba2b7e9 ("arm64: dts: renesas: sparrow/white-hawk:
Mark SWDT as reserved") is not yet in soc/for-next, I can still fold
this fix into the original commit.

Or better: drop all these swdt = reserved commits?
TBH, I always had my doubts about making them reserved in the upstream
DTS, and there does not seem to be much gain in doing so...

Thoughts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

