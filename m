Return-Path: <linux-renesas-soc+bounces-23385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E13BF6D12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 15:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B3CD1886BD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 13:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D977A338928;
	Tue, 21 Oct 2025 13:35:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E120338915
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053729; cv=none; b=nWbJggmjgY7thVpkN4TE8lz2lo6NjblU59SyI3sJXJcrtPrdRhYMj59bxxYm7n0FjvolHljlMg6WlPWXIa7fK6CO9Yxvn/l37ZsBDxITJgigDFJ/kIOwTKkxg9HOKk0Tk8xpWGjuysJ3WQWlrpfPFjXUZrc+rCRvykaDFJqPrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053729; c=relaxed/simple;
	bh=gnF9AkJgPkgv+c5e70+0S/TuXUz2qGPWDAKnDZ2oFUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7IrFFYjtkUHHX2j4dB2QlKKTin7NFI6tjkmWZMxsvs90xU7JI13sOgRPfFBe1OBYll1DJWaXuBbWSabw/XH8dBxh7iAIExkr1JNGhWW/MjKMxelB6skxJWXX3xyKqjSI+YwgDBTUW5cWS4/x2MelO8VVOFkfIQlPcowoR9cfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5d758dba570so2768928137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053727; x=1761658527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TkKqx+vxrv5wCaSsuSiP+PuBVA5+FMh9B80POq+sr0=;
        b=CR2rHtsZGjZ/MLVnDKxiqAULNgYRAtZYNCQz5VVYp7YT5u1uCKeAA5+/MU3WaTk6dC
         QhvjuSNiicwColjUkRoP8jNQjJso7BTADXPnSn4HR/86SejTTH3r0E9PgWnUhBt+viC0
         +oXQ9RYpva68ydtt2e58ns4ZxOgmbxQWy2rdpr7qVeKgcr6dsavuAzWv6VG7q9X+rn9c
         XaIdt9Pf6b4lrWtYYyM72wrXSqvY+iuQ32ZhISU2xpx7DDI/ljvRvDJPfZZadiBfDB6s
         qGqyYhw8GeQ8oRzyzVQqXveaQtgVntwWC0JSud1RGkAStnF5wvk+JWUS/WvIRB4CMTk0
         Esjg==
X-Forwarded-Encrypted: i=1; AJvYcCUJx4xA2Q6cMO6hr5+DVDa+n+5myzhbnGSKhUaQR1S+BQS9WRL3f+F3VHiq3R+dr/6YkxQIQlMhOl8TZbfYLZ8ing==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRbBzVnmK/YoNTR0ZwLuQJlWVhfeNLIxSpO4aw7PykaEIJo4N
	HYXbo2L04FNq/XN7o+w02SHMhmubou5o71p9O3Y/kGuXHYPJDQQHIHyehbcysMCV
X-Gm-Gg: ASbGncuYg6BXSyNfvkk3MkcGARxzqo817nOi13fgy79liZqO6mbkoIOEliHBKKCaTgA
	s3mHaBegiW8ep1+xqPJm86Ky8S+vSpruBmUAV+ZNH1royYYLFK02RFpsYS5h1YG7cAUA6O0+sNB
	os/BR4YZzxwtY8C5D8XYMin4VuPSMo6JEBskhwh2lItiJnmyvkvoUx6TlvFll8QaVDPg5nEQUm+
	XgqH/6K/vBF6EKUGXV+FYQda3wmmWssxr92eAJBFkv+o4uza494ZsFQNXlEEzZo/lqDiStQvL21
	5XRB9SV1WhA56UOTlMHZ06rGgoZCdr8b2xRxploEJgGKwDdep+RprCanuN8VPVJV8oymO0iYZcc
	OwUTUOYQyzSAvMtiyR4DcI985k2kCHYdZDvq70KLzla973zFlpKgGru8ksiVW+0xTHNztg4jom2
	fbA0/94Y6DYZOYff8K7BGUgN39zQJ26EHhmdxNxg==
X-Google-Smtp-Source: AGHT+IEeVZ4uKy9qrGN/YLPDVmO7aDMHTCB3vI7p87Zo62ApAy/fIYFf+nOxT44zGBARiLonvhTQUA==
X-Received: by 2002:a05:6102:324f:10b0:5d9:6dc3:90d5 with SMTP id ada2fe7eead31-5d96dc39bddmr1989109137.5.1761053726675;
        Tue, 21 Oct 2025 06:35:26 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55662117c75sm3337415e0c.23.2025.10.21.06.35.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:35:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-930fe879d1dso1553140241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 06:35:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbmfkQPm7WS6K1KiCOZRS+rflXIDLFAWbfTHvqejD1lSeBPW60Tlv/eDzrFnrfnc28oMWcDVjZ3U+2GtDf82Em4A==@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d7dd6ba33emr4614068137.41.1761053723732; Tue, 21 Oct 2025
 06:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:35:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
X-Gm-Features: AS18NWDE7aRGEcmYizQFJmtQta7msQIG0JXTbcDHGFqFLxinOoGCd4ViST3rwwc
Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] clk: renesas: r9a09g057: Add clock and reset
 entries for RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the RTC module on the Renesas RZ/V2H
> (R9A09G057) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

