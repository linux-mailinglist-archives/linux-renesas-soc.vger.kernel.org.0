Return-Path: <linux-renesas-soc+bounces-8952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4855977F20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2024 14:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEA5B1C21881
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2024 12:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC01C1D932F;
	Fri, 13 Sep 2024 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPYvN4/O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B11D86FA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Sep 2024 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228941; cv=none; b=C+/Dt1nqKKOMWTBMmmddm2teZ8Z8M5hv5bHNUtrEpmr6lHKb0xj4pggN4pPftsp77MGBaL4RYeh/yXPTHCnbza/kNL29lLraf4an8bcRSGmfFdRDCzlW83i9Ik725v0OmvPc5QdkzToxDgJ4Z7DG7gz2oHdxK1Dgk/AS1rgGx4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228941; c=relaxed/simple;
	bh=WuwqpRmxlM+RziSDik+Xx/cAiRX1REx1Yj/wgaxdIFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfZdp1HUlad1k0LJgKbArz1j6kA23KAc9Fh5axaLpjNRr+WwoolT/K/e9E0ubyY+nr4q+ucg+npUYph0CaMFSW0rKHwcGevYG8w7ugUy7iqMO0WuTMcfk/NrrtN/1zjC/ghaIm/hPcMSnvEXRXSdBevOplYOC1DgQqJ1oQhh5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPYvN4/O; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6da395fb97aso16776247b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Sep 2024 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228938; x=1726833738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VZUveVe5ug6pUVY95Hk2rZagT2tEgT+khEe5hqljA6o=;
        b=GPYvN4/O/P8AOTFh7dQrOYWMtpbMEkxSUdO10t9LY6BGBSNcG2l3laS+a3mP3/d83H
         sI0GHWdF83xiIqKHQi2Ht7+S9zGhGv1ERRz/Y4jCLeTjLO6ICBzqUtWVfqj36d1YhYq7
         1hK3PsHoMU/VcGX3iH9Rc6/xYcsAlq1g5OnFZX23DuQkujL1xQiAYa2TztKWspXDeGFD
         tzdG+pDgj7XmAOU5spvuMcinagiT103csfAofIvHLu6DbuK4tdRyBmHRFdazFRniNPKT
         gTZYuyzKgs7o1JKP6q9ep3TP18u9Oo7oH4SjKedW/oRDuae9cQGHn5ZbX9qLsI+ijzk8
         DSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228938; x=1726833738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZUveVe5ug6pUVY95Hk2rZagT2tEgT+khEe5hqljA6o=;
        b=SSYr1KdlctrJzI8g+GdToKklrRJfUTJ8Hz8GXl/RQvq3vowE1KTdsJY2yy1JRPXvH/
         eV5/a3vEv+pIWgm4sqmk3La1nvxEA6tBc8AICoMp6bT1GhYDGhHedG8o7zLDR7W6n8oM
         gMWn9r+2o/7Oiduh3DcEhaR1a6ngs1J6M89kgVtIpESs7gMcNNHUF+ayvjNg2OJzN/WY
         a+ubzQ6lKC+vvjkXCoBwUdUflye4QwXu6W6W73vK9lnYd+fuHBgBR6Tvq+bmhDesLKZL
         fgwcnhSgA6cv7qf0m0YPuAy74oQekLRtaKyh6mJtF9QOitFsqmM9CMQCVZP9C7OQ904T
         7V1g==
X-Forwarded-Encrypted: i=1; AJvYcCVv1whGmszHi1ywcnsokVNJpgwtPAD1czoBBj9RN3KnI8pJDeoeohj+lyvGPR1gLmoAa0apI3tQnIlI0r/B+E+LKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/nzugz8JUmWT+HfRmrvhcaCEoI2RWfXz7u7QtMDsL8RXPyIp
	RcvhQN6LbNdv5fJvzQZApLAMvEO2NeEaTAYu+tu8ldXGP2k04RcryUBkWdUiw1vMR2PEa2X9RZU
	KgdcUWBG/oWeUbcOlT1/cHTK6WhJ24qkJpSKYDQ==
X-Google-Smtp-Source: AGHT+IHvWAtjRL3HNkWkaP3coSzhpDLefItiLLMliColzEkeBMjyYypjXfXV6VN6sYk4ULxR/arxmws/Y1dWw592ffI=
X-Received: by 2002:a05:690c:1d:b0:6b0:d687:3bd3 with SMTP id
 00721157ae682-6dbb6b20d8amr53618377b3.21.1726228936095; Fri, 13 Sep 2024
 05:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:40 +0200
Message-ID: <CAPDyKFr51pccY4Wx3x_NcuVrJcsG0U_xMptdC-2hf_5BnjaR0Q@mail.gmail.com>
Subject: Re: [PATCH 00/10] pmdomain: Simplify with cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2024 at 14:51, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Simplify the code with scoped loops, guards and __free().
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       pmdomain: rockchip: Simplify with scoped for each OF child loop
>       pmdomain: rockchip: Simplify locking with guard()
>       pmdomain: imx: gpc: Simplify with scoped for each OF child loop
>       pmdomain: imx: gpcv2: Simplify with scoped for each OF child loop
>       pmdomain: qcom: cpr: Simplify with dev_err_probe()
>       pmdomain: qcom: cpr: Simplify locking with guard()
>       pmdomain: qcom: rpmhpd: Simplify locking with guard()
>       pmdomain: qcom: rpmpd: Simplify locking with guard()
>       pmdomain: renesas: rcar-gen4-sysc: Use scoped device node handling to simplify error paths
>       pmdomain: renesas: rcar-sysc: Use scoped device node handling to simplify error paths
>
>  drivers/pmdomain/imx/gpc.c                | 14 +++-----
>  drivers/pmdomain/imx/gpcv2.c              |  8 ++---
>  drivers/pmdomain/qcom/cpr.c               | 58 ++++++++++++-------------------
>  drivers/pmdomain/qcom/rpmhpd.c            | 11 +++---
>  drivers/pmdomain/qcom/rpmpd.c             | 20 ++++-------
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c | 26 ++++++--------
>  drivers/pmdomain/renesas/rcar-sysc.c      | 28 ++++++---------
>  drivers/pmdomain/rockchip/pm-domains.c    | 25 ++++---------
>  8 files changed, 68 insertions(+), 122 deletions(-)
> ---
> base-commit: e188fd67a69319f3d105d9b90e424b8d1ff9580c
> change-id: 20240823-cleanup-h-guard-pm-domain-35eb491f35f9
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch 1 -> 8 applied for next, thanks!

Kind regards
Uffe

