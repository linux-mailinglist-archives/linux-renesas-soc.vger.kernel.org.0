Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F05976815A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jul 2023 21:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjG2T2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 29 Jul 2023 15:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjG2T17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Jul 2023 15:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716122680
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690658832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
        b=EPkr81QF15P9S+KJtX8wACNH99zAwJkLzyCz295ALwVIWKw0LgaGcuHwiQUlknX33luAm0
        l0SlHbAUw/4DfdtHlz4J0Zxh14Zsed8TjhiZ/3n0taARoKtKdyrZvWPr25+zLNFOCzMCtm
        53UnIVsLXtxQv8bgKwE17K0iHrqy/EA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-F72202DrMXiI43fjUjqGSQ-1; Sat, 29 Jul 2023 15:27:10 -0400
X-MC-Unique: F72202DrMXiI43fjUjqGSQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-314256aedcbso1650089f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jul 2023 12:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690658829; x=1691263629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
        b=ZM3CXa8JqHN6L6rSGM2OgMDQ1097uhJr1LDNwpltkDlTh2vBkFo6h6Pz24xZ9Ho2Cb
         sUC3VFawis0/wbTHWurLEyK1t2B1t2X3Sba406O3zvR9OSWLuOaYTveXZCwXCg7apaLl
         BUSD1UQzRg2nkOrOrI9We4hOKGIsyKZaD6G5yHnk/rSoaxmCHFoL8RHr7AyiruMHakBf
         hNyjMK9uc94vNJic1mPK2oCv40wGSsFc7s9ZTZy3SWoDXPbg4zq3ZapZq2ZIe+6M4/kC
         cmFNJ//idd7E9KEOC3ROuoG6Vjhab8/hV67EHf00m1DaglluJnqczcw8/J+WosD5TzNA
         rzDA==
X-Gm-Message-State: ABy/qLamM0hoXcATLQ8bq9HOiOBwyAZbBUXUaQ60pX4XLc1WP+9zAdx5
        vbvEzfWtAURbIfXZL1WVxlorn4pAHfe3LG2J7LEBxcY5IZMdShPy6BV00fkX2fzNmFs7/MWWYQy
        uet3itWhvpurshkLd2n2uISOWvAXYvCk=
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id x6-20020adfec06000000b0031759481fe0mr4433295wrn.45.1690658829300;
        Sat, 29 Jul 2023 12:27:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4P4YiFhuI4ynzieVdKtm1Z/PFipBTRtmnhicR2Fu7fVK2AwNkVjGHHEaf2sFTV/ye9YNVSA==
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id x6-20020adfec06000000b0031759481fe0mr4433290wrn.45.1690658828986;
        Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d54c1000000b003176f2d9ce5sm8194584wrv.71.2023.07.29.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ville =?utf-8?B?U3ly?= =?utf-8?B?asOkbMOk?= 
        <ville.syrjala@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm: Atomic modesetting doc and comment
 improvements
In-Reply-To: <cover.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
Date:   Sat, 29 Jul 2023 21:27:08 +0200
Message-ID: <87sf96wmb7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

>         Hi all,
>
> This patch series contains various improvements to the documentation and
> comments related to atomic modesetting.  Hopefully, it will ease the job
> of DRM novice who want to tackle the daunting task of converting a
> legacy DRM driver to atomic modesetting.
>
> Changes compared to v2[1]:
>   - Make main text read correctly when ignoring the footnotes,
>   - Add Reviewed-by.
>
> Changes compared to v1[2]:
>   - Add Reviewed-by,
>   - Drop double space after full stop,
>   - Use footnotes for references,
>   - Remore reference to unconverted virtual HW drivers,
>   - New patch [2/4],
>   - Drop "first part" in drivers/gpu/drm/drm_plane_helper.c.
>
> Thanks for applying!
>
> [1] https://lore.kernel.org/r/cover.1686318012.git.geert+renesas@glider.be
> [2] https://lore.kernel.org/r/cover.1685696114.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (4):
>   drm/todo: Add atomic modesetting references
>   drm/todo: Convert list of fbconv links to footnotes
>   drm: Remove references to removed transitional helpers
>   drm: Fix references to drm_plane_helper_check_state()
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

