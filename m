Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76E06FCE4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 21:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbjEITJJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 15:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbjEITJH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 15:09:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3232B40E0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 12:08:58 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac7f53ae44so68989231fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 12:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1683659336; x=1686251336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yt5KfNcwqfPOoZbh4G0tprFNP82FtMS+mCj5x/3lqoM=;
        b=py8vpq4m4DgHLkKm3vP5cYjp26ITVSxj9BXSX+YBMkAtUTfEDwZ4FqdgYznUs6hniV
         BundZP82BBtZeljTcqeuB0FoN7XdFMvuladY/ba7eDzKu1llh8a0IWgzyRwNdFi0zEue
         uFNAD+fYYU+sWcnoP4i7/RaITp33GQRVIjVFVzJQSfginCfRyejmHlgROcMVP3psLrcB
         G4+XjXz10XLjYx1ZtUYYnIyEgpd0o29JMQlUqc0xcc8ZfPwG6lCmZKFxDhG/afx6HCwS
         cMgrOhRMvD3zgxTFRZ3Wuu/IlDA8Zkhq0rNjphpTt36dtwRfrX2tq8jLo6j+yIHS6JwY
         57CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659336; x=1686251336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yt5KfNcwqfPOoZbh4G0tprFNP82FtMS+mCj5x/3lqoM=;
        b=gsWAsxy6fUocTZexs7y2ItcURPaeYNrkWRjLkbJ1/qAm6qh7AEB13BsHLwv9uhw5g6
         +jO3qjWqfGct/91V3RglTzSDoPsrLuktrvA78VXnh7ZmZ7sPcbXhjI+jXFVnzy8JVID0
         9/WTbyxDm5msp82ImbarEPrgxdX/ix8JCsjYL29Aw1rlyxkYDBTI2h9INrGr/rGzAzcY
         p8D6l6dpVSWvIpCy+bl+6t6DesinMAhEUsWYR6/GLegDiPgyTvW3kjwyp7F5P3hQfMZf
         j+7DFoTM36kfV4X9pTJVZwrYizBCjZnW01tb8H4onhrmjCc2FrdElPpIVVAfx06kQ+pX
         5C9A==
X-Gm-Message-State: AC+VfDzVgz5TbMmu+e5KwfZptsCyk8TlmMhm+MhePHPg0ainfwe6OApy
        73aV8cWmA1KF1wb4xhlEG6Q9Pg==
X-Google-Smtp-Source: ACHHUZ6SfDbrM+ZFCsW7U0WMeEVFVd1D2dXTh44iWO8snGCslvSIBmIZ6fPHiVimk7EppA1ODc1OGQ==
X-Received: by 2002:a2e:9d97:0:b0:2a9:c61f:dcaf with SMTP id c23-20020a2e9d97000000b002a9c61fdcafmr1158754ljj.33.1683659336440;
        Tue, 09 May 2023 12:08:56 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id j4-20020a2e8004000000b002a8a5afb87csm1669732ljg.20.2023.05.09.12.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:08:55 -0700 (PDT)
Date:   Tue, 9 May 2023 21:08:54 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-isp: Add support for R-Car V4H
Message-ID: <ZFqaRnaMprXcWkTI@oden.dyn.berto.se>
References: <20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

A gentle ping on this patch, the binding was merged in v6.4-rc1.

On 2023-02-11 15:54:36 +0100, Niklas Söderlund wrote:
> Add support for R-Car V4H. The ISP Channel Selector is used to route
> channels to the different VIN modules. The ISP CS found in the V4H is
> very similar to the one found on the V3U.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-isp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 10b3474f93a4..ed9d8ca56730 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -433,6 +433,7 @@ static int risp_probe_resources(struct rcar_isp *isp,
>  
>  static const struct of_device_id risp_of_id_table[] = {
>  	{ .compatible = "renesas,r8a779a0-isp" },
> +	{ .compatible = "renesas,r8a779g0-isp" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, risp_of_id_table);
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund
