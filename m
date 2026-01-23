Return-Path: <linux-renesas-soc+bounces-27318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA1nJyRSc2kDuwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 11:49:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F5B7493B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 11:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33C83303CE1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 10:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2206E310630;
	Fri, 23 Jan 2026 10:45:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F9263C8C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769165135; cv=none; b=Eb1o8AuAexMhllt8RF4zNEqRPgKZ4tkJVHVHnuKAxRdd3x+zrMca6JHJ4Ih+zXIO04xCluX3EiRq0O0zjXZntWnPjBV0p6U+0ljQGb3OuK7odYmG6P2yWmEwXaLkkJ3E823T4Toj4nSaoH1WZ9+m8Zf8gY5HKAf7Xn2TJvazFY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769165135; c=relaxed/simple;
	bh=U/RnWZxIOYjC4icaCufBf5Jgz7l487bsxNb5goW1DzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJFYvKgkby8wKlq/DaB7SdIB2YMhFg9I7T08s6iKQf2Yypfaup5bNfB1uNUy54b8dbtxM/POqW/VVLGxaXf+LhoLyGxQ15yuNpPjrhQgCsN6YwsfGigVAiILHpoxAREGAR8Udg7kSkZ0lXRqsUVUahBx20T6JdRm7Uitaq1QXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5637b96211aso2197226e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 02:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769165132; x=1769769932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZH6GDa0IR7vPjNTu/YZUzV4OD1KMENL8iFhJrWXtT0=;
        b=SU5HfFQaJsjs8m1fTQXy1ht8GAmT7sYzL3eZp4SuhDj6cRxlrFcDzJixSV39aUID4q
         oFHdpXTtWR48OkTp9McfJqqq8T8hJxK7eP9ZxZXr/G1HfWWNyvQStJzQMh2MsIPH2bmI
         RBLn4Cg7sNXvlricpBTp7zH/YWc4GpOdWnSMPQEWdVZL12UnUdjLyJCVoQlHDsjC+Yhe
         dt5fKBE/FR/YEFJCz3nClrtpKdsd2y5F7aVhpHA3LN8lgKIPVruAoKXW6DaSnHC1sH9j
         WO8jop2UXdyaLFJ1IUJpdp28rtQXcHxfH/LLVLtD8jUkNczVOwWs7ZWx83cJsI1ghQjx
         o6zg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Cb+96PfSqlYN0YN11uxUKvzwvBkAcu60Szasw7Hzz4WAJVbJcwWUpcI23LGoazXKKTaMCLXGfrDuEvwmwgcPug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwESk1LU9G3uS4YqwBQM2VYVUv3yfTF/6RE10HEtqRnpfM+wI/c
	yFfGs1pdq1mQ4LuXu7vyme+cgu3N+WPDQ6tRD5fTENNzu2ZuTasgP2F4+0O4rpMN
X-Gm-Gg: AZuq6aJAyLrJQkQm2I/t2G2CdIWTLGicbPNmhPPRT6NBrF+RRuRfAnoNDmIHN/zYW3h
	pJYzyYDXOzyPPYpZDtgpJrUynAEMtOq5eXV2Xt64x8ergzyIkg1ebLzv43vTnSoSfWDcOzwQw+6
	3F+fzPgzgZ9G7nxQaJHBgaUEHd18WVxglMxrxih7YKRKtzhLkhyVHtosKHN5+qpLA5egRCItMZi
	v7DMjjUJuzrlAfHBg4QwIijSF29Ef9t1wbbXrcEDzHihUECnVw3SWc2REjogyGwv59CDXbAH80R
	O060jpnuZy4A3TJNaIlXImgrzauxxYOIggVT5gK7u21o9qGXeeZSU3O6AD9ROHwDFWN1AhZxFtx
	Ga4KQnJ9V3FVXDkO4odH/662hIjyAXeWQLR5d4fmGp9L7ABc7WRk0ZpBwRUqvd43DuX/6uRfCq3
	VXeXf9u/UhcyznC0Awt117nve9AZDlVfFo2VshMHNeeC92DD+W
