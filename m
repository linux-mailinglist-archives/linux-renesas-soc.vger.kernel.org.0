Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B0B617C09
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 12:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiKCL6B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 07:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbiKCL57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 07:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFFEDF6D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667476620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xUsslBgfioG7+iWyattqFfLmG0F1gkOA/LUNlKDCuUE=;
        b=AA+v/mC3NlIRz9QI9wTP9DqGSbJdMpHkdWxm0LzyQhkjUcTVUff9e5gjdFl5rr5ofdDpOw
        2z5KN5HVw00vls0CZcJNo37z9mZbMyUW4rx1kUKQqkgi3plIP83OA6Y1N56q1ZudCtg5GG
        ub5aLO/HyFPmaC+9C4g8wVV3axN6K/U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-Frj-PYHEN3qLN-jCkC-Rqw-1; Thu, 03 Nov 2022 07:56:59 -0400
X-MC-Unique: Frj-PYHEN3qLN-jCkC-Rqw-1
Received: by mail-wr1-f71.google.com with SMTP id i14-20020adfa50e000000b0023652707418so408878wrb.20
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2022 04:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUsslBgfioG7+iWyattqFfLmG0F1gkOA/LUNlKDCuUE=;
        b=jwdfz6XEzY3GkEN+IONE58znc4+8VAiV68brxt01vVjJZXtWtBHg5hh3D645kHSA4Z
         1CaWju3abMf4nSm6MTHKIhOhlAndZ/LnmBLgIuSsReT899+t/nanggl1k/2JVsn2rFCH
         ICYi3CqeZrDOdGiH+h0RhC/vcAkKENCVAFfCgn/zzX9iVwpU0h+CkHKdmFz9HFrDE/bq
         om0OFKGwnDWqeUA51tGd3CFNbQmttFQBsteFvzCQSyxIZirvNK+ig1vFCFrJhlGBjfaU
         jVomWt9MgwhwB6b9AqZHGPza+jId/OgKrI027d1Y1IVhfOuIpA3SMhMi39WLp/e0Leu3
         SWZQ==
X-Gm-Message-State: ACrzQf27Seu9fTUWkjQR4MoCRt02EBra7ZA9rpeUtyOY3/jMbcpZfaza
        yHnGPgDiGYub0iYqRCR+sj0JLDjnd1QPzTBqs/QP89lUchylmkD88Vu6LQfo08WIXrsvYnw1Xey
        t3+lcPbdRJKobXEvM0GqOuMXi0KxURW4=
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id ja3-20020a05600c556300b003cf857e18c0mr6148483wmb.24.1667476618220;
        Thu, 03 Nov 2022 04:56:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jlojoGO8BlWc+DQVkk3s3r1Mp7Cu2UjhVDtTHUEWmRy034Ohm8DlDf7vSROFbjktagpDy0w==
X-Received: by 2002:a05:600c:5563:b0:3cf:857e:18c0 with SMTP id ja3-20020a05600c556300b003cf857e18c0mr6148473wmb.24.1667476617980;
        Thu, 03 Nov 2022 04:56:57 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l12-20020a1c790c000000b003c5571c27a1sm1145704wme.32.2022.11.03.04.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 04:56:57 -0700 (PDT)
Message-ID: <88d5165b-1825-3a71-c8c0-dd5a99cd8bf6@redhat.com>
Date:   Thu, 3 Nov 2022 12:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
 <166747314442.3962897.9754510086268412956@Monstersaurus>
 <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
In-Reply-To: <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/3/22 12:53, Javier Martinez Canillas wrote:

[...]

>>
> 
> What this Kconfig expression is saying is that it depends on DRM_RCAR_MIPI_DSI=y
> if DRM_RCAR_DU=y and DRM_RCAR_MIPI_DSI=m if DRM_RCAR_DU=m. But that the it can

It should had been s/and/or here but you get the idea.

> also be satisfied if is not set DRM_RCAR_MIPI_DSI.
> 
> This is usually used to make sure that you don't end with a configuration where
> DRM_RCAR_MIPI_DSI=y and DRM_RCAR_DU=m or DRM_RCAR_MIPI_DSI=m and DRM_RCAR_DU=y.
> 
> Randy, I think that it's more idiomatic though to it express as following:
> 
> depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

