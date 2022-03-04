Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2344CD924
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 17:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240524AbiCDQcC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 11:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbiCDQcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 11:32:01 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AE41CBAAC
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:31:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id s1so11405649edd.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Mar 2022 08:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kipyyfQhII/lUc7ysFVEiW0FpeN/L7xlD0io3E8wlvc=;
        b=V9VXpoR2CA3L+SEaFUZyvVoeyi/77ttHxWBlqvxLVMmPTjoYR/nKzSOkXUSlRFawnH
         SUWqu7YOXW9wdIjUgiRAmaJXZDwLokkfZ19LAfe5+A5R7Y0l4IQWKyO/T7HW2uT5KIoS
         +IIi0cc+vsdq4W/QrEKG3xPPXJ5ATrszY1WkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kipyyfQhII/lUc7ysFVEiW0FpeN/L7xlD0io3E8wlvc=;
        b=hwW6QuyTe5ZUOHNtTwv8TM15nHXY+v9fWCD/C85yAii0pJYE64+lSX2qGZHP9Z3VHE
         76ioMWrcanzYmJD9kinD7erx7YUDyygQGZbpkJeUdZ09DRzL/c6KRpmgn8QwS76mf7u5
         pth9X0bDiG3NxtkSjQMXANiHOgs66PBYUHRJWLI2tRwPYjGXgTFItB63da8TJaCD2D4s
         UhwNpYM1ZkRq/MrQju0xb/LMMiniA9hF6mBKOPfCRR9OlASEur0hEb3RtvrRLvh1SR4I
         59YXQVfRvAMvX6eZlMxJLjftzci/93bIa1QsbHnYnKD6GPHTHGi8bKqhecPrtOMbFXUJ
         n8uA==
X-Gm-Message-State: AOAM531mlZ5zQwckVpVwxQcGjPTofTVyMaTnUmwehqvO5dUMVGmYgQZI
        CzLTbx0ivCK+oULacZ91tz8Jw9kDyFtircKv
X-Google-Smtp-Source: ABdhPJy2rL80Pd0YbUQocD3aeUTAVySPtJGc0lF4CGXIHtXxEyOBbRhnKBR9hQkhPbGSPlAe/+18aw==
X-Received: by 2002:a05:6402:40d0:b0:415:db98:c263 with SMTP id z16-20020a05640240d000b00415db98c263mr8647538edb.82.1646411471582;
        Fri, 04 Mar 2022 08:31:11 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090657c300b006d01de78926sm1933667ejr.22.2022.03.04.08.31.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 08:31:10 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id n33-20020a05600c3ba100b003832caf7f3aso4252717wms.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Mar 2022 08:31:09 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr8416576wmh.73.1646411469246; Fri, 04 Mar
 2022 08:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com> <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
 <164563818901.4066078.3221991328451321918@Monstersaurus> <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
 <164640875638.4039516.894310137608889285@Monstersaurus>
In-Reply-To: <164640875638.4039516.894310137608889285@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Mar 2022 08:30:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WC09+-H+pFTgxFHa8B+fqMkJPO0Jm81FLJiu6+PeNn7w@mail.gmail.com>
Message-ID: <CAD=FV=WC09+-H+pFTgxFHa8B+fqMkJPO0Jm81FLJiu6+PeNn7w@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Fri, Mar 4, 2022 at 7:46 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> > > What about:
> > >
> > >         pdata->no_hpd = of_property_read_bool(np, "no-hpd");
> > >         if (panel && !pdata->no_hpd) {
> > >                 DRM_ERROR("Panels will not function with HPD. Enforcing no-hpd\n");
> > >                 pdata->no_hpd = true;
> > >         }
> > >
> > > That leaves it still optional to DP connectors, but enforced on eDP?
> >
> > Yeah, that's fine with me. Nits would be to use "warn" instead of
> > "error" since this isn't fatal and use the non-SHOUTING versions of
> > the prints since the SHOUTING versions are deprecated.
>
> Could you clarify this please? The whole driver uses DRM_ERROR style. Is
> there a new debug macro somewhere?

Mostly looking at commit 306589856399 ("drm/print: Add deprecation
notes to DRM_...() functions"), which I added a few months ago.
Despite the fact that I added the documentation, though, I'm not the
one driving the transition away from the SHOUTing versions. If you
look through history you can see this is driven by more senior DRM
people.

IMO it's fine to transition slowly to the new non-shouting versions
and it doesn't bother me to have some code in a file using the old
SHOUTing versions and some using the newer functions. Basically for
new code or when we're touching code anyway we do the transition then.
That being said, if you want to

-Doug
