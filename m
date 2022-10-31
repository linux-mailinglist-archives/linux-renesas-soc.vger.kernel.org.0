Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF7613627
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Oct 2022 13:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiJaMYv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Oct 2022 08:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiJaMYv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2022 08:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFB5F031
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667219003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
        b=OXxETfR4g8DTtsYOgeAYKp+EQgjNGaqLLCMi4dhrYZ+lPfcfdS5h5O8mwAFhR877yun0Zf
        nn2XbQOGwj8SjrqEVIoXsAliYDbiWm27JjHNCKViA/plFCtoSisI7Dw8DPfoOt6SWLCrcj
        xhNghWqsLn4MotOmVecD81rNWnwv9F8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-cXa0GF-PM6SSoAO2kG0pfQ-1; Mon, 31 Oct 2022 08:23:19 -0400
X-MC-Unique: cXa0GF-PM6SSoAO2kG0pfQ-1
Received: by mail-wm1-f69.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso5233954wmb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Oct 2022 05:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
        b=M6NTyj3mO7/zLGC+Yu419H7ZacZCkT+bPl0CL4K7qP3y4kieW31/GsW46/l5rgkR8t
         gVrGXFVhgU8rQwOJjA9HjtQZ/cj6Ek5nBg44GqTjwtRc8NktNcu960745gnh7CpPjyN9
         TPu4L0cpmO4EYU+TtqYs1WOD3NxjQW/SfEi8ffRq57rupinpmSIL2CBhv1M7Ios2la24
         pMh+NnKQi11H9ybVSA/4igIeXrbih61jDwhzvkfNdfkhjxcI8USCl2qoeqj1BrV6UNsB
         5WA2IIER4wnSuxCrev8xcwHkwCze14wPtjHwcA980+e9QkBsYWsogQ0O4z8aD1w5RtK3
         xuSA==
X-Gm-Message-State: ACrzQf3276HiNjItuxbKYtJIQt8opP1rFkN00Rb6ubXKVylQQZDFq0cl
        b2BFwUny8sVrS/i6L3vCGj5gKhf2oj3B+spQcpYDbZQ7QoROPtQ5lvXw4gvegpV/yXVwLVuG4IZ
        gJn8F4atyu1GvvAggW/C4Ok0Csgc8SDc=
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582880wrc.205.1667218998716;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7e34dAcxvP3Vi0CwbwP1YeMi235O6q6VyKCYvEf93eDT38FEWiyAv5s+MTc8QNv7Bgz3ny/w==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr7582855wrc.205.1667218998538;
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id ci8-20020a5d5d88000000b0023662245d3csm7011927wrb.95.2022.10.31.05.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Message-ID: <63a804b4-ab2c-f5b7-73b5-edefdeff038e@redhat.com>
Date:   Mon, 31 Oct 2022 13:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 11/21] drm/fb-helper: Cleanup include statements in
 header file
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-12-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-12-tzimmermann@suse.de>
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Only include what we have to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

