Return-Path: <linux-renesas-soc+bounces-4917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A308B2FA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 07:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE121C22CB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 05:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAAC13A25C;
	Fri, 26 Apr 2024 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chK9Rx4C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1841849
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Apr 2024 05:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714108129; cv=none; b=u5JhrgRJih8+Fy54B8epFEViO0rMQ9ff9ytplxG3/HLtJ+2ppFrexxs3kSQZCYZEOtDcxXECsmxynrP+C9p2bFhr6OauBLMhhBR6UkWbgTR2l+AUvFOGL76oFFKEfDJ8Zg+rn6wyjIpTWIyIETZTKLwZd7jbwdQ6CBSzNgn0ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714108129; c=relaxed/simple;
	bh=1LBhiAAzsix5kBJ7XstPViIgPB3xqpoWGEuihbF6h80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwA9nAYVUKIOvbOL8HiMxK5foKn5Cisc+lTAcEH2pAFeCZWJssl+1c2zIFI14Eph5h13qx0HCnToGte5kyNrKzT/oxblSZzufbIS+8ODSMdDwDuzS5uxnisyJktCMDBLTNtHW5bwaSnhFsPb7O97fBPzF8RLkgwUTT/WS5F5fs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chK9Rx4C; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de5a7b18acdso410123276.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714108127; x=1714712927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9qYK6scXFU3hWFQO57QP2e7QzwrtzpT92BwSQPl/Ws=;
        b=chK9Rx4CmSO4WB1nmYQwDfCdxOIaxwLzFuaC+HA1lYR2aNZiNMdp4Ql+tYUEsBfs8V
         2GpH4pe3envr6cD9PuDnQJAJtDwhaENtuWpkhm6bEXxX3mTVuLi/o2H0x7mlEDooJK4A
         BzAyd4EcMbS5/bZpiAQavopDUc/AXHqM/S4lisFU/thGEEg9ZDTSLpOC1L2WXEh2dz8v
         17D+CtssRtq8hR8Y7QfWuLKuJlws9I6bW0rYGTpr+8AnD9LhBq+isyU6MxrGgEX8Ze7A
         82iIrWnQIWCCh+DAGuSNlJBRT7tldnwPc1gC+MLjDxm7kfAg+s1StF0Lb/BzwozCMBQX
         5Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714108127; x=1714712927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9qYK6scXFU3hWFQO57QP2e7QzwrtzpT92BwSQPl/Ws=;
        b=xELFinPSflNIPAIcTy5rdIMkdSlc9kJF5i5yhFq8hjZN7p+YUDTSNdx0tA/XK/JRNY
         JCvCjhOovMr3nhO8kcgjKx5+h8TuTSn2U+F1JzE6l00W3jLA2Jj8ySyMOrY416I7QURj
         rW39oi5uanAsayFqm5H4uvHkak3DGW+o3QuIRtXNpxl1rvcxyYsKGEzK01V+doBNy02Q
         AHqqNqmmuArMH3YChxXl+SQcE6FLV2fP5hThOQWeOKzIIGCqGrQ6mVpCTcDw0KkiedC8
         s0BfNSvtLF7bwimEISxIUqGm4XODr9n4mAOEeANTNlAuJ8DEJL+N2iEY43Wv2Agx7k/y
         Jd+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1Y2FZn7cqVqInvCFVurBYeet51eFskf/UVaWiE8ZIEu//QrKPOZrHCGyqvng76ua9NixPtb0PCUd/njoYawW3QC7wwh5R1HXYB2jPgf4pCDM=
X-Gm-Message-State: AOJu0YzeUns9cyn6X4TFQ306jDbGkRQXtjeF9exwplR4QAm8A7A2Es9L
	qJhZ5s6bn8p6qRG1zGrAk7K7BAXlRXjhLYa4uGcMq58UGMwU/EouKyCtSUXRtB6iCE93sj7jNfb
	rNNCdaZ92TyHOJUCR/ck09pIKTE8n45lPdNWYRW4/Lb7W0Gwm
X-Google-Smtp-Source: AGHT+IH16hO8vwDnyxZrKnMooAxMmGR34X0+CmzuCVy2Rc0FqatpjC5Clkv6zfTfOM8jNaRnnuwXmkNi1ffzofnr41g=
X-Received: by 2002:a05:6902:2303:b0:dda:c5ca:c21b with SMTP id
 do3-20020a056902230300b00ddac5cac21bmr1953339ybb.37.1714108127133; Thu, 25
 Apr 2024 22:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410135416.2139173-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240410135416.2139173-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Apr 2024 07:08:10 +0200
Message-ID: <CAPDyKFovRYQOCM8UqFcsP+MiUd2ViKJhgHUMH6hgBiqtdBxmkg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Set the SDBUF after reset
To: wsa+renesas@sang-engineering.com
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 15:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>
> For development purpose, renesas_sdhi_probe() could be called w/
> dma_ops = NULL to force the usage of PIO mode. In this case the
> renesas_sdhi_enable_dma() will not be called before transferring data.
>
> If renesas_sdhi_enable_dma() is not called, renesas_sdhi_clk_enable()
> call from renesas_sdhi_probe() will configure SDBUF by calling the
> renesas_sdhi_sdbuf_width() function, but then SDBUF will be reset in
> tmio_mmc_host_probe() when calling tmio_mmc_reset() though host->reset().
> If SDBUF is zero the data transfer will not work in PIO mode for RZ/G3S.
>
> To fix this call again the renesas_sdhi_sdbuf_width(host, 16) in
> renesas_sdhi_reset(). The call of renesas_sdhi_sdbuf_width() was not
> removed from renesas_sdhi_clk_enable() as the host->reset() is optional.
>
> Co-developed-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Wolfram, when you have the time, can we get your opinion on this one?

Kind regards
Uffe

> ---
>
> Changes in v2:
> - fixed typos in commit description
> - limit the comment lines to 80 chars
>
>  drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f84f60139bcf..5233731a94c4 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -589,6 +589,12 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
>                         sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
>                         priv->needs_adjust_hs400 = false;
>                         renesas_sdhi_set_clock(host, host->clk_cache);
> +
> +                       /*
> +                        * In case the controller works in PIO mode the SDBUF
> +                        * needs to be set as its reset value is zero.
> +                        */
> +                       renesas_sdhi_sdbuf_width(host, 16);
>                 } else if (priv->scc_ctl) {
>                         renesas_sdhi_scc_reset(host, priv);
>                 }
> --
> 2.39.2
>

