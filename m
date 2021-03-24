Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD493484CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhCXWpT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbhCXWpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:45:04 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB375C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id o5so44182qkb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZwT8HkDsYvi3JzaJTZKAAxslt8vR/nI4jrcLGJopjQ=;
        b=QngrCIgC/wKLQ7c3KG9w7IKpUZodjWSZvldFViMa0lUYVj6zczuz1FnHD+n6fO983q
         za80kVYR9hB3pNX/JWzDVC5zoPAWX8UrqzoBtM9n0FEo2QjBwA8naoXc/zhMq74yHUl2
         xjoMVwQIUQazyfWzNKlRyUrx+BbQz3ulLaUj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZwT8HkDsYvi3JzaJTZKAAxslt8vR/nI4jrcLGJopjQ=;
        b=Eed+U0mnuE1udAItVXEGSPFckdaoxb3KcA1BpImkG8S3wjj3td0d2F/vuv/WPUotHC
         zztpI0gSY7R0WLPqzXdbAM+IqDNQzoFRxJ51GlKJwXRunemWI1VgpwDoFjdh6K46ZwdM
         BqBwIpd+RTzedjWS3YEcUwMLDlYpMjd4pf2VLg62VAMh+z0qnFj7k/BGfxiyU8GeJ5v/
         uUGihYES/ar321LUK9pcajeIL1fJtDPZnRmg6KgRM/VZ4MQDH3ti9o+mB4ulStaE+EYe
         G/uVBJPVRSxhuwnRtVQMfeL2+minKrSppGzDLb3Z0Q5AeA+zmvDNj5oj5uZWQvHSId7W
         9tpA==
X-Gm-Message-State: AOAM530Cp3gQeTHWRUGN7x9rAQr38kGLEovBjTDuAQ7p1mofS1YAjmP8
        V4P4uhMP2rZeRqFtXCSQn++Xo8x2AJ9+hA==
X-Google-Smtp-Source: ABdhPJxMytWJIWOJ4XIjaqe0hlzvY5+bJ6NvYP4WFB75z/+If90UW+wPU3jKetFkg6S0kzP7qeojCg==
X-Received: by 2002:a05:620a:12da:: with SMTP id e26mr5147063qkl.92.1616625902811;
        Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u12sm2670078qkk.129.2021.03.24.15.45.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id t8so256328yba.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:45:02 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr8194218ybc.345.1616625901780;
 Wed, 24 Mar 2021 15:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:44:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLkfSZ=sR4y3PbY4PJdita6GERzoh--j8mrjXKRCW22g@mail.gmail.com>
Message-ID: <CAD=FV=XLkfSZ=sR4y3PbY4PJdita6GERzoh--j8mrjXKRCW22g@mail.gmail.com>
Subject: Re: [RFC PATCH 06/11] drm/bridge: ti-sn65dsi86: Group code in sections
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Reorganize the functions in sections, related to connector operations,
> bridge operations, AUX adapter, GPIO controller and probe & remove.
>
> This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
> will add more functions, to ensure that the code will stay readable.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 +++++++++++++++++----------
>  1 file changed, 47 insertions(+), 28 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
