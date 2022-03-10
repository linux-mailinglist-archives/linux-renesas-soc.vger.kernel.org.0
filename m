Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472524D5519
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 00:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245277AbiCJXLj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 18:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344591AbiCJXLi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 18:11:38 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D265919ABCB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:36 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id dr20so15334298ejc.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FdRD7UqyvIUj279CEK1jZhIkgCE+xn41rfRl2yq1BwA=;
        b=T/q56MG2EY5bFCFeahW25OmtAXtMaEF5rZwoAkIuXrQ+H+ausHtpVCkE4IGxGnitV9
         7wuejt/lAn4WozekwFbX/ISvBi2gQ2dmVE7m0S3Ug4eXsNJ9DfMOqauA+agFNy33+qN1
         xyrawS89u6mWz1ZMfZ9rS/OTtQw2YrBmH8MXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FdRD7UqyvIUj279CEK1jZhIkgCE+xn41rfRl2yq1BwA=;
        b=a3w8aXyKOHwILsDirn03kIopPHIAY5FqXJCZsxm3aznqigCV+K8WB20C8UQqYctWbh
         xwbyOtsJTrNaoB0ck/XbbBNBNU+YdbNjfcqWWP7FVP1+8KvaW2ZLQDcYy6GDxFyznnpt
         Z2zoQlg09c8rPTeQH9kRHpUmtT4JHVuArn/ghi+7WRLV+/qB9DbeplPJ33gzYylckPeL
         +P1W8leLtCynQIepupPs3/sR+Gtey7vJ6nm+e3DSwk7M5iyiete0+xFClOjtoPy95y3S
         kIHyWRQl/1fzLageMHAv2k2QbGw5YsQbpdvGPKXVLe281it5lmXy2aBT/iMNJ+p4JbIq
         nrXQ==
X-Gm-Message-State: AOAM533ukLPogVFMZQlx+hlfRSJUWhhDVjAVqs5AFp8MufU7oldS8En0
        rdX4vHx3dwXiyMrMXLF8ao0m2NO+fruE+MN7
X-Google-Smtp-Source: ABdhPJzoLecSmVFqlMd+sMGjgUbGuo9hUVQ+tWa0EjaaHlSG2I0cLx0/maRuO6swLH//zM342NBQaQ==
X-Received: by 2002:a17:907:7ba6:b0:6d7:1888:d553 with SMTP id ne38-20020a1709077ba600b006d71888d553mr6550008ejc.98.1646953835062;
        Thu, 10 Mar 2022 15:10:35 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id m1-20020a056402430100b004167e4606a8sm2629823edc.74.2022.03.10.15.10.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 15:10:34 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id p9so10361671wra.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:33 -0800 (PST)
X-Received: by 2002:adf:e983:0:b0:1f1:f52b:8328 with SMTP id
 h3-20020adfe983000000b001f1f52b8328mr5208098wrm.513.1646953833413; Thu, 10
 Mar 2022 15:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com> <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Mar 2022 15:10:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
Message-ID: <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
>
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 93b54fcba8ba..d581c820e5d8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1135,10 +1135,24 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put_autosuspend(pdata->dev);

I'm 99% sure that the pm_runtime calls here are not needed and can be
removed.. The AUX transfer function handles the pm_runtime_get_sync()
and it also does the "put" with autosuspend so that the whole EDID can
be read without constantly powering the bridge up and down again.
