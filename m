Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3E345863
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhCWHOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCWHOb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:14:31 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC05C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:14:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so681100pjb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=o4jQ/HAg2zzn6VXOsLRxOATgDFZomMzaCwsHyYG7+S0=;
        b=Awr0J/TWCAuW1+ZeBWqd9HE2uWSsSki1YqvHdrZyR194nao7xCzhO6TpyU2Wqj6+/l
         LxA1yhbYtkWYvweFxiUGiVqyR8tNUAj08kmAgKuIKvktwnx1djshUMUh1lGoBsHt6esq
         R8gMtAdxsn7lF0OzymWfB/P0X70sA6FYxmMBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=o4jQ/HAg2zzn6VXOsLRxOATgDFZomMzaCwsHyYG7+S0=;
        b=E/JAsjOdzeyfy1Bs3hPihOIlc7xvVsf62C+CjpciGhr6GC4nV0ZFrkoBSRba1q2+ma
         L4Aks5I3UlvIEYcNlG14e2d7WdB9iYH3W4B2ByMzStyADWqrIhluSsvpDNBiL7i+NKl8
         W+QWV/QYYs4z6GnqnN2Soffs/XYRsuJzDEyoKtUS/gV0AvInpMghAyJL5yl9sEgwXUaJ
         Rirl5pJibht88j+tlyrFpyjydU3BJIxlAZA8qhfqIL86gZzh3rnvswCzIxLZzVU8KrVL
         0sjp0ImmM72CEJKy4wDx11/YJSYRnNXjYb7MpvWf8kThirlE7yvKETzSaf8w+oh3qCpn
         2AOQ==
X-Gm-Message-State: AOAM530IU+PJdi5G8jEfLGCck1WHdzawY8aieWx+DwNOEx0EpUoF3ASN
        eiF8GTXDD01NATxMczi2HJu2TgHyz1DBDw==
X-Google-Smtp-Source: ABdhPJy+TA/NcPaSnxnHe/+lxvHzzNKXcLzOmpdTkrfnAfUxmH64ryNFeH7o4IqTuQ0UILyCXIx0Mw==
X-Received: by 2002:a17:90a:b293:: with SMTP id c19mr3142455pjr.193.1616483670308;
        Tue, 23 Mar 2021 00:14:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id y17sm1485194pju.50.2021.03.23.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:14:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 06/11] drm/bridge: ti-sn65dsi86: Group code in sections
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:14:28 -0700
Message-ID: <161648366852.3012082.5399469001009313940@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:23)
> Reorganize the functions in sections, related to connector operations,
> bridge operations, AUX adapter, GPIO controller and probe & remove.
>=20
> This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
> will add more functions, to ensure that the code will stay readable.
>=20
> No functional change intended.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
