Return-Path: <linux-renesas-soc+bounces-15824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24167A85589
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01DC467F70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 07:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217222036FD;
	Fri, 11 Apr 2025 07:35:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF401E835D;
	Fri, 11 Apr 2025 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356924; cv=none; b=HntwkURflLF/60nTReDMvf6+ngieabLxrAKKcDhtkk2t7qqUzs2fCDEx+4SvHupCdeumdK74r/qWWGb6d2n+aTSv0r9odkBmMFe2QjCzNW5NgnbPd+obMNCLfwW31CdeuzRHYubu2yPDr9flH2DDDYscQxcwSjo9F172BJYxCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356924; c=relaxed/simple;
	bh=puNy0gZGTOqFqAb2b0QdJORahOZ5FRTGd+gd+/a2NbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6EqC3WbVfNoIhWzHt+XFxbvbSWAIKyS88B6Otye98Q3PGIgwTnq57K/hyZIueMpHxrkzGmVCfDwhpXlO5lSexmFoz5IPcwG3l0RlfVDdsciuNPiHhfNiDM+w2YPZAW44p1QbJvN86ZMUcp43jV+bfyVZvctfVYNRUkaEchCnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-520847ad493so1541500e0c.1;
        Fri, 11 Apr 2025 00:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356920; x=1744961720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+zG7d5UeINc2mvxds9sIv7u69XobW0SCDHU/G5G5oQ=;
        b=SwqFNm14Jv8f9z3EpMv43tEPkCV1Irbr8xlchxzRARpEfg9ePR5OOSAQ2RXk0V3k7U
         3NzG5IsLWq/uP8OiBHhVS38MmqqokxE7neps7hzNaUccF6OtVz8JdkSShqOvESthAedI
         uyC6tIRUvsOx8L+KaxVmfz56fRbP0U8TIzShgSy7+A4G3YDxGWxoAPK099I9dAsWRr3i
         lGXawN8ytW4SThn+Z/M9G/D3KGpwHyMjDCv4fSmaZCvBwaRFAo06zGaXjfDTLD+gzJiP
         0p4lRGCbvGVd8nxHxDvJJY1K7kjK5TLEd7ZTPI8Bc6dc9mev24pZzJB1Z2XFM9h7vQRf
         gMgw==
X-Forwarded-Encrypted: i=1; AJvYcCVg+uRrp6WLibtqSKw9Z703lGo5R4BqQys/rswUVSoIpY+yFpN6Kws96a3GQFr6JqaFW8T9ILUnWuoT@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkvJ30ZH+hPVaQSks8uB98CqDFy//E7G74tEf4038TVd54Eip
	GKUWf2i8PQIrrabhPBP0kfp1CiB/L9gdjOe5+jAtdpszaEhGrDndYyBfobDR9WA=
X-Gm-Gg: ASbGnctIFggGrPTMkneTe3zOLtXq6tBww3llG/pFVgCLhk0va5rqJGiuR39os4jY0eN
	Qvvgj8rf1Ut+/Hj0v/9mUi2pBIOzEVc1uKQWYDA8eqQPCfUv/I5bGABYYWbHYfPF+oQ+YV/cAf3
	lKFf7t3/Rv6RJk9urLDO/oYsAmLDEWlEACPbZN2YI6S38U5fhIVK8GgoGJN/9iYm/EIuT7CE6Qo
	19r8IkfwKigyPEE8vrAfahBPEi/v/ap7mAYcxDQNVi/z1NEGrWg/L18L+4fRAChbBd+Nk1F7tsp
	ETyNwlCOPJXLxZbNhqcOuHUxfpA+BWVhEeU8Kg9l7sm3ZIQWSmxs+rSe7e7/2aU/HIiBsAjnxEw
	l3SGqix7p0op00Q==
X-Google-Smtp-Source: AGHT+IFCFzeEluntzqNboQjyMAmeFp91QZs/OWCB8BNvoV3TASEeNbAGlvjnbc578Yey3fd9I1CiTw==
X-Received: by 2002:a05:6122:2008:b0:526:2210:5b68 with SMTP id 71dfb90a1353d-527c34d3cd2mr1098371e0c.4.1744356920434;
        Fri, 11 Apr 2025 00:35:20 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cceesm995602e0c.4.2025.04.11.00.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:35:20 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so1483401241.3;
        Fri, 11 Apr 2025 00:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEwDJNTBy8kZBOijmbELLLwJxaOe7LszyXKvuERMiTxjPUhM5vAmZ9F45cGabDtinB/4wUa1RvKwn8@vger.kernel.org
X-Received: by 2002:a05:6102:32ce:b0:4c1:b2c2:61a with SMTP id
 ada2fe7eead31-4c9e505a50dmr769876137.25.1744356919695; Fri, 11 Apr 2025
 00:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com> <20250328153134.2881-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250328153134.2881-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 09:35:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=s9Gaum1s4QZsbr2Jzq3hPqkcUMQpbDUbd_+usu0auA@mail.gmail.com>
X-Gm-Features: ATxdqUEYpR3RTzFwuJSHgpkQZJVLwHPRjj3LqVgpw3UowgwVp6hAvofjITOQrhg
Message-ID: <CAMuHMdX=s9Gaum1s4QZsbr2Jzq3hPqkcUMQpbDUbd_+usu0auA@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 I2C bus
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 16:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Schematics mention a 24cs64 on the bus, but I definitely have only a
> 24c64. So, it is only mentioned as a comment.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

