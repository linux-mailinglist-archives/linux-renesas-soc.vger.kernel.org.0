Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1F6345855
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWHKM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCWHKH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:10:07 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DFFC061756
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:07 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id j25so13332233pfe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+K97PdVuEE+1g5sFpZ/HQJps6vR1JaS12plaQgGGVrc=;
        b=hJPsR0X8zUt01jIOr510j6YVCgU5chpqEtRn3weogf28emnKpbetTL+jaiJCKCfBeO
         1sI7ghj81uIZvzwFy3Kw9NHdOWH17EYsE6SN/FBJNDwCq8UG3f8Y/fbxraf7I4+zVX+Z
         esuBJPP66rpgSEeOoDQUjQu95RLTM06PCrCZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+K97PdVuEE+1g5sFpZ/HQJps6vR1JaS12plaQgGGVrc=;
        b=oBRhQJbEIeXSMYT6Bl3HWoUw/NZenpM/KBhIECvOzbg1EwT+djZxgIQz4uVcNCwKsp
         yWLgESGV72sZdb9hHdqv4zmoWJg9iY23NOew1gQ3t30Cdas3uwz11RtWXsOK5cSjHagw
         nWhO/KLAEsSFAmtwyWCEjMfhHVqNTsWc5DOkgGkaLOD1ftcfbUu/jx70ELMf/w8nLbK9
         vxqjFrUJhiMP0rnS3zIaTVAEkIyONhSg7w47QIU+KGk9ZfOPhwpzssEdhA4AtEDyK4sC
         YD727i2TLC8FmgufBvSSLW/HjUSWDEeci9bThu/BzlbavxKa3T+fufh1MKhELYHHayyU
         c2VA==
X-Gm-Message-State: AOAM532rK+4lps3ULIlEhiHgebKM1Hzo8lrYtKZYr7G/OiDyrImEJE7+
        2F6vbGilYiO6brFgyZ/LW9A1O5TFRhLMgw==
X-Google-Smtp-Source: ABdhPJwBA4HX/OVdGFcBVhzxavJbsPmpXxWAd100ZSbxVqWbcho629Mo06rAJsZji1oYXubYDKV3Aw==
X-Received: by 2002:a17:902:d2c5:b029:e5:c9ce:cb3c with SMTP id n5-20020a170902d2c5b02900e5c9cecb3cmr3914484plc.74.1616483406508;
        Tue, 23 Mar 2021 00:10:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id x125sm6171927pfd.124.2021.03.23.00.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:10:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:10:04 -0700
Message-ID: <161648340457.3012082.17691256832017517403@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:18)
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
