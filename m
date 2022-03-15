Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA83C4D9B13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 13:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348218AbiCOMYz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 08:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348225AbiCOMYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 08:24:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3496400
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Mar 2022 05:23:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w7so32655621lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Mar 2022 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhA1GLG+ThfB/ULmckl18KRrtSqi5cj0f38GineTxak=;
        b=y51G4icc4ji6l7k51HpJ89iyZwNNyHpsClgLlHC/jwwgwDLuX2OPguGQPTOKgHk2QM
         Cv0WI5gcT06wLo/E/p+VKAyt88SY9O7pVV632LAT5LwqlZGQarOKMGFFoYzdrw8MFMpz
         VEgLMcHmupLmlzxKs/xVm6el8hYO/nCIVr62nHWIq9ki/BL/z/wW2xHMpb9XJW9hsFkm
         H6jsXaT5+S5mkIdnKDy6ngcDguSZ8P1ufdKp7vzNmEsgoEG+I7cVjJSbdmFRtz9sYci4
         0xy6MSxQMku6+q2ejA3I34WuK1t3jKDYUKiOu5tFNK4mnUhgXYwnPpMATGW+SKPbBZnx
         TZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhA1GLG+ThfB/ULmckl18KRrtSqi5cj0f38GineTxak=;
        b=ANDKmMiB9/l0mhQEQYCEc+EIKy92g5yJhHdiMqFy5pzfRjjHwDdtaoKJtiIcGE4tvE
         d+vJOYTaiscoJBrFqgqtf9JaKujINwOtM1oVsDGZU8b/CuyEij7FnJqu1xovTy6vYYJM
         ah/I3Iiq3HTRKYykSRtH4q6Q9jPCUEx5h1MJfxnGLe2JLqpdKkD9Zt9wLdFOJlgjVV2a
         AwFJzy6Qzs4aA5ezyy2wrP/gRZeMB5SOQnCu708xI6wrCkGRHxr+aKzPU6bvDZSqcBYY
         ksPOsW9k/G6Ea+WgQbqTpL0VH5D+R+Xp0QrHhOUZC77Q3aQzA+OP51ReD7qhwp3uOvHZ
         3+4A==
X-Gm-Message-State: AOAM532Z1PXwqla+ppVqs57x/47yYEJ4tAnohEhFSvXZOre70PJtEzZ6
        1z3ilD/V6VwLMhqz/9Uu2bFU/3oMm2ajYpqlHTFIUYtTadE=
X-Google-Smtp-Source: ABdhPJxJHIfWXy3LM8OaHRF1p8RMdm/xQCST8ulB7KHkdFenSCp4WNueN4WjBKxDCaaLi7gVMKTNr7ysZVYySNpzaJ0=
X-Received: by 2002:a05:6512:308e:b0:448:3826:6d68 with SMTP id
 z14-20020a056512308e00b0044838266d68mr15633990lfd.184.1647347019420; Tue, 15
 Mar 2022 05:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220311140542.5407-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220311140542.5407-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 15 Mar 2022 13:23:03 +0100
Message-ID: <CAPDyKFrX2ca2HiO3d_VBCofv8DM1in1pegJQ5NGXDGUj8PoA-Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove outdated members from host struct
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Fri, 11 Mar 2022 at 15:05, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The wrappers are gone for two years now but they have still pointers
> reserved in the tmio_mmc_host struct. Remove them.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: f22084b662e5 ("mmc: tmio: remove superfluous callback wrappers")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/tmio_mmc.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index f936aad945ce..e754bb3f5c32 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -186,10 +186,6 @@ struct tmio_mmc_host {
>         void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
>         unsigned int (*get_timeout_cycles)(struct tmio_mmc_host *host);
>
> -       void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
> -       void (*hs400_downgrade)(struct tmio_mmc_host *host);
> -       void (*hs400_complete)(struct tmio_mmc_host *host);
> -
>         const struct tmio_mmc_dma_ops *dma_ops;
>  };
>
> --
> 2.30.2
>
