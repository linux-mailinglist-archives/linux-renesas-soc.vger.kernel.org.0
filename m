Return-Path: <linux-renesas-soc+bounces-22403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C9BA30FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEDEC176018
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2734172608;
	Fri, 26 Sep 2025 09:02:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039E1F03DE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758877379; cv=none; b=Rtt/PSLnDgLNycmXdjk7JOGi0DlJgSzK5hylHhh21VbekF1Y0NDommDeZ4cry/OvYyA9uBDGqFdV7SSs9WWH9UiLPDgb9MWCKg8bpWQ8Wxhq9OLGem1lSrJdwIhn7mCAeRQw2AwmveqZcza6jn2qTEhmS9S7s9P8Q2bmZ4qyJkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758877379; c=relaxed/simple;
	bh=yqhKXeyjFsotA2/WijdIHnCoHcbIYkQLPHah/e5pqhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNYvwhCxkJRvN7n7etU0NbuybDOeYpuB0/qX+Wty6sFx9P3MvLhHDYf2Bzcu3KLa5DULQbfSMR6AuWatQsiNPtJ1V+1kfmEKw/+upwdIZWbGyCosIOhA6cBGQVfoTK4XQXWB2/VfifrEiFM5pDmoU2mxKLJ0eBAbACGOwpD/ysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a786ed57cso1481348e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758877376; x=1759482176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A1nnX1lRJWhBOD0gbzoRliet8LOTaH1O95sh7if/L4=;
        b=EnBnLdZs40ZwkRlw4KZAJeOVXKS//LKNsp49Bc1PzIdnnu54EilyrUcMO7UB0jHC0b
         KYg9GuOwNC56W60O0BnACi61E/sRTEyNVaWXZjKp7NGXPRpHzK1yZkDgtmBxzhmemRbo
         GuppeUsYtlxmhm/uufRxr6M9QMYMI91vi6DF/F8uK6u1d7nDxD2S2mFssBBmK7dy68Jx
         weZoPhNZMtC1JyaS98hEgLFJrsoOMvJzCteRGYRlOyUKO73gIG9DB3L1AXyHfAiXS/hF
         yMC1PxMjgSOL2XFiQEB5e8C/7S47+mQ1c1QmD+2kaWYYJGqoSD5CF9vVG8DW9PeTm05w
         mSWA==
X-Gm-Message-State: AOJu0YzyfYg0zZSR7znPdPKz/Bcaxq0gpTxY7dSu3f3mO2OMLw7VO8U0
	jHXl/b/cHp0bvBuobY7pyO7y7oZsd/zbMiszoahuBxKkH+E0cqCc2aJFjb7GxvHn
X-Gm-Gg: ASbGncsIbBg4yTFgv2a+wbveUC066ERUwzLQNECtZqIiFI7Cy7hMpcwfzG2rmEeagt5
	905ZBlG0bX9kQVfreqG4c/W1HNdEzkDTo6WvK6sCUGJSF9VWbHrfW1Wc6LW6QjaWhtmjHcr1ttk
	6hJhbDUTRRa2JmGVfD2hsIR+FYPyWbeapD5+RccLdCPxW06Elg/fckHlPEsoXw1iEUpNUSUDy+w
	/NVcW7bvhsixGQ+Id2/7LOq8vYBOPYy474PA6PX/WfGt4di4jN3Dp1Ht3uPT3D51tP8ogBbsPXA
	p3ujkFxEw25lzpXfInpw0QdoD9JeGrIkUwLjE1Rk+gLLnUTfNUzDrFpHdz9uzHQO8+xuY29PQdL
	3RPkmc5yFYOcG9PnL0rvApryOriN44Gf4H0p/6cGc37hRKC2qXHIkUDifJurC
X-Google-Smtp-Source: AGHT+IEBiykuA70PJELToZQnaa+MasFkNrNTcux0tbrHqKEo+ozQxmycv5/rPzXhoI09QEZz6bReiQ==
X-Received: by 2002:a05:6122:82a1:b0:541:bf69:17ac with SMTP id 71dfb90a1353d-54bea380af6mr3067256e0c.16.1758877376061;
        Fri, 26 Sep 2025 02:02:56 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed89e291sm925717e0c.7.2025.09.26.02.02.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:02:55 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5a218470faaso1454604137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:6102:d90:b0:4fd:53e0:b522 with SMTP id
 ada2fe7eead31-5acd4639abbmr2500563137.19.1758877375688; Fri, 26 Sep 2025
 02:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 11:02:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGthcw94vXDErZTissJ1wVPvJKaLb+j7D8Y77-E226PA@mail.gmail.com>
X-Gm-Features: AS18NWDWwg19m25N1Unra71jecmnvaAojQgpAo4nRTxBbEsY4fGL5OyahynzoCI
Message-ID: <CAMuHMdVGthcw94vXDErZTissJ1wVPvJKaLb+j7D8Y77-E226PA@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 19 Sept 2025 at 12:07, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To be able to use the LEDs, a configuration switch has to be set to a
> non-default value. So, infrastructure to support these switches (which
> modify signal routing via the CPLD on the demo board (DB)) is added as
> well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> This patch depends on "[PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO
> controllers" which is still in-flight. I send this out as RFC already,
> so we can discuss the introduction of the switch dependant settings. I
> copied this approach form RZ/G3S.

I am not opposed to that.
The switches are needed in both the DB and EB DTS, and in future
DT overlays (if any).

> --- /dev/null
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h

"...-db-eb-...", as this header file applies to both?

> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * On-board switches for the Renesas RZ/N1D demo board (DB) and extension
> + * board (EB)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __N1D_DB_EB_SWITCHES_H__
> +#define __N1D_DB_EB_SWITCHES_H__

The include guard does not match the file name.

> +
> +#define SW_OFF         0
> +#define SW_ON          1
> +
> +/*
> + * SW_2-2:

SW2-2?

> + *     SW_OFF - enable PMOD1-3+LEDs on the extension board

Please add "ALT0_PMOD"...

> + *     SW_ON  - enable CAT/S3 (default)

... and "ALT1_CAT_S3".

> + */
> +#define SW_2_2 SW_ON

SW2_2, which is what all users below are using ;-)
Or better, DB_SW2_2, so you can distinguish between switches on DB
and EB (EB also has SW2).

> +
> +#endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

