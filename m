Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB810343DA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 11:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCVKUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 06:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCVKUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 06:20:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C7EC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 03:20:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w18so18643045edc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JxQycfZl4jSTbGYi2nkecQ4g9I4uNrlUDRaBTHk2Ti0=;
        b=rn6m9hNN8Mz6OqugJhzoo1bEFFx4j4lKoJXSVe+1A6Y6EJcb2PvN1gIVrIPgBYYF+b
         Udb+DaMhSruAfgVQaY8RqZpuqGxhcRs9qjHDX4Aue0DuxGduO2duB6o79fjaOvfbzN7A
         5QJTL5Yxqn/Z4dcUZ7n8CGotsEEXinRaiJj0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JxQycfZl4jSTbGYi2nkecQ4g9I4uNrlUDRaBTHk2Ti0=;
        b=cQHZ6XjPQJCH1KvGyLk0HzaOuyv10U9FKAJp663BBvmvBSEir3Jn5JQw/icpCeo+cu
         HWT79TurL0EQx4GU3McakK6VkC62p/8cN3UBtzE91Z0as0Cpii+cgnOsDec5J0s5JBJy
         Yo4wLwnz1AJ0NGQa4SiGApJ5LMJD+SvLpgDNbKbr5qzWTpHh3vwiZmiH2QThWh0S+jl8
         +5jVjNBXQaxnBKFOEyG9vQdBEJfHKVOxoIG5jL0zi5I1/zmt2icJiHUZSPgOG2gfVgIe
         TtQaqAiytsVwv/8UuxUcVo9tMrgDWmj5uPrWyZpodaPnpkcHyU19nkVZbGI6ScSPLjU7
         lmmA==
X-Gm-Message-State: AOAM530PcaDxIY2GmL8jkiXsqat4RGQHHnHYQczUvOrC63zT8DrRSGaO
        cQ9f6XzCuTk5cTthb4tp6s3Rz3t2cKKb6WC6thaln41hdZY6vUAa
X-Google-Smtp-Source: ABdhPJzBNauWmxsB4JWin1uuFzEirq0q9Gbf5fmcNqM8+uLxgvTBp0nDyl0nhbG36g5UIA6kLEnr1yLEcyj3tiu/NYA=
X-Received: by 2002:a05:6402:22b5:: with SMTP id cx21mr24884079edb.27.1616408409172;
 Mon, 22 Mar 2021 03:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 22 Mar 2021 15:49:57 +0530
Message-ID: <CAMty3ZA58KZNGAv-OUhJv+sV0Hd6uGmVjm0gUXv83CMD8Vwfkw@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 22, 2021 at 8:32 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
