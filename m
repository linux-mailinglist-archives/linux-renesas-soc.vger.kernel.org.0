Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B23345864
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCWHOd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbhCWHOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:14:07 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB68C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:14:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id v3so10776775pgq.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fYWO1UsVoh/R8XZE64RM/Jl8z5zWy63u5I7GZoSU3SQ=;
        b=Xo69Mt6/kL/aCKLvYa4Fwr/j/tKHmX3zlRj4mQ3UYyxt4TqESg+DiZQnhQRNho9iLu
         fndUjnKmf/vMdACOm13Pfy6MjDrsvVWzg8vDSZRIP26TGx6oNw3kzcRJL8lJXA2rZPFz
         VTrXDP9Vdje6a6md8xr1UxBXIy7JKO+7oGkgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fYWO1UsVoh/R8XZE64RM/Jl8z5zWy63u5I7GZoSU3SQ=;
        b=n96++nNjOa7sARz53jQ73wxNfnlT+bUtHtsGq3sTxkHM/ylQpfhqrhigTCwOVCcqJe
         VMVJ1y2b3HvOqWJ2nRORKpFA2JeHnS8USD0E+zfFnw2cyvf2myV2QE3xqm9+btGoarnO
         Gp5CjrfF7k5YLy2gMMXwGyaNzWV8QveP2rEE10gfIIMVzU7k1vC92BlfgE2IOjXNs7Uq
         5kq/Q7auovC4SMq8VdEZUs3/ItS5A6RdxGIlfLj2Lm3KgRAKevq75r3NQYLFMSEIUBIs
         prtgPCUWt1YHsK+4/QkYuWU4XpKOsfzdq9JVK9XI8DkVCJtW5eL3meKUWKmnCKcNJBmV
         V2WA==
X-Gm-Message-State: AOAM533TbkN0ClGLwEKsGi4HdaGvPuu1HEq5JCWEcRWKCtIIO8TZu6gU
        Q+Oy4nsen8oQPhLHcsPeWvyqrOYMqbNzEA==
X-Google-Smtp-Source: ABdhPJw9WwH3T40f83xyLQqcJ7XwWyC7xDQSJ3yvrXZrrL8RcVUYTZujJS7eHt23lV3STFi5M+ZCBQ==
X-Received: by 2002:a17:902:7fc8:b029:e4:32af:32da with SMTP id t8-20020a1709027fc8b02900e432af32damr4224131plb.24.1616483646679;
        Tue, 23 Mar 2021 00:14:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id o19sm3550978pgh.62.2021.03.23.00.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:14:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:14:04 -0700
Message-ID: <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:22)
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 1d1be791d5ba..c21a7f7d452b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -418,8 +420,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *br=
idge,
>         }
>         pdata->dsi =3D dsi;
> =20
> +       /* Attach the next bridge */
> +       ret =3D drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> +                               &pdata->bridge, flags);
> +       if (ret < 0) {
> +               DRM_ERROR("failed to attach next bridge\n");

Can this be pushed into drm_bridge_attach() instead of in each caller?

> +               goto err_dsi_detach;
> +       }
> +
>         return 0;
> =20
> +err_dsi_detach:
> +       mipi_dsi_detach(dsi);
>  err_dsi_attach:
>         mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> @@ -1245,6 +1249,14 @@ static int ti_sn_bridge_probe(struct i2c_client *c=
lient,
>                 return ret;
>         }
> =20
> +       pdata->next_bridge =3D devm_drm_panel_bridge_add(pdata->dev,
> +                                                      pdata->panel);
> +       if (IS_ERR(pdata->next_bridge)) {
> +               DRM_ERROR("failed to create panel bridge\n");
> +               ret =3D PTR_ERR(pdata->next_bridge);
> +               return ret;

Just return PTR_ERR(pdata->next_bridge)?

> +       }
> +
>         dev_set_drvdata(&client->dev, pdata);
