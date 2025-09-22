Return-Path: <linux-renesas-soc+bounces-22144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71002B916C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DD987A7B19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B1830DECF;
	Mon, 22 Sep 2025 13:36:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD5305E3E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548165; cv=none; b=j2/+T2VnlkdWFWY6cG7hC0GS58EnatVE9uiZcPhF8nX3X3ncbJ1T3zbBsMo8uYpwQtyR9eNaG9A34w3JEcQ9iDCwTSJ/aLrQ44C8H3WCKgiqebOlKiUYBYrJNtqLImH38kuNx8JG0nF4gEDS8s9hX9sgxAKetfZSveUyzeGxo4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548165; c=relaxed/simple;
	bh=o3fokZId+Y6ExSrmVp4U54jGApx0aJHWTHEveHEApIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEooqY0kG9/Q5GCcliNlK4eaouLyjUp0Y3Fi1AlPZMx5dhByMFZGwZbWkEYPuFUm2w4UfbOCRBtNy05Qgzf5BCfLST1g2LKlS0qDFa8O7539knyUSpfioDVDlrQGui4a5NAEVrknDHkZhcxdeTEo/QIN7mdS0iBMmhCQfrTAyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso2745085241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548163; x=1759152963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ot5mKBkVwUNvkCox+i1Ysazafolib0GaP8R7L+vKCs=;
        b=r0IsegPm+r6DHJJ0WfuENikzSpDXbkVzJFWuEeqZRRM653Uk2MpvXhJSxhdCMDritJ
         9qFiEwCKruR6dWIvPTduPLkRxwLuw1c981wCXwpNMchOduzfPeG8uux9qfpqsc5SQW9O
         kOQwbdtfZ/N11pSxAQS7ZEVXnxv4uiCDHBnP4rpJNk2WXWerEdg7AaTy8n7UHqKcg6LB
         3349dbODA+Lxfze8GXCTqyCTa7KsZ9Njek3KNNLb9DYzXoUH83sRm1jn2QpykQvK47ZN
         yC0HpcM8oL+qXGP6osqNC4JSDS+OIdYC6Q9nYKv61T3Jmpvbyp6C/8sRo4ORY10KRnEH
         SgHg==
X-Forwarded-Encrypted: i=1; AJvYcCV51x3XC1cgwy3YPljzfpN9AupsLf6iQlte6Le+rVvoZRYAoi7kUgotHDmaawsAkyObuJ3UY5hR71ib5Xs5KlU6gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOsNlaWu2hYLsAEDq7MUh7qdiYriwG78+i5lC+z+MuNdqEbCp
	nx5zGTSsqEkAtlblabrpArMdLoiUSwfyVDoNRcz0mqcxyO99NCQTIXk+snbwIBs2
X-Gm-Gg: ASbGncuEaKirzfxttjwCgkggZ+s47GM79xrDVrxLN5tkta0NyTW0ZlsLSkWFaHOZ4oT
	Nd9t6m7uEoaB8ocfTeaVksxPDRm/wYHk4KcXDXlf9JOMDgSP886Y6whiK4eAniBJ/T9CqzA388O
	rumfVbwOSC4WTkf4Mn1vrYoMMyAxGuHynO0YZuXZa8Xl4jczm1N7S9krWpR7ETCXvZLew4srZde
	2h2VI1vtME5g2uiZHHdUdndL7MddgrCsrmiQraXpD78rJVzW3EB9wL1GJ/cRW1zranldTjUVp/x
	JsHu3AGJ5z6BiyhQAcR6tbrwYPQL83RJHsqbwhNRWcIYFrMLNSvfwO17q1/2FPuhngjwJwK4AEd
	EY7P0IM9yFQz6q6z1dev68vvoPycNeKee00M3aS+7jyaOr1CzPVCbc55C9Dtn
X-Google-Smtp-Source: AGHT+IEjjiYUVLMVwezqa0Y3pYkL8rual8J1zmDn7UF3yJBN3HWcuRe2QClz3Xb6nccXv+FrZ7+vcA==
X-Received: by 2002:a05:6102:32ca:b0:51f:66fc:53af with SMTP id ada2fe7eead31-588f72b36f4mr3947514137.34.1758548162762;
        Mon, 22 Sep 2025 06:36:02 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e7a062cesm2148554241.16.2025.09.22.06.36.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:36:02 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-556f7e21432so3063354137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdUm5HwTREKQ45NR6Gif16/DyQlCCIOSwggvw3MIhL9O7kORm69O4Vx3v2kKt8MhXpNK+YzISiP2PHFFTddoxwHQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4426:b0:533:44d4:d624 with SMTP id
 ada2fe7eead31-588ddf8299fmr4350434137.8.1758548161616; Mon, 22 Sep 2025
 06:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:35:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmQrOg5-fJ+NOmLyp3TCSRuoEtwNKSy4kw_zKuoTD-oA@mail.gmail.com>
X-Gm-Features: AS18NWDZCs0_Ui5sZv5S_MT6lcUUhGR9J4Vn0VBerunEKZYm2pd-7PEJiuRZBa8
Message-ID: <CAMuHMdVmQrOg5-fJ+NOmLyp3TCSRuoEtwNKSy4kw_zKuoTD-oA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 12:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped extra space before the == operator.
>  * Moved spinlock acquire before reading pfc value.
>  * Make sure it is configured for function in PMC register for
>    skipping GPIO switch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

