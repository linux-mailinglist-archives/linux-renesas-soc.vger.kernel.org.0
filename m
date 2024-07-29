Return-Path: <linux-renesas-soc+bounces-7600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA493FD9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5191F2205D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA8E16B38D;
	Mon, 29 Jul 2024 18:43:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8AC8061C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278582; cv=none; b=GUcPCsh2cly8IyZZSqV2mgFqYyLIArKKMUTgvlTzg3vZavuw/JQ3QE05xRUUMKHWHLzI27CvehlOg3lEXin1Mc80zgC+/Et18Vw0KqcEWLIIE/BjfqblJl61ggKUWQMH0AIzcGrDSB8OjRJgbYwv3AaO3JII3m22r9Da1wtTTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278582; c=relaxed/simple;
	bh=XhcNVP/l/6bOe7+J2401Cf/p960/A4OFDFF7CdzKo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6OO+384c0wxeOpNo/gkms5w+HO9f6kLwsBeEnaY2IqmAAa0fZ/2K5enMFyzBpnsgetuc42vVaE7t1IM/ja7rm71s3yNwNpG1NO/0iBGlSXW8K93RF6D/HINnrcQRe6LW5jbvNiSjf2iDIePH0IrsX5F8aw0Kp9HiyEWpWo+cuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0871f82ff8so2385078276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278580; x=1722883380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjXAMYWj+2DlW4AUr114ZJiz9q73g2FgQzpz3la7KdE=;
        b=gIr4bUMpULvnptYkzSndPh2H+HZ1fL+gDOwaH5ov+gJ+pi/8gaswmmry1DrJJpsW+I
         pJmJIsBGG6+sB4TwGx7Gg6GPJvJMlci0BahMXh8K1UIyDzm7R0SYz67pcwXQ9khHOhMS
         xi/XejJZQnE9j35cAx0lM0xTbWAhkUHi8h/aT+uKGwzVw72APkc42FIenpnRQjr8NVjP
         efwGfszG4mIW6edX3IaQDrej/btoPz4QmecKqFgwaj3IcKTL1C8HjO7Gp9quYoh5SLmo
         kbgApr0be158kohO7g8Yvy4VDIA5V/FjDOBAypYCtiU5pudRVd2RHgPCrwCdllwc3RYl
         3JOg==
X-Gm-Message-State: AOJu0YwAcXT05ehbJOUxh/1f8AJiZZM4LDTOWhLMhkcMKT8RRCRTho43
	eQt0x0VSuWXIEX6qJLiruE3VbQK/TTqMq57CoRJ614/eBnN6uQrELsD4MZ/C
X-Google-Smtp-Source: AGHT+IFyoAhLxgUAdgDFJTd58+P3R+US/CLMFeWA1iy+wLpxCdJOOGKFhSTpz6agHWV3xaKCLdDMcA==
X-Received: by 2002:a05:6902:20c8:b0:e0b:e59:35fe with SMTP id 3f1490d57ef6-e0b5456ca22mr10105410276.31.1722278579765;
        Mon, 29 Jul 2024 11:42:59 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a284d9asm2060706276.35.2024.07.29.11.42.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:42:59 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-64b29539d86so23653317b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:42:59 -0700 (PDT)
X-Received: by 2002:a05:690c:fc9:b0:64a:d9a1:db3f with SMTP id
 00721157ae682-67a05b94993mr122831147b3.7.1722278579323; Mon, 29 Jul 2024
 11:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:42:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX44RD3LLB_seZs6tkGyCxg8rjFyhd6zkrZMx0GWJAAyA@mail.gmail.com>
Message-ID: <CAMuHMdX44RD3LLB_seZs6tkGyCxg8rjFyhd6zkrZMx0GWJAAyA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] arm64: dts: renesas: r8a779h0: Add PWM device node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Khanh Le <khanh.le.xr@renesas.com>
>
> This patch adds device tree support for PWM/TPU on R-Car V4M (R8A779H0).

Dropping TPU...

>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> [wsa: rebased, dropped TPU part to be upstreamed seperately]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12 with the above fixed.

PWM1 and PWM2 are working fine, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

