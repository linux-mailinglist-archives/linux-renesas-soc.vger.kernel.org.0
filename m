Return-Path: <linux-renesas-soc+bounces-12474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C016A1B7CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D81C31882C81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8244978F5A;
	Fri, 24 Jan 2025 14:20:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAD35969;
	Fri, 24 Jan 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728443; cv=none; b=Z4siXCHBJVbGLznEpHw51/wPXe9cqlN/hWN9kYWai6rG2348Nct/eH/JTTG3ftqqHG9fN5+M8GOdzC4BfSxI7ETAnJj8lC5up/N0hnl89oTjn5WuZalPk3o64MxaOvbbjik7XUPvIUvF6+pFwRkM3UBnHVMH4KJS+sznq77Sasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728443; c=relaxed/simple;
	bh=1GJYPbXOZ+5k1IviaCO9BWLObO1dV26vnoQ9Tog7eeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdiTmPgnuNanOpPrfb9wSx/Weuo6s0IAxf3bs1MU17ndZ4jlNDAJZablW44kTVqOPjZiiHIzRE6VTBgnPXkZgm2LN2eQp0BJzWCY+IwnWWjBb2xQqx73hlJEpiU+T1zl/CcP2cj4ESpdOnp7ZdyBND/U3TE8iSGu2dmnPUI1v+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso443938241.2;
        Fri, 24 Jan 2025 06:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728439; x=1738333239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42y5dZCgeT/edoin6krPWNEO7pqim//OCoWHfGWxTks=;
        b=ZHzCTnE2t4IGyS1AayoWaLYGnkwbUYcxhZiliaA0KQtF8XpwJWCK198pTO5LJykjiZ
         phkVDQo3E8ezsUfBlFG1WQXHDcVNn8FzEO7xEKsF0d+vwoOU9jGwVQaAmb4kMx7AlenS
         cUdbE1PQgXM789t1+FoTJ5Ej2FMGwRHFXXAdNwoslQUrwC+ehAAAETGTK1D68kEbtO7j
         U2ID4exM0tH1voCxrAVv1R7cmHkhw0/hnGS9fa0BDbrXdSh2qU+OTQN5KNnu9oSLkvYu
         /P7rBRneDcLhylp3QLGbDDssMT4DBQBQ4Men1KypEoNy/xgX53C9qhnkk8qaT++UxGCj
         xoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUqDYDOeQMqszpovhJyUWipDeOga4xRS1cRcbUbhTeP6FeMzIoILi4cCymxXHG1H9sY59VpZV+U9NprPZX@vger.kernel.org, AJvYcCVfjVeh0O6bixTpdRtVK0gs+eRBwTTh1LW1tH/arvlsuJ6JCpNRyPSoJZYDNqQrWgZHvR2EVjvuVnop@vger.kernel.org, AJvYcCVmjsdHGPxTVkvmkwMv3N0xYzNyjgUclBRR9TdIhdhaSkyXEsHE994bpfA144ukE3s5dgQTYcgkhBX3VSw+RtqC814=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOy4aFX9VJTO/12PqyVK56+JxYsXNxwspdtbZnNmKfRweBOP8
	QjKHh1EnxJM+fS7GEVtVhI8N/cpLR8XTOKOAtuyAe13/iXn7++WtMEso6o+9
X-Gm-Gg: ASbGncuNiA7J9CpGKWPscBbBi5udFh6YohJwTRzRnTn3isg+Or4QZdkSa/pakNXfUNr
	0dyfG20JxDCKDvFDwYZc0WboufGLsUQIhGZQQxfiN4cEYNyEJnYJZEyoHIolWpIR4omEv2jJa1a
	Wr/WikSqrvjOX0frHyrC1og1K0xUai/wr+D6nL0w69SYv5GpcppXkz6RFLT/QV3mbaoww2TGqr8
	tJ5DgdZsD9RLw17y/0sfBxqSNNW5A1NVZvKyw9qcIwuTUdUiDm+KfUT4C1RCAi/hQRq3wEBxCiV
	QBa+rzAzO2F/wPE2CQYLtUhBICMg3k7i6dAXrgvAMWc=
