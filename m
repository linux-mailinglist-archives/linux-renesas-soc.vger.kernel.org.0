Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18D43E89BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 07:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhHKF05 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 01:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhHKF05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 01:26:57 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727D2C061765
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 22:26:34 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso370209oot.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Aug 2021 22:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jKw0GFQ6ES1SXq7f3K/KZLMXlxNSWW1xnzU/Bn2f5/U=;
        b=oQglrCuBdilvHbZV6KUJUzMJ3zfGeJpnr+USDtU7GzXcNH9zYQ5E/abys4BpNU6qmI
         nDMndzuYQNIZ891UVmMRHcnnLGpXbW2QK/XzoahnCunjGkoJL+JNU1dm5xFBgjJjryzl
         F2HTsGbGYGW+M5iDuPg8o1bV6G1IKGnHufPUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jKw0GFQ6ES1SXq7f3K/KZLMXlxNSWW1xnzU/Bn2f5/U=;
        b=K+EB4pqFNuBkD6Wl8kchPSM1E+NGHtLi5uJ6RvqeyJ3ezYLvLUVISKERf02Pqr4fUX
         U+Dtz9qZ7RoJTRzulJGOXKg1dp0Ojz8gxYfUOfE4V8OjCwqq/9LZfEbSbP+rFjh0VHwe
         4a/SYSb7X45x1jt1BKkwbE387kJSuksoFqODMSxEPVRzYYcUOpUTWGyCci9r94/5qN2N
         OrTumQUlr9nojrQlZpJqTFXd20QY6AAjtsI3ITxWrCrxLWZguMjav4rDTIR5t8t/2wc6
         +sa2RUB+q8VRgsKxqo6IElKBJvYF6a5FHkBfYN7HkHWMQLqkp0PZXIIHZOSpcHQRlpBG
         yjMQ==
X-Gm-Message-State: AOAM533yw8wCRs+Bma3Piy+5Y9Ubpww/Fm26HFNiO0wlq9kX/+kaloBa
        mvaKWz9vj+DdbprGCrDMQzdTHCvlsAPS62H1uGrTaA==
X-Google-Smtp-Source: ABdhPJxodrz0DuJFGpejWPyD/CG1hN1z7rUNEXCtuHnaaSzfGEoDRmUwje3DWqyQLr9U6pCrk+syW4tO5VWwCAajHMI=
X-Received: by 2002:a4a:96e1:: with SMTP id t30mr20991495ooi.16.1628659593721;
 Tue, 10 Aug 2021 22:26:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 22:26:33 -0700
MIME-Version: 1.0
In-Reply-To: <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com> <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 22:26:33 -0700
Message-ID: <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org, robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-06-23 17:03:02)
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

With this patch applied I get two eDP devices on Lazor sc7180 (it is the
arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
looking for more info). As far as I can tell, we should only have one
eDP device on the board, for the bridge.

localhost ~ # ls -l /sys/class/drm/card1-eDP*
lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
