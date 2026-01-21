Return-Path: <linux-renesas-soc+bounces-27196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAZfApq1cGndZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 12:16:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5D55DC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 12:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2AA5D688B95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6532FBE12;
	Wed, 21 Jan 2026 11:07:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B8396B8C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993662; cv=none; b=YZpZF+DHF72l7HKToIxdo9Ho05Pp/TTuBk6PtGrLW3UTnzq+yOaxpIyi8tkcTosmfE3O/dKh9ich5R3eLoqVlnV8A01AV8ra/PYImXPvvdHFkDqOw6z7mgha8dIe7dxV+90NImMCy5XpbB36a8N6Y1CMxnTJ7e5IjDBmKPWyYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993662; c=relaxed/simple;
	bh=cysOwS5g5dZRSxtVrJ3zv/VB5w+D2iLkyCuaPMhXFP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2FiCDjBZasPKLNj2QIBrqjwukdM3hi713Pm2RoQXuHNR1hFBjZecTpWt3Oegar4bq4fnIxWqctT4U+Jg6YzG3GgoA5VXOodxMwfcB4tmM8gN63nG2o8Id1szAsfL7JrklL59Gui6L1OXug+hXsN8KXtRj/dHSqZm6Ged6X74yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a35a00506so97836326d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 03:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993660; x=1769598460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSYJm8i9wWqRvGvRTZz6VIsl7/oMewZT8tw/+hAgWzw=;
        b=vOskUe0z5jnk5qZK7GiHliXnYFVWXqz4ITvE1wRTBZG95csOkmzK4QcJTTgWHqWPWs
         u+5wtrftsWo5eZJ6BiPmksFVwj+qlecSUyAzDju4dSDQ5kX7zD3f6enQiEQVQ5OanJ81
         AbiKZ3XRwHafXRVG0K8RGOz+QKPTuZNvXwbwCyHuawmfW0ofBGOQS3fuPYD78u57raq/
         dVFbn4UyDOkbrYBvi/9fE1NcbzkwhgdH8sgPKBr3VGWtDM9ipPiAwmj8rJk+YJJ9/DLk
         oNi36neJSTT72MK0wlpSyaNRnAidXBLEQmi4oDrV2c3G+hbXaVr1URGco9+ifM3ehDMf
         b1ug==
X-Forwarded-Encrypted: i=1; AJvYcCUgcDxiVfArJFUg6DpNsVTtvgzw3FBtcjWVV2VIKUR88WRm/wI+ugEp/j+oFjSZhn4ghEnEACX0bMiC5GGxGs4JyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCPxt4vI7dIoAIuupNqn4/P3PSQcQ6G24xdl3H0Adfi2MC9O/
	divfjr5ucdff5fsJv8C3bu+3tKF4pElQaSH13C5nA07E/2nYQvhtmVfbQGoKLN1A
X-Gm-Gg: AZuq6aLahrta1b+ARbThFWjXQu0kzsAUiTQAuYCLrZa6Jz6/TD9JOWMw5mUQmkaijvR
	vAERA9pFTthwd3TdMS1BzCxEt7GTvcBjbv/aA3zp7v9nsXmkdhyYgMMcYdb5JfSUFJbUDnG099l
	g9pK1jCA1Xd/9OHDtseN7pDOZdY8xkXgBH7Wk3uTodA5b8AXD37/nnBIxKo9/54zYJvTjD6mb9u
	vfZSWG2TFgg1TX9wIWpUc1OIeRgJ+0MLioUcg2RFXrTyAliy+0jfD4paeXuGq1q5jpryGQdxDLI
	vpoZHTMGt0EaXsjUKFeRgSlgy4ifeqg87bxgVrI+SpfdV47rWI2IJjQAS1+DPXYgQK6nGlpH7c5
	y73gKTwQoyoEVNnsB8M9DKWFUl3Ixc0Dvl1fWA1zsyKGwHEIo4QA6vTKsNSGLBtmUOLmhUicVwx
	wZ8xvKI5UapU0Z6TnXbo6yX20cnou9n8kSbadtnQ/CqJgzPM4s+kldOCGsyiOnE6s=
X-Received: by 2002:ad4:5c62:0:b0:894:6c8e:ed1c with SMTP id 6a1803df08f44-8946c8efa0fmr54491866d6.5.1768993659714;
        Wed, 21 Jan 2026 03:07:39 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8946c6d2691sm23748856d6.42.2026.01.21.03.07.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:07:39 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-501c6665144so64873631cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 03:07:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDBjRozOqjLzR1RsXpEInBQ13BIj0Vd0eM/rJuS4qzUh/vo1/ep3mcEdyaT8w3nWR/Q2b1E5d+KENT/wxK6X1iGQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad6:b0:5ef:248b:d533 with SMTP id
 ada2fe7eead31-5f1a716fcbcmr6150752137.31.1768993204250; Wed, 21 Jan 2026
 03:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-rz-sdio-mux-v6-0-38aa39527928@solid-run.com> <20260121-rz-sdio-mux-v6-3-38aa39527928@solid-run.com>
In-Reply-To: <20260121-rz-sdio-mux-v6-3-38aa39527928@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 11:59:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_rKgfusHP5qVny8OZufU6VAiA6sqg1LP3T2jikSz7yQ@mail.gmail.com>
X-Gm-Features: AZwV_QifTISU05sQ0lYySqx5XyPjAzUqa1H8fmOUOfLhWhGN7rzCzfM2UGq26-s
Message-ID: <CAMuHMdX_rKgfusHP5qVny8OZufU6VAiA6sqg1LP3T2jikSz7yQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] mux: add help text for MULTIPLEXER config option
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27196-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,solid-run.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CAE5D55DC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Josua,

On Wed, 21 Jan 2026 at 11:02, Josua Mayer <josua@solid-run.com> wrote:
> Add help text for CONFIG_MULTIPLEXER to allow enabling this option
> through the kernel configuration without explicit "select" driver
> dependencies.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -5,6 +5,14 @@
>
>  config MULTIPLEXER
>         tristate
> +       help
> +         Generic Multiplexer Support.
> +
> +         This framework is designed to abstract multiplexer handling for
> +         devices via various GPIO-, MMIO/Regmap or specific multiplexer
> +         controller chips.
> +
> +         If unsure, say no.
>
>  menu "Multiplexer drivers"
>         depends on MULTIPLEXER
>

Unfortunately it doesn't work like that. As the tristate has no prompt
specified, the user will never be asked about this.
You should use something like below:

--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -4,10 +4,8 @@
 #

 config MULTIPLEXER
-       tristate
+       tristate "Generic Multiplexer Support" if COMPILE_TEST
        help
-         Generic Multiplexer Support.
-
          This framework is designed to abstract multiplexer handling for
          devices via various GPIO-, MMIO/Regmap or specific multiplexer
          controller chips.

Sorry for not noticing before.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

