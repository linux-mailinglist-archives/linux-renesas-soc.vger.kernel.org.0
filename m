Return-Path: <linux-renesas-soc+bounces-10145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 098169B052A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 16:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CE7BB2287F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 14:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4731F7552;
	Fri, 25 Oct 2024 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kp6SyCOK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D41A1D435C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865409; cv=none; b=m02afD2EACeARrvDpHAEgekQMSi9r1Zuzi28SlDyOoLF5BvxCxV9SQ1Sh6UxXaf5GVTAXAZ2wMTHvoygTO0vosn2V5i1FwfdascQB2rOEVjz4SfDb2g9RIocBxVONVmOMDilw+tOffSsUQEk0O4kbQrfzwWGh0EoYWSuMVgFblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865409; c=relaxed/simple;
	bh=wT0Fbjlo0iRz0o3dwX6TmjVAJpH3/ey4pQYSoadWd70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iD8xnpZQUDMjhB2lt26Kf7nXCRFFax6lL/ZdLLO6eSaLhvY9d4RrIHr1V/TNK9oLNB/vTG9NR4BEGilFqPxCOfrxyRyn8a6nJ17cQ86m6Z0qwnTMcgzlzq/KPFJrfMnX2pBNNQOExB8OA4QCSjKRRG+n0qUFUvF+la85XIkykng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kp6SyCOK; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e305c2987bso20642497b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Oct 2024 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865406; x=1730470206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6bqKUbbzLPafKXYYn/Pz2qYPWwSJiFRgsqP78w1dQVs=;
        b=Kp6SyCOKuz7Am6P1VI8VqWpqD9EBLoP9u3T9WKR5hv4pZa30TVuFeVnLFz/j64gcXD
         UZ8ic4QbQh3P15a7ibP9cq+eABNJUbdh029V4xV1nyLOUKol93G09fZvDfbrjqDzx6tB
         H1PDjSJrG3cqijz31iSyTRt9CfML+0m7VCl35Q699AyF+kIK+R/rZ6q6CMom6MzurtOu
         xmw2G5yf2PMdNJ6c6tFEiywmhMQGl7WhW1JPRyd1gwvGDURjDs3h0i456kWvmohE1wxT
         jdx5n7Frt8WYRQUxxZlX4eQhQFSBibdW/jzg+Lja7lmAEBGizMpjpssh/aznKXBwhpMO
         OCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865406; x=1730470206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bqKUbbzLPafKXYYn/Pz2qYPWwSJiFRgsqP78w1dQVs=;
        b=IdxWoRsAS1U4En8Bzxf1gN5WM5e3NoqY90vKaQI6CFF8MC6pi05k7om9m0Fyh3NVnj
         6u6N4VJvd3mLkWXz6/5gx/q8IR4nVaxilI1Cl6mwGI1rSFY+qPCTpN4rYKg7CTJCU6gI
         qQ9KzcwQb9ugPGgif1MVPZPbFTafAVs+6j678+ibdRIlNXneMYYhvF0En3pxcA/ydQJQ
         184GhO42I+WyJA2TpGrr8e96mQ02Vj0tBUBr/drvnUjSLxII/jIkndY4embtf3uBCdNx
         v/M8+tI/KRf3P5iljyqiz0ehCN0oYIRSIr/LZ+IiXzftE79DzeU57pnOTuoFVQPlBPeW
         q3BA==
X-Gm-Message-State: AOJu0YzoyUa4SQ/Lg+MyNiRm80viDMCI3Yeji1t5YouAMAwqvtoY4Zgz
	+0NF3E3A25KFj0NS3b0Tup0AeJ6VfYQEaxW2/FQShEZ6hrIhudiIB5PoJQvN3gYOeFc2Zcb0K9m
	HhazOmUcqKy6E9ogfCTkxcLPM8LQAYisd332JTOFWB8764jKo
X-Google-Smtp-Source: AGHT+IHg7iSwppC+kZAh48MyBJONx09dWpBYPtV3TbMJB797/l/XJxCpPx9qo53hB9THHkONolJyhHI5tyxUncLSWRI=
X-Received: by 2002:a05:690c:6c11:b0:6e5:a78c:5795 with SMTP id
 00721157ae682-6e7f0fdb89emr110602867b3.43.1729865405714; Fri, 25 Oct 2024
 07:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 16:09:29 +0200
Message-ID: <CAPDyKFqfSgmPJtjLyf+dU6uz15EerOYPTp9Pr9KYt1RpCzRDMg@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: suspend MMC also when unbinding
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Oct 2024 at 11:34, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When unbinding a MMC host, the card should be suspended. Otherwise,
> problems may arise. E.g. the card still expects power-off notifications
> but there is no host to send them anymore. Shimoda-san tried disabling
> notifications only, but there were issues with his approaches [1] [2].
>
> Here is my take on it, based on the review comments:
>
> a) 'In principle we would like to run the similar operations at "remove"
>     as during "system suspend"' [1]
> b) 'We want to support a graceful power off sequence or the card...' [2]
>
> So, _mmc_suspend gets extended to recognize another reason of being
> called, namely when unbinding happens. The logic of sending a
> notification or sending the card to sleep gets updated to handle this
> new reason. Controllers able to do full power cycles will still do that.
> Controllers which can only do power cycles in suspend, will send the
> card to sleep. Finally, mmc_remove() calls _mmc_suspend now with the new
> reason 'unbind'.

From a principle point of view this makes perfect sense, but
unfortunately it's not that easy. See below.

>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> [2] https://patchwork.kernel.org/project/linux-mmc/patch/1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
> ---
>
> RFC to see if the direction is proper. Obvious improvements are removing
> the debug printout and check if the forward declaration can be avoided.
> This was lightly tested on a Renesas Salvator board. Accessing the eMMC
> after unbind/bind and suspend/resume showed no regressions.
>
>  drivers/mmc/core/mmc.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 6a23be214543..bd4381fa182f 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -32,6 +32,12 @@
>  #define MIN_CACHE_EN_TIMEOUT_MS 1600
>  #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
>
> +enum mmc_pm_reason {
> +       MMC_PM_REASON_SHUTDOWN,
> +       MMC_PM_REASON_SUSPEND,
> +       MMC_PM_REASON_UNBIND,
> +};
> +
>  static const unsigned int tran_exp[] = {
>         10000,          100000,         1000000,        10000000,
>         0,              0,              0,              0
> @@ -2032,11 +2038,13 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
>         return err;
>  }
>
> +static int _mmc_suspend(struct mmc_host *host, enum mmc_pm_reason reason);
>  /*
>   * Host is being removed. Free up the current card.
>   */
>  static void mmc_remove(struct mmc_host *host)
>  {
> +       _mmc_suspend(host, MMC_PM_REASON_UNBIND);

Calling _mmc_suspend() here, will put the mmc card into
sleep/power-off state and the card will also be powered-off.

During this period, we may receive I/O requests in the mmc-blk-queue,
which then the mmc block device driver tries to serve. This may lead
to that we call the host driver's ops, with the state MMC_POWER_OFF
and asking it to serve requests. This doesn't work and will hang some
of the host HW/drivers.

To be able to put the mmc card into sleep/power-off state, we first
need to prevent the mmc-blk-queue from serving any additional I/O
requests, which is what mmc_remove_card() does. :-)

Although, we can't call _mmc_suspend() after mmc_remove_card() as the
mmc_card may have been freed by then. Hmm...

>         mmc_remove_card(host->card);
>         host->card = NULL;
>  }

[...]

Kind regards
Uffe

