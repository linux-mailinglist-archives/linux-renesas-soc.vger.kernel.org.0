Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1276345889
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhCWHWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCWHV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:21:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F49FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:21:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so702624pjb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GHDhziE/oTUWgeSPv8hi2p61hONT45CsImRcE+t3T5A=;
        b=SsLOR4LLwLrU1iVER9axbrwghAGi/pvLvTPnSSXUOoTV7D0Lwh3AxSHyAGFiK7PUov
         dhZ4F2++AA74GPiPZZdkUVQIcM99ti83wNX60E8+k7l6Fm8IUCRoBU8qoFdQBlYKyx5A
         Bw1Yj6iuNWwhXKF1VD1xHn1+OcSP5t6IMT9MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GHDhziE/oTUWgeSPv8hi2p61hONT45CsImRcE+t3T5A=;
        b=IAnO/DdWm81xw/Fkhpj4uZpn+XN4QW7lnU5Z4Iwcu7MYIqeyhrrVYR+4K/4XKA63Ae
         MbqlC5WRDr5FeCyKG6oL82sqaM2ZvCpTCQHRof5IRi0xZEWdHAz8G18dHPY3R32iYP3D
         mMcJRLLAhyvHOXiNUtpFUyreXAL1nh7f2FoXjRqd/+SRPPgXV7PzeFWKGGuaI9EcDrhB
         kdbeth9kbmwJZEfHWhZ5+BCenJeweFWY+wvGzaWpWKOgjf9uggSwBzv5Fr7zbPe1V6ZL
         opVtbV8tTbbhAOUpXztcVH0McriMD35jKhPDmr6E7uUhDoNGeqaD49NE+sO0Kb5R+g9G
         vE6A==
X-Gm-Message-State: AOAM531X13yRpVQjHzVClSXLbrowSD8t7+n4Rr4pnsX5f2XWtgci8Fle
        sbOQjwHRdW4ynbnSijG6aqv17lGkz+jLgw==
X-Google-Smtp-Source: ABdhPJyZ/CShxiXs/l+OsxBZaV1oLFVk9dmNR17PTSOGiZ0dB+BzqeABH9qtreIgoRyLynq5nl5BvA==
X-Received: by 2002:a17:90a:cb12:: with SMTP id z18mr3043096pjt.132.1616484117831;
        Tue, 23 Mar 2021 00:21:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id w191sm17250565pfd.25.2021.03.23.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:21:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:21:55 -0700
Message-ID: <161648411577.3012082.12552929328689935144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:28)
> When the SN65DSI86 is used in DisplayPort mode, its output is likely
> routed to a DisplayPort connector, which can benefit from hotplug
> detection. Support it in such cases, with polling mode only for now.
>=20
> The implementation is limited to the bridge operations, as the connector
> operations are legacy and new users should use
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index f792227142a7..72f6362adf44 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -890,6 +897,15 @@ static void ti_sn_bridge_post_disable(struct drm_bri=
dge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
> =20
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *=
bridge)
> +{
> +       struct ti_sn_bridge *pdata =3D bridge_to_ti_sn_bridge(bridge);
> +       int val;
> +
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +       return val ? connector_status_connected : connector_status_discon=
nected;
> +}
> +
>  static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
>                                           struct drm_connector *connector)
>  {
> @@ -904,6 +920,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_fun=
cs =3D {
>         .enable =3D ti_sn_bridge_enable,
>         .disable =3D ti_sn_bridge_disable,
>         .post_disable =3D ti_sn_bridge_post_disable,
> +       .detect =3D ti_sn_bridge_detect,
>         .get_edid =3D ti_sn_bridge_get_edid,
>  };
> =20
> @@ -1327,6 +1344,8 @@ static int ti_sn_bridge_probe(struct i2c_client *cl=
ient,
>                 return ret;
>         }
> =20
> +       pdata->no_hpd =3D of_property_read_bool(pdata->dev->of_node, "no-=
hpd");

I see that we missed adding this property to the DTS file but skated by
because it was the default in the driver. I don't think it's a big deal
just something we should fix in sc7180-trogdor.dtsi before this patch is
merged.

> +
>         ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
> =20
>         ret =3D ti_sn_bridge_parse_regulators(pdata);
