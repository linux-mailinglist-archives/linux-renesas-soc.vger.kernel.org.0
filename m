Return-Path: <linux-renesas-soc+bounces-12473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87580A1B7C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F7F3AC177
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A0786345;
	Fri, 24 Jan 2025 14:18:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8783BB54;
	Fri, 24 Jan 2025 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728321; cv=none; b=BOFDmDG/E9x+L3MxUKH9FCBgI9MH3OWFp1BCOaslYCMNNu74hzZroh/OnW6bxCNrJhGnMVxx5KPUc0J/8XgIVDf9UjjKnWU0Jq/JRc1BIJeZkAAdjpOEStAe0Jk8RyEzX5vG/uh+Vz0fXLYmlo9Nr+eDfTmpA06ssu/Tyf91+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728321; c=relaxed/simple;
	bh=t8V8Pz2Cipz4IFEif8RW5w69lmtqTjIxsCrWo32Qv2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9og+sPoxicEtnbiYiB6/ro/StGFKDEnc+dJ7OC8P3A+5QW2xynaYCtUTAgF+DBrtR/LqnDZCFhT0KLEK7lDd6obEtHT6o/0iX0w/l5VP/ZeMWDAW6Fj0qfj1pVpfLM1cghW5hSfSQmEbeDLgfnMdr4kRlUC6Rcc/XTGPXLNPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6ef047e9bso203185785a.1;
        Fri, 24 Jan 2025 06:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728319; x=1738333119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GGrcLNH2B3qsG8Y5TMy3RPRoSgHMPCm1FIAad209F4=;
        b=gxGMUhNIXtnVqprzXZGgMtb5QLQ9er4HcGqbnvNKAAg/mPH/cPb+hWdKEDNb9dn8cU
         DTwS5xTmAzMT/Qx2CZ5gjUH3Scb3lfp3thxpDXjTnI9o6GTI4ll6NFDZfgpLi4ZUfHA4
         DBdLaXhP+yiKv0xx1trIdc4thpXb3VnY1gu9FJQtz9RG9rI7kk3Z7L5u4T8U6lNWaW5T
         HXkQFvQBLTTXL6Trdr9nMErRBT7Fib/Qyben5nTtcSngcaEGnwpMgoW/mtAinmZOMlT6
         MipujWrD1ZzdrpYx+5W+2Ni1CSFka2itLhP4LF3t98fZ4o8HRxvdayFdoQ0Ranv7Ngh0
         SKmw==
X-Forwarded-Encrypted: i=1; AJvYcCUzOLJhsj3R+PhJMefmx6B7tP6VDEId6KZ0y89Re+4ovXwzzD8QXMrjurXMNzmky0fw8AqffnJtYI2zqTlF@vger.kernel.org, AJvYcCVYGuaUaukcTk6ZjZlfR9QJZUDmoC+BdJwlERLwkfC2SdIYNPTQC3KWwAKXpPsmpTTHfOCdk8meHR+l@vger.kernel.org, AJvYcCXBb699abGGuRCUl/WnuFU/4NG84AoAUnA6vGfyREP5ADfXtLYgcaDx6cEbz810dw0sXq1xBSxU3JWphx/Rrm2STNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylZu/z7Hg88VJOFgNsHxYytJaJbT3uvBfYEEFcm/mHzJR3Lhf2
	9ccw/Se0Lzf0yuTRmBLzFpvJS27jJFI6j/6KLKnx3KQ8zbshyQU6E8+EgTI2
X-Gm-Gg: ASbGncss69g+hGOWm6hgfnIyCWLXRD1E09Ejhk/eU680jpQ0xxNQJ6rEuIjX75q/wwa
	OCQ0WZ7DPDZSXoBnASA2FYIxtZm/E01UI3WwfcUhhta+GSABBTwX5vGp0rB5ch5G+jfEUV7C6Wr
	gsevqIkhTJfQzcQRpa1dlmXsH/O8zJolSRMGlUSSNXcpo5QFql7sTpfR4rpq+tX3Idq5JLbvp+y
	W3IPPQxUtcQGofBUowCJWheelpKEhnQg82Pj4LlJTswcwoQv2TQ92tUARQ1UGs4bgDvsh674D90
	3wPGiJrrsEf5Y1DIoDuhrk0FQ3LBNbANrAA0XlhAO9b1Vp0=
X-Google-Smtp-Source: AGHT+IGasnemI1yGwFKTFFQDSO/a171YCjlHHMzuG1LmzNQaDHfd7jM759V7lmP5zqzo3SpWeTMPCw==
X-Received: by 2002:a05:620a:3192:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7be931afc79mr1236197485a.11.1737728318647;
        Fri, 24 Jan 2025 06:18:38 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae7dcc3sm97323685a.22.2025.01.24.06.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:18:38 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467a1d43821so31840781cf.1;
        Fri, 24 Jan 2025 06:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR4xzqfnB1r2dFswxTk8zuk1CuF51hP2jrAPfmtAaroBvKMGCeBTnuy/4h4q7srP5lVryS1nZCmY2Gbow3ea0ZT4s=@vger.kernel.org, AJvYcCVH8fYz3srYTV7JE4h6QGVSBa57lRI7J44dHwsEcyYN0/aLW59N6XmnUHs2XSWFROYx9+xkfYMFWMG4ySaq@vger.kernel.org, AJvYcCWmKQorX8NtEnXEOHXul39kZjPaFmDuVP1RnyEXCsKHz1fu+pyVVw7cchi9FusAAwViD/6F1UI78Mdo@vger.kernel.org
X-Received: by 2002:a05:622a:6107:b0:46b:1c07:12c5 with SMTP id
 d75a77b69052e-46e670ac0c5mr56452241cf.17.1737728318009; Fri, 24 Jan 2025
 06:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:18:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWECrWeBkUK6FpT_teJWmE-ifyHiv82OrNU31N9C36VHg@mail.gmail.com>
X-Gm-Features: AWEUYZnjoEpyZ_nCPcjWvzMv5owHotMiS4zBAIaUiYkLJG3e5W_LAIrgLFRBJeM
Message-ID: <CAMuHMdWECrWeBkUK6FpT_teJWmE-ifyHiv82OrNU31N9C36VHg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] soc: renesas: rz-sysc: Move RZ/G3S SoC detection
 to the SYSC driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Now that we have SoC detection in the RZ SYSC driver, move the RZ/G3S SoC
> detection to it. The SYSC provides SoC ID in its own registers.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3S System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/init.h>
> +
> +#include "rz-sysc.h"
> +
> +#define SYS_LSI_DEVID          0xa04
> +#define SYS_LSI_DEVID_REV      GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC GENMASK(27, 0)
> +#define SYS_MAX_REG            0xe20

Unused.

> +

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

