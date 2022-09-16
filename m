Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB885BAC06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 13:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiIPLJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 07:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiIPLIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 07:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188D44AD48
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663326047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ZbmxGQFx5NUyXDI3oRsG3PEO6C5R/qvXpxefqzSfSQ=;
        b=h6nhtpHsR8PF9SBjM3Vp3ZFe44rxZo/29icE3pTIBU0m2JNANmJzvx/fOuJjlMuknvwvj8
        wiC+pZbO9H7vwYuvbaJkAQ4Jltcwnx9c25MOQ6FzO4n7Atv3eMCSFr0AsdUGpmnoIHAiIo
        e4+28aiVL0Jaj5XGnK7K5dBGkxIa0o0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-110-syclWnurM_KdrPUBfu-Lew-1; Fri, 16 Sep 2022 07:00:45 -0400
X-MC-Unique: syclWnurM_KdrPUBfu-Lew-1
Received: by mail-wr1-f70.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso380042wra.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2ZbmxGQFx5NUyXDI3oRsG3PEO6C5R/qvXpxefqzSfSQ=;
        b=Sb4wEXBtfeDxlmupNZ76NOSTHlD9fT7A+nQ3YIhbFsKyqGsZoMW0Vl0s/ORTQ1Fno8
         2vvlg41kzR7HwGTkjZHLP4YG6YZ83pVs0aR9ukPhCp0kEfjbPZlbTpwdSBvnzm3gR0rq
         NDlevhqGo1vMsZmURJtyCwUvXb+fG6VhnGm8Z6ze0mba2/+jBfvmHV25hOo13ho82zCQ
         MYdl1hqYchafWXORdqFhjKfWtNVhbKNR7xve8sD/b8L6xFJMbmGGUjzxUHNJFDHG+Wpj
         A3H7CodNZNC8zvbUTU7TDozkdrPcxxqq31fQYxkpisRl3svUxQVpk9JChkauopwYvDrH
         gxrg==
X-Gm-Message-State: ACrzQf1yV2CrDElzW8LpXiQ9F6T9nka6sOFopFPpr7K1YfP2sloOHHRb
        +h0UBu+oWcHK0STO2hZ0oZ7o2ySvLIekknE9v5W8S9XoRihZWMxu5Gp6QPz6/RP+ef/N1MdoreD
        up9bHMvyJAJ686mfGyfmkma1760SqkpI=
X-Received: by 2002:a5d:5848:0:b0:22a:c104:c2f1 with SMTP id i8-20020a5d5848000000b0022ac104c2f1mr2519354wrf.699.1663326044861;
        Fri, 16 Sep 2022 04:00:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43fBOdh9afnK2x5mvyniWJnGPpavwwlgRXAzXhit5u76P4eHdYTeO9LfpPvGZhI/+XXh73Tw==
X-Received: by 2002:a5d:5848:0:b0:22a:c104:c2f1 with SMTP id i8-20020a5d5848000000b0022ac104c2f1mr2519331wrf.699.1663326044582;
        Fri, 16 Sep 2022 04:00:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b14-20020adff90e000000b00225307f43fbsm4772079wrr.44.2022.09.16.04.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 04:00:43 -0700 (PDT)
Message-ID: <e15772ac-5ad5-37a1-9957-0b1f2fc5284c@redhat.com>
Date:   Fri, 16 Sep 2022 13:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] drm/plane: Remove drm_plane_init()
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-2-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Thomas,

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Open-code drm_plane_init() and remove the function from DRM. The
> implementation of drm_plane_init() is a simple wrapper around a call
> to drm_universal_plane_init(), so drivers can just use that instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index 37e63e98cd08..33f29736024a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
>  		break;
>  	}
>  
> -	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
> -			     &nv10_plane_funcs,
> -			     formats, num_formats, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 3 /* both crtc's */,
> +				       &nv10_plane_funcs,
> +				       formats, num_formats, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);

Not only drm_plane_init() doesn't add much value but makes the code
harder to read. Since by calling drm_universal_plane_init() instead,
it's explicit whether the initialized plane is primary or an overlay.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

