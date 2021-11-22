Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BA6458D61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 12:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239076AbhKVLai (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 06:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234216AbhKVLai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 06:30:38 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92822C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 03:27:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f18so79260645lfv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Nov 2021 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jnObts4yEssBRq0CgcfLFbel5BvHBgSVDLhsYI1t6EE=;
        b=smABZihhhLvltoiO3qJwcDIhRFz6AWvUMaRVfLdFagOmWWozWjkyYpuWSdHHq5U8FL
         LWdnlvRkacqp8rhjwSw3kEmQ8/4BzEmBx3xqhCpuoQSY+bQSUWGiSBTx8N0IW4RQ+9SH
         CZiJqe6RYaP+Ou8QWgtcMdoIA/rFBjh7K2sh5r57zt/gOdyOulaKNQnMNYVanAD3R7vc
         PtVZX1DtEcq4oSbVwsOU2W7i4Dt9pHLrQ86fWOcQffr1xNOoVh1TSHM4VliSXPue5+CZ
         y7gKSQOPGsK11tnHfWpr2nGgKHp8OA095/KE+x658jy0+FrpjQ7Cyf36Wguf9iG639z1
         qkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnObts4yEssBRq0CgcfLFbel5BvHBgSVDLhsYI1t6EE=;
        b=mUXYgwIUSz5vr4VJ3VAKaC5C8LSSgl88dtCHANGjaoHOS/0Rc9Jgsv6l0hFu8CHIjT
         9KoC/5dO+/PXu1tKo65hkzkp2osVdukPr2W+K9LRXURe/AaQWJrC00WR1m2f5YLzxYCx
         WfPK3CRvTdk33UMJf9TnAHgHBVQQfGyrXa8bal+7mChKaHOCvS/5cQCqmtnyFP/Z1ksp
         QGc9onDfxz/B1MJG1y5i3XoEP1wNhDgUPuiIIsAyoPXlLUk/QfFdAjAOmjX8Cy9BAUvN
         MAVJGX4GPhOJTO4bWP4phxyx+Qz62tU+MXiLrv8R2Mea2lYF1TLD/cpOuCx4ogJg9rxW
         qDGA==
X-Gm-Message-State: AOAM532FnazjiszaVLGfRtTnJix6hK5DPqI/K7mPqala0XwO69nKqpFi
        LdD5NxyhlpmApMFA5dMeWX9nUN4dc7tyLqIPSNfKMexcpMtPXQ==
X-Google-Smtp-Source: ABdhPJzRCcOUHwbvuB1FfUSOQDxqniiTd5zq/5cPFqGOG32yYqXzzVUq/LHFwAEL8cMfn5DxvuKkHXB8fEV9l+Slz4g=
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr36611066lfg.373.1637580449865;
 Mon, 22 Nov 2021 03:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20211117103850.28397-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211117103850.28397-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 22 Nov 2021 12:26:53 +0100
Message-ID: <CAPDyKFp=hMOY==VXhOh_KssKE5wWe6AnsNcJ2VdP+GVa-m5LGw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify an expression
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 17 Nov 2021 at 11:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We already have 'quirks', no need to go via 'priv'.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index a4407f391f66..29bc086f6cb5 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1044,7 +1044,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>              host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
>                                  MMC_CAP2_HS400_1_8V))) {
>                 const struct renesas_sdhi_scc *taps = of_data->taps;
> -               bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
> +               bool use_4tap = quirks && quirks->hs400_4taps;
>                 bool hit = false;
>
>                 for (i = 0; i < of_data->taps_num; i++) {
> --
> 2.30.2
>
