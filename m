Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0761612F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 11:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiKBKrs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Nov 2022 06:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKBKrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Nov 2022 06:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ED720BE8
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Nov 2022 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667386007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iUJvEUx8gtjx3iaw6xY22YZZMkx+Fxj3A7QQSAUB80Y=;
        b=IdsGxcpc/b9eri3/F2vdOUh/cr0GJaUlcfrvfXm5M1ivFv5rIhWx6/D/pKE538YSPP5rTI
        dnD7I+fjmyuhuvWBoCiKKCvwlRz6YgWk+A/vS3qXmahAei/2tst2AFgeuCYRtXXo0TJL7L
        IuJ/qqE+hcToYJ3azmb4wt9N7PXsAw8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-7KHJKW2fMxyjZQmmFsgdVQ-1; Wed, 02 Nov 2022 06:46:46 -0400
X-MC-Unique: 7KHJKW2fMxyjZQmmFsgdVQ-1
Received: by mail-wm1-f70.google.com with SMTP id d13-20020a05600c34cd00b003ce1f62ac5aso921534wmq.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Nov 2022 03:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUJvEUx8gtjx3iaw6xY22YZZMkx+Fxj3A7QQSAUB80Y=;
        b=qlaQZgkRgddRMsmxSj6CJTGqSIBC5ZAMp/zAmqVhItCp3AsTCLr23Lbd+dqqErt+tY
         mHTLp6Ez1EBFguvHMqaUbCFHmvDWAEUL4mEOkdGV04zjBULBFCVDw8Sw1J9h6Fov74OX
         0A+YLK0mEUyYjI9sWaE9VoYWCEHf2M0j0KfxFJB++Q4gcu4u+mOSA1kISthJbM4tU46F
         W2rm6iiIl1hQtUA7kJP5yDAUk1WVf7sy0jTDJfZfjyYYqf0YhFJPdZZyTSBLJktwIbG/
         JPqjCrwKAYdCJ4HzqpELO3LlFKRSag4+Ni4FlouYt2n+iQEKBmHK6ulw/nK/TO40IaUX
         yTOw==
X-Gm-Message-State: ACrzQf192OTKdoG4tBA8eY0ckttm458GdOnKvZvUDkZNRAJOrUgyIZFP
        k2zdIm17PtYzcJ20McKqKzNYSdFachIvzt5KUx45R7mO9pppP2oHITA8YFoFVC2W89l7f5IwDdt
        AnUyWpk1dmYf5IbS/RP/rZSO2Ponctno=
X-Received: by 2002:a05:600c:3556:b0:3ca:771d:701a with SMTP id i22-20020a05600c355600b003ca771d701amr14652026wmq.61.1667386004909;
        Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jzv0egtLEIAVaxEN/tayyZgqvKvq+1qzahuWoTfzpPIfJE04AyAO6MvJnCllXJsp0I0J18w==
X-Received: by 2002:a05:600c:3556:b0:3ca:771d:701a with SMTP id i22-20020a05600c355600b003ca771d701amr14651998wmq.61.1667386004691;
        Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c18-20020a05600c0a5200b003b3365b38f9sm1701531wmq.10.2022.11.02.03.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
Message-ID: <5abf94d6-9a48-525e-c562-605529c5793a@redhat.com>
Date:   Wed, 2 Nov 2022 11:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
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
 <20221024111953.24307-18-tzimmermann@suse.de>
 <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
 <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
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

On 11/2/22 11:33, Thomas Zimmermann wrote:

[...]

>>
>>> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
>>> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
>>> +{
>>
>> [...]
>>
>>> +	/*
>>> +	 * Copy to framebuffer even if we already logged an error. Emulates
>>> +	 * the behavior of the original fbdev implementation.
>>> +	 */
>>> +	ret = write_screen(info, buf, count, pos);
>>> +	if (ret < 0)
>>> +		return ret; /* return last error, if any */
>>> +	else if (!ret)
>>> +		return err; /* return previous error, if any */
>>> +
>>> +	*ppos += ret;
>>> +
>>
>> Should *ppos be incremented even if the previous error is returned?
> 
> Yes. It emulates the original fbdev code at [1]. Further down in that 
> function, the position is being updated even if an error occured. We 
> only return the initial error if no bytes got written.
> 
> It could happen that some userspace program hits to error, but still 
> relies on the output and position being updated. IIRC I even added 
> validation of this behavior to the IGT fbdev tests.  I agree that this 
> is somewhat bogus behavior, but changing it would change long-standing 
> userspace semantics.
>

Thanks for the explanation, feel free then to also add to this patch:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

