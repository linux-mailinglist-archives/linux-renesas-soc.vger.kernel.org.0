Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E8339F795
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 15:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhFHNUU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 09:20:20 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:38418 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbhFHNUG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 09:20:06 -0400
Received: by mail-ua1-f53.google.com with SMTP id d13so10889139uav.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jun 2021 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/G9l7SZvoUdCJxEXjuBblAs730rAEGTbJM8qPA6QnU=;
        b=VgUbGyWA5w4WVmAe9n8s36mYEbTWqRLHWDBYfnzcrwv7u8Q13KXHzmh8sVX93mWvIB
         pDw3LNkobVwjNadgKKbR9ciXt9GJdirirQT3tKqeg3SGMlx74RbbrKY8/gvILsY83QoF
         WIsfKE8y2EWlPIYIYolXxZE4LapDijyU3xDhsE0WwDYN0M8H1W1DeRF3GDgANY6jO1eJ
         emwiO0I8sSUoqmLQdL1sd8aXa1Xw0XxpARyWm1EdzGk+XsIspjT1QnYdE+ob2ulc+tRn
         McoKCBRtA7C2v4JRCnYjPZtOpOhKe/KUm1Zf8k4pL71gd2zYxqYue5fs+LYVSqc2h7Hl
         uXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/G9l7SZvoUdCJxEXjuBblAs730rAEGTbJM8qPA6QnU=;
        b=TA1Y8Tq67yb0ljuYkUoGpPbaWvQwQ4RoUr8OR8vp6zCsj+Gh8ejLtLxUBb93gEW11i
         Pz6O1pHPPOs+5loGB+c3+WysKYiaPsjYYR1GPI0O3IB9w4lXGHawJrHa6LjA4L8VkfuS
         LJInmND9dp3niyyabnbHjqOIWuQ+kUfb4p0aEhHR7Ev0LzBZnE682Oq67FFuzeGCueL9
         Gu+wvnAjjrCncHnszoisOWwiSJGjavTquNeIilhxh3qwTHr5Pue8pMdeY0ifME80UCwz
         YLP8xzwB3kClBdBdq5vnk8ZK900Mf1tTvNCaXZUYS0pPGUExqKzgcubTerG95LJs79HS
         9mDw==
X-Gm-Message-State: AOAM5300OIOiYjyR5jVcuFSS30oM0I1iOOi0y20ZIKLkPxmreewZrtfo
        MoSIZxZ1zWAQqS+GvLOg6CV8jI7wNF4zgFTz3L/KGUDJLbIyVw==
X-Google-Smtp-Source: ABdhPJw6Z7tEwu1v/VB/4p+MORZ0ZMJRvQwsN15C2gwVElhiBFHlbN9EVF81SFiKHxUf9+L9SMq/DikLEI/mGwTxoBc=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr3218881uad.100.1623158216958;
 Tue, 08 Jun 2021 06:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210604104459.7574-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210604104459.7574-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 8 Jun 2021 15:16:20 +0200
Message-ID: <CAPDyKFpX+n1R4fuiS-sVjXyiA392roRjL0th_fpvv3sGGF7h9g@mail.gmail.com>
Subject: Re: [PATCH] mmc: debugfs: add description for module parameter
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 4 Jun 2021 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Make it obvious what this is for.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/core/debugfs.c b/drivers/mmc/core/debugfs.c
> index 9ec84c86c46a..3fdbc801e64a 100644
> --- a/drivers/mmc/core/debugfs.c
> +++ b/drivers/mmc/core/debugfs.c
> @@ -26,6 +26,7 @@
>  static DECLARE_FAULT_ATTR(fail_default_attr);
>  static char *fail_request;
>  module_param(fail_request, charp, 0);
> +MODULE_PARM_DESC(fail_request, "default fault injection attributes");
>
>  #endif /* CONFIG_FAIL_MMC_REQUEST */
>
> --
> 2.30.2
>
