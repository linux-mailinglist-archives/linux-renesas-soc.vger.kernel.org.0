Return-Path: <linux-renesas-soc+bounces-9837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D79A3918
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 10:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61AAA284752
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F06318FC70;
	Fri, 18 Oct 2024 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGvX/ymO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725AE18E76B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241438; cv=none; b=i84F+XfnIO4/bOYTDT9JH/tF037GWc93M0qCZxD0MIBnoZeerMjk64Eg4S9wD/L5zy9JwogyztAlXpyuCwpSFQVBNWYVzj2PWozz9Sqalk4xy0F4uwaugjH3OdWFQCgVo83NzuAOad3aTdpuTfCtSb3c2VG/SuFUIbxIASj26og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241438; c=relaxed/simple;
	bh=q6UaaBG1S1+qACQ6YRhwicu8VBEuLQLOH0LNHXVY9yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9LgpsZloHOVTMOneS1M97t86/zv/v4N2lywfoDq5xsH8BT2G+iWu3QKQEhEjIx/tvlkuI4yeWUyCNB/0TyzODK7565vDo9NP+cTKzM+gaLb4DzpbVq1yR9vju5um550dvpji5ULicM02ZATyiDIhd8i4gVJRzO1MsBxZ9jTbFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGvX/ymO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3d97b8274so17294557b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 01:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729241434; x=1729846234; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4/RSforFp+VQNtLc4ofIvEcTd/s/JTnlqhsY7WVRH24=;
        b=cGvX/ymOsRiCUhCtm6gKWeuZv7bEICcUSiqlkEPEsnKr/DjCPCeM5szJA6HiqIMEJJ
         7GBU7tluoAZ/Lc/wJZF4Dp0fflq8F72YmkdRI7OQTp6n8DQfwyLtOGwFr79mM4LDVKpW
         z2e1o2Qq7rnQ+MM6bWbLXn4LLxzwTssXZhGeZ/QCQRRYqGVNzAHfePrMMmlKjRI0x9NN
         H59W4nbjDXpBXrFw101KgpBc3IIaORYMIlHKzenIVrAXJK77QRvbdS85C30cZiZM40Ql
         Yr2J4dEKBnCjbQk4qON2gBvMLCi0Eto8dhwgnNmguO9ApD8m3r33VPrR4mmz7UGDTqvB
         m3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729241434; x=1729846234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/RSforFp+VQNtLc4ofIvEcTd/s/JTnlqhsY7WVRH24=;
        b=ZleMP2Hc46q7GDpT6ZvEwutCM7M8xkN1D5/aPcQzfXGYRrvga9/QU7U2ASyi0FswRk
         O+qlUts385blGSzjkejOjRsisrBeHDzmCjXVvYtxtwRgM5Ig04gGiIi0WY4uTwlDj+tT
         K2786WZ5Ofqfq0BSnHFwPQCJbKftm67QXyP+nLKujEQ/xfoBiGGoa+JI3+wqv0LlJVHt
         rXoGDYaqBsZiWvE9PB0BZkT3JU+X5eHlSR9HqhAc1VDef8rfqGxr+N7M5ez+/XMr3nWC
         4CuF+c6xXeH4UuUXqTp06SMIW0HFhc9mJJBvqyU3RmFM2Q08BHJrWkNjatSIXC+wis2l
         KCGA==
X-Forwarded-Encrypted: i=1; AJvYcCVSZQ1MQFfl4EyoSCna1VVzHEvEklUogsO++25vZsoL6TFpjdq+AH3ElqEMkZfloPUgkF4fUIad/XSnvvbLJR9+mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wZeaY7aBYxqjme2GmnUw5yFqQW5biiYiBQ5mXzInoCEZ12GV
	UbDvyxVFWEd3RMPbchrSkwXWnNndtZmtTBf0fzW8OiSB7xMWJbtxvqP0ZZbUGlsrpn6WzgdQ/mh
	Gwa+/63nNEBz9He1Zaninc3vwfdL99bzUTKPxbg==
