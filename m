Return-Path: <linux-renesas-soc+bounces-13111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BEA33B72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 10:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034CF1889767
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 09:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9354A20DD7A;
	Thu, 13 Feb 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSZo7KJD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E220DD66;
	Thu, 13 Feb 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439757; cv=none; b=OgmsGzQkylfhRlSsxB+jHn+YJTWIpZw6UOVOHLXBq1C4Y72Cd20ftzgdyZFIRTiBO7e4+27tT64LYHsM/ZPRigYrRRPTAk+aVOLJhlA2IUeaMNYzsl62r5E+i0Az75NSw/lkzfcHYkGfLH3OGOIy8v/PRBEd7LD/EU+Vtg72s50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439757; c=relaxed/simple;
	bh=70gkQr9mCvqXr0TdSF3NCcQppe8lqEfX0r1vSf/fPMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fipvf3uTRBVyfzsqTtY3hF0cJOf99oUhH3mthRMr/1yOmKfC/QxtJDUqFig/tVzBcK+UvnDhqvRB1FpxIb3VDnC6Ov9lm2LRQoo18exFveBqnOesGvmB/txnua3ska2jFgHGqnxQhWlW86ABPyk9G7+O90aWeZ00u3TVg5SLLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSZo7KJD; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5203017d0c2so174429e0c.0;
        Thu, 13 Feb 2025 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439755; x=1740044555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1YyDULLTEPTdFlHI8lfrun5xA13sZM7yRo40OzkefY=;
        b=iSZo7KJDb0lNTadywIlijPqkCWuNyZFRlweQCz+G1+/axwqcaMwHmuGSITmMU+LLZB
         swYK4DbIbRsFIlUTQHAhjdRTd4c3jeDxQzkGm1ym0WxL8oNixgNL+jgezMSJ8AI9PEGR
         ZIX1hxoVoprw+g3ApslECNjWQkvzeSrOFWLkJbwINOb8IN4oReR+D6rzInnpKHduq7BB
         XbdoC+bTbX87RF1/yXNK/vQtxrDg2qal9ztuwxssUyDPyaS3YDwdGJedna+OEpPx8B3s
         gFt1UQPFyMtqDFgup3t3yhaYdD8LX6p/pEcLRpW8HvAjLQLurYv64nhnKg8ClKMUQnkg
         35OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439755; x=1740044555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1YyDULLTEPTdFlHI8lfrun5xA13sZM7yRo40OzkefY=;
        b=vRuzHHxuSZBKYrFy+Z0F0r1ijSgEJdLZ0FRwP2HwHImzlAKX49gQk7sPJ4W2sqlrdG
         +pgRuna8QbDnccy+I7OSn2e6wiE6TlFDSi2otscnsvnPoELkGpqUCpNW+iHd1zNqu6XU
         dssl1NQbiMdGwWgAShmDcuIAyerW8v5Mr29hHzqynT6cdVOtxaX+wRH3/KKaAjUdjH8h
         4Ki0a29XAE/+ZIrhEs3mrQhGMPODkw+FTsk8xJ93e78Tq8xy6wSOArMdTKlR+H629AUl
         AqdiBQE+4T8W5yBXursuuFQ30q9GaEHlkCoC93CUcTjUVC/6FF/DdKeEORtW1ggIPXuo
         T/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVjA0prAEtsSjt3eq+pxvVCjN0p+hNKGlw/2BhhwpUlmVPvkOxumZAdsNEdNTEwZguu73Hlo3NIzmO6AIO04gDrxBY=@vger.kernel.org, AJvYcCXLRdnAOQYh9duhbxIMbL9QSS3HXuUnQuXUvV/VEL7pVCEmYEGB/aqpc6fX04/6ey3nMConW6Ahl9K3Xes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOIBc8qyOpeDHfbAle9TTebGFbrHZQPj4iH+hneQKvpAr4hCK
	RBl9ZN1ki64AojqPnRRu8+e7nnyAIu3ScdiSohC1M8WfRtNRq0Yj6/BhqE1TOtGoeRpFgpQm92q
	N3gTwZgQjRZGnMco4xnCFBJ3+uZTf+Ro+YYU=
