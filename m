Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8FF768120
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jul 2023 21:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjG2TAK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jul 2023 15:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG2TAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2023 15:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D6BE7D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690657161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IvO+/WMBr8HColenI9OuzU4QhXQcDCKpmNrQvlBghTs=;
        b=Hqu1kyKSARl7qkDTHsCQS0LCsUY1Pr6rrAxHrRcQyW9TDASeIMdZjj+WB8Bt6BY5xajhIx
        pBdAL9RL8BpyDrRWjk0bcIL7rKtPE/ziaDUhhe34vGHKUfXVKzzdmTnv1Xib4GSGGOoBFq
        s48gBL1VUdvNl03sxLp0BFysiK2ZRT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-BLYyYzECORqUfM5h5nEViw-1; Sat, 29 Jul 2023 14:59:19 -0400
X-MC-Unique: BLYyYzECORqUfM5h5nEViw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fe1521678fso6146775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 11:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690657158; x=1691261958;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvO+/WMBr8HColenI9OuzU4QhXQcDCKpmNrQvlBghTs=;
        b=bcB8zsNqsdR61jfHMMvPSvPHF5jTjZIXC2CtE9veQgXGCbmG708PJ3L9GVb6cjhldA
         lAGS4rjP8OdVW6kxJAsAIo+KibI37OeOFubu8HateGISBujmaCH5k4nkE2+NSykqLhr6
         5ltg3E5AtJk6nEuvxyqgxEYYQBMLk55BOpYyc6y1VyXrLt0YZ2vAp1uPZf4LYOModplm
         lT4chQRks00rhErXw/EXBnCw6YzMaYNgdXz1qNKVJh3meQTtSplPoupkGlHy0UFh6amB
         GB4FIddPmpsALJXzwXvAblQQU8Bd+iuoYV0p/xEzDCULu9rAO0WK6HmO0FUdi8ddC9dh
         0z/w==
X-Gm-Message-State: ABy/qLazpcI5+LVHzdts0t/FNNIN4wVJT6AEkneoTYbwqW9W0SeSSRXc
        5vhUhbeVPjmqtFzvqLE0tnyKK+IISP2fH0ALzaJ2u068aOxJmLy/MYotxnwKoJolY1S9RR+wB3p
        L1c543fSKC1qs0FqM2POdC18yfyaatSg=
X-Received: by 2002:a05:600c:a388:b0:3fb:b008:2003 with SMTP id hn8-20020a05600ca38800b003fbb0082003mr4745717wmb.38.1690657158805;
        Sat, 29 Jul 2023 11:59:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFMSsOTmpZlNxwG0WIVCOABpKQSgEWATeoEszwnUFQT9MVfjwAu8aJ8bSjvP5EsjeJOVAOVwQ==
X-Received: by 2002:a05:600c:a388:b0:3fb:b008:2003 with SMTP id hn8-20020a05600ca38800b003fbb0082003mr4745705wmb.38.1690657158438;
        Sat, 29 Jul 2023 11:59:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o3-20020adfe803000000b003143b7449ffsm4469090wrm.25.2023.07.29.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 11:59:17 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] drm/bridge_connector: Handle
 drm_connector_init_with_ddc() failures
In-Reply-To: <3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be>
References: <3a7e9540d8dc94298d021aa2fb046ae8616ca4dd.1689599701.git.geert+renesas@glider.be>
Date:   Sat, 29 Jul 2023 20:59:17 +0200
Message-ID: <87cz0ay262.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> drm_connector_init_with_ddc() can fail, but the call in
> drm_bridge_connector_init() does not check that.  Fix this by adding
> the missing error handling.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