X-Google-Smtp-Source: AGHT+IEfhw8dTGOqtMUmLixgGGVRqyf2gSqNzfjdP2OonSOoTDcrjLgzvPuP0+fWji/QpUGei3fuavAC7iK/8ckB4NI=
X-Received: by 2002:a05:690c:fc2:b0:6e2:1090:af31 with SMTP id
 00721157ae682-6e5bfbe7c76mr17174717b3.3.1729241434462; Fri, 18 Oct 2024
 01:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241015164732.4085249-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 18 Oct 2024 10:49:58 +0200
Message-ID: <CAPDyKFq1-fW=d5QiEcYNkErpMuBo0aZzB1pos1CHcPZmAWGTRw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] watchdog: rzg2l_wdt: Enable properly the watchdog
 clocks and power domain
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 18:47, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Watchdog device available on RZ/G3S SoC is part of a software-controlled
> power domain. The watchdog driver implements struct
> watchdog_ops::restart() handler which is called in atomic context via
> this call chain:
>
> kernel_restart() ->
>   machine_restart() ->
>     do_kernel_restart() ->
>       atomic_notifier_call_chain() ->
>         watchdog_restart_notifier()
>           rzg2l_wdt_restart()
>
> When the rzg2l_wdt_restart() is called it may happen that the watchdog
> clocks to be disabled and the associated power domain to be off.
> Accessing watchdog registers in this state leads to aborts and system
> blocks.
>
> To solve this issue the watchdog power domain was marked as IRQ safe
> as well as watchdog device (as proposed by Ulf Hansson). Along with
> it the clk_prepare_enable() calls from the watchdog restart() handler
> were removed and all is based now on pm_runtime_resume_and_get()
> as explained in patch 03/03.
>
> Series contains also power domain driver changes to be able to
> register the watchdog PM domain as an IRQ safe one.
>
> Initial RFC series for solving this issue was posted at [1].
>
> It is safe to merge watchdog and PM domain driver changes though
> different trees.
>
> Thank you,
> Claudiu Beznea
>
> [1] https://lore.kernel.org/all/20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com/
>
> Changes in v4:
> - in patch 1/1, function rzg2l_cpg_pd_setup():
> -- call rzg2l_cpg_power_on() unconditionally of governor
> -- drop governor's parameter and decide what governor to use based on
>    always_on
> - collected tags
>
> Changes in v3:
> - added patch "clk: renesas: rzg2l-cpg: Move PM domain power on in
>   rzg2l_cpg_pd_setup()"
> - addressed review comments
> - collected tags
> - per-patch changes are listed in individual patches
>
> Changes in v2:
> - adjusted patch title for patch 02/03
> - adjusted description for patch 03/03 along with comment
>   from code
>
> Changes since RFC:
> - dropped patches 01/03, 02/03 from RFC
> - adjusted power domain driver to be able to register the
>   watchdog PM domain as an IRQ safe one
> - drop clock prepare approach from watchdog driver presented in RFC
>   and rely only on pm_runtime_resume_and_get()
> - mark the watchdog device as IRQ safe
>
>
> Claudiu Beznea (4):
>   clk: renesas: rzg2l-cpg: Move PM domain power on in
>     rzg2l_cpg_pd_setup()
>   clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
>   clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as
>     IRQ safe
>   watchdog: rzg2l_wdt: Power on the watchdog domain in the restart
>     handler
>
>  drivers/clk/renesas/r9a08g045-cpg.c | 52 +++++++++++------------------
>  drivers/clk/renesas/rzg2l-cpg.c     | 41 ++++++++++++-----------
>  drivers/clk/renesas/rzg2l-cpg.h     | 10 ++----
>  drivers/watchdog/rzg2l_wdt.c        | 20 +++++++++--
>  4 files changed, 63 insertions(+), 60 deletions(-)
>
> --
> 2.39.2
>

For the series, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

