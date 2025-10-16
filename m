Return-Path: <linux-renesas-soc+bounces-23145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DBEBE3932
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 15:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 482CD188667D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 13:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF4C19E7F9;
	Thu, 16 Oct 2025 13:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B511712
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619796; cv=none; b=kIX9M0XGHqAshtG2LK5LNBLKghdJvWDfg9bvvroCqbHYgUmLs67Ve69+vodONM5JffsW8FN4HRCszpJYRbD+P+Wbz+PUELKovApjzH/0tkqWnMpcWB8tvqwaRU4qFNwp9k6d/+K7tWaIsqEsxCnIZu7+L8TquM3MIGxJNw12bQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619796; c=relaxed/simple;
	bh=0AcPguF7DH274FG4kuspo74fxSRZ6Q4tez0YJJCGbm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At0pN31l99fouT6OqvzDxEMDNJeo6Y0jd2OkCHuAG2C8X5mIV3d/8vGMdXmt2qy+sDeqmQgrxcZc3/i0quTCE7z9GNGm+U8DCnO/FWZ3jGZSTGqxwmyQ0EQvRaiWqIPpzVnAS/6I2kssAFG2laxnUczAzFIjVykOnH0JL49/pTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93109cb9dffso271457241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 06:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760619793; x=1761224593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdIoMomFfpw6tW8BeWtLibvojBlEBE1EJKLZQ5iP+S0=;
        b=b96n3UYJE5vNbX8HkHVhOQ71jtud+if2vfoNxnphUA+hnhiBDXpsojist8+cJZtB+/
         LW7cIdao6jcyRHS25RA2FWJZ7PLwORto7BYaXQE96jTCg799oEtVvlgUrRW1K3P3p3jG
         2M6WTkq2A1tYi+90LKMuAgPBk7Goo5cJuvi59BJ9VzHyvxeR3UmChTY/LAvZREoJb0zU
         nXC1XE4mG0g7W7BAlK44mgDZi2MvKivrMn+hEI1V8rRt5lkYLXbLTCnugibBSeYF2mhS
         A2ouHbSXKlr+DaaoJwbBiOBFjIomL4NxEjLDgH7OlSww7NtyxNavO2e7/qhJd92/UiJB
         sJ9w==
X-Gm-Message-State: AOJu0Yx5/N4dRcePinAIffy4onuFaZdHEr6C0lCHFcqXiX9Sj219kyQc
	u39ZY+ORQmvcoB3DDQ0t90oaMxp/VZW63E4X8Tdl7HjvXbWVMVMZTuQvh9I860XV
X-Gm-Gg: ASbGncs3286ksN72HKo4lOFY0BBlk1EwUDkChrJ5IEx29kISESFjxMMCpUJOnPqlbeF
	grSvyiCBYLcKL4QtWJ/pBtlNqcJ2fGzEKeDymh9MY3f20vTNDrMsLOIWRLpjEw888jqogJWeVNJ
	sPb1dlpXtXcgW1hatY8eKUmWCbkXcvnsp8YoVEgHWhY9hYVZdb4sMTV39mPLK7GKrfhv6c0WQd2
	xUenT6iXTWK2RbeeSDW/7OM9JBzyZkwCUESV7T+OYu/1nvlU6tzfHO3djB07M+38E8tpTB0xl6X
	bG4rt0nBIIS4e4ZbsZqaZl6NfL7rn25WI6epXg17OJYwEBnAfH2nFPr9p7yxNKF6uJnK1WHqwUi
	jHpqYhPWqoz8lM31164VlTiYPiJmKoVtOrSfhJ5frfLhPy0j/X1r4/uJpEIkUcY/w39oozORtkF
	zoEi+mxDo4+PRGE802rxyVplQTK1gT5/b9pYOgos1m/WsDe0HS
X-Google-Smtp-Source: AGHT+IGUrGxeeqz/lXRxo8zs91VWtI0GG+4HjvmUlYHIsUNf+6SuSQHeyR67AzJCAkTTKNLR3IGNAg==
X-Received: by 2002:a05:6122:a24:b0:544:98a0:4869 with SMTP id 71dfb90a1353d-5564edef37cmr55871e0c.3.1760619792865;
        Thu, 16 Oct 2025 06:03:12 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80a38ddsm5944998e0c.16.2025.10.16.06.03.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:03:12 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ce093debf6so565673137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:6102:e11:b0:59e:2c90:fae2 with SMTP id
 ada2fe7eead31-5d7dd6a1252mr46608137.30.1760619792176; Thu, 16 Oct 2025
 06:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com> <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 15:02:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
X-Gm-Features: AS18NWBZilE682DWas3ATbTkhQVgsQwHH9LuAVhgcMxFqSN3t6GQlo6WKm_9ezg
Message-ID: <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 16 Oct 2025 at 14:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Reset core uses the reset_gpio driver for a fallback mechanism. So,
> include it always once its dependencies are met to enable the fallback
> mechanism whenever possible. This avoids regressions when drivers remove
> open coded solutions in favor of this fallback.
>
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -5,6 +5,7 @@ config ARCH_HAS_RESET_CONTROLLER
>  menuconfig RESET_CONTROLLER
>         bool "Reset Controller Support"
>         default y if ARCH_HAS_RESET_CONTROLLER
> +       select RESET_GPIO if GPIOLIB
>         help
>           Generic Reset Controller support.
>

Makes sense, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This does mean RESET_GPIO will never be modular anymore, while it could
still work as a module (the reset core creates the platform device,
which can be probed later), albeit in a non-intuitive way.

BTW, could we run into a circular dependency?

    config RESET_TI_TPS380X
            tristate "TI TPS380x Reset Driver"
            select GPIOLIB

I guess this should be changed from select to depends on?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

