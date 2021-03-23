Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FC2346AD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 22:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhCWVJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 17:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbhCWVIo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:08:44 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4228DC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:44 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id c3so15955345qkc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bhxntC2kCWiXUcljK6XjLqn3ZyM1P9GZ6GZxVZPSLkc=;
        b=ISL5uaEpK/mtGEUnqfo26+gWCytbo2jzykYIzpcyEfjcO2M2Vf8DgJK+LmF5jLKcTS
         Dn5cc2X9PHWyt/wq3Hu0/LIp6socNPT4rfDKLOUYWki7K6UWoRDUPQ6fVkSME/GnXD4e
         MPeD6Zu3RWlv/nDBf8ZOOy2uyUSLM4pt154+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bhxntC2kCWiXUcljK6XjLqn3ZyM1P9GZ6GZxVZPSLkc=;
        b=BResxS9w3TwiEedbD+lR2JYi+uk1ub4rlRQ+vi61T7/DCJ9Uj/fkMePSW39IhtXtp/
         LvRJnXPM/SBAjBhZNF9a3t45bXYVUdAUry6WNHCf6YDK94BPHlvykYZRh6KD8jAZQUyA
         t5Zlv5YcDeS3+YTZLlNG/koSFCse23UlBkYr9KOqSDUW/t5AtZAZw2CZpfVxOWDuxmzn
         cSapCpEThapjMia0r7okTnz/I+9H+mZo/ei0OTvCmwkZqGQqDtUmwMnT3UGPKlHqf12s
         VMrITE9jBkN6j37i5W2xMoE78BO2BolBU2Y8ZRsns35hp1NyUYNz4PCgnM3sRO+I9ZI3
         m/GA==
X-Gm-Message-State: AOAM531grTt7wIyBaMCP4eIcF26CSFbMGAR9Hc2nPKHtmOtf1LePEsCU
        3T8RLPKRzak/i6iXcqX6IVBerTJXmOvmVw==
X-Google-Smtp-Source: ABdhPJwxEVrTjxNvBlKcvEhprO30zpOtX4JAX2ij2VBDh2fH27zy8QZNvB3WQULjXAGmbIBH4mGSJA==
X-Received: by 2002:a05:620a:718:: with SMTP id 24mr7511661qkc.121.1616533723240;
        Tue, 23 Mar 2021 14:08:43 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id h13sm89259qtn.26.2021.03.23.14.08.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x189so4498582ybg.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
X-Received: by 2002:a25:3741:: with SMTP id e62mr193674yba.343.1616533722144;
 Tue, 23 Mar 2021 14:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 14:08:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmBVmy_B5HM7M6LsKfKNWhzDthK_6RFc2vT6+TPUSmGw@mail.gmail.com>
Message-ID: <CAD=FV=UmBVmy_B5HM7M6LsKfKNWhzDthK_6RFc2vT6+TPUSmGw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
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
> The enable signal may not be controllable by the kernel. Make it
> optional.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
