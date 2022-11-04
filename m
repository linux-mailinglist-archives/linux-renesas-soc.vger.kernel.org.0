Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F097261949F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbiKDKiw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiKDKid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329D12B19C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667558249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
        b=Rf7Y0x2rmHCJixzVfneytF9Am7S6DScMizsbjl0XclcHjmrS6FPguGpDS21bWKcaSNoWS8
        IU34rB7tm8+HIrkqjlXmm8ygtqUVipefGTYZrcAvIZthEbmZUTNabiOFhO6uRJcm6XHgzx
        1svERowWXKKM5DwNVwy2HP6lQY2ewpE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-oePjR0yANKet3T1GuHh-Bw-1; Fri, 04 Nov 2022 06:37:20 -0400
X-MC-Unique: oePjR0yANKet3T1GuHh-Bw-1
Received: by mail-wm1-f72.google.com with SMTP id v188-20020a1cacc5000000b003cf76c4ae66so4041108wme.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2022 03:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
        b=fwSenAzALl0tqGRy2Km4GuFZMaZ3fRvZzWMMLFPP+VGnmcCWlDQRmMvXo36S6cr2Js
         GS6duhnvUkectqC6XillXwq3rlgdjW3hjv813F7rGbfJrvtIXcc/fo2++RdE+37EvANS
         Qpn277O5CofLy0/4PuOVKYVgewp9ecC/cq9H+AhBcHL13aTPSL85v3iGuSXGSSb2IIFR
         JnbMssvm/kdmjpJCSNrem22FHRxc/8yysH5/OTmkrA3w1lRlSxIwohB9CRxTYiKXmmSw
         nTvNXvGniPVuekIEJNVD5b90T1NsSgh+CVfQf/6YXXiKQxN5MWOC4CWGjcED/3f2rKlt
         PD8g==
X-Gm-Message-State: ACrzQf3jIPtIGusgJJGWHzNEjWq1hykeRx14ah10UHlovw+viaLGFkLf
        rM1BoGgqNKwaAvnkzhhq2+K7wfoqGZtb2kGyf3AVAeB78AC6utodZfg1DOsMukWV1SQenpr8YfV
        1z9flkCojwiwlXhN+rTGSlo5igIzgb9E=
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539608wmb.134.1667558239667;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LKXhwK5qh8ieFEkCSZgi7mblk9sJOfnr0awtpFbS+pIQGNE9IUSRaCOrs9CG3VpGFJY/xjQ==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539569wmb.134.1667558239379;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f15-20020a5d50cf000000b0022e36c1113fsm3031008wrt.13.2022.11.04.03.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 03:37:18 -0700 (PDT)
Message-ID: <ab8358a9-8450-0d49-627f-26afe7ba4f9d@redhat.com>
Date:   Fri, 4 Nov 2022 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 20/23] drm/fb-helper: Set flag in struct drm_fb_helper
 for leaking physical addresses
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-21-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-21-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Uncouple the parameter drm_leak_fbdev_smem from the implementation by
> setting a flag in struct drm_fb_helper. This will help to move the
> generic fbdev emulation into its own source file, while keeping the
> parameter in drm_fb_helper.c. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

