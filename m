Return-Path: <linux-renesas-soc+bounces-3469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078AE871ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 13:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399FF1C223C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3305BAC9;
	Tue,  5 Mar 2024 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZMb+mZMy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DFD5C057
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640927; cv=none; b=hHB7zn2jyaznlV25iozyqsG4I/tYlhR52PltawF7BaEze0poGLsKY5o0xLqx4bfU5izYpKHQpEfmUrkUumSP79pSEZAmTX0lWm1ozb04x8xWfSqe4RZmb5ALlr2ic0YX2fG3DXUUG0ogjO/Ztdfj1oP//lKKWjRIIMxflzCaT2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640927; c=relaxed/simple;
	bh=DcnzC15jjmF1MCyU9zIkSIhTwgFm9vccBcmaQItPkJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvuP8Le1LL9Q9Z7mA9pioUOLJ/QjpCbZTyQTqG+PXrbUIVYXuR/PEdu6KDWu7KkYqBd5nZJxEW1YSCb+zXIERUA9nuGNro/MxMk/nG61LT13tNRC8YLnOcs6A7oAADUamS+zZTrpg8lBUDyoz1QhVWzfB4Fxs9aJqjinM79w3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZMb+mZMy; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so5396273276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Mar 2024 04:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709640923; x=1710245723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ5xx2edHD5FMmLecpHNeUGAP2uUzcBfz2t1dwA+19A=;
        b=ZMb+mZMye31AX8BUxTkQi0P/LOw3S6FuUIQ7H0+F39vTNu2l7MQIO85lr2HMZjtB7q
         shpCenLHdBUqe5PMUd8gUAVet5XkbHyovNHZAiRk4tGiJETpKxjNV5DkOHpILzwfC2jc
         X1XQtgUKLgDjmUpDtTtRxmxY9cDxF8nIq1IlzKZGVJ2CLHU4GB0lhNRz0qmKD32llPXg
         MoqBMRQSJywPXHJL+OVSkjVe8hSl537PvR1543TVNgfA3SP+zqSXpJvxuZHLgp1F0Ei+
         nl6JNXv3eesRUmXBx231qvY2wgSZiHX5SKiLiPrJDYf8QQQ8PTpY5NytVWottJ+AofR2
         qZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640923; x=1710245723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ5xx2edHD5FMmLecpHNeUGAP2uUzcBfz2t1dwA+19A=;
        b=xGTBfz22Gv26wEMba4ohanTHLbb+WcOLR2CPGLWbIfVWQRmsu2ZmICr00OKRdYVqSe
         8lvO9ZqNrw7upzE1kWKR0/tLNxWI7+8Y6zU1hPCjR7rYDNdJCImlVg/dneB4mczTPrxv
         dkc4GINv4kaOnI+rnnPvKxfeNmwGymKMYZ3XGZFd7XYlFe6L3hyV2oRUSdOhLdtX71ci
         1hvima9MWWxR4sjyJbJDCRWcdBtMjj75MPybeTEryPq2xQ90EzaOg/mtc8+DSwYOvzxp
         pmX/GrFQ6sahFraAlM9Cs3x8vQ5yJ74iWxem1MljE3RsAEFeJKMl1MD1d56DSxWWm74w
         v0CA==
X-Gm-Message-State: AOJu0YwYxiRfN1qC+ZCO4fBc4gfRGUO6/OlGM/avmy4A+smZ18RahuWd
	cyHZXb1e0Aeecnm9Ku10VhF00Lsup5kGqDC196lWtuou7K9TzVWwami3EzGXa+88dcu7hWv7N4d
	RbgQfF01Ql/erP3WsOO9BLOhb3bY9P91JqB8bbw==
X-Google-Smtp-Source: AGHT+IFRHrlt93okZ8pF8wCozXRKOrxXQZtOR31rF4Oxv2ktk0VBMY0lfxSqY9Tg9+i8KGWI6harXSX+rrTSNtu1DrM=
X-Received: by 2002:a25:b91:0:b0:dc7:46b7:6d67 with SMTP id
 139-20020a250b91000000b00dc746b76d67mr9606155ybl.33.1709640923661; Tue, 05
 Mar 2024 04:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305105623.3379-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240305105623.3379-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Mar 2024 13:14:48 +0100
Message-ID: <CAPDyKFr_GyWVXPbaeLf5hp_SKuRpr9sixhDQxoYBbFEU2qiJ-Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: comment the ERR_PTR usage in this driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 11:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> It is not super obvious why the driver sometimes uses an ERR_PTR for the
> current mrq. Explain why in comments.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/tmio_mmc_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index c253d176db69..93e912afd3ae 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -972,6 +972,7 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                 return;
>         }
>
> +       /* Disallow new mrqs and work handlers to run */
>         host->mrq = ERR_PTR(-EBUSY);
>
>         spin_unlock_irqrestore(&host->lock, flags);
> @@ -1006,8 +1007,9 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                         "%s.%d: IOS interrupted: clk %u, mode %u",
>                         current->comm, task_pid_nr(current),
>                         ios->clock, ios->power_mode);
> -       host->mrq = NULL;
>
> +       /* Ready for new mrqs */
> +       host->mrq = NULL;
>         host->clk_cache = ios->clock;
>
>         mutex_unlock(&host->ios_lock);
> --
> 2.43.0
>

