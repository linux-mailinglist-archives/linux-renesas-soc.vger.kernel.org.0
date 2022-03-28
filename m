Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9824E98EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Mar 2022 16:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239249AbiC1OHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Mar 2022 10:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbiC1OHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Mar 2022 10:07:02 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60361B780
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Mar 2022 07:05:20 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2e6ceb45174so110167067b3.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Mar 2022 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K3+Dl/fXqkR61IfHf3wdo0RZbRkOVxgqnRH8r2jeutA=;
        b=F0qAKt4+iXjNX+pakdSa7x85Hn986B7jQP5dnq1voAdEAgo2Xw9JCdT3BC/J7IZYye
         jqT+PdfRl6t5wmBJVeUf6zzZnw7H++P5plLUtrByacGW/np2yQfcuqGBSPKGxDqPMiT2
         oGBjW/sxYst5dVTVwxWHp4ZTAoxezVYAxaTyqB39ZYxuhr94EcXZFw/wy39mcKEzyPZ6
         f3HwDJ7h/HPKPjwQ3dOqmFgOSNLcnUTwNDi/SNKww6Kfzqe/t/3YXvsc1d9dtZ53fF9S
         PoAPCXB/xcPGoOMCR2OHNUVVjCJylwtuHBUb0siyOZHadnBSDPhSRuXBB49iaFvhperQ
         KEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K3+Dl/fXqkR61IfHf3wdo0RZbRkOVxgqnRH8r2jeutA=;
        b=yuOKFSRFE41JlPyKLE3u20xXQb4RrtQVh31hwFBj8LHVj3UlxKblZTN3ap2svB9hPi
         GXmWqactPhsReuiI9SaObbRgVlI9GaJ1N3xGdFTbXokVqgW5Ok0d65FqeNCvtwb5O7wX
         8rC5SfhSVEboU0TCD7x9e+8JtsMSvJwOWpuRHoBcqvYkJ9XzYPmXYSFX78qakx7LECLL
         KAs2g3J6fTSYMzjuwEr00kjW+4N/G9Gse3j6O4KdyY9Hn8yZw9iM5AKb+OYAlDYtA5LT
         8Gtzl0Bx5Dlf2pkzpAj0ht+MB5JugMHKGPDY4LDveXPyBv273THQhzN+PHs3lXFL8Bu4
         pLjw==
X-Gm-Message-State: AOAM532NXRJQ1SfaMstJYZq8mxfyVxBKV3YqOk7Avc5oU7m+DKrstruq
        a2L1iilj8nLK0jYBJZXK11OMSbERein4v55m9r0TvkBdRg0=
X-Google-Smtp-Source: ABdhPJyPbUKLtl6wP3iIRYwX01Vwz6zZ+XswSo4Xh6MSyr6T1sjKL8p6Iq/hHnIfAb4w33b8erjRMxXqVXitrUvEZFo=
X-Received: by 2002:a81:1185:0:b0:2ea:9fcf:5ca1 with SMTP id
 127-20020a811185000000b002ea9fcf5ca1mr1977196ywr.37.1648476319626; Mon, 28
 Mar 2022 07:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220320124538.62028-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320124538.62028-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 28 Mar 2022 16:04:42 +0200
Message-ID: <CAPDyKFrqnt5aWniYHUJo9hTfBRoaqH9eHHmfFL5bUj+C65bQ9g@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: style fix for proper function bodies
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 20 Mar 2022 at 13:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Put the braces to the proper position to make reading the code easier.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Queued up on the "devel" branch for v5.19, thanks!

Kind regards
Uffe


> ---
>
> Ideally, should have been in the series I sent out some minutes ago, but
> I just found this now (hey, Murphy!). But not so bad, there is no
> dependency and it can be applied independently.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 1497a46260d4..0bf35fb8b293 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -296,7 +296,8 @@ renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
>  }
>
>  static void
> -renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host) {
> +renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host)
> +{
>         u64 val = RST_DTRANRST1 | RST_DTRANRST0;
>
>         renesas_sdhi_internal_dmac_enable_dma(host, false);
> @@ -312,7 +313,8 @@ renesas_sdhi_internal_dmac_abort_dma(struct tmio_mmc_host *host) {
>  }
>
>  static void
> -renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host) {
> +renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
> +{
>         struct renesas_sdhi *priv = host_to_priv(host);
>
>         tasklet_schedule(&priv->dma_priv.dma_complete);
> --
> 2.30.2
>
