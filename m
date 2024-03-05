Return-Path: <linux-renesas-soc+bounces-3468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B8871EC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 13:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C73C286514
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73505A4E0;
	Tue,  5 Mar 2024 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlXlibw3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F035A119
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640910; cv=none; b=e9sbL993GJYOmILiNYJrCo6x34CT0aM6x31cMX36bXb1blApGUDrSqkUkCP+0CyIx14SYCRYxRcan58omHpKOZev2YCvRrAffDKeookeD+fiMnjAf6fhtkIXpMil1cITBCnR4HBMiMt8i5SJdSYHkNNSSb6lkAq/aZ/812xeYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640910; c=relaxed/simple;
	bh=RCaP4GDWT87Zd9IUZzQQpBKEXe+s1x2lF2pIn4GuNXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFGQtyY7w4r3MrTpLmt/60BZZc1xnxUdLF9P3TMJRmv6CIhpi25okg+J46IbsjjgmCtlWonzn9KYvbqtbpnt7YDTRWEmC+PwrrDg4it83Hgv0Tqf/o8+9r509Q77Cst+kFuwakL79PYGKcKG/itRfduDoiARiZSApZNMy2UPmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlXlibw3; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso614767276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709640908; x=1710245708; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVW/PXVs5nzy5Gr+BEyjbP8Shu9TAluG0kZZRSGaf1s=;
        b=UlXlibw3caQYA57kMfjNtfV6yf5J+oylhS9K4ZXt73FtLQhoSMTyKVWUDyiZYM9FlO
         EpBnaNdd20YdCCHFYLDfAnnK92S9dPpJ2Y9GVPA05wQI9IcIc2O1F8zGjuqEbuf3blQA
         Xj9Fvt86ML6cxLIoamGCj1otdU1z5qe1RbQvrj8ausuGUyRf1TBAKvzTjczJAhCmix1s
         qTtYnakLOvJnfliFe+S++misrWDWyrDGTwvbUAKHi7KiM62Jz34pKCbGwLnoWqAzuB2h
         cHAWIhmJRSiprowLH6F341m3oIAjgIg4nZXuKHrW/AA6Caed9MyL3loyZrer3w39SvHg
         fi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640908; x=1710245708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVW/PXVs5nzy5Gr+BEyjbP8Shu9TAluG0kZZRSGaf1s=;
        b=knOTcXM+HRxpV6aB9KoUNxOzX06o5HQPZYIbkP2KRJ2HLBWTNx0nCbvvNDUgB9nJlK
         vGWt4ClyGo/CbNTtpRWnV4CJk1U1PhQnwOSv9Kayop8eKtts4ognbpkPHMaUp/81SSHA
         RoZd0jHW+KGEROA+0ss8JiG/BJI1mxMUEUk8BkcBZPhWsYxRD4g4wo5MDiYx/eAv4Eg/
         7gE4yhPNt5h1hojjIdJDjVQu33R28kmD8q4zOAIZM4IT5TtqYvFZdzBKpdIsp5o0jeHO
         TzaRhncZvvQ8PnaYUisf81CkOp3zVhrTPW3pWw4/eiqwg8g089/vTB612azJ38Fg3aMk
         8EpA==
X-Gm-Message-State: AOJu0Yz7syr2/ke2dREcKMHoIN2/BYR3FDeAqQOEX7hZ7t6Lsss+U76L
	tZBt4/WT+EjJgNBnTYiITdfuFu3SeIPNgN2pcDJjhTw2R59NSpAPuQn+TU/BPsLb79EvwwIehTw
	pPShG+QfolsmhaOZxKMwgopmA2zDlfGQ1FlLS0g==
X-Google-Smtp-Source: AGHT+IE2Y4cAajm9+l0CPilDWB96P4S9WhAwezHUZMdrZBUawlG/ZjtdnYQewd1l4phaxcPiQSTerAEAXTI4XU4tz+w=
X-Received: by 2002:a25:660c:0:b0:dd0:c2a:26f9 with SMTP id
 a12-20020a25660c000000b00dd00c2a26f9mr6859439ybc.27.1709640907662; Tue, 05
 Mar 2024 04:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305104423.3177-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240305104423.3177-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Mar 2024 13:14:31 +0100
Message-ID: <CAPDyKFryGhRju5CohRipXk9E_G3kob2g8=VztjtPBZ_i6D9Ugw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: tmio: avoid concurrent runs of mmc_request_done()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>, 
	stable@vger.kernel.org, Chris Ball <cjb@laptop.org>, 
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 11:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> With the to-be-fixed commit, the reset_work handler cleared 'host->mrq'
> outside of the spinlock protected critical section. That leaves a small
> race window during execution of 'tmio_mmc_reset()' where the done_work
> handler could grab a pointer to the now invalid 'host->mrq'. Both would
> use it to call mmc_request_done() causing problems (see link below).
>
> However, 'host->mrq' cannot simply be cleared earlier inside the
> critical section. That would allow new mrqs to come in asynchronously
> while the actual reset of the controller still needs to be done. So,
> like 'tmio_mmc_set_ios()', an ERR_PTR is used to prevent new mrqs from
> coming in but still avoiding concurrency between work handlers.
>
> Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
> Closes: https://lore.kernel.org/all/20240220061356.3001761-1-dirk.behme@de.bosch.com/
> Fixes: df3ef2d3c92c ("mmc: protect the tmio_mmc driver against a theoretical race")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>
> Cc: stable@vger.kernel.org # 3.0+

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>
> Change since v1/RFT: added Dirk's tags and stable tag
>
> @Ulf: this is nasty, subtle stuff. Would be awesome to have it in 6.8
> already!
>
>  drivers/mmc/host/tmio_mmc_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index be7f18fd4836..c253d176db69 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -259,6 +259,8 @@ static void tmio_mmc_reset_work(struct work_struct *work)
>         else
>                 mrq->cmd->error = -ETIMEDOUT;
>
> +       /* No new calls yet, but disallow concurrent tmio_mmc_done_work() */
> +       host->mrq = ERR_PTR(-EBUSY);
>         host->cmd = NULL;
>         host->data = NULL;
>
> --
> 2.43.0
>

