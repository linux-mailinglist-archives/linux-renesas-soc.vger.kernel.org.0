Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756FB41F675
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 22:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhJAUuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 16:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355475AbhJAUuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 16:50:02 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD8BC0613E3
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 13:48:18 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id b16so10222114qtt.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Oct 2021 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fTwGjqOo2qpFUBnSVDlFyolMyzUY3P07s+PYc+sfnxY=;
        b=DoDhvCYRyP3bI52k2WCEwtOJHIoz8ay9LklCmI5z0nlSjdj2gKo5hP9c/Xbp0MpgYa
         QkDbjNuGI1fN3ObZzMb/IffcrHuMfDl1JqpDiziGrymys0Mj0bpC18FoM/SQRJ2yhh+H
         mokkTqv/ZnP32g0hiEA/BcCjek8ynV3GjR40GtWy0/S2DA10ernlOVr5p65Kb0An0xqp
         ZaOOZjGcZtf04Mml416DbxGvTXbpoK3UueGTN5Jdjky0/3POHDtxBxU2PKWtUz0cjVCU
         D9jMXomhHB/OKNZVK51aa82CckJviyHHBn4r+QId2nGXfkZzAme7XSAZs0jtbiyCVQ2n
         AokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fTwGjqOo2qpFUBnSVDlFyolMyzUY3P07s+PYc+sfnxY=;
        b=2RFzTE8Wm802bqfFBzF508fno796lXu4e9A4kmbyEf6a0rr867p13+0IXQIdBvoVGS
         63/t+hTSIhnv+8PViqA9LLZxMsrgfbXt23HyvwQ7pYB1C63AhFZUQJ00C8uyWgM8twpg
         mlN2yzBOiPo9EQGNd600DADZmwS/A1HowupjN28V26wkQD//BpStmMGSkmIxo1oQUSo8
         015tWBpBpD8I5Cf9m8RUXiVbY/OZ3/cBIlxXIvSoLPEaYBML2R1WvsAe2syIX78JV4hz
         CsltKtxa5gu41yr+mE/irODqwln5xwa2tE7qshJ2FCUIgNzGdFjRD6EEhJxWhLvy9lNX
         Xohg==
X-Gm-Message-State: AOAM533hSL8FsYDSZYpLZd4Asp3td6SMlbaN9nqJeIAMLbTk66wK3nay
        r0lPJlt7+Y0jA61P7zZjObbFqw==
X-Google-Smtp-Source: ABdhPJxa6tbnxCBVxCCTZMZ2tB2zzEWn+wtu5XraFB8rYcu4iq9lSU2A8XqbxRaJTOI7W1N9S6DK7A==
X-Received: by 2002:a05:622a:1206:: with SMTP id y6mr82618qtx.68.1633121297387;
        Fri, 01 Oct 2021 13:48:17 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id d16sm3951352qtw.14.2021.10.01.13.48.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 13:48:17 -0700 (PDT)
Date:   Fri, 1 Oct 2021 16:48:15 -0400
From:   Sean Paul <sean@poorly.run>
To:     Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc:     Sean Paul <sean@poorly.run>, Fernando Ramos <greenfoo@u92.eu>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/17] drm: cleanup: Use DRM_MODESET_LOCK_ALL_*
 helpers where possible
Message-ID: <20211001204815.GA2515@art_vandelay>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay>
 <YVda4jNSGuQf50JV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVda4jNSGuQf50JV@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrjälä wrote:
> On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > On Fri, Sep 24, 2021 at 08:43:07AM +0200, Fernando Ramos wrote:
> > > Hi all,
> > > 
> > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > "use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
> > > patch series is about.
> > > 
> > > You will find two types of changes here:
> > > 
> > >   - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
> > >     "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
> > >     already been done in previous commits such as b7ea04d2)
> > > 
> > >   - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
> > >     in the remaining places (as it has already been done in previous commits
> > >     such as 57037094)
> > >     
> > > Most of the changes are straight forward, except for a few cases in the "amd"
> > > and "i915" drivers where some extra dancing was needed to overcome the
> > > limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
> > > once inside the same function (the reason being that the macro expansion
> > > includes *labels*, and you can not have two labels named the same inside one
> > > function)
> > > 
> > > Notice that, even after this patch series, some places remain where
> > > "drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
> > > all inside drm core (which makes sense), except for two (in "amd" and "i915")
> > > which cannot be replaced due to the way they are being used.
> > > 
> > > Changes in v2:
> > > 
> > >   - Fix commit message typo
> > >   - Use the value returned by DRM_MODESET_LOCK_ALL_END when possible
> > >   - Split drm/i915 patch into two simpler ones
> > >   - Remove drm_modeset_(un)lock_all()
> > >   - Fix build problems in non-x86 platforms
> > > 
> > > Fernando Ramos (17):
> > >   drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
> > >   drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm: cleanup: remove drm_modeset_(un)lock_all()
> > >   doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
> > > 
> > 
> > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > with the necessary drm-tip conflict resolutions).
> 
> Ugh. Did anyone actually review the locking changes this does?
> I shot the previous i915 stuff down because the commit messages
> did not address any of it.

I reviewed the set on 9/17, I didn't see your feedback on that thread.

Sean

> 
> -- 
> Ville Syrjälä
> Intel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
