Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3AA4C1AD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 19:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243808AbiBWSVD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Feb 2022 13:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243804AbiBWSVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 13:21:02 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F6749FBA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:20:34 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id s14so28183879edw.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kc817LydO28fR6UkAPJN+rJA2Gepj0IpXCsI544eHP0=;
        b=hXkbGMYnWmwgIGl12e3NPzs5q+2Lgx8L+R2+dw2D7uuQK3jF07CqtynQW9kqCY8jiz
         9ax3T/B/9vUsDEPKt0lz6WV67/I1ZdJj5Dqo93BAQomcLcnjHrOsI0C8BV8ixjHWuEEt
         a3lHWmQ9yRRUixbMzbtt4mgK8WEH4rm0XgbxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kc817LydO28fR6UkAPJN+rJA2Gepj0IpXCsI544eHP0=;
        b=crfpNb4bi9HdsBPmd4yclAWDgTWwycytAiiH9Xees60iYBhTf04nXPTW5o4DHISjV8
         9AAMwNtmslq6z92m6CmftXMuSBdWZrnx+Ube0M3t7lUanolIkhGVkKxFIbIK5eDKuj2l
         3H+7NqOhO6xOakhLNxwsGdoqfHmf077CmiMGN3tLIsU75//TOFMmyo89SxoFLESxYTuJ
         uS6BG5Zdy9NPxGnUbRprX0Ut5gP1vti+qIPU7ueqStOZ2cZYBQRqf0LTho8BKaoAO8Lo
         +25phTxUCZDByheZR6Hf2p58lkxi7/yJFbU5GpUkNVu5a2KgrTzvvBBMM+gamm9ok2y5
         NxHA==
X-Gm-Message-State: AOAM530dhmMOqhZsFKwd5TLCVWF2OA4U5A7cWQ/lCZHCjBWqTkNaWdp7
        tvy/mWcf0NbybD42+B3BPggl1WfDj4B/WfMfHs0=
X-Google-Smtp-Source: ABdhPJw6LBjR28DvRoNd7H6DYWmRBg85dEtHgwftbAIPxEiACDmvuj/4Y3fQoDfQlyZPChs/jEgrLg==
X-Received: by 2002:a05:6402:2553:b0:412:8684:bd34 with SMTP id l19-20020a056402255300b004128684bd34mr691161edb.436.1645640432665;
        Wed, 23 Feb 2022 10:20:32 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id q8sm220596edt.78.2022.02.23.10.20.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 10:20:31 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id s13so12506062wrb.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 10:20:31 -0800 (PST)
X-Received: by 2002:a5d:5112:0:b0:1ed:c1da:4ad2 with SMTP id
 s18-20020a5d5112000000b001edc1da4ad2mr660312wrt.342.1645640431088; Wed, 23
 Feb 2022 10:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
 <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com> <164563949999.4066078.2399611738908533224@Monstersaurus>
In-Reply-To: <164563949999.4066078.2399611738908533224@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Feb 2022 10:20:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
Message-ID: <CAD=FV=WSHpu3Ub=0Gbq01o_s-SsUa_Q6uC7Z3PaxFL00eeJbdw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
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

On Wed, Feb 23, 2022 at 10:05 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> > > > +       /* For DisplayPort, disable scrambling mode. */
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > > > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> > > > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> > >
> > > I'm assuming that this is the important part of your patch? Would be
> > > sorta nice to include the "why" in your comment. Why do you want to
> > > disable scrambling mode for DP but not for eDP? Maybe you care about
> > > compatibility but not EMI if you're hooking up to random DP things?
> >
> > I'll investigate and include proper documentation in v2 (or drop the
> > change altogether if it's not required).
>
> And indeed, this part is important. If I drop this hunk - then I get no
> display output.
>
> I'm afraid I don't (yet) know the reasons 'why' to extend the comment,
> beyond "Scrambling is not supported for DP".
>
> If anyone already does, please feel free to provide the text, and I'll
> include it in the next revision, or I'll try to do some more digging
> into this part.

I don't know _tons_ about it, but I later learned that the "alternate"
scrambler is used for eDP and the normal scrambler is used for DP. I
don't have any background about why they are different other than what
looks to be intentionally making the two things incompatible.

...so I guess that would make it pretty clear why you can't use the
alternate scrambler for DP. I haven't personally done the research to
know if you can be officially DP compliant with the scrambler
disabled. I also don't know why the ti-sn65dsi86 makes it so difficult
to switch to the standard scrambler or if it works at all... ;-)

-Doug