X-Google-Smtp-Source: AGHT+IGW9N3i4M9e56/gb0p57kHbjUbMlPuQRPRMtbofpSkvXnndh/3oK6QUE9EubJG/pnmR31lHSA==
X-Received: by 2002:a05:6102:3e0a:b0:4b2:73f7:5adf with SMTP id ada2fe7eead31-4b690be5b36mr27619277137.9.1737728438829;
        Fri, 24 Jan 2025 06:20:38 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm418567241.23.2025.01.24.06.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:20:38 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4aff5b3845eso746816137.2;
        Fri, 24 Jan 2025 06:20:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGxlAjPWqQ3xMgXvGURyf7+E81Zm8y294UloeDHaVJ/xUnjOOUJuyr5/R5i3tNTcNmfx2V69McsRz4@vger.kernel.org, AJvYcCUmaygbnr4irp4PQRizvDAstUKW+qras4BPXOpgOaOAtSAPeWgJSJo4wJyTmOCeTrJT7Ich6NRN2QRNDUWu@vger.kernel.org, AJvYcCWy9t+Dug8aIt4EDeAen0N+qP2DC53IsKjaHlTp6B1JsqtYm2JBm9hM5Yk/tovIrgNatDrZFkVMjgbgUBGEzwGYUnA=@vger.kernel.org
X-Received: by 2002:a05:6102:3bd7:b0:4b2:5d10:29db with SMTP id
 ada2fe7eead31-4b690bc6357mr20783079137.7.1737728438351; Fri, 24 Jan 2025
 06:20:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:20:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHuwdYfm_b9uO8LjmJpAwyRrBTJbeoz5FOyEcYSJqL9A@mail.gmail.com>
X-Gm-Features: AWEUYZl9UtJCYmpF4jhja_MRuYjCzskd9nohPWtQWEgfPLmFMn6RM67s1udBKjg
Message-ID: <CAMuHMdWHuwdYfm_b9uO8LjmJpAwyRrBTJbeoz5FOyEcYSJqL9A@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] soc: renesas: rz-sysc: Add support for RZ/G3E family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, krzk+dt@kernel.org, robh@kernel.org, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting
> the number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW
> settings other than 1.7GHz.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> v3 -> v4: No changes
>
> Changes in v3:
> - Removed Syscon support
>
> Changes in v2:
> - Group bitfields ordered by registers
> - Rename SoC-specific callback field to 'print_id'
> - Explicitely select 'MFD_SYSCON' config option
> - Do not rely on 'syscon'-compatible probing anymore.

Thanks for the update!

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g047-sys.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3E System controller (SYS) driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +#include "rz-sysc.h"
> +
> +/* Register Offsets */
> +#define SYS_LSI_MODE           0x300
> +/*
> + * BOOTPLLCA[1:0]
> + *         [0,0] =3D> 1.1GHZ
> + *         [0,1] =3D> 1.5GHZ
> + *         [1,0] =3D> 1.6GHZ
> + *         [1,1] =3D> 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHZ       0x3

Please add a blank line here.

> +#define SYS_LSI_DEVID          0x304
> +#define SYS_LSI_DEVID_REV      GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC GENMASK(27, 0)

Please align the second column in the three lines above.
Please add a blank line here.

> +#define SYS_LSI_PRR                    0x308
> +#define SYS_LSI_PRR_CA55_DIS           BIT(8)
> +#define SYS_LSI_PRR_NPU_DIS            BIT(1)
> +
> +
> +static void rzg3e_sys_print_id(struct device *dev,
> +                               void __iomem *sysc_base,
> +                               struct soc_device_attribute *soc_dev_attr=
)
> +{
> +       bool is_quad_core, npu_enabled;
> +       u32 prr_val, mode_val;
> +
> +       prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> +       mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> +
> +       /* Check CPU and NPU configuration */
> +       is_quad_core =3D !(prr_val & SYS_LSI_PRR_CA55_DIS);
> +       npu_enabled =3D !(prr_val & SYS_LSI_PRR_NPU_DIS);
> +
> +       dev_info(dev, "Detected Renesas %s Core %s %s Rev %s%s\n",
> +                is_quad_core ? "Quad" : "Dual",
> +                soc_dev_attr->family,

Fits on a single line.

> +                soc_dev_attr->soc_id,
> +                soc_dev_attr->revision,

Likewise.

> +                npu_enabled ? " with Ethos-U55" : "");
> +
> +       /* Check CA55 PLL configuration */
> +       if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) !=3D SYS_L=
SI_MODE_CA55_1_7GHZ)
> +               dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
> +}

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

