Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0DC2AD629
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 13:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgKJM0v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 07:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730086AbgKJM0u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:26:50 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63722C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 04:26:49 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id 128so6905377vso.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2020 04:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bg9l2seJVZ7O7doP72lzXqaBCKK3JjxmLYGn2ZaiXcE=;
        b=hI5Q10IHntEe+TBd+uxnI0cuMODlj3zS83HMI5chgEqkVPHIvrZA5bajZ1jL3JQ62E
         Bsz9VZmPIGh0/aVD8a7lc7ChkAuXhV+UMC3NNKI+7vntCiIbtw1xsTyKM5tnhBcGjw4X
         v6cRCFQOusD/Xm8oS5l2vv9SEM02Ep+NJbFL7vRaZbItkjxk/5Io0+GoR92WoovFuVI+
         GYnCKqesI8xHK8Qync1FzDZkQY4bR5Nlo9v9gMrrav+4JpW4qz4iLyW50CsU/Qnc6vDF
         E+q9gOm9nK0uMJUy82EEWaTsBCMQ7gPd4Sq7XtBjseMCQaBT/v+FQ6ilZd3dKtRV6iZ0
         j5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bg9l2seJVZ7O7doP72lzXqaBCKK3JjxmLYGn2ZaiXcE=;
        b=eFmUGJ2RCcqRlqOVPFJAzBB9ygwojFIAdl9i4ojYdfzqw+Nnp7+KzDBsxSzwIn8Wgn
         T2qxTrQJwfeRbbr8VDfvsz/RaJRW5tF89xmQaZZ7Dm4IYOmicCrAJuIhyCvP/oClUYwv
         OwU+e/ZLY/83xsDghQKd1mqAEqGJggpMElgWmgVVyMmtipiEmbcaQuj/9HNaOiY7DJeC
         wx/GzJcpyN2Kc2TfiCC2wRxcjUpkTW9G07hTQu5S1alHHwpNJGLzu7ZqOlwSHHTcJ6rE
         OCHuD+XAF9apN4qkUdKwfVvDqyZYCyDRCUaxi+I46MiaACC9l1a/Lie2utIBnwEzdXJj
         er0g==
X-Gm-Message-State: AOAM533VKrsFxlqDo2wH4ocQ4Nb39ht/Aub1oozFN2qxu71XINJCZe8V
        bLLpmPE8IhI6+S8ZmUiGaC8ZKedVhFlnYGMv1drD6Q==
X-Google-Smtp-Source: ABdhPJwCzDANDGShOXJKvk1oOOH5z9VQ/+FB3yhI81IbVRvxLSqK721kLxBv0lsbOd5pLzQRi5uOOBXcNbMG43NXCR8=
X-Received: by 2002:a67:310d:: with SMTP id x13mr11578035vsx.19.1605011208686;
 Tue, 10 Nov 2020 04:26:48 -0800 (PST)
MIME-Version: 1.0
References: <1604654730-29914-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1604654730-29914-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Nov 2020 13:26:11 +0100
Message-ID: <CAPDyKFpNrX4SgXbOeUgniy0nBt3-LNCAEijm2EnYmEL-SsEEsA@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: renesas_sdhi_core: Missing tmio_mmc_host_free()
 in renesas_sdhi_remove()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Morimoto <kuninori.morimoto.gx@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 6 Nov 2020 at 10:25, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> The commit 94b110aff867 ("mmc: tmio: add tmio_mmc_host_alloc/free()")
> added tmio_mmc_host_free(), but missed the function calling in
> the sh_mobile_sdhi_remove() at that time. So, fix it. Otherwise,
> we cannot rebind the sdhi/mmc devices when we use aliases of mmc.
>
> Fixes: 94b110aff867 ("mmc: tmio: add tmio_mmc_host_alloc/free()")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 4143141..03c905a 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1160,6 +1160,7 @@ int renesas_sdhi_remove(struct platform_device *pdev)
>
>         tmio_mmc_host_remove(host);
>         renesas_sdhi_clk_disable(host);
> +       tmio_mmc_host_free(host);
>
>         return 0;
>  }
> --
> 2.7.4
>
