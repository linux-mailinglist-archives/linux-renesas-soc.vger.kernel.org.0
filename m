Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EAB345859
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCWHLS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbhCWHKy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:10:54 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FACC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:54 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id f10so3689657pgl.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=OTthsKtOcH7+5b1h2hSE3Hi7N35EUQSGFHNAvucSefQ=;
        b=SPdx1dfspvXVtTtUqDNDHDlEX4O1qt3rDkuETcTLYLQ5JNiwXWZn2GucU4/qLxRkmm
         6g9+Tavvr1cf8DbBl23KTXBCtlMfALBHdWhIzm+SeerNv8SlchacLT5BFRXF0zTzBl7V
         OzckXfhz8mAaa8t9gXp+EHmmMG3P9eHJk0Xao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=OTthsKtOcH7+5b1h2hSE3Hi7N35EUQSGFHNAvucSefQ=;
        b=beA2WyChRqydGEUWXog/MSvfbZKggs8BhXnbNdsQVwA6q2eIwCzrucruc7Tq1oOkbg
         S+ZW5DaQ2/uUuxlzIUFuVdzFJvRCL1CXc6gUzm4RE0HoBVbgKORMreppMeDzK/zXCo6o
         IqdDanj5BhIDjrIrwSELcPQCMCHTypgdiD1R4sLag8YUdJY9+MfgffFZn/U7iDAXo8cW
         1JJ1yB3nyscGYMgr4dVT9z1nsAO3pkOfrW4fRZ30aGqDWRiCXyTkMfFzQKg3jNGIRsAX
         r4+gA7mkDiNyb21BoUeBJGIfkkhbNLK0/xgjbO2uY5tnK0klMF94ASXu+uDbj3ghUI03
         PamA==
X-Gm-Message-State: AOAM533v/UMtD7s+gbdQlmAOYdUJ200gHQCBxYjnHrR0+CsCav/cdgV8
        J4+X0c4/rtk76zcsbHdI0W7VaRkqjWuR1Q==
X-Google-Smtp-Source: ABdhPJwyiEPAoqpnxs0oSYEStjvutu2YYkkVVstSNl3urHgQUzsIobHrocGv/nTEeRXxtXndcn6Rvw==
X-Received: by 2002:aa7:8a58:0:b029:1fb:8ab:866e with SMTP id n24-20020aa78a580000b02901fb08ab866emr3797125pfa.0.1616483453880;
        Tue, 23 Mar 2021 00:10:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id s28sm16161503pfd.155.2021.03.23.00.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:10:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX adapter in remove()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:10:52 -0700
Message-ID: <161648345208.3012082.937476389048930443@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:20)
> The AUX adapter registered in probe() need to be unregistered in
> remove(). Do so.
>=20
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
