Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EC96D08B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 16:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbjC3Otk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 10:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbjC3Otj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 10:49:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33ACDA24B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 07:49:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g17so24870834lfv.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680187774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VU/9sR2Gn6BU0Gika4QeRGZssdzpgS/xpjDgT6yVGt8=;
        b=luOdiIo4Hx8rQKdQNf+nnvmIW9CweZ8RDJ5Jb++wUXig7hQudRu89S9OUo8FbwySda
         VBl+PZx4OiHHlLkQ0xBTfPJrGdqjznpx/U71d4EqI+QemMXlzX+hpDm70gMXIutJemBR
         NOJcFa8oE89KYB+oFrkuvf/oAObHivm6EJJSRvgeXVRY0lFJjzLo3j1QHW60QAnja08T
         jC6GKtX8NClEoulTUtcmEORMlgZWy4m0QUxOxr3sMbhx9FpAvEic1VlNU6Ojg35LW7W8
         KuHtaz2fWUpWXov0uAy2tA270HEoASEbwpGUE604JU8kPEy8ZpoF69VbFKsz0XezrPN+
         z6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VU/9sR2Gn6BU0Gika4QeRGZssdzpgS/xpjDgT6yVGt8=;
        b=YrU4gy9UIwsCIeHgzfSjOV/Sc6r5M9q8utf88L+lUV4r5rBeJN9vggkPwIyC0Wj8TH
         G9gPqumuieEyckJXnsOyEqg8vqnxX52sAny+zt/lF19zLAlHbJDWsEbYB3AKl5JeCEsH
         kou4iRzFYOlqkK9BTIj+y4wilxlPiYbvkb+e4qfHmNzeCzOHGbrvRJAp/gixOiZbMkRb
         Ib3VSb7lDNM1GaZat2XCdHIgzUZmQAhpm/uUtZvlKNVJ/t/Q4V/88ccmdtmnYf+yMiZU
         8R+5lptcS4Qur4mrcSAFwVm5Dv1pc+Bd41oVOI3btew8leOeU+ttyeJar1pm9l+R3DRg
         HGag==
X-Gm-Message-State: AAQBX9fftB3ZcjBada2KzgpvXdSaFgpR9fdxmZ0yWYtquewY9PVQGJEv
        gDPQSCxr2v9t34OoNHok7HJQj585RdFGXPgjbI0WvA==
X-Google-Smtp-Source: AKy350YfuNaarH6edh1TVcm+uvVLdWvJ8mJR+9Ed3cqC+YFNN8IGmFsat1TRuB1TEHeVt0QaXZK0Rg==
X-Received: by 2002:a05:6512:486:b0:4d8:71dd:5c5e with SMTP id v6-20020a056512048600b004d871dd5c5emr6852197lfq.37.1680187774095;
        Thu, 30 Mar 2023 07:49:34 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id r28-20020ac252bc000000b004e9cad1cd7csm4835115lfm.229.2023.03.30.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:49:33 -0700 (PDT)
Date:   Thu, 30 Mar 2023 16:49:33 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Select correct interrupt mode for
 V4L2_FIELD_ALTERNATE
Message-ID: <ZCWhfYCUz2ISG+Ac@oden.dyn.berto.se>
References: <20230211205534.493789-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211205534.493789-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

Gentle ping on this patch.

On 2023-02-11 21:55:34 +0100, Niklas Söderlund wrote:
> When adding proper support for V4L2_FIELD_ALTERNATE it was missed that
> this field format should trigger an interrupt for each field, not just
> for the whole frame. Fix this by marking it as progressive in the
> capture setup, which will then select the correct interrupt mode.
> 
> Tested on both Gen2 and Gen3 with the result of a doubling of the frame
> rate for V4L2_FIELD_ALTERNATE. From a PAL video source the frame rate is
> now 50, which is expected for alternate field capture.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 23598e22adc7..2a77353f10b5 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -728,12 +728,10 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case V4L2_FIELD_SEQ_TB:
>  	case V4L2_FIELD_SEQ_BT:
>  	case V4L2_FIELD_NONE:
> +	case V4L2_FIELD_ALTERNATE:
>  		vnmc = VNMC_IM_ODD_EVEN;
>  		progressive = true;
>  		break;
> -	case V4L2_FIELD_ALTERNATE:
> -		vnmc = VNMC_IM_ODD_EVEN;
> -		break;
>  	default:
>  		vnmc = VNMC_IM_ODD;
>  		break;
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund
