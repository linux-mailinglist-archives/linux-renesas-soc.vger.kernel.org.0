Return-Path: <linux-renesas-soc+bounces-24586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE9C592EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EB3422274
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 17:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DEA35A14D;
	Thu, 13 Nov 2025 16:54:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485335A149
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052867; cv=none; b=YoBywm8mapbYj98krkZiRNoRCFMMUjgpnO3SLx+yTX1wBJlge54IXJDqSnOwxVb1juv63yQ1Gm0bNACJNUhvu+xwxKjalgP0HZ4j7Oexl8Hi76pl0pnOMSjHdSdVrgRKacUONeRM2wlxukL69gfOYnNXvJVpTWWPe13DTxhk+Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052867; c=relaxed/simple;
	bh=/w7U1lULN0Wt5cy2n+o8BXmaQCUvdOw6lpumB8VVy08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5EB4QZRCu9x6lWzkllhqOCpiDxlQXkKyEhqT3trfSv9j2xxWU/GVuvMe5ynv1oJcKbAd2c+kgHTijRocajgYv02IaSN0vWUAY5O9s36HqE6S1pps0I4MnFP/b8z55jT2JbfSUeYzKRHQYYUzc+GU5Pqhy2fX9+MOReJahreaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso529219241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052865; x=1763657665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiVTOOriFml3/StIKpZ5dwhW9Hno3lDZNqDkWyJuxDU=;
        b=ftE+HrJ6q3c2h/80JL0ZaXNjHSbU5tw1cNWivvH5d5Y1mdHRhRpqJBhY4ZMcsLTKCb
         UDIiQAULoseVbezdetN7T1ysEoQSHiV/cN9CZ9WlqZ0MqQxLFy0aYqiGV+P5rMg6EdA7
         yL1QBLE+diD51aWDckL2F8+1KbAwqlmAwEgg2+KA1MUYsVfpfOsD8HuRDBvomeokzx6T
         ErSrjl8pOk0fKUQquPsaGgoRYWyuej1fr67hlghKrXCaJe78LH++xzNeBiu3Z1ksNoaM
         ryO9RrGZDBKcAe2HAh6bPbBIBghhKlcYtZnS+gGPN7zpiZWO9vg8OlL0pBaUIutCtwIf
         mymQ==
X-Forwarded-Encrypted: i=1; AJvYcCXawlfhO6pyoGOpzse2AWbkiKv99DBxLaB1pzA50Ht7+Rkr3bzvUhp5C7EZjnAOEgTm3vyEUoLLLN9Ha7jDZuRmSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lJI5B9fRYsM6PssDzzVMFtv/ZzFDl0ImrBfvjLtnWufz6Rm6
	Bfbi0M1Lf0eCLf4eOciOP13o0/b44tfmZ7YZmvO6eYOBPscYVRayweSsgJxXowdO0Ko=
X-Gm-Gg: ASbGncsIt5pn+0o5hdw23kot2WogMHyVglk+INFiPYqfJ7nAodYES1QuEHNDe/QJyIX
	30JIfedzaOja2h4kVjeOzBl6W67Uo5fKOifkdmIdbXumUC9HimtNTvrDcnJLiP3Td8LRBTTRFO7
	IplyrHyWbinixlQ1HAoj/ipV9M0WMbFPhCR79FZgHeo5uqQOIf+1NYJjJHAW7vf1SD+3Og2w3Eu
	UgHqA8V0RRHjNT6m5yfQYJfRwAaA99/jC7sM2U1qK7uqxP0IWBf/+SKS8M/vPQi9S97hzlnqRbA
	HB6vbGjoliRaHRMAlarHM4uHD5LCttnYcIxt5vvGGoTpDQFkxnHqVj8C0iL67+++BAgZHXJZ31z
	+xg2/tq9Qu/nNqYWAip3lQUh//KRQVsif3jcv+Gy1rJ0QzWcYd/ibCeQPLjeYnYv1yuyBECFnPs
	CslX+3TdFUyZhoDkydqKyxR8+vunUTnM/VWK+uXdXR8X8NjIkS
X-Google-Smtp-Source: AGHT+IFY8A+U3Aabj++rPSvxH6Rs4xpEWx7+0DypA6GQA4bENknlBqNXr07OY7kDw/KXljwBUDlNyA==
X-Received: by 2002:a05:6102:5114:b0:5db:27e9:933f with SMTP id ada2fe7eead31-5dfc5c0489dmr166993137.40.1763052864514;
        Thu, 13 Nov 2025 08:54:24 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b16sm819927137.10.2025.11.13.08.54.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:54:24 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9371aca0a4dso631779241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw4YpUSs+Sj8u3TFCzaiiZkLQCUrb6ewSNl+WjfIUPjC97e2XRU8ohxnLcB/GRSlB+SBEs1MVFvDQeyZmd1HuAng==@vger.kernel.org
X-Received: by 2002:a05:6102:4a91:b0:5db:f5d1:5799 with SMTP id
 ada2fe7eead31-5dfc5bcb984mr194258137.33.1763052863591; Thu, 13 Nov 2025
 08:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:54:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6V-wQfiMPSE2k2Yi3dfWCj=Mp-3DYLwqHEWumYhxGSQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkUtT4Rsq0h-4oIRE82Mo78vsdX3V5yvPLmFpsMCot8nqUOZIzab71zY8g
Message-ID: <CAMuHMdU6V-wQfiMPSE2k2Yi3dfWCj=Mp-3DYLwqHEWumYhxGSQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r9a09g057: Add USB3.0 clocks/resets
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USB3.0 clock and reset entries.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