X-Gm-Gg: ASbGncvTV99qlibs3JX9OLKQev0eM8ftfqsfZNqYYjxHm4/OxruPihz6vdB/uZsLtwv
	IveQGIw0gnxNPFPZVzgmwaowFGgFAXneRu/c33ZXQcYTziRtZK5rJaxaqpZPEVxOK1zK4tNDGTZ
	i/NZbXyj574PpEtjV+QV/FkZRMW852Vg==
X-Google-Smtp-Source: AGHT+IEChG8sXYcIQqj2usbpsG4q0s8UBsXKceAbItyOQSQWW0z2C6bUOT588MpnzVzYu9bX+shlxDtn8ipPLgQYPqM=
X-Received: by 2002:a05:6122:829a:b0:51f:4139:c30f with SMTP id
 71dfb90a1353d-52067d8d86amr6232850e0c.11.1739439754767; Thu, 13 Feb 2025
 01:42:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com> <20250212182034.366167-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250212182034.366167-6-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Feb 2025 09:42:08 +0000
X-Gm-Features: AWEUYZkfNEgXoUsAgysmkvxGMd07VBSU21-11x6Me-0ju-Oj2xs9j3Jh5zp2-BQ
Message-ID: <CA+V-a8vpODYVyu+UM-HH5XF-4p7r_2HpnkWij_ArbJ7GPX=D0w@mail.gmail.com>
Subject: Re: [PATCH 5/6] irqchip/renesas-rzg2l: Switch to using dev_err_probe()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 6:33=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Make use of dev_err_probe() to simplify rzg2l_irqc_common_init().
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 34 ++++++++++-------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 0f325ceb0f53..0e79deccda6d 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -541,10 +541,8 @@ static int rzg2l_irqc_common_init(struct device_node=
 *node, struct device_node *
>                 return -ENODEV;
>
>         parent_domain =3D irq_find_host(parent);
> -       if (!parent_domain) {
> -               dev_err(dev, "cannot find parent domain\n");
> -               return -ENODEV;
> -       }
> +       if (!parent_domain)
> +               return dev_err_probe(dev, -ENODEV, "cannot find parent do=
main\n");
>
>         rzg2l_irqc_data =3D devm_kzalloc(dev, sizeof(*rzg2l_irqc_data), G=
FP_KERNEL);
>         if (!rzg2l_irqc_data)
> @@ -557,28 +555,21 @@ static int rzg2l_irqc_common_init(struct device_nod=
e *node, struct device_node *
>                 return PTR_ERR(rzg2l_irqc_data->base);
>
>         ret =3D rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
> -       if (ret) {
> -               dev_err(dev, "cannot parse interrupts: %d\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "cannot parse interrupts: =
%d\n", ret);
>
>         resetn =3D devm_reset_control_get_exclusive_deasserted(dev, NULL)=
;
> -       if (IS_ERR(resetn)) {
> -               dev_err(dev, "failed to acquire deasserted reset: %d\n", =
ret);
> -               return PTR_ERR(resetn);
> -       }
> +       if (IS_ERR(resetn))
> +               return dev_err_probe(dev, PTR_ERR(resetn),
> +                                    "failed to acquire deasserted reset:=
 %d\n", ret);
>
>         ret =3D devm_pm_runtime_enable(dev);
> -       if (ret < 0) {
> -               dev_err(dev, "devm_pm_runtime_enable failed: %d\n", ret);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "devm_pm_runtime_enable fa=
iled: %d\n", ret);
>
>         ret =3D pm_runtime_resume_and_get(dev);
> -       if (ret < 0) {
> -               dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", re=
t);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "pm_runtime_resume_and_get=
 failed: %d\n", ret);
>
>         raw_spin_lock_init(&rzg2l_irqc_data->lock);
>
> @@ -587,8 +578,7 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>                                               rzg2l_irqc_data);
>         if (!irq_domain) {
>                 pm_runtime_put(dev);
> -               dev_err(dev, "failed to add irq domain\n");
> -               return -ENOMEM;
> +               return dev_err_probe(dev, -ENOMEM, "failed to add irq dom=
ain\n");
>         }
>
>         register_syscore_ops(&rzg2l_irqc_syscore_ops);
> --
> 2.34.1
>
>

