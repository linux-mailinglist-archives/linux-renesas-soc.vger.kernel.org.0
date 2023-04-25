Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052FD6EEAE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Apr 2023 01:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbjDYXMe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 19:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbjDYXMd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 19:12:33 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3C018BA0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 16:12:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4edc7cc6f46so6828290e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Apr 2023 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682464325; x=1685056325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnlCUsHYv+GW6Jb5eFvfXBx/9n4dlZPF0LLCiXTuzjA=;
        b=XAeCr7CQIIthwaquJAw6kgyfKl1Z/ZE4If1wLhQxO8ySzqfwfv164Omz1UMhMKW6P4
         ZlY0I51pLZw10lYjYHwQVPBkRrahMwL5ZQic0UOlIESFBqPRc1VtbuHu5Ya9uklOhu9K
         siZeX+d5M9MhCEzBlK6ZVt0K1IBIJrt3cTGKUPo4zBSWPNhysZALlG/ak2xyhyVoyBZ6
         2lskHtz8vzozIFkrEPGTsbDAtXih81xBlQNIpOcU5K1oKzq9KZAZ47yFi27raQzqI6rr
         O4JfSr2Kp1PmvcCDPLt/4+Pal9JdkZ9egRW/2Jha/Tg6iovDmBwc9ZqLNORgAHEn/Mq3
         9KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682464325; x=1685056325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnlCUsHYv+GW6Jb5eFvfXBx/9n4dlZPF0LLCiXTuzjA=;
        b=JH5XNSPbmd/0Myf2mpc49H5oplXBon4ZZ/vCzhtke+EMM3eY86Hm00gO5sbENqaybX
         f3eoWrGT8jNoH3UirTp8QZFpyJSrucbx/7RUQeCwzOy2h0grCSlDAv23vdcTCB1/7Qrk
         +7uMxu99ujuUR3yhiv28MEtqfsYfqAfJGALeg5LwozXMjNjyMHeE9e4uda79NtUTDRXs
         fmOeO1uqJIpFYXpeqXrA3TI2B7Qc2Ioq/MUp/dupvjjrjPpPORseD48WIMKl7FSCFl4E
         dERQkHEdDQnv3OFNAf6M/Qy30vLUxOrvkmKM8iGUSrdEplrc54MeAp6jZP5P8IwV0ctC
         Bu+Q==
X-Gm-Message-State: AAQBX9dF4WEiJuaQZWcttWXDYyFavKuSUxjW3Aj1sLCdscrfecMaVol5
        ++h/VUr1kEzcYGz+7EWApD68pw==
X-Google-Smtp-Source: AKy350av3FYt4RiqWvZqDPiRUup7W009PUdsfgLIHczXAGjCl62iUz2J3Uut7VyvH2YCrO4VdnYUEw==
X-Received: by 2002:ac2:4219:0:b0:4db:3e56:55c8 with SMTP id y25-20020ac24219000000b004db3e5655c8mr4802156lfh.59.1682464324873;
        Tue, 25 Apr 2023 16:12:04 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id j20-20020a19f514000000b004efec2462b6sm1350975lfb.101.2023.04.25.16.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 16:12:03 -0700 (PDT)
Date:   Wed, 26 Apr 2023 01:12:02 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-isp: Add support for R-Car V4H
Message-ID: <ZEheQia1H-OHkS8T@oden.dyn.berto.se>
References: <20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

gentle ping on this patch.

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
