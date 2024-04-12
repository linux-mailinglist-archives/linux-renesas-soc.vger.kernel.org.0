Return-Path: <linux-renesas-soc+bounces-4555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23EB8A2D76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 13:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613F828659D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DA854BF9;
	Fri, 12 Apr 2024 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sufxpuQj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEC54F86
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712921481; cv=none; b=gRdoIqgy2u9Mce5Kbhmr0EHf9KHahDAvFj7uZVjLX0vbPQEAY8OTK0WWKkUUxIcn+RHlOVyPGroJ8sWw1bUntDg12iskEYgWhLPjWzvX5H2TARdAKlnOehN47SKgsvxH1P3O9F1rdHZfirZqc3XRDRJkoaXP7mQh9QAwBW+2sZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712921481; c=relaxed/simple;
	bh=ZoSyU+Qrcr9uh8qbOS2xd/lSpeAOebNenMFaShgPgOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XT8So7KY27JAOtqJ6btM88QeAXcG6yP15DKL22r+O2Pi0m0q3VhFo4OLJ5xvqPcSAMJA1MiJTS5Sj4AZ3hLabgyV7OoTP0rHQMi5UhaGG4VAOAVXZHlCklbjzBzidZoHZF+k5j/uSHOpRIBMhsZjGde5eYeXpOYncyno7EwG3nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sufxpuQj; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-617cd7bd929so8032787b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712921479; x=1713526279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qPNOn0GLuQk8KwNG0ziRn0Mun0YoWTdTe+51qrseWJo=;
        b=sufxpuQjwIwTinfC6VmHT9h7jX7ovJ+rsp4ScJr5FNhM9VaaN90WvFOI3lqG3h1krA
         c12vUkAlOM5vlGNeWGwEhbx1sxHNqvu/o2kPBvMz7J8nssIPSbitYQwnpQF9qGCE1yCM
         kXZOZM5ccVn3B/BYfpmak4eRTqCjZlBV7OPc7zac5m8Xlx9L4WQGW8ZfUa2ovJMGLn1Y
         UwolpslDcIMzy6R7fVMdTzwqdNIHhkfOlaFKXKaHStoUBPCiDF98MaOmMRx0sgMcFVQi
         QryzS8MOEQRHp4qmmH0fjXDjByBvUFS84yNukvnFLggbq14F8JUbnoFBPvQlnVrPJIPm
         oPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712921479; x=1713526279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPNOn0GLuQk8KwNG0ziRn0Mun0YoWTdTe+51qrseWJo=;
        b=rRlT6/QSlojJ/XQaOJw08t4+xKkk6BdXO19iQcW1JgbFA1GPJGw44nDUmqvKVXyQzn
         4jVjyXHA7EVWrT9eVFE3Epps/6tb6Jyg6xrHgNXH0CjCMTK4Y7Ht1uVUiHgfs1DeOf/7
         9IsiPc+F32P5QnnIIQO5o2DLEPWd1JDepcZFYzIFFYxaLFK5FRFRSdMfIdzDr5cIE4//
         TEVQOMTfdNqRC04wYht4pEcLnFQWCj2l/ivyGLyF2rcLM4fUw3f6P5YuvrYbzjaWnHl2
         Z27dW1yeESEk1ml7hobF1RFU4n4LAA9RfsjDP7h6kKDD1iwcR0MvUgBN35xKPHC84A/+
         bOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbaF8Xw7yWvlB0Ix/0saL3afx6uteGYkDoDw+b8QDMZ+MrV379YVIc82xR5lSWuk1WXUpAvzLsTe6ischflMx91LhiSXHFsdjmpVw3VFJI4VI=
X-Gm-Message-State: AOJu0YyGutHg66oXCocSrLJmk1Nr7rMpqmJ3Bw2OyDU/ngyp7k9vIQr4
	VtSBy1ynigvNmsBql9uGDgk9Ihb1cHTL6c/jT/IsKwujTbD+pjrMAibNcJ1MlB8Mej2gBxWpGNO
	qSQqmCSMqCsNJ8iIEryb5xzVmjawS17l7NHuixw==
X-Google-Smtp-Source: AGHT+IEGrhRwJIjO4KiFsAW/ZNbIF+dkGaOgsaB02MvYBIzWfJNTMR4i8201QPvrr2Qs77dSB1uO3NhGLefzi1RtS4Y=
X-Received: by 2002:a25:810b:0:b0:dc6:9399:849e with SMTP id
 o11-20020a25810b000000b00dc69399849emr2180984ybk.11.1712921479121; Fri, 12
 Apr 2024 04:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 12 Apr 2024 13:30:43 +0200
Message-ID: <CAPDyKFr405qt58wrqNdSn8bQPRqPKJ1omUZHS_VpQrX5zxUJug@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] clk: renesas: rzg2l: Add support for power domains
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 14:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series adds support for power domains on rzg2l driver.
>
> RZ/G2L kind of devices support a functionality called MSTOP (module
> stop/standby). According to hardware manual the module could be switch
> to standby after its clocks are disabled. The reverse order of operation
> should be done when enabling a module (get the module out of standby,
> enable its clocks etc).
>
> In [1] the MSTOP settings were implemented by adding code in driver
> to attach the MSTOP state to the IP clocks. But it has been proposed
> to implement it as power domain. The result is this series.
>
> Along with MSTOP functionality there is also module power down
> functionality (which is currently available only on RZ/G3S). This has
> been also implemented through power domains.
>
> The DT bindings were updated with power domain IDs (plain integers
> that matches the DT with driver data structures). The current DT
> bindings were updated with module IDs for the modules listed in tables
> with name "Registers for Module Standby Mode" (see HW manual) exception
> being RZ/G3S where, due to the power down functionality, the DDR,
> TZCDDR, OTFDE_DDR were also added, to avoid system being blocked due
> to the following lines of code from patch 6/9.
>
> +       /* Prepare for power down the BUSes in power down mode. */
> +       if (info->pm_domain_pwrdn_mstop)
> +               writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);
>
> Domain IDs were added to all SoC specific bindings.
>
> Thank you,
> Claudiu Beznea
>
> Changes in v3:
> - collected tags
> - dinamically detect if a SCIF is serial console and populate
>   pd->suspend_check
> - dropped patch 09/10 from v2
>
> Changes in v2:
> - addressed review comments
> - dropped:
>     - dt-bindings: clock: r9a09g011-cpg: Add always-on power domain IDs
>     - clk: renesas: r9a07g043: Add initial support for power domains
>     - clk: renesas: r9a07g044: Add initial support for power domains
>     - clk: renesas: r9a09g011: Add initial support for power domains
>     - clk: renesas: r9a09g011: Add initial support for power domains
>     - arm64: dts: renesas: r9a07g043: Update #power-domain-cells = <1>
>     - arm64: dts: renesas: r9a07g044: Update #power-domain-cells = <1>
>     - arm64: dts: renesas: r9a07g054: Update #power-domain-cells = <1>
>     - arm64: dts: renesas: r9a09g011: Update #power-domain-cells = <1>
>   as suggested in the review process
> - dropped "arm64: dts: renesas: rzg3s-smarc-som: Guard the ethernet IRQ
>   GPIOs with proper flags" patch as it was integrated
> - added suspend to RAM support
> - collected tag
>
> [1] https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/
>
>
> Claudiu Beznea (9):
>   dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
>   dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
>   dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
>   dt-bindings: clock: r9a08g045-cpg: Add power domain IDs
>   dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells =
>     <1> for RZ/G3S
>   clk: renesas: rzg2l: Extend power domain support
>   clk: renesas: r9a08g045: Add support for power domains
>   clk: renesas: rzg2l-cpg: Add suspend/resume support for power domains

In particular patches like the above I would appreciate to be cced on
to help review, but I understand that it's easy to miss in cases like
this.

That said, maybe we should start separating and moving the
power-domain parts out from the clk directory into the pmdomain
directory instead, that should improve these situations!?

>   arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
>
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  20 +-
>  drivers/clk/renesas/r9a08g045-cpg.c           |  61 ++++
>  drivers/clk/renesas/rzg2l-cpg.c               | 269 +++++++++++++++++-
>  drivers/clk/renesas/rzg2l-cpg.h               |  77 +++++
>  include/dt-bindings/clock/r9a07g043-cpg.h     |  52 ++++
>  include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ++++
>  include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ++++
>  include/dt-bindings/clock/r9a08g045-cpg.h     |  70 +++++
>  9 files changed, 659 insertions(+), 24 deletions(-)
>

Kind regards
Uffe

