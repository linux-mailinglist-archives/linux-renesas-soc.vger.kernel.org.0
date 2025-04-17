Return-Path: <linux-renesas-soc+bounces-16109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3EA91731
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 11:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93EC16E115
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761B920FA90;
	Thu, 17 Apr 2025 09:03:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149BB199E9A;
	Thu, 17 Apr 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880599; cv=none; b=F/qQERCLVZCHJ4VNM/1F9NN9GufiNfaRULYJETeriEASMA3BUuo2+Gew4AMCNHpnWzHAeTf1mFN9tudvt78JESduvoYq+kGuutpF5GNzHkoPOyYrHmogB9kJ/BOOYSdKWs3zl36bjBXFU4BKAw8NKKriwve//kJGMjBVD9yEejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880599; c=relaxed/simple;
	bh=HCuWBCUptqkOU+jDn3R/tfHWvL4P89Xt3ifSZJ3Nphk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdzNNPKGj3GschMnSee31fAmBIudJHbtsj6X4+/jTAbEsfYQho/oPq2QC+MtTy4T4QN8fcHpQxPQtVUWjQ3vOSd2UXBcckEcaHgzvPg1nT9Jdzbz4vlNbrijOXErC3zzRKR0Il8BifoHEgyhRLHBNiIqyvOeVzupfRVRfbGA+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5e39d1e0eso50723985a.1;
        Thu, 17 Apr 2025 02:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880594; x=1745485394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9iOspZ7qwSi0qr3nNPSumRl4tqdAmsQdsdUQqYUHRQ=;
        b=FJGFXu7oHmEoSxbf38FdqV5M5vyD8Fv/q1IuYJwLbxiXR9lo5c7ABr6Bpn5pK6QxTz
         DPTy2g2pFFM6TTcgAXMZ26wWWKyN8F3MsEz130JB1WLzoDe5+8EFZ8/CFTlT85Ixu6x5
         tX17OjF27rA5ZzVcR9asrqT4zi0ZJAn8kjC0YCSR1nzoUNBdpXzevTVxDGTJvZPnjiaj
         fE0K5+4oCO/63HqsJj6q3zFc6nDQmJYepQF3t469HIkzxKoevoXznk0ZcRZEe1Cb52e9
         0PcwRmQPxog2RlCyX7Ln+mT+NGYTdZdpcwwC22LiI/mpa/HeZDZIchEqBdcDPUgQgbZE
         twUg==
X-Forwarded-Encrypted: i=1; AJvYcCXrC5qFhvV82tDLlObxBlgVtK2d8MebsrYhzwkWXcXraYLFeGNAVSoRp8qFGwY7/xvB394MD/bRLpbp@vger.kernel.org
X-Gm-Message-State: AOJu0YydrOdXc/nV2Pb2zYJl5DUHhf6ZnLWhoFV9N5AB/+KcYEAE6w1Q
	AOb5KvyarG4zOB4ng/DiAibQS0H97lL0Cif04uwJae8M/zOZ9BmuV6sSPLKf
X-Gm-Gg: ASbGncvq0pvGqKY4X3KM4hFo0BHY51CdSZl4te6fT42KKgSMCCOSqW/r5FxkmWL1i74
	NcW6RWVIFmbeRvoA9yy+Y5kUH0P5pq7aKB1N2ou+4tJua4gP+61fqwmS377W0qZ1hzCUUyw55+x
	ewWI7yvyCVCJZTQFNEYtXmjanUQVwDbV60zqAs9c2Iaa32cXwVBrW7RlyXQheoifKZRSNPSZZ3T
	cMmmxkzInrrF5Hpa8ekZfxo4EyL8jU5N37OZxUQGHZJMRUyj30NmDwyMSHbAm1OYrpTNUZeYriw
	MlxZc3ZHYPm5lf0wuUky077sq0SkTkDHLvg332YXBX9C4itDU7b6TOlyKY2UJBHf+K0dGWUDxhe
	lxaYnM7g=
X-Google-Smtp-Source: AGHT+IExYdKs5RoW4do0Iix6xgAQKy5kPxmV8JJr00RZck3kE2go/bbO6HlSFordhrXmoSQus3WbaQ==
X-Received: by 2002:a05:620a:1aaa:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c9190642dfmr779559185a.40.1744880594376;
        Thu, 17 Apr 2025 02:03:14 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a1c7d8sm1149511985a.117.2025.04.17.02.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:03:14 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c7913bab2cso46118285a.0;
        Thu, 17 Apr 2025 02:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk4Bz1XM7tEsJ5WMoJ44FtqgdxnrHUZThc+vw4muVqkXkf1Z56/lWOfzLp+zFEJs8wYgT5r7U9qtDf@vger.kernel.org
X-Received: by 2002:a05:620a:2894:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7c919083ed8mr782230985a.56.1744880593927; Thu, 17 Apr 2025
 02:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417085228.34679-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250417085228.34679-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 11:03:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCz1=CyMKaKRmn5dEVphEJDUHKGexuxk3hBUXS+EHRGQ@mail.gmail.com>
X-Gm-Features: ATxdqUGkmBRYatlJ6009iqOxkKz3m778aXyiAc0tQPZ3ib9FUHSU0bW304HWMHU
Message-ID: <CAMuHMdVCz1=CyMKaKRmn5dEVphEJDUHKGexuxk3hBUXS+EHRGQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 17 Apr 2025 at 10:52, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Because these LEDs are not connected to a device and have only a single
> color, we don't need to specify 'color' and 'function' to distinguish
> them. Even worse, that would lead to namespace collisions:
>
> leds-gpio leds: Led green:programming renamed to green:programming_1 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_2 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_3 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_4 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_5 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_6 due to name collision
> leds-gpio leds: Led green:programming renamed to green:programming_7 due to name collision
>
> So, just let their node name (taken from the schematics) be used as a
> name.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
>         * renamed nodes to match schematics
>         * added default-state
>         * updated commit message why not more LED properties are used

Thanks for the update!

You could still add the color properties without function properties.
However, the "function-enumerator" property exists to avoid the collisions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

