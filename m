Return-Path: <linux-renesas-soc+bounces-13011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA620A2F222
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58FCD160E42
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF94A1F8BC6;
	Mon, 10 Feb 2025 15:52:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6431E32A2;
	Mon, 10 Feb 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202751; cv=none; b=XttlZuHuOYtqVWsGu5NQrqTUfuiZQV1RpDi0HnuipZKVALC4lDDbnoxrHCyo8FFawjk6PMmqk/P62JB3BwQ7EAhJhOvpGHdcrvdrN01+Iyv+GpKkIr+rWWWbM5nAcdh0n/Bxo6Ctl9SspuYsBbASrH2eyU0u35fCEgNsH9dr+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202751; c=relaxed/simple;
	bh=T4p3xEVBvyWcXEeHEOyj70pPzf7pMCYhQAyjCMJja4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3ECJAphPSUa7e1j3woW0ibcnMGyrFF+rblYuJItvGvc7OahK2KwMuPeEIvzSRUtHMDp70LIT+Alszvf5s5CG34QI+J1j/l7Cho8WguTq2PhhYYNOgYFsHHM5DjRelyYJFjb0uZj1e7VNUKXrP6RdC+JwpoI3VKjdFGGBrupPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ba6ef7d736so878938137.0;
        Mon, 10 Feb 2025 07:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202748; x=1739807548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqgJlFK8yCMJ6X48gHpDD9aLdWGuTZHvmJepaNnjpLk=;
        b=hEoEthVIvnfu04PqFskHfq34BBTgQm71JgEuWo5FsYZY92MmKCmE7XHPtLdzVKvpNI
         bx/lGnzU5wwcw9p5sQqftFVum1BW4rpZlzLXKfxit7tzlqRRkREGAzguTozJo2tMkgfb
         boERdCLhDe3F3tf7oJNZUNUwW0fq16QJSua3X3I8LW/z8ad+zqg2OFsIs4rhxVeaRbzg
         pTBNrJt0a3XRyPKe9U1+1V155v0+hweZSVEU26nA6M1b6SbVXXOJEy1crdJBUazkmGfE
         B5/pwPWfT0WgQvZ1EPQpXOKd6eBQ85I54HWA/VPAaT710+alPIYfFtaYUc3v1NNfCwAQ
         d/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVGSpVKNXMITR++xHFFxCuqYYzRVneGXYOCzYYt/TfON3YMSufTTKEGjJTVdhNgeEqCzDp/7kvWpB5sGvMx6ntK2SM=@vger.kernel.org, AJvYcCWbWqjwPfI7R/pBUBT/R2of0XHDK3vpTs4ACOKvezgzocs/bUKuqek2vi/DT/v5MJV8Lfj7NoNRDB+b@vger.kernel.org, AJvYcCXt4BoDeAHILSOsJmHDeWwIOMWOBBMsZC2m4ojuKeVJlQvO5d93Q0FoXd1fAcYI3YAsNSjtJlQgx+s+LF6/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnh0z32ytbIB8ognd+ibPsHcPe6TRoa8TQwiJrI68wUJz9+JgF
	f48mT8nDT2QUfMy6HWlLLYb/PKC4da1SBy5XSq3qqm/UEAlh1YdBIRgy0mi2
X-Gm-Gg: ASbGncv0r6bFNWjVf18bXKCO5OVlSRjQKO0SzI20SWO0eVy0KWj2iD0DNtTWkSxnNAd
	FgdMpoqUwuqaSzju/icaKeqj2zfZYK5AfUJ+XhynPGmqvFi049mJHkuib4AGKgXibt8zqihF44c
	3QfmE0ei24mkWSNiaS7cgsjWRhXG2o2mXLTXZme7b6zDcf/x1LFBCA/DP/GbEiMjT2Fkc0niNau
	+G20qYhyUMQ2TYFbg8SbckMSjIigMB8TuzcqFHaNXGy+M8qWbXsLEIz1aPSaRMufXKsMgEtc1Sx
	lDGtLdKGUXfyoP29x1bLoLbCrV18BCxATbKX8gnVc/RORi7/wFn8nA==
X-Google-Smtp-Source: AGHT+IE5zabgmCeNCXYOisSZwfHqqxV99as9LMzSq8Oen3EhV/ZWO9YYbZ/5MbAoZLEihhaL1Fz4kw==
X-Received: by 2002:a05:6102:442b:b0:4b9:c326:f992 with SMTP id ada2fe7eead31-4ba85f70fc1mr8480869137.20.1739202748680;
        Mon, 10 Feb 2025 07:52:28 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d7902sm1664647241.27.2025.02.10.07.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:52:28 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4bbbf49a329so237841137.2;
        Mon, 10 Feb 2025 07:52:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLJGeg+CY4LwWK+970dWukTtyDazrTSKCM0L/m5cvSMfaQ6lidRK61Nwd3fMXllIvVZtWVZNZYp+pobH56swPFaTE=@vger.kernel.org, AJvYcCWso0JjmxUELdqnhzfMilzG9E/yPiAeE8XHXKJc8GBQV8hnpp3Wmw6cmwvYOsuVJmDl/3j9pQ0n9cmQ4XuH@vger.kernel.org, AJvYcCXhYbr5LyYfIt8hg0G3X1SqACH4ceyjjwktu5ZYn9ZGAJriHDcdSfHG7wLo1DYvhRKHMtpGfqTYra0b@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:4bb:9b46:3f93 with SMTP id
 ada2fe7eead31-4bb9b4679f8mr4715145137.8.1739202748211; Mon, 10 Feb 2025
 07:52:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-13-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-13-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 16:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMaUa_+TNKzuiFXgbQG-AABETVekobE8DYf5xHwrEFcg@mail.gmail.com>
X-Gm-Features: AWEUYZkW-vmSFH_ns7VR-yte7YX_5QFDxQJ7jAHfL7OPzQAkycq4iI5H0LiX-XY
Message-ID: <CAMuHMdUMaUa_+TNKzuiFXgbQG-AABETVekobE8DYf5xHwrEFcg@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial dtsi for the RZ/T2H Soc:
>
> - gic
> - armv8-timer
> - cpg clock
> - sci0 uart
>
> also add arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi, that keeps
> all 4 CPUs enabled, for consistency with later support of -m24
> and -m04 SoC revisions, that only have 2 and 1 Cortex-A55, respectively,
> and that will use /delete-node/ to disable the missing CPUs.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/T2H SoC
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/r9a09g077-cpg.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "renesas,r9a09g077";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       extal: extal {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       loco: loco {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       cpus {

Please sort nodes without unit addresses alphabetically, by node name.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/T2H 4-core SoC
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include "r9a09g077.dtsi"

compatible = "renesas,r9a09g077m44", "renesas,r9a09g077";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

