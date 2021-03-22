Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA02343DDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 11:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhCVK3y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 06:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCVK3b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 06:29:31 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41400C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 03:29:31 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id o19so18622092edc.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 03:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWnMXVoQRmHW9unHMINxWSWflwkHqDEbX/KH42wQ/b4=;
        b=LpMSiaOlGl1lK89C+7KfYX3AeenMAoV1TZ+jJGN7Z5bir35JwiSkiM8nDJBsIiXDxm
         /A7hvlSNTDNgacNg7ABbk4PIKReH7pcUYyl5AGJynJIbkImqpKPG52ZLHXO2IrmJHOr8
         6IfUIKNcc4o84juyMjtEcAyS18bW40k8ttp9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWnMXVoQRmHW9unHMINxWSWflwkHqDEbX/KH42wQ/b4=;
        b=lLacNxii65Q2xRvhB6aDvYUkryhZyV92HyNThWv7XSt2f+tPhnSw0enmUgoatrjRFj
         FtXCuYmsJUOLXoXZuyq0+JmEh3Yo8yqRJu4BRx8jqkAgZioFT114HQ0XmprKnUv3jrv3
         We9B7PXh3YNrumy+j6xCMZiuVmn+GjRTtymfPgieMkSC5nPi60z/fGhLMJkDFFBm/4lt
         NRmYyFH4PN8EiW65NqqaN1EPDHGgvmFa3147JksSSs0nStmsLa5hIsaqn0JhwLwsxQWD
         GSyngM2bhZl44VdzfUVJNuSsKycgV2iywZIPcGeDSNOD5lDD74AqQ48tvM02Qf/ArDuX
         d8iw==
X-Gm-Message-State: AOAM531nOPzJP4BlUHFBcPMNs2ohxK/tRelj0XBc1Xmy8EJIKrOrysls
        4paYKd7MUz3dhnd3y21EDAzEv+DEVEgiZQG0n9/LFA==
X-Google-Smtp-Source: ABdhPJw0TY8k6mLGDQKSpiTSydOSR3jb/VCtnFZ+EhA+xcwCeVMFa9ULPgzf8ayJZ7IWBMzjDkVyc8tdukz3VJj7DG4=
X-Received: by 2002:aa7:d296:: with SMTP id w22mr25748187edq.150.1616408970070;
 Mon, 22 Mar 2021 03:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 22 Mar 2021 15:59:18 +0530
Message-ID: <CAMty3ZAZ8yXPzCzpi5Oubd7XH+ckKPhw_-Ceh=1a_PdNF8xFCg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 22, 2021 at 8:32 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The enable signal may not be controllable by the kernel. Make it
> optional.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
