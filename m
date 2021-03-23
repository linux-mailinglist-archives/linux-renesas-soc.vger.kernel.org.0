Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E38345866
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhCWHPG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhCWHPE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:15:04 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7A2C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:15:04 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id s21so9694959pjq.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GJS1m/A5U7XP3iq7fk/jli3OnxTi83Ud02GBGt0St/E=;
        b=gN4FlASgyHU1Ntq97QVzk1lwyTj8YdNDsq0dstEZspabzUqyRTJPNdlzIisGI3Av0U
         DtOOjUhj24mUb3X3RnS1vIVNQX5tt0weZLKlsvIgkZTyK/3fjgtn91QwH77+/UzP4Kh8
         j99GwAHxL2onNsoEOX8KVyyzA7gF+qAAzKetk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GJS1m/A5U7XP3iq7fk/jli3OnxTi83Ud02GBGt0St/E=;
        b=iVg4SIeZeVt3I4GSHzfs6GrL5pkeM6T92ma9g15fd74cVvf74wlBbCcsbUpl0wlsd1
         1Lobgn1xsnW2GnNez0yj1s7mbdI9dF+JUlIxPE31Br3nopTmsPClLwVwzAhsrosILxkC
         U+z9wgRFfciOqHSqXNsEAFyxhXC3iN0+38UtIIva1HlrOy/vZdYzCWtI5NfaLoMRdzQo
         At/2Hyrr20XoNew5XgD0MaAScCpFLdB/rMXBhUNgfvHU8jA2wYVCIk31EvEMjru0gjsk
         Cy6rxapBqtbSZO1Uv2CKmuznCC4YY7mCqKgmKX66rH7xqeuodq6L2nw0vbtPn3Znfa3M
         vx6Q==
X-Gm-Message-State: AOAM531VXG5cez0wN7Ql9ye8RnA6kv/1U+Z6Y0HzIIfAwxfLbUsBYKhu
        VgwCczI9KM3NowRLcoZnKdKVOv0qNBbPmg==
X-Google-Smtp-Source: ABdhPJwgBMmh6QYlC8BOIZ7xAIR0GbJMf6zQhL9CLxvBvrByacMvfxg6HXogSxCLXVaksAE0T75Idw==
X-Received: by 2002:a17:90a:a4cb:: with SMTP id l11mr3094986pjw.144.1616483703916;
        Tue, 23 Mar 2021 00:15:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id f2sm1524324pju.46.2021.03.23.00.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:15:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector creation to a function
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:15:02 -0700
Message-ID: <161648370205.3012082.3202368984408404985@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:24)
> To prepare for making connector creation option, move connector creation
> out of ti_sn_bridge_attach to a separate function.
>=20
> No functional change intended.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
