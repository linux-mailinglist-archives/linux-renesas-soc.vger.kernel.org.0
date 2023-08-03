Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCF176ED29
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 16:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234963AbjHCOuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 10:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbjHCOuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 10:50:01 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC981A3;
        Thu,  3 Aug 2023 07:49:59 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1bb954414e8so761108fac.0;
        Thu, 03 Aug 2023 07:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691074199; x=1691678999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8o2tX5+ObWdJ6nPH9CNePm4qsxAob53K7RELoVeQcA=;
        b=ECYRm8PItHnv4tMeHbjSUF7zGYgwsQc8uxJzBOFxHuokYWCE9bNkGEBvXVIVT7XB6/
         Fyh8hNG75nEi0mBV2JbgpJ+UJMDPl95nEP+cWJYrAM94RiQujmOs4rtjCGuTYVbl2bXe
         0rZP2DAG/k4PPlqKjC6FmdrrquuPxiwYdQ8HzGuqyYEXcWDXsVSZW9DAEA9VIVFJ0Q2A
         PamqGd5vsM2XQru5UpREx3k89c7PjGtxlgPEeMpLXDtxNO1tbZpTfSTwFa8MVVCVg1Eu
         54hAx26eJtVGLhsGCRsduVWREEKyc7ZvUDeU4UFcDe5a5ynht/aWAWNaBaWBeibk7g6Q
         95cg==
X-Gm-Message-State: ABy/qLY9XDvHjLS3ej1lOmCyKmnCCKPlruE13k33rWj77IJ2eX2PAvu3
        UTxi6IRH3Y7JU7nNjFeuGDI=
X-Google-Smtp-Source: APBJJlEzux8FpJhYBch1rhVqgW9xKb1hxN0xOLq9Sn0MTKxJutwYgUtXOpMpJkzD3dRTe74oc7/XSA==
X-Received: by 2002:a05:6870:a54a:b0:1be:f311:4a2b with SMTP id p10-20020a056870a54a00b001bef3114a2bmr13225444oal.24.1691074198866;
        Thu, 03 Aug 2023 07:49:58 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:b168:5a8:480e:1a0b? ([2620:15c:211:201:b168:5a8:480e:1a0b])
        by smtp.gmail.com with ESMTPSA id w20-20020a17090a461400b00263dee538b1sm57268pjg.25.2023.08.03.07.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 07:49:58 -0700 (PDT)
Message-ID: <e2dcaed0-961f-9daf-aed9-d5e6cf1b2f61@acm.org>
Date:   Thu, 3 Aug 2023 07:49:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ufs: host: renesas: Fix private allocation
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230803081812.1446282-1-yoshihiro.shimoda.uh@renesas.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230803081812.1446282-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/3/23 01:18, Yoshihiro Shimoda wrote:
> Should use devm_kzalloc() for struct ufs_renesas_priv because
> the .initialized should be false as default.
> 
> Fixes: d69520288efd ("scsi: ufs: ufs-renesas: Add support for Renesas R-Car UFS controller")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/ufs/host/ufs-renesas.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
> index f8a5e79ed3b4..ab0652d8705a 100644
> --- a/drivers/ufs/host/ufs-renesas.c
> +++ b/drivers/ufs/host/ufs-renesas.c
> @@ -359,7 +359,7 @@ static int ufs_renesas_init(struct ufs_hba *hba)
>   {
>   	struct ufs_renesas_priv *priv;
>   
> -	priv = devm_kmalloc(hba->dev, sizeof(*priv), GFP_KERNEL);
> +	priv = devm_kzalloc(hba->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   	ufshcd_set_variant(hba, priv);

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
