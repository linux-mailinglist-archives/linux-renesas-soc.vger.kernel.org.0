Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F36D95B3EEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 20:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiIISjW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 14:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiIISjS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 14:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7396C81B27
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662748756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
        b=DyBMsWysP1OzVl2/wyG1BXtM+Qg24+0DfugbTooXAnYJi4VPLhGCDCXbUPbmVcjq97JgYi
        vMiz2kmn0lgTgX5cSEXoPLTBdg8BS1FYF4qRyXn72lel7PQIC9tXjmkDGz7EJ9yumJKaLt
        p6VwGqAlm6vEwb9uGYSuKXW7vcQB+sI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388--bUP4NaePd-5sKgZ3HaLog-1; Fri, 09 Sep 2022 14:39:14 -0400
X-MC-Unique: -bUP4NaePd-5sKgZ3HaLog-1
Received: by mail-qk1-f200.google.com with SMTP id l15-20020a05620a28cf00b006b46997c070so2186087qkp.20
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EdLhczu0CMi+mDnVz/QrauXucQKKVCzqETWjwaQHd38=;
        b=v757n967/x/g5DKFfl4YMplIEQRmUXzfoXY0iMjRbNpeyZKqItA6qGnJGaF/hGURT5
         d+AuzDZnmagDhdsJ+n9yi4/3Hzn8hFicJZIHH/pIdoPIA3v1MjXhtyaJfetLvkE+LTpK
         /YDBM2GdvAdS729oyLdxlKUfEf+Vc+a8eIUdauY1ZzILTdolZ5W1JjTrPTV84woqrUrZ
         gvMA+R3zbnAWlwP2rIUSD+i7catlMvTJCHSLK8sPHZiRJ3Kloq+s8h+G7MxQEVZpzZlF
         9eeiI8FNwzogo9rxabQLf71I9N3pGJyDj0Zuv8f/Pc3fel4MCgPaXceGMKnGuT51WQHK
         agSw==
X-Gm-Message-State: ACgBeo2hR2mBa7eLyKYwz3obefmUZMIEBYSlsLK5tmxNx/NRnWKh2x0z
        MtWiB3be10pMirpTdMiwO4zcP8Rh2c33VADVG4VD2dUUlunLP6jMhahQD506YW+LS1Nt+9GkQEx
        HBBKyuUAc3CHwapvxh3Uc084RiQB2C00=
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id d9-20020a05620a240900b006bbd417c8b6mr11021733qkn.304.1662748754337;
        Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hJkqeVfTbw7cuxek5gomVvLkSerw4ZzxC0N7zAg5c4TbdTJmbRg/kK4DEJejexdZcRhNvDg==
X-Received: by 2002:a05:620a:2409:b0:6bb:d417:c8b6 with SMTP id d9-20020a05620a240900b006bbd417c8b6mr11021713qkn.304.1662748754013;
        Fri, 09 Sep 2022 11:39:14 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::9e6? ([2600:4040:5c48:e00::9e6])
        by smtp.gmail.com with ESMTPSA id 64-20020a370543000000b006bb619a6a85sm965016qkf.48.2022.09.09.11.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 11:39:11 -0700 (PDT)
Message-ID: <1fb0323d201ef2d9b00fe9bdb65efa97e5bd1e8f.camel@redhat.com>
Subject: Re: [PATCH 0/4] drm/plane: Remove drm_plane_init(), plus other
 cleanups
From:   Lyude Paul <lyude@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Date:   Fri, 09 Sep 2022 14:39:10 -0400
In-Reply-To: <20220909105947.6487-1-tzimmermann@suse.de>
References: <20220909105947.6487-1-tzimmermann@suse.de>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For the nouveau bits on 1, 2 and 4:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-09-09 at 12:59 +0200, Thomas Zimmermann wrote:
> This patchset does cleanups to the plane code, most noteably it removes
> drm_plane_init(). The function is a small wrapper, which can easily be
> inlined into the few callers. Patch #1 fixes this.
> 
> The other clean-up patches #2 to #4 affect plane creation. Modesetting
> helpers and nouveau share some plane-allocation code that can be shared as
> helper function. While the function is already outdated, it's now at least
> well documented. As suggested by Daniel, patch #3 adds a warning to
> non-atomic plane helpers when they are being called from atomic drivers.
> Patch #4 adds an initializer macro for non-atomic plane functions. It
> should not be used in new drivers, but at least documents the current
> practice.
> 
> Tested with nouveau on Nvidia G72 hardware.
> 
> A possible next step would be the inlining of drm_crtc_init() and the
> removal of drm_plane.format_default.
> 
> Thomas Zimmermann (4):
>   drm/plane: Remove drm_plane_init()
>   drm/plane: Allocate planes with drm_universal_plane_alloc()
>   drm/plane-helper: Warn if atomic drivers call non-atomic helpers
>   drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS initializer macro
> 
>  drivers/gpu/drm/drm_modeset_helper.c       | 68 +++++++++------------
>  drivers/gpu/drm/drm_plane.c                | 70 ++++++++++++----------
>  drivers/gpu/drm/drm_plane_helper.c         | 10 ++++
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 45 +++++---------
>  drivers/gpu/drm/nouveau/dispnv04/overlay.c | 13 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  7 ++-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  9 ++-
>  include/drm/drm_plane.h                    | 52 +++++++++++++---
>  include/drm/drm_plane_helper.h             | 12 ++++
>  9 files changed, 162 insertions(+), 124 deletions(-)
> 
> 
> base-commit: f2c3a05d33693ad51996fa7d12d3b2d4b0f372eb
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