X-Received: by 2002:a05:6122:e46a:b0:563:7816:ed17 with SMTP id 71dfb90a1353d-5663ea74e7bmr870432e0c.1.1769165132326;
        Fri, 23 Jan 2026 02:45:32 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa7d527sm450557e0c.7.2026.01.23.02.45.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 02:45:31 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94130b88642so1883306241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 02:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnPKnPfmcxU9opv0nCyRTuBT9fwsBaDjTR2tpBrl5/jZLm3qO12NtxRgwTBYhP1nCh+M5yzCuByWI5jiDaDfCz2w==@vger.kernel.org
X-Received: by 2002:a05:6102:5123:b0:5ef:b0d3:295f with SMTP id
 ada2fe7eead31-5f54b9db4cemr926463137.8.1769165130815; Fri, 23 Jan 2026
 02:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 11:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVmh7tG0D8az6E9tWE8iHhxvrw56o-u5DR53Rpcoh45qg@mail.gmail.com>
X-Gm-Features: AZwV_QiSMumhptKY_EHJCpU3rYa-mBb0IjvP9nq8-iLINTo6u4GRiy0X3X7lSLk
Message-ID: <CAMuHMdVmh7tG0D8az6E9tWE8iHhxvrw56o-u5DR53Rpcoh45qg@mail.gmail.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-27318-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 43F5B7493B
X-Rspamd-Action: no action

Hi Prabhakar,

On Wed, 21 Jan 2026 at 16:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)
> that allows software to explicitly assert interrupts toward individual
> CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> interrupt.
>
> Introduce a debug mechanism to trigger software interrupts on individual
> Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> explicitly enabled.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -11,16 +11,23 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
> +#include <linux/cpu.h>
> +#include <linux/debugfs.h>
>  #include <linux/err.h>
> +#include <linux/fs.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/irq-renesas-rzv2h.h>
>  #include <linux/irqdomain.h>
> +#include <linux/kconfig.h>
> +#include <linux/kstrtox.h>
> +#include <linux/moduleparam.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>  #include <linux/syscore_ops.h>
> +#include <linux/uaccess.h>
>

[...]

> +static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)
> +{
> +       static const u8 swint_idx[ICU_SWINT_NUM] =3D { 0, 1, 2, 3 };
> +       static const char * const rzv2h_swint_names[] =3D {
> +               "int-ca55-0", "int-ca55-1",
> +               "int-ca55-2", "int-ca55-3",
> +       };
> +       struct device *dev =3D &pdev->dev;
> +       struct dentry *dentry;
> +       struct dentry *dir;
> +       unsigned int i;
> +       int icu_irq;
> +       int ret;
> +
> +       if (!IS_ENABLED(CONFIG_DEBUG_FS) || !enable_icu_debug)
> +               return 0;
> +
> +       dev_info(dev, "RZ/V2H ICU debug interrupts enabled\n");
> +
> +       for (i =3D 0; i < ICU_SWINT_NUM; i++) {
> +               icu_irq =3D platform_get_irq_byname(pdev, rzv2h_swint_nam=
es[i]);
> +               if (icu_irq < 0)
> +                       return dev_err_probe(dev, icu_irq,
> +                                            "Failed to get %s IRQ\n", rz=
v2h_swint_names[i]);
> +               ret =3D devm_request_irq(dev, icu_irq, rzv2h_icu_swint_ir=
q, 0, dev_name(dev),
> +                                      (void *)&swint_idx[i]);

drivers/irqchip/irq-renesas-rzv2h.c:730:23: error: implicit
declaration of function =E2=80=98devm_request_irq=E2=80=99; did you mean
=E2=80=98can_request_irq=E2=80=99? [-Werror=3Dimplicit-function-declaration=
]

How does this build for you, without including <linux/interrupt.h>?

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

