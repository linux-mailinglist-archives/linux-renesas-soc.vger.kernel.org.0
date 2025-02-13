Return-Path: <linux-renesas-soc+bounces-13110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D3A33B6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 10:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFB116699C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436FD20D4EE;
	Thu, 13 Feb 2025 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW+zx3Cn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249920E000;
	Thu, 13 Feb 2025 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439692; cv=none; b=hGB9mN/c11FRon19mC1fFrDvqGtSOKDzAPwXLOucS8+aKATfNMboUSh5V2LFG2KddDXi+mhH07z3mrQSE02DMaYd3KfHERgnb88POVz2EvWjo3rJoY76TH0TGwdTHtsKj0iokiyshkeiut/jzdBbVj78qa2JP8YAFwblqDJ2q7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439692; c=relaxed/simple;
	bh=uFhapaUQfkxoA7dAZqiBdPzVXHQAqj/uXlnLguurdXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjMWM8EfivRCkQ2hyXxcu3yZTqASV2vh75hgjia2D2IQ4ICz2+tM22FIDfJKYvyASoqqLd8sDpSibQSbboDplzOA3+4cEkvQpyqbxID8pUkzscaMj1/+XdnKPomlTWVMfH7HqMFDVdZaPOwA1T65Vts75npPSC2vLUWYtKdtRrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW+zx3Cn; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5205539e38cso153005e0c.0;
        Thu, 13 Feb 2025 01:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439689; x=1740044489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37ciusaJ+8RMFR5h5MX5uauDdXI2VmQzbf/ScIuHlpo=;
        b=gW+zx3CnNvQbVhL8AVPQre/JN7ei54UQXoF01KkMcMXGf0HovlmBwe9yOqLamxDw3c
         DkMoFGdDXOO9qFvGxVVrfRzIcqWuqoIhM8vRAsC8f1SAdiVrsVyHVRi6/nxMw/kO8YIV
         IInWxJVRgHxyxnrqmLfFsX7rmCjDrD/hkTGXbkwYDEWiT7dM8Dm737qP0KiDd1CorLF7
         pir0WC9UCz8qKSBtWnZaCr/DSsrXd72o6Ag1gg29U6weci7hA1TohrHWbeX/oQEkSEbC
         2Wi2Xj6V1UD0zeOCKqVnIL2Nfg2H70ps/nkEc33RFYrs48YrbO9GBsM0XpDDmxpZooVD
         MzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439689; x=1740044489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37ciusaJ+8RMFR5h5MX5uauDdXI2VmQzbf/ScIuHlpo=;
        b=qQFa4PuyBrQPXc34QgUSoks55T9cQC0o1LeYCefzTPBzRVHZCNmGj5cVBfLpQ7VLDp
         uls/ZlCVQEK8BtNWWODc6eLJVFUF7NhkYJnVMRA8x1cVPX18KG8+1VpPtibxeRQtE7Cw
         2O2ffZIua1ZyXO/biM2IKORutvWSbme35mCI3fHXxNfVrwLjJ7O8NNFLkGSZPf1xtpv2
         aaVoiRF4/5GWIf6rFtS5Yf7QAU1q2r9CfU6KVhhtfedTXn9aIHZIPrYqqH6j8g1LaCZ+
         C6r4egvkwyzKv3DW0oJqc46c5RyCyhpBZnpH3kcgrETalJNI3TDWWBOo4Jj7u1NWkLFe
         O+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI5yKJkJvYtTkyS6Yze6d3loqmo94xaUPmYed/FqWbdPflv0Ctskh1wCyEcC+b0vlv5EU16fnSKUf6vrE=@vger.kernel.org, AJvYcCXuGTFs1F0pcpvQ43CscdLa+3X6wZoapdDbr1shuSYCLHaGghW2J3r9Muo7t3Ec3fSYjprdfxsrcRtqXOZuG3hoJpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtg0OSVu4RsQesxt55vX0KSVxDysyte+tGJII0/nXxVfHx1bMU
	y3pdO+YhuFwxTLaunMqzLmAIqjlqTO6XgPSLmRSPOEJ3SclW9plF4+gwXpHp8KBqiURiZLdL4YN
	Ejw4HkwwobGCXfZlKKfRyu3sBhfc=
X-Gm-Gg: ASbGncvpT5AxSpRJ20J5573dVOUKFgTXMFUe19iPP39wL45YKTcguGr99DR0BpArKrN
	6cubUzZVtlOtz1HjdcG4migLO8ocBHgxUXIR/E06ONQFhmsCA9biDMr6yZWGO9AGKo1Ndli8/Ly
	OC74bHam4zsD+RCEgQ1B5qlyU4fVKFQA==
X-Google-Smtp-Source: AGHT+IEI4YtFBpNRLZFtF4xIZ/+cFLLhKtBQuSrv9pOnQoFq5seU3++mSfAibMAmYyi0UTdE6jsQWRjNBQm/hULjJCQ=
X-Received: by 2002:a05:6122:2186:b0:518:791a:3462 with SMTP id
 71dfb90a1353d-52069dd8b0bmr5611151e0c.9.1739439689320; Thu, 13 Feb 2025
 01:41:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com> <20250212182034.366167-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250212182034.366167-5-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Feb 2025 09:41:03 +0000
X-Gm-Features: AWEUYZnRRp0wvLZswZuXrKA-4zGh3tK3gjZ8eSbAGkGxKSEvw3LLx4lrIJcYVdc
Message-ID: <CA+V-a8vV1omcm3ASq00KQVPj8Aj06fczmYqkUDu2Dte1YbVsuQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzg2l: Remove pm_put label
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 6:22=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> No need to keep label `pm_put`, as it's only used once.
> Call pm_runtime_put() directly from the error path.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index c024023a1832..0f325ceb0f53 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -586,9 +586,9 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>                                               node, &rzg2l_irqc_domain_op=
s,
>                                               rzg2l_irqc_data);
>         if (!irq_domain) {
> +               pm_runtime_put(dev);
>                 dev_err(dev, "failed to add irq domain\n");
> -               ret =3D -ENOMEM;
> -               goto pm_put;
> +               return -ENOMEM;
>         }
>
>         register_syscore_ops(&rzg2l_irqc_syscore_ops);
> @@ -605,11 +605,6 @@ static int rzg2l_irqc_common_init(struct device_node=
 *node, struct device_node *
>         dev =3D NULL;
>
>         return 0;
> -
> -pm_put:
> -       pm_runtime_put(dev);
> -
> -       return ret;
>  }
>
>  static int __init rzg2l_irqc_init(struct device_node *node,
> --
> 2.34.1
>
>

