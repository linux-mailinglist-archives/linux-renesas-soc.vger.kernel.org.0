Return-Path: <linux-renesas-soc+bounces-23623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD2C0D003
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 11:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 229604E537A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 10:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519B929D27E;
	Mon, 27 Oct 2025 10:45:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1C134BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561929; cv=none; b=DQZM+kNkCK0FGJ20cDcsm+QvOTUTL9wi3Wosqo6lZZYo5hT8rAB7Pvqgb74ae5CuTRggh88cO68PLG9hgicicij3D3KlfxIfukRh4HMIawzrcp1noqHCFuvrpLAnrKNiXXKm0Say1y9doKWP8tHS/4AOBKjk4konZ97xf8LMCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561929; c=relaxed/simple;
	bh=WASv8vPf9FPyquyQDbPoOdROvffB+ReSLfQNpiWjqIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IegrY/rMauPcAYtwvEwd7OQnvEmTMp+18mOqp13TnarNOM2iIJZi69g0M/8er5j3m3ft9XOgTGOqgcjfk0LGmEv0aZ7o3vwwkLBAxsszvfPHFSwrO+WPQQyVPPWk0Tr4VJgDsODYH4DFtBUnnBRQD/ZF3XdvvC4AR7zURW3zQ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932c428442aso4257678241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761561926; x=1762166726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFi78x1MtIeYqpVCKC1DBSPNonZlJu7dJLYb6jM72vk=;
        b=HCjIfLUOqXSU5Eg5imxPl+Y0hTxLdiTirhoIDygebHsHGGC2Sj7QjN4ypzbVjwbanh
         LNNyxi1FZLqYXDJgX3s1+dQauFTATFmdAIsxAAh+DmCt3fYd4ogx3WSF0bmmENVMIEx3
         izyNAozhRcbDR08e/QlO7yialq5cOX0aO3xnhKtv1XNHx/q05sl8RMh411V5/CboJI/+
         Q055qcOgGdqtx98jrto5bzdOWbCAd6cYGco0Wm0ViDBKyn6TBcBBtuoe1/RR2TVWy6pB
         FAtpN//cKIvc3ANTW5NQkZqXcSI/6C8qWbRBPv6JmISmx0S/V3CEDjS1b9fAgTpSh1S3
         R3ag==
X-Forwarded-Encrypted: i=1; AJvYcCUIu2ijtddktGT8wfB3SQNblxSHvlbJxG5OofGeAw7NZ6BJPJehruS2NiFWLczPBbG7HPMEOHo2PMmIkT6tUoTd1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkbjHkFZzeatyfdgRXu99YMyi4K3TPh8d3llipNtsogZPX4fC
	VWa6ezOtXNFU/8HdxyJa+L2D84GYe2FIGqN4tYiD9QbB9/ApriAeVjzGCNLdjDS4
X-Gm-Gg: ASbGnctrI5swvJzrOuw65nlHdPwxnzmDql0Z0Qjbzcb5BTf/YiLIgHVWZ0ItiTjyKXF
	++LrItwf/XT0lxDZcU+NkrspWf0HCfQXh+S7oxymFldZgHDwrMiYdDum9Udy3XmCLxbEL7m6Xmk
	Xipdayy16o2ZF7IVtx9wDj2Hp0SL8nZq4GzUjWOeFxTcPwBvLb2WsNOZwLKDt6fGi5shUjPmmmG
	81Bk3p0eh8aAtlWNZKvWsJBGU2qH09i5U0m7RAAmGLS3220Xu6YIPfNes4TUKr0oKrf+R5mf0Z3
	fPgHMeOde+lgLTXsRxkiIo0yenWJC57CGMo9ihV5PElKhpK2JRKpY1ztoxTxggTouVr/L99/4we
	tMr+skjGH3T/1SxFeCudNrP/t79Gl/2CiL4r0fxsEjA68wNOEPKMgknXADVuTAMHkUiJNbGb3s7
	yDxS6/tNC99NX8LW8Bxi8hxFy4t5aE3tZHSVdXBDSEpJOfWhGK
X-Google-Smtp-Source: AGHT+IEw9RjMvaGGuQtcFBzgmvnkzcbm7DOZV+HV86Y2JPJOxHuCqRzrtp9zcCl+N/Zgi69NevdqzQ==
X-Received: by 2002:a05:6102:4b82:b0:5db:2531:c52a with SMTP id ada2fe7eead31-5db3e1b6605mr3929218137.19.1761561926203;
        Mon, 27 Oct 2025 03:45:26 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e52198bsm2577662137.7.2025.10.27.03.45.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:45:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d96756a292so7433452137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 03:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0Ol/jmpbaN45uYzOlTuD4rLDBcF07W1KD00zdQZXEaWdo4pNQ+2m1+Q/eGzGDOe2AzIzRmR9n76F5oeueo2sm4g==@vger.kernel.org
X-Received: by 2002:a05:6102:30d2:20b0:5d5:f6ae:3905 with SMTP id
 ada2fe7eead31-5db3e25962bmr2803354137.22.1761561924836; Mon, 27 Oct 2025
 03:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023081925.2412325-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 11:45:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnom39_Rj+6Jc2g69i+Z4V7UkfXT791buK3h9cpOFpsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnn-hFWk4Ur68Qi3gdEa85bXZjpybdjIi4iorAZW0HIZJSSUE0PNnuk68o
Message-ID: <CAMuHMdUnom39_Rj+6Jc2g69i+Z4V7UkfXT791buK3h9cpOFpsQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: renesas: r9a09g077: add TSU module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 10:20, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a TSU
> peripheral with controlled by a module clock.
>
> The TSU module clock is enabled in register MSTPCRG (0x30c), at bit 7,

MSTPCRD

I will fix that while applying.

> resulting in a (0x30c - 0x300) / 4 * 100 + 7 = 307 index.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

