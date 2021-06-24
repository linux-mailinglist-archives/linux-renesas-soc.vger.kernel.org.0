Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF393B2E38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 13:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbhFXL5l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 07:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhFXL5l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 07:57:41 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DE1C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jun 2021 04:55:21 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id l11so3309488pji.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jun 2021 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LP5qyGL6lLEV+WmF5VrpGRPefbIi4rgy7WQpZv7IaO4=;
        b=AYSd+eZKzc7DKWW97mjQKERNeQ7LE36c11XsII75USvemV3iujkK0jtEHDOKpeRTME
         o7CPbmPTVimu+dbtH0CI7DQLNhuHxu15fpTL8/ZJ5JQ6L7jOrRmkj48DhLlERDZm42hD
         JOZmTMS5dzLejIPBbIxCtXtfcch2FFJ1Cqdi0XM9RZB+9nZzY2/K7oo2BwwOTSOkKjpz
         sFSypa4gJb9NhjPfHxdtjpvgFr6gEoA2Pv5USaLQ1uwBXB9RnJRBRqFsXPzAzXM7JTXa
         q/q02QfX7TM0Bq46lnrAjrA8qQ9PpZNdooJc2VdmL/4epbhzeheSaUt8/KO/3rj09q1v
         c/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LP5qyGL6lLEV+WmF5VrpGRPefbIi4rgy7WQpZv7IaO4=;
        b=f3/ctQyp5ExU/splE+p3fHDorbBMqO2JqxqM6npsUgtycmHMY87yoWEYCYdHNEXrj7
         tM4BzogqJG0tZYgRB29oauiXtnRmOW/od2m1gboJt+BqLRKQT9BgDEwTWTKGrioL7pWC
         uDmkTSJ/CRP3pGg/kFjYBlxp5KgXa9zIlCJBebeyLnvmKu67vcBiyn1/lURhab24mdLc
         K77GfSOPI/BTWlJSme8lCkrqOMM/IzGjJeKLTEnqDAuZRnvoFQ2cDJLogfbljtTTvjKF
         5XfNnmMuT4sb0AAXTPo+li6o+JSojwDERXf6VxGMJtBZhnfXzVxeR7gZ5qfPNRg3drSC
         evPg==
X-Gm-Message-State: AOAM530QeOCguT08bgYlnt5rZHbMNbQW6SRnMBHKVSx2tp+IngAmdSYG
        HbHFn4xxJVbrtRqYx6gEOVKgmGowo93ZZZ5ZjEEKzK6EKOmP844P
X-Google-Smtp-Source: ABdhPJxgZ/UPqv4NsSX7Nd4Jx7gr38mLU+61cOm7pjjWPZj3YXGftRlNTL2DFm3VR7wx8IUCuDKUU1O5waV96yZlJA4=
X-Received: by 2002:a17:90a:c394:: with SMTP id h20mr14562236pjt.222.1624535720537;
 Thu, 24 Jun 2021 04:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 24 Jun 2021 13:55:09 +0200
Message-ID: <CAG3jFyvA8E6nBT-RTO6gF-FT1Hh7A6T37FMn5F1WMjGYP10DRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] drm/bridge: ti-sn65dsi86: Misc improvements
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Applied to drm-misc-next

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0715786771f24190b3f2dcdcaf2af263c1ef46eb

On Thu, 24 Jun 2021 at 02:03, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series contains miscellaneous improvements to the
> ti-sn65dsi86 driver, and prepares it for optional connector creation and
> DisplayPort (non-eDP) support.
>
> The patches have been posted previously as part of the "[RFC PATCH
> 00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode" series. The
> last four patches have been left out as discussions are ongoing, this
> series focusses on the base work that has mostly been approved during
> the review of the RFC.
>
> The code has been rebased on top of the latest drm-misc-next, and while
> some changes to the ti-sn65dsi86 driver made conflict resolution
> painful in patch 5/6, there was no big functional conflict.
>
> Laurent Pinchart (6):
>   dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
>   drm/bridge: ti-sn65dsi86: Make enable GPIO optional
>   drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
>   drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
>   drm/bridge: ti-sn65dsi86: Group code in sections
>   drm/bridge: ti-sn65dsi86: Split connector creation to a function
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 703 ++++++++++--------
>  2 files changed, 374 insertions(+), 330 deletions(-)
>
>
> base-commit: 7601d53c2c49e3a7e8150e8cf332b3c17943f75a
> --
> Regards,
>
> Laurent Pinchart
>
