Return-Path: <linux-renesas-soc+bounces-5459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B128CE1DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 09:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 249A6280EE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 07:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC75682D9E;
	Fri, 24 May 2024 07:55:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588D82892
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 May 2024 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716537353; cv=none; b=WmDAYfF/0qAecXWafCc1PwEPdVqyU0igZH27btQe0xvMPMaNS57dnf/p6xipotvtAlNScEIu9tGWKo7yvo/Lxc0MIGMm4eeNUKMyh1vd4aeKmMTYd1vbW/+C2IaUHjIzLElk0vvE0mDIdvRkToNiVTSsGqArZbJKz7erdZ2NeiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716537353; c=relaxed/simple;
	bh=ZuZ86FhL0CbN9dv2dRkk/VDsxiGg+cVUX2bWWZLxiQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gz0btBYkuyFGMER42dL8Pgx32WCEdU0jmp+2GezIb9Ug0Rv2V53jTufzh1kYaAQ7frSrbulaz5pZj8MFdscb95nqil8rW4GuDlMJazFaRU8MJbulIB+hVk2QYj1cKGQUt93iXYVaDpw2vNlU7/Ky2K94S5EyXzBBI90vbizkWZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-622f5a0badcso77417377b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 May 2024 00:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716537350; x=1717142150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbgPMJzO0iw5wOWyB2co7zQ8Wgo7bQukXg4UCYIc/FU=;
        b=NokcFh+Ztu3ZEf0bniI0xHwk8DOxOgjc3em6oG+rhal1NKyA/CnC9EkWCLo+8WHF9j
         RLqnAUxZIA5Y9mIfoPPWBL+9P4dK+yrsXi9SwpsMwPfkDi0qpJmdBtksBSpfur9BvJwf
         L9HKvuoAOKHpB0c8Qa8wbkMOaHznAzhcmESNBncB0RI+bgS26+BQYf7HxILiQm3cTQ1/
         OjDxMUhdKuYwNM9sseZVs2nUREMZ3SdmYrMaksNpQQd8P0id9FCjlSw8f2PjlwWqLQQV
         F9xGJTpf418DOJrL3kS4InAupTm5kH/uoUZ0JXPxYF5sNmBoG1FNvuOcxL59AL9C4odL
         Oqqw==
X-Gm-Message-State: AOJu0YwhcyYqdaw58WCbI439ou+GPjueFg7IV1J38nblSLY4+XorJUrv
	uYG9N0Ln3KgYuoTIAjqk3qqfl19S43q6iNsL/dAaMuWrJN1L/HVuFi2/X9J0
X-Google-Smtp-Source: AGHT+IEVObGDmr2L18VSfVlB0Ilkc6oB3FIlfZlQgL0orsbu4uELBGO0vEwZ6mCXZacO23dXKEZd5w==
X-Received: by 2002:a81:451b:0:b0:615:10f8:124a with SMTP id 00721157ae682-62a08dcf4d4mr13983037b3.29.1716537350408;
        Fri, 24 May 2024 00:55:50 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a534dfbsm1705037b3.121.2024.05.24.00.55.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 00:55:50 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df7607785e9so1331658276.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 May 2024 00:55:50 -0700 (PDT)
X-Received: by 2002:a25:ad96:0:b0:df4:dd95:cc87 with SMTP id
 3f1490d57ef6-df77215545emr1494324276.10.1716537350017; Fri, 24 May 2024
 00:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240523203431.6423-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240523203431.6423-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 May 2024 09:55:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfdHBMZ7WkUqN9JzcvXkPtLygL684_Qbaudb5+GvtMJw@mail.gmail.com>
Message-ID: <CAMuHMdUfdHBMZ7WkUqN9JzcvXkPtLygL684_Qbaudb5+GvtMJw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, May 23, 2024 at 10:34=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Enable both modes, host and endpoint. Also, enable EDMA for performance
> gain for the endpoint mode.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for the update!
> ---
>
> Change since v1: added EDMA

And you changed CONFIG_PCIE_RCAR_GEN4_* from m to y??

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -233,6 +233,8 @@ CONFIG_PCIE_HISI_STB=3Dy
>  CONFIG_PCIE_ARMADA_8K=3Dy
>  CONFIG_PCIE_TEGRA194_HOST=3Dm
>  CONFIG_PCIE_QCOM=3Dy
> +CONFIG_PCIE_RCAR_GEN4_HOST=3Dy
> +CONFIG_PCIE_RCAR_GEN4_EP=3Dy
>  CONFIG_PCIE_ROCKCHIP_DW_HOST=3Dy
>  CONFIG_PCIE_VISCONTI_HOST=3Dy
>  CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
> @@ -1215,6 +1217,7 @@ CONFIG_QCOM_BAM_DMA=3Dy
>  CONFIG_QCOM_GPI_DMA=3Dm
>  CONFIG_QCOM_HIDMA_MGMT=3Dy
>  CONFIG_QCOM_HIDMA=3Dy
> +CONFIG_DW_EDMA=3Dy
>  CONFIG_RCAR_DMAC=3Dy
>  CONFIG_RENESAS_USB_DMAC=3Dm
>  CONFIG_RZ_DMAC=3Dy

All of these should be modular.
If you agree, I can fix that while applying.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

