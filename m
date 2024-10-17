Return-Path: <linux-renesas-soc+bounces-9827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FE9A2220
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 14:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE423B25366
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 12:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D2A1DCB3F;
	Thu, 17 Oct 2024 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLLqppYJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643961DA0E3;
	Thu, 17 Oct 2024 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167736; cv=none; b=SDMzDwXiqSq77Es8DTUMECfHoV9HRr1RJOo07A6f5vRHHV9f1n52KRMr719mAEHzJIu76gI7dgeazwWbFWnxQE1lQPhklXbNjY6abEVwQi6gP3wRd9zn4Ct83FILP6gSxIXrN9lyjx9j1WS3wbpnnnl0SICvAdrWSj0hCoskjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167736; c=relaxed/simple;
	bh=vrUFbMC3z5MCMTTxxHNZMsBU1wNMvowtG2Ijv0C2hLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWJFila2yORQL4a7ajP2+kiD7e32TtCbb/G3MeMh2DxneCHXXWUIWs5KwRobzRW1ZtPAuegnX6bPS6a/hSYeEp2hgmjmCKvoUdSsilmhhT5WdtO36pFghgBCmt1iMD0Jin+EELf49NM74XsBzmOqdE3IEzXqXZOT8skKBfberC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLLqppYJ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-50d4a6ef70aso312932e0c.3;
        Thu, 17 Oct 2024 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729167732; x=1729772532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xij87LKX+Nlu3IEGLAYU+Sy+Vc3xK5ztqxOSAfKKhBs=;
        b=OLLqppYJxmkrkEM6qr7pgBmNulo4B4U/DHJBRBZfSl9kuBqIJz90ZCuIomfUIcrGn6
         XQRw63mddYLWLJtb77VP7Gic8W4k6rSzNxpoJfDPZN4ewNYuLuwpJhZa6StSScO4szys
         FH1wwa0CTHbe0kt8QCEtSXHqR5P6glDuBO4s9mi7/8oQq6XFJAioQlyGryC7dydT9/xz
         +DVN4TiQfwjpnly0xf49M3D0NaLXq0q3AV3WTuiJFL9EPGkOqJNcBsrCjkVqOjP57yr2
         8qjyi3jt9H2yezcrgYt4nN3RDuJMLDr1RvVPj7NQj4aPo7r22gKjiJqP9xn8al+D3Qym
         +kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729167732; x=1729772532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xij87LKX+Nlu3IEGLAYU+Sy+Vc3xK5ztqxOSAfKKhBs=;
        b=Shj7O6Wta//wt4QPwGvhMi0M+JOxL6JzREuCKzbc+jzPUvbRwwTX4/5UrNidZhEmXM
         D+Fmq0iOZOJ4yQqm3+WU6vAi5gErXb8ahsAzqm075guEXfdBi7csibo+95j7Z9YPDG9U
         fE/MYUxOkMiNXDGINlHHhP+pYyQ6ac1f0Z11Na4ZKXpzgCEGn+4FGVNlcHTWnB5fb8/9
         CAkdp0wbrBM9upDbuwBeBrqCaGz++aUXik1RNw35rx8mcgy0atbNXgk7exg4valaUsQ7
         lFq90aTGw9UFK985ZSwQb2PXth7JD8aDU9VTZOz0Ch48FV2QeUNADlweD7VsCm7zuT7f
         GDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlmPNBVGV+67AgL6vUyD3q0nubwvcUZPIVMtfEKbzSYGcJp9ALzGmzUDw1RTAi/3fLjnBV8ndv8bNEXnA/7f67+Ps=@vger.kernel.org, AJvYcCXSV3cX7rgzefdHmWuEFXLjpe4veAHAyn5fe+3tM59Fn4PMcWWmDXggTe0ClyxdpUwbAg39zneTK3YUsYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1CCb5xH6JfLmuhecDCvLvkM8lJuLhvVh8s9YuqGkQepOrf/6
	Jb2/T0AuKVM9Xwl7hhZfGm1Wzc9qq++D8jbChNRBEZ5var3CNSu1Er2cWwiVge2FuuNC63tEv2z
	2p4x3YJzmsKI2O15fj0ySeYr3etxMLjNvcOs=
X-Google-Smtp-Source: AGHT+IHz0Jc/pt/PjMyrtgxu69/Z3sfXFnrSDaJoXLMpXJTpl2ZljpnpXIgfBoYQ9HgB3jysjEMyVSu7rmpTHqeAo3M=
X-Received: by 2002:a05:6122:291a:b0:50a:b604:2bb2 with SMTP id
 71dfb90a1353d-50d37742226mr10725752e0c.11.1729167732210; Thu, 17 Oct 2024
 05:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Oct 2024 13:21:46 +0100
Message-ID: <CA+V-a8tfBftutbXCuAjTXJ3H65enOENtSdTWXATfa1VZN+LTfA@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Markus Elfring <elfring@users.sourceforge.net>, 
	Markus Elfring <Markus.Elfring@web.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Marc Zyngier <maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 6:20=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> rzg2l_irqc_common_init calls of_find_device_by_node, but the
> corresponding put_device call is missing.
> This also gets reported by make coccicheck.
>
> Make use of the cleanup interfaces from cleanup.h to call into
> __free_put_device (which in turn calls into put_device) when
> leaving function rzg2l_irqc_common_init and variable "dev" goes
> out of scope.
>
> Mind that we don't want to "put" "dev" when rzg2l_irqc_common_init
> completes successfully, therefore assign NULL to "dev" to prevent
> __free_put_device from calling into put_device within the successful
> path.
>
> "make coccicheck" will still complain about missing put_device calls,
> but those are false positives now.
>
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller drive=
r")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>
> v3->v4:
>  * switched to using the cleanup interfaces as an alternative to using
>    goto chains
>
>  drivers/irqchip/irq-renesas-rzg2l.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 693ff285ca2c..99e27e01b0b1 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> @@ -530,12 +531,12 @@ static int rzg2l_irqc_parse_interrupts(struct rzg2l=
_irqc_priv *priv,
>  static int rzg2l_irqc_common_init(struct device_node *node, struct devic=
e_node *parent,
>                                   const struct irq_chip *irq_chip)
>  {
> +       struct platform_device *pdev =3D of_find_device_by_node(node);
> +       struct device *dev __free(put_device) =3D pdev ? &pdev->dev : NUL=
L;
>         struct irq_domain *irq_domain, *parent_domain;
> -       struct platform_device *pdev;
>         struct reset_control *resetn;
>         int ret;
>
> -       pdev =3D of_find_device_by_node(node);
>         if (!pdev)
>                 return -ENODEV;
>
> @@ -591,6 +592,17 @@ static int rzg2l_irqc_common_init(struct device_node=
 *node, struct device_node *
>
>         register_syscore_ops(&rzg2l_irqc_syscore_ops);
>
> +       /*
> +        * Prevent the cleanup function from invoking put_device by assig=
ning
> +        * NULL to dev.
> +        *
> +        * make coccicheck will complain about missing put_device calls, =
but
> +        * those are false positives, as dev will be automatically "put" =
via
> +        * __free_put_device on the failing path.
> +        * On the successful path we don't actually want to "put" dev.
> +        */
> +       dev =3D NULL;
> +
>         return 0;
>
>  pm_put:
> --
> 2.34.1
>
>

