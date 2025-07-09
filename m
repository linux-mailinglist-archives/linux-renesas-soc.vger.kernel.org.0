Return-Path: <linux-renesas-soc+bounces-19422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E09AFE7D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 13:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A21F546954
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 11:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43BC2D7812;
	Wed,  9 Jul 2025 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOEEeWB2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F92D663A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060683; cv=none; b=g3rwkku49Gw0q8HuGJ6dPcW1xCzzfVNolsQ9BV8PJlCWhwiIOyVtkiTtJDOGb3E5SI+xbgv4eWF+IhZwnEehI6edPr0N78FkH3Aiks3sPu4A2Fv8DV2kTfvMuK0KfZmg9JoFIOylnUK4UporHYuHnMZniBqD4FNb3wIgL+083cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060683; c=relaxed/simple;
	bh=PaVrfIFIbwxqN5N7QELClwfl947mI/nydEQmr/00A24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkM3fB5K7JPA8hrkCe06cnpFYGEMEVTkIAnH5BbWD3BqJMrDzWOlxPEVZREhaBGZa3kcCzCyr6dh77A/9gdVcZHcO2V1wJObz3dBbUCzXcaIBMTZ/tcWINhBORMLjlkold3793nsY60/ZAjQbTT2bECh+uYr+O61pTCTm52dNis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOEEeWB2; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-710f39f5cb9so48725057b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jul 2025 04:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752060681; x=1752665481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ieb7vlaIuQSyop9+jXOCssxPnPUEaQyhl6jF6yrc0CA=;
        b=oOEEeWB2AMFvKDanRUw9Wbfj8qevrkrOhXD+GxkEitN1w2XcpRjH3aeGYq368wUiTj
         aoJNOliorRNPjrKInrIYuLpqbnGor0hEZheahf+RGfJgbJ1aVV4p/z4UQ9KrB3auWB55
         Fu7UTUTAODeTlemIY0ciHloIlmde/zZltgWHlokhwob6imEt2ThnCRnICWjswMdTydR+
         L8iy+yzo61RsDSuJIA0b+bgUby3SKHmS3HikVK5fB6oXlriMeUygwWWcmN42uT4aC8Sz
         5dQgnLev+LnENuChsCJFk/4BB+/1iTM84s5QzcrWk0g1O1JggNXuL144oqiatj5b3W3d
         ueag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060681; x=1752665481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieb7vlaIuQSyop9+jXOCssxPnPUEaQyhl6jF6yrc0CA=;
        b=UYEOm4CU6jm4B8nXXA4EjcjQrXDYnvPufgcAgbM8knEKl9sKHA0UnlmmhR420bOIaJ
         d2BAaeVDLukuhND+qzN+mAESnLynvEKYSV/kvQXST1UJNMZ0bfJGmazD8BNchsKPIqhl
         aSrgYa6d9eiJcG/ZORSBPT0IuRzFT4jT4gg26VTLwmSvHd3kGlRWEEkUNN6RswME6bho
         Yz1AyAE6EPTaL4mZg3uUQkLUMP9TG3kXU7UfwQK7uh5vvxIB343OObcIdiN+6TCWcxzT
         TvYC2wvNclVIB5mUossWUH4wlmwqwG1P4yIvZAP3LGsWL+nMdvfC6G6gKeSZ0GfBO4V7
         1KTg==
X-Forwarded-Encrypted: i=1; AJvYcCXsWhroMcjraTFcdqJtD1yGx32VearISKhRHHopx4QQrsNX1ZKi7W4AlUwquhZcvPPH/EUiEzj9zZqKJzqGFkpQrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytv67p1QHVvjAl2zwkC81jrqp317LON2EoSJ4q1DSGgyCIz3iN
	k1T6nD+WDQGbXIlc/NX2GzOiYzt0pSpuCyiQ9fH9rXOLkSQ2QiXLRR1QauHGRHWhVhqWoESiGY7
	91AQLDgA71PuVlt+m+Mm6tKSUlnxsUCrzHj+kq5MZmgYQFmBZYDkQ
X-Gm-Gg: ASbGncuJtv8bEJ2MJ7564n3/a8Bvq/jRtFXqQ8Qg7GzeFF1VeD/vXpaNTkZFV/+2hhP
	WKTnmSu7p/txMfyJOyMMbmtK48MyA2Y+POok+ZMo6cCG5anbJ0eTz3KwTrX9TiaB/LjmsXYwI/T
	kIlvgY6qVvi/n1WjoCRHCV4dNZba/l3C73T5C3yjJPqll7
X-Google-Smtp-Source: AGHT+IHsN2djYTTLi/DNc+rYRX18rxAuYsDytYTodNnkUxERwP2HTQBiU010RfwBIi4vYcEeLdjH1ca/ENkQxgfUlNM=
X-Received: by 2002:a05:690c:9686:b0:70e:18c0:dabd with SMTP id
 00721157ae682-717b13db678mr34773137b3.0.1752060680886; Wed, 09 Jul 2025
 04:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ldp6cadg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldp6cadg.wl-kuninori.morimoto.gx@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 13:30:44 +0200
X-Gm-Features: Ac12FXyu06qE0TNM2HzhP0EquqXPlNCwpR2ImK30RHFxe8aXBbo50zCoPifRitM
Message-ID: <CAPDyKFoy4GhZ5_2ssNapkUa80e0uW1ib2QPFZ0_n2stjR0qavg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pmdomain: renesas: sort Kconfig again
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 03:48, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Ulf, Geert
>
> Renesas Kconfig is using "SoC chip number" for CONFIG symbol, but is
> using "SoC chip name" for menu description. Because of it, it looks
> random order when we run "make menuconfig".
>
> We have sorted it by "menu description title order" (= SoC chip name),
> but it makes confuse, because developer usually checks CONFIG symbols
> (= SoC chip number).
>
> Let's indicate both "SoC chip number" and "SoC chip name" in description
> and sort it again.
>
> v1 -> v2
>         - tidyup git-log [2/3]
>         - tidyup comment [2/3]
>         - separate R8A7791 and R8A7793 [3/3]
>
> Kuninori Morimoto (3):
>   pmdomain: renesas: use menu for Renesas
>   pmdomain: renesas: sort Renesas Kconfig configs
>   pmdomain: renesas: separate R8A7791/R8A7793
>
>  drivers/pmdomain/renesas/Kconfig     | 126 ++++++++++++++-------------
>  drivers/pmdomain/renesas/Makefile    |   1 +
>  drivers/pmdomain/renesas/rcar-sysc.c |   5 +-
>  drivers/soc/renesas/Kconfig          |   2 +-
>  4 files changed, 72 insertions(+), 62 deletions(-)
>
> --
> 2.43.0
>

Patch 1->2 applied for next and leaving patch3 for you to conclude on
the next step, if any.

Kind regards
Uffe

