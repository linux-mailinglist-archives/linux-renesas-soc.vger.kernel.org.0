Return-Path: <linux-renesas-soc+bounces-17248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E1FABD3EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 11:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E61BE17C9AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5515262807;
	Tue, 20 May 2025 09:50:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6F266B6C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734645; cv=none; b=o/ktZ9Nfaw57wvyrhttaKT20cxIt74nIPFeo4fEyBGmFkhiGhj1YzlyYRI8efSQX+l+AfscP1xfCel8B2/3u8iq9NGn7VgZM9I98dC9KUbQmNhxS+oltp+m0S9Qp1khNx8vRMzI/BPPEQUOTrOompX87fCYJdWiJ2jozADtlJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734645; c=relaxed/simple;
	bh=d21gmt9hsSzJ8Y2d7pX+yZso27A6j0/KNC5HyEXv40Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcm0hegVTTav4yijKtYvyqKc/uRWiakRvzf9Z+VoLj9nzRbt3ZrQ/KS1RW0GCEDsvnJYfqqrYvvZ/0df9ygmHzoZNale7Y+HIcJ3Cpg0YBuW5e7zkzEJeDj2tFYtOIUdWpha1HCE9s3oENjPzZ3m3tR3pgTxmS4wrTPn2fn5ugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-525b44b7720so1578679e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 02:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734642; x=1748339442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV3RExiyrUlCY+zEgxXMbRVv8bAtK9rmT+eCSB7i9gI=;
        b=as27Gf6agip0/BP22JfuCq6b+mPbvt004Bum+FZEQrXFLcSGz1cWc44ZskL30Urow0
         RmJBB7kc4cUVzHeFFaWdgxql3WDdL/GSPlxXnNzJEUAjJwDlz5y1zvd6mPq3dzxd7WpH
         6kcxZb3Wb+ZPKwsd14JlsbpJQwa/NrazVJ+Peqnb8ugY0Pb5sYp9lcaTzCgOA5NnRe1d
         HRNMdxMyGLqHDtg38RI1gPQdR1QJXCe1xoxPNowKQN3ZoKztpt/qQUzG0k5sZDd4h0uL
         tAawmav/+9X2FNSju+bQFsFT1GapCevj7sfb9utd5lxHKtc31Qe+XNjHDCtXQnSZzYMg
         G9+A==
X-Gm-Message-State: AOJu0YxMxwHlj2rX+i8P0zqd0S9hambdqnyMOWWxZ9vAo0cR1fVXdHuq
	xuVuMBgnc3Krp7JUhzJRdapU6jpDUu7S5LjLO4XBemPiDoxUpUvthgLDHIvK5eMb
X-Gm-Gg: ASbGncsY6WM0J1r8JGxBpRzCodo0pnK5SBpUE15yV90LZTnomrsf1o/XfhUnxGDp1WG
	n0jGbXOWOiRPqGhGNaLT2Bvw+es5pdv9RCaCfYVTCwlglJ8dPaFHhMmXEtBF5uEH2nt/AvnjPRx
	O/1uqMbkT8gPmxev85Bp1/fN8JJp/grBNUqO9t0pY/r6SBqyKs9aq6+ALG+XwdjZXtt3shs1cdB
	cgAZEmj+DfLWUg/XHGIlU1xjYLSu1w7fNLEqLZBTh1y734t5aL1o8+jPiV5/9JmHL5TeYEq87SA
	RPZ/6d9KMWm9+Sz+10zoVUjtjbZOYAMkCVA90ZRsMblzlMyXcbUf9bxozqEAYxXb/F05yEoWqmG
	2qgBlmLqx/uMLeg==
X-Google-Smtp-Source: AGHT+IEfp1gROQMP6kSDArWOsXnj7nPuLyolfQ+bwIob6k4BwoZ46fu3wNnlqL9znBJeK2g8ls9AQA==
X-Received: by 2002:a05:6122:428a:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-52dbcc8547emr12298870e0c.3.1747734642088;
        Tue, 20 May 2025 02:50:42 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba91076esm8187104e0c.3.2025.05.20.02.50.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:50:41 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87bff37733cso812115241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 May 2025 02:50:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1593:b0:4c4:fdb9:2ea with SMTP id
 ada2fe7eead31-4e049d5c1ecmr15247839137.7.1747734641719; Tue, 20 May 2025
 02:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jz6itn0j.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jz6itn0j.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 11:50:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYbBwKPx1av+8_04-FZmoLKvmroWxge5cZ=0Y2FR8TFw@mail.gmail.com>
X-Gm-Features: AX0GCFsSlZGsQTvswqYL3yaz0RWL8ilzXJtnN617KSp3wfucXZ5MnOHX1arXwmA
Message-ID: <CAMuHMdXYbBwKPx1av+8_04-FZmoLKvmroWxge5cZ=0Y2FR8TFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas: defconfig: tidyup Renesas PWM configs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thanks for your patch!

On Thu, 15 May 2025 at 08:18, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> CONFIG_PWM_xxx for Renesas was renamed to CONFIG_PWM_RENESAS_xxx.

While at it, enable Renesas RZ/G2L General PWM Timer support, as used on
RZ/G2L and RZ/V2L boards.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> NOTE. for v6.16 or later

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply in renesas-drivers today, and in topic/renesas-defconfig
after v6.16-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

