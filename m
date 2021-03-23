Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8E834586B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCWHQK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhCWHPu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:15:50 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F383C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:15:50 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m7so10777590pgj.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=n9dAeyLNAQM1DR9JWXFsA91zKjf2FCCWvKSDEYq/hpQ=;
        b=n7UoauAu4Xeijdwod1hTKv/5+txQuO2VfiD6VWCwqva0bQfiwVCCr09WOlyL6Cr4LT
         1miVQyUcI7BmWnD+d6lVVHuNRSfc/PJybw+ulJKbhUrSbhc8jhy4rUXhG6AOsKxZbWco
         3G/u377DrsG/giFZW58YEprUCgKJAakBLVRWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=n9dAeyLNAQM1DR9JWXFsA91zKjf2FCCWvKSDEYq/hpQ=;
        b=Ej0DPZFon2wg5mxlH8OP6RUIWgdfseUfeUQhvRE2gMs9n3KK8kslQvlhMs+Xu8Nqen
         bUEwvdBHxLgcYOfRrCL0zO9nZBml89NqWu4S9u9ozCaGI48nV5aLIs2YPVtlOL3+LHqD
         08Say4qIX0HXtfUXHS9UdY5mLh95M2gpahABfHvpSptc565dwQ2uQPL+mHyTPK+U8OMY
         JAKOYb4DFwi1IJaEYijwtDTbaORhhidKWalDerK+GJF/XmbeSuQh0KOw5L/KlY1GN6K7
         0KGB39AwlXauC5acEP8fKls3iEeYt/OdDYYzSpqZJBbsR8FqV5EZT6JUjnSt6zuVQ2cn
         hkmQ==
X-Gm-Message-State: AOAM533s2JYeKbKmobUowREy1cP/NhWNDDId94tAclCX7cfEAYzXBJQa
        ItJCE7H8jwqX54Zk95pgHmDd/xpdvh3FxQ==
X-Google-Smtp-Source: ABdhPJw3UbUwdf5rwIwYgdLSC8XaOPuDB+nRfEXKFoM4C1O6RrUcDUCjSVnALslLFnlI7M02ZP+xVg==
X-Received: by 2002:a63:5fc6:: with SMTP id t189mr2819490pgb.17.1616483749658;
        Tue, 23 Mar 2021 00:15:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id r23sm1495676pje.38.2021.03.23.00.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:15:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:15:47 -0700
Message-ID: <161648374789.3012082.2966786788232174257@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:25)
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type. The .get_edid() operation is
> implemented with the same backend as the EDID retrieval from the
> connector .get_modes() operation.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
