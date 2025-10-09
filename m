Return-Path: <linux-renesas-soc+bounces-22826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E5BC92D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC593B2764
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A344D2E62BF;
	Thu,  9 Oct 2025 13:05:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A52E2F13
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015115; cv=none; b=BUDVC3g6EuWJuxRrLpBHoO3a5PELRFxU4hA8kmnDWhK+haes1WKQu1WfQ87M+YsCQ71ufHXEdWQ4ujrnzwlX70sXwEaKUlLfD0fFe2uqHtuSbhW2CUKxCTcVQes40n9zEyDzLKrFDlQNReW+PsP308prQyoLk+FyLORcSHNp588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015115; c=relaxed/simple;
	bh=xD6NRTXf9K2gq7W3hAHzUvosh1ygHLtSYWKi0Ow6kC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJoQ/geS7jTdUznZoTTeMmvKcN5UgIf0p36jFy36fdmDENqn4TBSs/Kg+FfoXMhoF5Ylr02QhM/0b8btPqY/xzYjUBZkKogfWXpr3WF8StqSxvY8pfdqwxoD+hZY9lrfOEYYIytT5YlLvbpasLJ+QNu59tCwG3NLmMQyHR61kpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ce093debf6so950470137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015113; x=1760619913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVdYrb04OGpyzIab7Gx3IKAauwKdWRH6vKgRJNRIq/Q=;
        b=qZYm2gQOR/JXI4DenADRKGfqVGZZT10EGeLkn01iNdB0O4Q9QDcI8UumfkIxCXiEWd
         ZO8ONr4I3ySY6xvWbYXmGtg9K5eJ6OgBiKFxjWtREKOJPbZsNjibm4CcKddN3yt6Vc32
         l6ekiUkVqFwXzicGnN8E44zgNGXWHl97lb1TGgxMiG6M+QjLPAsPZeJKMyK4A7Olmpue
         t/YkemoI/UCAsty+Qibzca7q236tY0ts1H5xn/uZ8INqibfXYczlsoybQaTmtRoT2G5m
         NtfjMWJJ2LT66hWzA63VOQWTbTrp3Wp5sJuVVa5sC2+RqH5Stc8Ih99v6iost1p26uPc
         q2aQ==
X-Gm-Message-State: AOJu0YyYUnCtO65TckW9Dgl5GhYbpOXdn+LvUGRcj/KNRfZ0kz86zmFt
	6ZMX6G86vJKZl0riS0a28ZlVJQx1LveNaGvQjmbXK2MrG7CPF5UByP9o5s6rrwPd
X-Gm-Gg: ASbGncuCdIZ/Ffvz89zLe6nz8a8gvoB25I0FjNPWeZuDsETbUHJtURe3zejo0ktuZEh
	p98KC5MYNzkQA9u3h5A5FlUvWt2igB6E8uKFFG73QCHqUhdee6U8QOOFbJ//8+G3IFeTuWKD+WU
	A5pUww6DPBNWfxXapRrINg8TOeHLwJXz39G0xPZ/bgy6biZI4pxfRqo6DGkCrc+Rq9Ha2fRwIpc
	XAVMHSd+grzVxlTEgDYSVq+kxJtu/0NCUu51tvY3SJYjGR4R6VRe+XIEbzs9SzGPlUMo62GGYH5
	KFv4g/kAf0rAcyyboyv0NRs/jrGkBqZ5UkTr12jK76176KT5TcalbRa8ggcFTu7w1HgYYIvSQf+
	trlnSjBYiy8UjuyDJsU/OocX9V0aFz9BWO7om0lamwG5YJlQRGkug168SzPI5YNXz67jpPrNCUt
	+p4YP27wU/57kTqR9VUFY=
X-Google-Smtp-Source: AGHT+IGbTEgozqMREayxg+72FiQasHlPpXUGqgAJTSrMD0jVbnw+fPtV0fXztQgwBx2SMlYvsbOfrg==
X-Received: by 2002:a05:6102:2ac3:b0:5d5:d1e1:73e8 with SMTP id ada2fe7eead31-5d5e2204172mr3404404137.13.1760015112489;
        Thu, 09 Oct 2025 06:05:12 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4dc8b4esm4593481241.9.2025.10.09.06.05.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:05:11 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ce093debf6so950451137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:05:11 -0700 (PDT)
X-Received: by 2002:a05:6102:54a3:b0:5d5:f6ae:3908 with SMTP id
 ada2fe7eead31-5d5f6ae3db3mr457996137.38.1760015111607; Thu, 09 Oct 2025
 06:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:05:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXmBgHv7=8NTCJwZguFAKeWyWu9dWkQxa_0kKpBVC=jA@mail.gmail.com>
X-Gm-Features: AS18NWCUrBtX_uO-fi06wEi1p8_gUsISME0n2FhoKXZozrGR11xEwQp2ykYneWo
Message-ID: <CAMuHMdUXmBgHv7=8NTCJwZguFAKeWyWu9dWkQxa_0kKpBVC=jA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The SWDT on V3H has no reset bit. Make resets optional on this SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * don't introduce new compatible, just make resets optional (Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

