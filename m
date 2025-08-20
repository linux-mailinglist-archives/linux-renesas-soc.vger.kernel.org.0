Return-Path: <linux-renesas-soc+bounces-20748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DAB2D609
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD642A2922
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1C9286D55;
	Wed, 20 Aug 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9Wh1RsO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652C1E9B08;
	Wed, 20 Aug 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677941; cv=none; b=X3Ra8AaiiG+42Ez309CwPPMixZENr0U/p8kJf73PONQ6qd/FBTsRaoOGjs5zoemZ6Qsu/VwU3nOKvWW81dQU39/uFagwAZWWp4bCmZvHWLIoQH5p/KcjaapC7QAz9ULXtdr83qTaG8XUuq908g7IOzqdsE09sy8ebYnnVLMu/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677941; c=relaxed/simple;
	bh=fK2DuSyV4LqHa2BTm2YQxEWab71xsSNOPn0cGrQrG24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhPcbvCyEkhOtdmuYmVn546nrNowRY5FUL/ObZgJSIVN/E+K63EsHx1PC4Nlmtu+n+BO58CDC47OmAR96BA/hSCTXDASpvz6d90QTwhpbwzq7PcHrvYGnDBLvsN50HfoIV8KW5dAkx49Vri8tSWU1SR+x7viMpswkm5ORUBGzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9Wh1RsO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b47174beccfso5227711a12.2;
        Wed, 20 Aug 2025 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755677939; x=1756282739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=g9Wh1RsOc9PkXPmu3u25+KzRfl5316bpZUP7ZvffoomCJmoPRXheapVeQBeKYGs7hZ
         sdcpuryKn7nrUnsN/WaksGubt9BYWHgfVdjqaeVKetCX7BpLZDFDWah8ZzQDNvUzvHjz
         W8k+1Gy/u9/dVC5sn1nc+QPwT56FZjpWh0I7BGP3JWAQeczOkLDLIB8w4V41F5+6EZvR
         cleK2On5TPwmVImmeUss4YqLr/iWbPS3iNAorAUDYkOV0pXGJM8sW4CrCbfMfUF66I2j
         PFgqZhP+zON0RiQXEpm18KxwPaZIMpAG0xGsr4Q/D8zLLbFeQFrkitckfOWcA72qj2kT
         V+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677939; x=1756282739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=ebYRjT1g7TMYQITbNEZ0iNyWtR/sypBltJPiSY5kLodoy/hBxpcF2Ry7jlYRyG+5Dm
         zRTjiIFNu6mEcgGpKx5qESHVw7gASvGrBF8y7zkDNor4rFqyZMrMTdDVd55gkFAmOYby
         yDI70yM8x/QMYh7weQTDCRxPmPBp4367zXtidjEKmfpPO6BlNoQIkUny7kJHvjM031uZ
         tRm6dIlUuLGAkRuNiJtPpgbX1RoiIyNlm83UmN859i9NOSIU7AKbquDwpk3Z6XeKYpz+
         WOmXWeLtE2zDr2ujSkcWrlbsisxRJyA3kZhiAPB8x3ejzypp+FCXDvJ7YatVzdwpM6ks
         S1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd72fmddij14aUsL51Awty35YJJnAAZnG83qb1x53iE72ZrnxNUKVvPyJ+gws7PKRiN+ofP4MCRUhE9Siq+Axr2fs=@vger.kernel.org, AJvYcCUdt1licW5rxdXyduoqJauj/e1oCiWQpvreOjV/+P6hgJVc8IahPJ4E1eKSZrgYTbZXn7Gmsw58zkNIw141@vger.kernel.org, AJvYcCWWVQlsxk1EYITlBVwVtgHk2LQUjaAKzEQ5tzw9dekU3e1ccGaryHEb4rISQEGVmg/LkmTYpDEgeXqrykLBhhDp4g==@vger.kernel.org, AJvYcCXV+oITgJ2BP0ZPjecT8eyE6LD2+1cNEw2/3Dn50FoghzreIiwJZrkwax48TxJeCbFr1QTJC2g8n2dPAhNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2yVrDP32tyMRBpRYBya4NXJbBUsQHTsyW3m1gAuLgAnp7InL
	RaHGf0XFUuP0jjkL+ZpTk+aRcOtGjHD7zAuiBgUauAdzOMyBTqJJ0zmx5q275a9uyasnzQGwm6B
	KxrP11E5QR2F7hPlQ/xP2MPtG91BOhbM=
X-Gm-Gg: ASbGncsXa5l3WtXkFmLedLdyovP5Ke4UQCRV4lpYMkgwibkqN5QK2uMFrcOMOk9dVda
	mfCqyxARY5XwpOxa8DDhNAUO9lYACVnHwB9ZFIHdzdRN9oV4PXeh2gJXUoCTgdmPMizLzMmRhF1
	lVtRtLjJg4sGOf2VVnppVwY8HTAvXdvBzcectoB2a/lYH8nSWT//WpL5XQHTmJaPAyRDYtIFVm9
	TOY
X-Google-Smtp-Source: AGHT+IHyS319ZtbgIK5QZ2TPQXhA0Y58me3odjKXWmlmqSDihLpOV/ytvp3iwfpabPjgDac+00Icnjn6G+Cpo8Pj+bM=
X-Received: by 2002:a17:903:18c:b0:240:96a:b81d with SMTP id
 d9443c01a7336-245ef0bf2bcmr23609915ad.5.1755677939214; Wed, 20 Aug 2025
 01:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org>
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Aug 2025 11:21:09 +0300
X-Gm-Features: Ac12FXwDgSq5YSRmZRgmCG7R1pa20x6uPGQw-yiLKpdR5FfgZLxMT4en9AePre4
Message-ID: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

This patch will break IMX RPROC support.
<snip>

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

<snip>
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware=
 *fw)
<snip>

> -               priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev, res=
.start, resource_size(&res));
> +               priv->mem[b].cpu_addr =3D devm_ioremap_resource_wc(&pdev-=
>dev, &res);

devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:

lib/devres.c:124
static void __iomem *
__devm_ioremap_resource(struct device *dev, const struct resource *res,

=C2=BB       if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
=C2=BB       =C2=BB       ret =3D dev_err_probe(dev, -EINVAL, "invalid reso=
urce
%pR\n", res);
=C2=BB       =C2=BB       return IOMEM_ERR_PTR(ret);
=C2=BB       }

while the devm_ioremap_wc doesn't care about this.

So we cannot use devm_ioremap_resource_wc here unless you add
IORESOURCE_MEM flags
to  of_reserved_mem_region_to_resource as discussed here:

https://lkml.org/lkml/2025/4/28/759

The same issue we are already experiencing with Sound Open Firmware
where the change was already merged
and we have a bug already reported.

How should we fix this:

1) Add  res->flags =3D IORESOURCE_MEM; in  of_reserved_mem_region_to_resour=
ce

OR

2) Use devm_ioremap_wc instead of devm_ioremap_resource_wc.

thanks,
Daniel.



Daniel.

