Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0294C1AE9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 19:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243861AbiBWS0J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Feb 2022 13:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243869AbiBWS0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 13:26:06 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03A54B1DE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:25:29 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a8so54414100ejc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LRbA1gXot0INJs+Otu1KgbX3YpzjjYajCrr+quEoLQ=;
        b=ZKWN4BXtdA8114US0fta2m3OaulmM1X+0u0IF5kvK9W9cc4hFePOKnWszY9ReU4p9q
         YaKQcx6gk4Byr1Y11DL5Lgl4AAtIWtrilGF58lDf0oLOuEiVpnChAp8fOmPgG9JGuli7
         18cnTFyXtkZKXDvDPTgMR8+kxPslnLmDC/nGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LRbA1gXot0INJs+Otu1KgbX3YpzjjYajCrr+quEoLQ=;
        b=jdafSx2q8h0xF6Hq5abwF1fl7qTYqN0ZEL6qM8pLQVO0+hiqDfhd23Q2GvqEJqC2aa
         lmlws0LIwMjU4hJf6b/EARJTdjLRc77zzcOBrxi6Qs1UXRA2u9ZPWrkLSzZkxXBxpVXZ
         TXdC/t4oEzAzqp1VkB7m532Wv4u3I4RByM+Rr/ZgMFk/zAzRaOWNj2XgQlSZ17co3c7e
         /XxiHohQDDRO7UZoJGHhpuzecBZCkC+KKYptVCKkh+gS/Z3tbK77WURP51kV3H089ISY
         XufWjfbvddMdjKbhVPcQNKnmov7DlrQQZpaALCztnzTGJMjxI+asdwGb4fI9oNip+n6n
         af3g==
X-Gm-Message-State: AOAM533ErV2gRQ3Y1QCsondqo2wYTJaOrv5H+nb4G2UPXmkUsnv4HBZq
        1P+uPdCvkS1COxudysh1qMGUdIiMb8IxHW8Sics=
X-Google-Smtp-Source: ABdhPJzlUXiCaQHVsFrUo7bBmcTIr8GLwDEvPDQcF3x0vENLE4qG6iqmQF4FUFBshNko6yGs/nf9Og==
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id d17-20020a1709063cf100b006cf86c68a12mr767212ejh.202.1645640727386;
        Wed, 23 Feb 2022 10:25:27 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id j5sm172137ejs.69.2022.02.23.10.25.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 10:25:26 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id d17so6202144wrc.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:25:26 -0800 (PST)
X-Received: by 2002:a5d:5112:0:b0:1ed:c1da:4ad2 with SMTP id
 s18-20020a5d5112000000b001edc1da4ad2mr673550wrt.342.1645640725787; Wed, 23
 Feb 2022 10:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
 <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com> <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
 <164563818901.4066078.3221991328451321918@Monstersaurus>
In-Reply-To: <164563818901.4066078.3221991328451321918@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Feb 2022 10:25:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
Message-ID: <CAD=FV=VxOOhZMjVWzXHbEV_EZKRLxtuKgbko-7SUFMsj7upz0g@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Feb 23, 2022 at 9:43 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi All,
>
> I'm working to respin the remainder of these patches, now that I have
> IRQ based HPD working on the SN65DSI86, and the (non-eDP) mode is used
> for Renesas R-Car boards.
>
> Quoting Doug Anderson (2021-06-24 00:51:12)
> > Hi,
> >
> > On Wed, Jun 23, 2021 at 4:26 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > > > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > > > >
> > > > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > > > >         pdata->bridge.of_node = client->dev.of_node;
> > > > > -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > > > +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
> > > >
> > > > Checking for "no_hpd" here is not the right test IIUC. You want to
> > > > check for eDP vs. DP (AKA whether a panel is downstream of you or a
> > > > connector). Specifically if downstream of you is a panel then (I
> > > > believe) HPD won't assert until you turn on the panel and you won't
> > > > turn on the panel (which happens in pre_enable, right?) until HPD
> > > > fires, so you've got a chicken-and-egg problem. If downstream of you
> > > > is a connector, though, then by definition HPD has to just work
> > > > without pre_enable running so then you're OK.
> > >
> > > Agreed. It's even more true now that your rework has landed, as in the
> > > eDP case EDID is handled by the panel driver. I'll rework this.
> > >
> > > Should I also condition setting HPD_DISABLE to the presence of a panel
> > > then ? I could drop of_property_read_bool() and set
> > >
> > >         pdata->no_hpd = !!panel;
> > >
> > > > I guess then you'd need to figure out what to do if someone wants to
> > > > use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> > > > then? Or you could just punt not support this case until someone needs
> > > > it.
> > >
> > > I think I'll stop short of saving the world this time, yes :-) We'll see
> > > what to do when this case arises.
> >
> > How about as a compromise you still call of_property_read_bool() but
> > add some type of warning in the logs if someone didn't set "no-hpd"
> > but they have a panel?
>
>
> Would a mix of the two work well?
>
> What about:
>
>         pdata->no_hpd = of_property_read_bool(np, "no-hpd");
>         if (panel && !pdata->no_hpd) {
>                 DRM_ERROR("Panels will not function with HPD. Enforcing no-hpd\n");
>                 pdata->no_hpd = true;
>         }
>
> That leaves it still optional to DP connectors, but enforced on eDP?

Yeah, that's fine with me. Nits would be to use "warn" instead of
"error" since this isn't fatal and use the non-SHOUTING versions of
the prints since the SHOUTING versions are deprecated.


> > > > > +                         | DRM_BRIDGE_OP_EDID;
> > > >
> > > > IMO somewhere in here if HPD is being used like this you should throw
> > > > in a call to pm_runtime_get_sync(). I guess in your solution the
> > > > regulators (for the bridge, not the panel) and enable pin are just
> > > > left on all the time,
> > >
> > > Correct, on my development board the SN65DSI86 is on all the time, I
> > > can't control that.
> > >
> > > > but plausibly someone might want to build a
> > > > system to use HPD and also have the enable pin and/or regulators
> > > > controlled by this driver, right?
> > >
> > > True. DRM doesn't make this very easy, as, as far as I can tell, there's
> > > no standard infrastructure for userspace to register an interest in HPD
> > > that could be notified to bridges. I think it should be fixable, but
> > > it's out of scope for this series :-) Should I still add a
> > > pm_runtime_get_sync() at probe time, or leave this to be addressed by
> > > someone who will need to implement power control ?
> >
> > IMO if you've detected you're running in DP mode you should add the
> > pm_runtime_get_sync() in probe to keep it powered all the time and
> > that seems the simplest. Technically I guess that's not really
> > required since you're polling and you could power off between polls,
> > but then you'd have to re-init a bunch of your state each time you
> > polled too. If you ever transitioned to using an IRQ for HPD then
> > you'd have to keep it always powered anyway.
>
>
> Hrm ... that's precisely what I've done. It's not IRQ based HPD...
>
> So would you like to see something like this during
> ti_sn_bridge_probe()?
>
>         /* The device must remain powered up for HPD to be supported. */
>         if (!pdata->no_hpd)
>                 pm_runtime_get_sync(pdata->dev);

Yeah, seems reasonable. Probably you'd want to add a devm action to put it too?

-Doug
