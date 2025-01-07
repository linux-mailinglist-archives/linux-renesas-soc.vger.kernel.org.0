Return-Path: <linux-renesas-soc+bounces-11924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8967A040F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 14:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAF53A1C61
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416761DF75E;
	Tue,  7 Jan 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifvlCcVS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01611F03C3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257057; cv=none; b=DH7YdFjtViZRAdMHCgmTXvkFsNM5b5kSwuQmuWCcbs9dogooJos6xCQoq5aTsaXXGyWmG4HhGVueCOabMWLbqz19/heNv5tXoljU6QJ2QHH/hhhMEIAul/CzrsXGftJN8ljlIDRVwi9eH0rOwbJtYAt/LWopdrg2gHY4mhciwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257057; c=relaxed/simple;
	bh=62MPZ2MYfNM/zR+5ESRJqFcT7ZFz/a2ypSc7IQNH1m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhSaxFWKVeKn46yqoXelUv3aUoUvgh+HTauuwhiMJprFntLbgMUbOQftSQCkRXFbROkItbVqB9LecD0yP6b1zv4Lsy+J8vlT/f1M/UZcfjFVBtPz92nDDudA54xpncQGIj24t2DzX036q1TrksO5QMNzxDd28GUSNN15b5iqA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifvlCcVS; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso8062849241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2025 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736257052; x=1736861852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nT7ElrT6NgtR+4YVm7t41z7Jqy6cR/7wkNnPmcGmP0=;
        b=ifvlCcVSgkorr8dmFXeCJJj8Mvj442akFHXteqjvKjMDz+VuaD/iE2jppeLjG20zFF
         gnvND9pnaKyCxz/x1g8xmFRRUS2Avba8v+5r8qbUlRRvI2obzMFXRNztIyNLt+h6OfVy
         hVVS4GO6AFHPrVzIy2hg0vi2JyOSWgziLa5BWiocV1wIq7FnVb/5kv9/W207YDHX4bKq
         f2TylWastVSkdhVETAn/SLE+UZK2vXDVFH1WI4VUZVuvp+yh1hUgWpXddBvYNS9gF9r/
         z81IVLfwZ7exEQ5XOfcbCUVk2f2pnttGOHXrX6Arm3lvii2Ab18d5Yb/6tmDuHm0KuAS
         +dlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257052; x=1736861852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nT7ElrT6NgtR+4YVm7t41z7Jqy6cR/7wkNnPmcGmP0=;
        b=FW2VP9imSERDLkNxMiiK3cep4iknO9flWIkbmiIE3r83Dgmp8Lt17sYUmndqvzY2I2
         z6IAokL00fbvtw1z1HkxugUMUfby/ayqpgnfizOZLF7EQTHOIqKRANxNpYjwAAxApEOb
         trKHLQgQpmCnmmafGUOnjfm1j+xI7VvS4Xo09VACufuEKrX3LDXvCs7sTSaZo26x5uLd
         Qq3sx4fA4YS03LOnMYcQkVmC7HWmNTxVxerQM4FZj8V7v8oHGS40cKAXSeuPxZhB5bfz
         XRuf6FPjuhzgUtMRxaoVLyccu7djKe3RQWO+bl8N0JFFxYgbCaYwHqvzE7jWl0GIUV2h
         Q/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTvUkZW/pB3+Qq6hc3r5VSSH26HBEyr7k/x5ccQrxlJY1KqJkzuHpeI96HCvlRIX5xZLKtzLWml/s9YrZvY8O07w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlf3Ggvsinw7RPRNr+/wlM4i1jmvVkdY7HS9La7szGeNcl0D5S
	AMIqNzWgibHHARiaTbU0gDWloIz8c4Sm9LMXsLoOYiK0PWpF2djj12g7qUcqV18JFu76Y7X0Nok
	L9KmGBShKx5U2SB5Jjt6fvec2yOo=
X-Gm-Gg: ASbGncuzfEdX97suY+IOQMEH+eX+gk/wOJ9fK27YrzRBYP/XGLF9COx/YXt9cRi9Kd4
	Y7S9vPV6SbwqgYnWwXg3Jz8gCJjIWnxOsuAkSBPY=
X-Google-Smtp-Source: AGHT+IH9cyUfWUkUmP0FEaYur5iCHqOSKloTz8L0rEUSwVEgwWYHApDdfY2wlGCNL1CfRiGkfZsx+Gqeb9yMV2sR0tY=
X-Received: by 2002:a05:6122:410:b0:51b:8949:c9a7 with SMTP id
 71dfb90a1353d-51b8949cb1fmr32561424e0c.8.1736257052606; Tue, 07 Jan 2025
 05:37:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_6C5F0FEC04B90F53F10E8A44D4ACF42AE709@qq.com>
In-Reply-To: <tencent_6C5F0FEC04B90F53F10E8A44D4ACF42AE709@qq.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Jan 2025 13:37:06 +0000
X-Gm-Features: AbW1kvaBavIm_7kFQ7MNDMVwtb8PAepTBjaj7d84yd5MDeudVaL93abqEE18-Zk
Message-ID: <CA+V-a8vTBoHZu8A9AgJ6LEejLLBU7GO0Gg9fgB8AoeTCOczMkg@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: rcar-ep: Fix the issue of the name parameter when
 calling devm_request_mem_region
To: kingdix10@qq.com
Cc: marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, 
	robh@kernel.org, bhelgaas@google.com, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:26=E2=80=AFPM <kingdix10@qq.com> wrote:
>
> From: King Dix <kingdix10@qq.com>
>
> When using devm_request_mem_region to request a resource, if the passed
> variable is a stack string variable, it will lead to an oops issue when
> executing the command cat /proc/iomem.
>
> Fix this by replacing outbound_name with the name of the previously
> requested resource.
>
You missed adding below which I had mentioned on v2..
Fixes: 2a6d0d63d999 ("PCI: rcar: Add endpoint mode support")

> Signed-off-by: King Dix <kingdix10@qq.com>

..and also:
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch has not been CC'd to any list not sure the maintainers will
pick this up. Please refer to link [0] on how to pick the right
recipients for your patch.

[0] https://www.kernel.org/doc/html/v5.1/process/submitting-patches.html#se=
lect-the-recipients-for-your-patch

Cheers,
Prabhakar

> ---
> Changes in v3:
>   - Fix the spelling issue in the comment.
> Changes in v2:
>   - Fix the code indentation issue.
> ---
>  drivers/pci/controller/pcie-rcar-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controll=
er/pcie-rcar-ep.c
> index 047e2cef5afc..c5e0d025bc43 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -107,7 +107,7 @@ static int rcar_pcie_parse_outbound_ranges(struct rca=
r_pcie_endpoint *ep,
>                 }
>                 if (!devm_request_mem_region(&pdev->dev, res->start,
>                                              resource_size(res),
> -                                            outbound_name)) {
> +                                            res->name)) {
>                         dev_err(pcie->dev, "Cannot request memory region =
%s.\n",
>                                 outbound_name);
>                         return -EIO;
> --
> 2.43.0
>

