Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7665BAC4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbiIPLXo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 07:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbiIPLXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 07:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC2D79623
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663327420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
        b=IvXlTPPbpy/1rdfC2iHccqCRbmmDavwtFwITUR5RsXFuPZu8IGwpj+X39ZS9f90+b47Aft
        3wtHq77Lbx6CVIG/hn9Iz4BGl7sLPVo2McTo5Wsakl5OdyhLrcTzeKbN+zHtVcf8XZpwbi
        jjnyslBk0uOc7vo2KYKtCL/QIDkdEIE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-vBf9fcVAPN-yU9HXTA53dA-1; Fri, 16 Sep 2022 07:23:36 -0400
X-MC-Unique: vBf9fcVAPN-yU9HXTA53dA-1
Received: by mail-wr1-f69.google.com with SMTP id d25-20020adf9b99000000b0022adb03aee6so567085wrc.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0ZQH9PFYSxgOPoALsHsE/rErasChde24zrfOYiDyTX0=;
        b=26A16r7rMqY75wd2EjltemqEiQT2Fc+sGmMYcml7tgL1uZSX0Qfd8JR002Es/h4qQX
         CZJ3VCQrPBTseL3vAXXmuqeakL7q7TUR2aXVFz/Waxa3sgXjV3Yq8Z1lWgfS7Nc9+OJx
         TNtaEjIgyS9j9jalmiZY19lTMSG2LZXwPRfcB4arb10e6SjxfjYigvDZ5Mh5RoLTDVtj
         yr1Bo2UK6TDF2OMJppUS0aYweZtkZvrlcArBuLEjrh1E6z4eSMrAOkW3jPBZf6nzLLe9
         27yRI5R4vWg8pf+S6eZGpamONlYofeiQk9bIG+1TmKCakZX6KBfOZf25I4dtY4wK3qTV
         DN+w==
X-Gm-Message-State: ACrzQf19VnihgeK/DUl5OkpWA3Dsx6ncy6E3YsJ0naWrPOCGMN7l2yN/
        BR4yNSYkzeJ3fZBYIgg5+c1cUzuFzuDxnQOn7xN4YQy7huRVPcPwkFDRxiOAovSFiZ1RDo/gCFw
        FtH4MuNVOheI5MNYjv4Zzu4r+0gRHXL0=
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id m5-20020a5d6245000000b002253e24e5b1mr2594336wrv.698.1663327415721;
        Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rSqpUyp7t2tSW+U9ofrvqVJDHxMOvNBeGFF95LaCwlhrl5+FPdJsu1AfyyGVP8rZkzhUPzg==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id m5-20020a5d6245000000b002253e24e5b1mr2594316wrv.698.1663327415543;
        Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b0022a9246c853sm4779510wrr.41.2022.09.16.04.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 04:23:35 -0700 (PDT)
Message-ID: <cf3b577b-c284-867c-8450-b791eb746176@redhat.com>
Date:   Fri, 16 Sep 2022 13:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/4] drm/plane-helper: Warn if atomic drivers call
 non-atomic helpers
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
 <20220909105947.6487-4-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-4-tzimmermann@suse.de>
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
> The plane update and disable helpers are only useful for non-atomic
> drivers. Print a warning if an atomic driver calls them.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

