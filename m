Return-Path: <linux-renesas-soc+bounces-22712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15FBBE7F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A2784E6ADF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF6122D4DC;
	Mon,  6 Oct 2025 15:34:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526712D77FF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764848; cv=none; b=RBvk6uujhbDNrlJsVtedWjb4es+FMKn7UCaI/QxsxjkTAi2VQpeMnMeV9fijk0pRFIho59c4f7Lu9x9KIcn+vYsFXfbFca+kWJTDcZMlopqQo6c+Y6hSLmHkm7AKS25CSLXAnYsitTARH+Jmbblx/o+Ei+97DZNCqOhOruT0rQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764848; c=relaxed/simple;
	bh=BRVnuKO/hGRiXoQFAyWThnaMnX8y6wSiK6YP4Lc0R0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0Ayr4fx9gbVbsy6z0gSAFWc8xx5xOA18299jCPABLMsyQfxMHg3VpD5H4AUT/LgqNYqaR6OZEMm7pD/U1ullAFoPuFmnV+c1hCMYm7qlMhD4kaZrklTt0u1oYGTUsj0hC8MEBh+bwRZG7M/EPCJ9ugNlIxnVFsHbeq7/LNJToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-528d157a48cso3561472137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764843; x=1760369643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04DpCx6C5dPpdl7atQBgrPvHfA4NCQYu7la1Z2lk5Do=;
        b=dIBQQ7n7uJHkG2dvzr2otJrO+ljJU3cGzCBx52wJy71yFpvVsrGIrN12SrOyIwewV+
         mA7S6LJFXaM9Bo/i5GP/Ma3TOcXRP8GvMnbESgaw4Iept8/gBjxXSbeRjv5Pyb4QvOwk
         MfbR8YP1YgMjrstaU7Sg8r1pUmXSjyq92x6d+Gavip0lRigif4fUzvvJ8X5hDiMgE1KG
         3psG7NgNRYjM2EVxIKcyOw3jpVc/dhUCeYWmU3hJe2Ky7428bmhRQbuqKJMdng0hYeH9
         GyAiS+6nBg2V+fT4yaBvegwFP3OPZIBHkievlOBuP4oHXbY4NJOrOevm8aHg3u2YGadO
         5sRA==
X-Gm-Message-State: AOJu0YyOorH8oUI0e+J9cbMWg5xwSHk3Pvvw72hAezimyFsdwsIzuzqL
	g9JLszG9BkUsEeFXGNelmzerpEY88++MKeK+DZ70kLQn69XYIjb4Mu3FVBCif3Hy
X-Gm-Gg: ASbGncslsAlcIhfE8E+nLfWdPMTRSI7dFKDEYRi3cl++alW5x7UMsvti0D7Us+qwqLk
	xEZDRuPsL5JfeD/rQbD9YBxjdXAujzoIA8TS8P1diO+AVOc/fphkARLypzn2MgdsbIFiW6E0iZd
	UxCMK6wo5WVfmFa9RVxjCU/a6YiL9Hrj9QS0khUZ/3Hbv05BBsUxa2+xL0ZbWpunwGILBgd1z+t
	kX0t3InG4q8fGwd4DkCLWEiV2Hld7gSNTMXfm/rGPLFGcU3bp+UVn+1p3ek1wPVwARoWmNDZCJg
	VZFfDa9tMqfsz7ZxsWnbF/D5+iSDZ0Ss4h6maHKkrRBUzxQUOTteokDODwp4gbM1atrwqzTb8vl
	udMUIgIVV1Em97h2HGxlSVGUqRc0zjCW8bb8LofR6+/xlbDpAcq1KXyd8iX4fkCbZv54tTg5NLH
	2cqbM+y3ugGuZdPXQHthDU9Rw=
X-Google-Smtp-Source: AGHT+IE5TvmQ/uJH3t3+1gL9dsczjcQIUioHcWxoZ2uV7jDyZkoYzBrxPfBGwyR7rLvgfNGRSVkYVw==
X-Received: by 2002:a05:6102:5086:b0:529:7c2f:ceb5 with SMTP id ada2fe7eead31-5d5d4cb96f1mr22070137.1.1759764842913;
        Mon, 06 Oct 2025 08:34:02 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d3571cd4sm92413137.0.2025.10.06.08.34.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:34:02 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54b21395093so3508062e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:34:02 -0700 (PDT)
X-Received: by 2002:a05:6122:807:b0:54b:9f67:441c with SMTP id
 71dfb90a1353d-5523c17dcaamr5151918e0c.6.1759764842122; Mon, 06 Oct 2025
 08:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-13-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-13-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:33:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0n5WvtVbQ1Q_JJUS0orW4gm_4J8y_MEAdSdDa8-gCvQ@mail.gmail.com>
X-Gm-Features: AS18NWCWKPBWq9BA14EBZvxM7ulYGPRWZikV-jP5rc_BgPkBwo44Hs1cQhwj4kM
Message-ID: <CAMuHMdV0n5WvtVbQ1Q_JJUS0orW4gm_4J8y_MEAdSdDa8-gCvQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: renesas: falcon: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> V3U Falcon boards. Sadly, it doesn't mark the node as reserved, so this
> is added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

