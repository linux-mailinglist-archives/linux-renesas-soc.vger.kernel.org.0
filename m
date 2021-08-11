Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF59C3E9B03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 00:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhHKWnw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 18:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbhHKWnv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 18:43:51 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC79C061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 15:43:27 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso1168727oot.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 15:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=04cS4A0eo56m0oGnqXAn6XieM9vnDgHVg0ePStjOpRE=;
        b=Ny9jH+ZqN70nJmx35HOVsWRmUNHLTcIMbQ4OPBPxuVKg1AXmmD/J3JYkA8clW6Fu1S
         AK1RB1feliPJZzwB/Fmg/QX9YE6IPSMl1qQDZSOKssPiRCEha+1pTe3RahhLJCFXvA8x
         CNOvChGVdULSIY3++xOU1GoO5GVwzPcJ2C2ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=04cS4A0eo56m0oGnqXAn6XieM9vnDgHVg0ePStjOpRE=;
        b=NzUikkcNYD4AaVIMAppOY60T9vo3Vsj7Aw4lClEz39etv9qOnwxA+3+QtIps3+hPhl
         ZqcdPo1xP3ANui2YrwIG50HvZAhNeLV5SCtZKXTU0g/w5IuGnDwomQrfI481XZfE9JFV
         gwtTKRbbaXhqSaBrYDVSUvxCr3R7ki/KXQDC0y5O37F9dqfKgVUdo0mUSPbwBsadedQ0
         +ul4jt//Uo0gS0aj5Z0vkbLg4M5vuwrpKobjGbenwRPKMOzNcF9MNMl9JRLkTAEdFesG
         1V83KfpcrfsuCvNgSuBSBDW2rJN/MWkzwW2afvV8BCWhyiIgjOkHq7UtmIhxU4l4ulv0
         D1WA==
X-Gm-Message-State: AOAM532P/RiR7uNXTrigRlx0QfifrWpxZ+k/G97MHG5tGEtttYzg3jlq
        zfunjqUT1Mq9v4hPKJA5lrel0Y0AKDHV2XTxZT789w==
X-Google-Smtp-Source: ABdhPJwDBd0j6rLWyuqknaqcd4wiONq8hvPaCYnmxA5iAPWlPegrYBqNU5bWVcEIXniwp0iJ+ZQkovWKiVqeqpoxBcc=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr773111ooe.92.1628721806915;
 Wed, 11 Aug 2021 15:43:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 15:43:26 -0700
MIME-Version: 1.0
In-Reply-To: <YRRR2BWZP8SlskW/@pendragon.ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com> <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
 <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
 <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com> <YRRR2BWZP8SlskW/@pendragon.ideasonboard.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 15:43:26 -0700
Message-ID: <CAE-0n53MW+_nmBcNbTVU-5LQj+a2zOFUCFCC2OAMXWTGfQP7xg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-08-11 15:40:24)
> On Wed, Aug 11, 2021 at 01:51:28PM -0700, Rob Clark wrote:
> >
> > I kinda think *all* bridges that create a connector (whether optional
> > or not) should OR in NO_CONNECTOR when attaching the next downstream
> > bridge.. since you never want multiple connectors
>
> Yes, that sounds reasonable to me. Stephen, would you like to set a
> patch ?
>

Sure I'll send a proper patch for this bridge driver.
