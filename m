Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2969D3484D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238862AbhCXWpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbhCXWpN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:45:13 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19200C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:11 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id o19so267140qvu.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nt2tcO/o4/zlLYQXVM4u2/2lHhJoANdZ4tq344KBt8=;
        b=MEGyYvhbOMsM6iSnFVZApDL7UWms0z+vRSWP0Qx0hVwQxOs1VrXu6oj5npSLF5AUXw
         oxXxsd8SE5DUFN0FnmtM1CGTm1yRT6UY56vhteEshaHmgi73+gc8Vx9pk8pboCIJtQqj
         voO9jIl0DEpxBV502dVcdt5UAmNHVFfdzsG4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nt2tcO/o4/zlLYQXVM4u2/2lHhJoANdZ4tq344KBt8=;
        b=qxDvO0r/aetrAkAM3m1G8uAnLt4+LMzUIPbNBVOUkkFS++xu8d+4uOsSN4B5srFfeg
         0IGrqaJMQc9n4vJrmhI2WADb84aXgzl1HSM2KYfFwzS7hZ5a1iQkW1CzbKmvKOJrC5Vg
         Lyy1lbYhAwRZRPB7znNAe5HWzImGTahYTfGKldbQotPSq/LQqzrai4iwuHMlJrz3Trzs
         7IzQeGP71I+Q5EsKvJuP4fjbtD7NnIb3FMyQS4uTGV3J5rbFGN5WndpS3T+O2z6OTwCY
         oxAJzQe55N5jQRyDPuwTdXNABG7YU4hy1qkAK58sUuVlZR+fOj8D1Rq5UVfEyRqIyz9X
         Ohsw==
X-Gm-Message-State: AOAM530Mlli4f1qRmJ9W9Y2BA8THeVVLGNUPqnmFDjgyDlM4HmGsmCJT
        BQhy1F0iYnsUIolsL1ANtl4OjAHBZWcnqg==
X-Google-Smtp-Source: ABdhPJwHlvYsImEnYpNVJqYINCCBggdp6/0XGTLCZJNiwEilwWBeeXyd7f79Mm8JGk8/sQfY7hGgGQ==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr5460455qvt.60.1616625910089;
        Wed, 24 Mar 2021 15:45:10 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id b22sm2863607qkk.45.2021.03.24.15.45.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:45:09 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id a143so269085ybg.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:09 -0700 (PDT)
X-Received: by 2002:a25:2654:: with SMTP id m81mr8285676ybm.405.1616625909042;
 Wed, 24 Mar 2021 15:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPT=woS51O9B3AGQqrt8wjxCBHXajnThMt_wFqAKE9uQ@mail.gmail.com>
Message-ID: <CAD=FV=WPT=woS51O9B3AGQqrt8wjxCBHXajnThMt_wFqAKE9uQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector
 creation to a function
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> To prepare for making connector creation option, move connector creation
> out of ti_sn_bridge_attach to a separate function.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
