Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1482E5BAC55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 13:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiIPLZS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 07:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiIPLZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 07:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7EF760E1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663327501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
        b=dSxU7r7329dN0FoTAdkyh3qUZOU6nG/bqQIxlm5GOkHSGwae/K+/pRdzfuDdqyWbxeJDeF
        k+fV/mIiTJUxgrHwtYqR260lW/izgftwANPTChAyjeqkQL24yc3JUvncaoAPHLJ9t9bAb1
        121T7sBpq4bjW7iI8OcqtWrqsJjPO6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-6W5BE6VRPKC9xjhR1KirSA-1; Fri, 16 Sep 2022 07:25:00 -0400
X-MC-Unique: 6W5BE6VRPKC9xjhR1KirSA-1
Received: by mail-wm1-f71.google.com with SMTP id c3-20020a7bc843000000b003b486fc6a40so6097387wml.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FWT1aNW0ZX4uFyjwmsjPL1bKB9oSfjQTT8f6OZuNFHg=;
        b=tEvK2n4cG8XCFgZD1lGPPcKAe/8TDM3PUj1cK1WcrThopxSL2WJESp+gN6tkNhfwUj
         mlvjve5tTZ4Gjc5xLLug5rOc5KzZ+HszCJ+FowGSjApXEetDKmasi9MabGTBKeCB1ljR
         r1cUobyVZGniP37WzpTfSxCIxKN0Nds6zbJVRpGVYIwegbqw2mhbkOxQL05fbDuXrGyH
         zAZnNzI2rdtv7/tJ5lcaFP1PExFrzrLe1anqcXKP/Yy0dPBX4RqBKek+KtmCn4lHisNk
         qpv5NZmW7Q5xA/SWbpyYC7DDq5oZL7MH+ow0NdsFK1AbQvg1GogWTsn2xo+4mdTgLqVC
         csdg==
X-Gm-Message-State: ACrzQf3bvooibaZCfOXGhVheczm3KXbqqvCFue4oyc6XPrl/mpMIokys
        vu+Ofdq8ZSNHfrx0B2OIG17+pBdeMH/YZv5nTQX0aTCYHeL8tg/PZz8mOijZXD0+sGTJzWjkIiL
        rmjkZbrWkjSH2nMZwFjeRSt+tQNTJHCs=
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id y3-20020a1c4b03000000b003b474d3b4c5mr2953801wma.96.1663327499415;
        Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n/5/jPTh15owYiIdxqtDHEqMzxYlB4BIVX5SyvX66tGS3HAdFaQlivz6iDfYJgd4mjkRCCQ==
X-Received: by 2002:a1c:4b03:0:b0:3b4:74d3:b4c5 with SMTP id y3-20020a1c4b03000000b003b474d3b4c5mr2953782wma.96.1663327499183;
        Fri, 16 Sep 2022 04:24:59 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k2-20020a7bc402000000b003a5c999cd1asm2275331wmi.14.2022.09.16.04.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 04:24:58 -0700 (PDT)
Message-ID: <4d492346-36fc-a230-4112-e182caa158af@redhat.com>
Date:   Fri, 16 Sep 2022 13:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 4/4] drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS
 initializer macro
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
 <20220909105947.6487-5-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-5-tzimmermann@suse.de>
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

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Provide DRM_PLANE_NON_ATOMIC_FUNCS, which initializes plane functions
> of non-atomic drivers to default values. The macro is not supposed to
> be used in new code, but helps with documenting and finding existing
> users.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

