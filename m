Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE54346ACE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 22:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbhCWVJA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 17:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbhCWVIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:08:37 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CF6C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:36 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id y18so15940543qky.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fGp9OGhSFYep+wgICuctJHe6AunYvp6GoDFbNEb/8TM=;
        b=j+5PaN95fKfswhdgD662vrvF8rN4CfNwG0kwHV81OlkvM8XS2H8sc20+r4YTghNet/
         V0wWg+nF1W9hUBEZeCgYjjcdqHm1Fy539xa2f7uEmeWZ7IkAJ/1lPspWn7yLuI81nwHf
         o3jILhpzIInb7kSAYo3jc2GypXixenKdS/mqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fGp9OGhSFYep+wgICuctJHe6AunYvp6GoDFbNEb/8TM=;
        b=jFM0cSZ+5nyyVET0dax74/bhalkAqXZ3d/2eV//r7xf0u9hNr1mhBTW+T8uax6yARM
         cMWCbQ9gM/dA875Nmp9wIiLFpj8UIksHOw79hFLYrtzBzSLwExpAbUqo/y8f41F5fi+M
         +JTazdy2aG+NDP63gAgHsSqlTjn+xUSfweDnjdRlVEnxLrmod9mViHYvvQDc6vkm44Q5
         +vic6uA8JWY9Q6gpm6GZ23jneT1MHotdUVG+1P7JWfG/glRGYpX/UqLPqbz1EFRgd8pY
         AsbyhOe6C592R5iMzOJ/NTt5yK4ENmfQo/7FjUgGqOZ5g7NMQNyypYgxxO2VQ/3i5zLQ
         LzHA==
X-Gm-Message-State: AOAM533p4jDMm3psDXMxHhU5TxZ1Uf+vxvxFaZC7ayFErljz20MspgtJ
        ixWotPCUEkkFqE3wypYdaut+Z0QUhkosFg==
X-Google-Smtp-Source: ABdhPJx7PTNYUY7aPMQb35qbALa2eYLQq4ZO/aVB2DU5iEpMuR6J8S9qIIARrAEggI5ldK2Tzsy9gQ==
X-Received: by 2002:a37:e4e:: with SMTP id 75mr15862qko.54.1616533715781;
        Tue, 23 Mar 2021 14:08:35 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id h16sm76307qto.45.2021.03.23.14.08.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 14:08:35 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id z1so11845258ybf.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:34 -0700 (PDT)
X-Received: by 2002:a25:b443:: with SMTP id c3mr300894ybg.32.1616533714574;
 Tue, 23 Mar 2021 14:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 14:08:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xak21bi5zcoKv9o7aLcJpWsm67U9NzYZ6zJD+UnOOtfw@mail.gmail.com>
Message-ID: <CAD=FV=Xak21bi5zcoKv9o7aLcJpWsm67U9NzYZ6zJD+UnOOtfw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
