Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003E5EA132
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 17:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfJ3P7S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Oct 2019 11:59:18 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:32969 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbfJ3P5b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 11:57:31 -0400
Received: by mail-vk1-f195.google.com with SMTP id p68so610277vkd.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2019 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJeQS9cFeGl1OPSSl6cPS0WOzk7e89rbPQpCN40pRm4=;
        b=mo1Ke15458v/vlvhjBXcmWHlSfc7pqPA7K38Pbo+8VtoaUcrWE1z6EHBDJG+096Gyp
         Z21AqErrPKNDAlc6XNJCZBKhaZi0UJoPkSCJJx92vLPauys7MOe+Q6BnX8+0VqPOm8Qp
         Y878FL6Aa5z+2w2CESN6cvHxxGiv3/MdI/m36jumjIjzS5Xg8wxzgAHZYg4Puefdo4dT
         gdJLuEWpBBzHo5Fx4KUeqSZreK836lUWLIYyX0nB4gD9xeV5yFXKcbr36eSo3nZsYJuL
         dtaWLTXbSllV84m/yULlfhSMnksqPYJOsgQneVjKKJRlOjiWc7UXO0t2cLUi/Al3vefC
         wC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJeQS9cFeGl1OPSSl6cPS0WOzk7e89rbPQpCN40pRm4=;
        b=K7zyCYAvpISB1IvDPrPleoBmJNQ+3OKKmcQpzL1ZS6gHZSbSrmmhuVPhmx8VOjjhYo
         aT3YQHvaJ1uM1DAy4EivRIMYen5gOV2W4zOXVXJfaPKVewi4owANAo53hEo1ARv0/TT7
         tDvXWiZTSyu06/0S4MB2WnShr6EuYShoBwrUWDkxyQyE5AGAS+tnkes/SIHh2Nlr/IzO
         Vac3F8sS8Pf19gVKujXNp8dEJ8TgUxaxOp9cN/1lktUsJLvRmM0tdulNJ65upRYtOuYx
         7+bn+B+u2hNF9zPo+N9GAlPkECMjBGzne4EE6GQClPdGl/jMrRVz7aqT9jUbKD/08gYT
         FehQ==
X-Gm-Message-State: APjAAAXSPkgB3DOBvnFw9zxFIhcscC3Xmu3PVwHB031Nd78FeoEvg37U
        3c9PI2yYwF9u1Chr8y3lRosw+sOA+LIaqO3kwWv8cA==
X-Google-Smtp-Source: APXvYqwXf+9b2dlOFi2XWNYH+wHUypr7rezsWHjr1zgOe7uguG/zo+9y/AtodCpKvf0rggo+VpvTzzgQzhHJmZYD82U=
X-Received: by 2002:a1f:2f51:: with SMTP id v78mr15068742vkv.101.1572451050456;
 Wed, 30 Oct 2019 08:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 30 Oct 2019 16:56:54 +0100
Message-ID: <CAPDyKFrHbytKUeGkT0sVAmhcgc65x4miv+cLgMLj7jDcGzJxUg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Sep 2019 at 08:49, Biju Das <biju.das@bp.renesas.com> wrote:
>
> This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 751fe91..7c6020e 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -308,6 +308,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         /* generic ones */
>         { .soc_id = "r8a774a1" },
> +       { .soc_id = "r8a774b1" },
>         { .soc_id = "r8a774c0" },
>         { .soc_id = "r8a77470" },
>         { .soc_id = "r8a7795" },
> --
> 2.7.4
>
