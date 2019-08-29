Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9CAA1BB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 15:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfH2Nom (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 09:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbfH2Nom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 09:44:42 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 404E92341B;
        Thu, 29 Aug 2019 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567086281;
        bh=mR7GA3c4mGRbLwLDIK+jRuWdNT4gDXNkRRI6mT85V6w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nO/aoVqieSJBIcG8Q1+Ukaxbr8aB1UPguFn1lMmZhsf/sbrqA+r7ZtvKoOxFOXt6R
         P6+qGYTzBPWW8jXYLcKpzu2eVYVOPYH4+olE+9leQGrL7R+7OJCID9RsHoB8rEp683
         srC9yYQYiwILMQRhyzllWwssMBKCbzaeQERBmKGI=
Received: by mail-qk1-f180.google.com with SMTP id p13so2896557qkg.13;
        Thu, 29 Aug 2019 06:44:41 -0700 (PDT)
X-Gm-Message-State: APjAAAV4BKnLNRmqCiKkKnMdJl6ASPZQomiL5Zj0WGH0w16EBhhNwE0s
        mcQ+QWprhyHJNkM4Doojw1/mBS0Tx9dQ5iKYrA==
X-Google-Smtp-Source: APXvYqxSE0YabCZbTGJEMY6IRxRqXQltQGwtj+w4DSTunRzVOnwmn8VB0XQkhKwOYkeqn97wvdZAYXR3bCf8AGd6bR0=
X-Received: by 2002:a37:4941:: with SMTP id w62mr8752360qka.119.1567086280340;
 Thu, 29 Aug 2019 06:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com> <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 29 Aug 2019 08:44:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLikohkWAq7exzCuGfg2yVE1Wx6h7GZFP8-jaL31PLpmA@mail.gmail.com>
Message-ID: <CAL_JsqLikohkWAq7exzCuGfg2yVE1Wx6h7GZFP8-jaL31PLpmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 29, 2019 at 6:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Add binding for the idk-1110wr LVDS panel from Advantech.
>
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> v1->v2:
> * no change
>
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
