Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1995B250C10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 01:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgHXXFD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 19:05:03 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42686 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgHXXFC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 19:05:02 -0400
Received: by mail-io1-f68.google.com with SMTP id g13so10527807ioo.9;
        Mon, 24 Aug 2020 16:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=grnX0VUhlQ7UkI6SwTPw8N7QvRi6xvd/z+SkEjq5s38=;
        b=kRp1Tc4dzjEqAyGvvK0qxmjauDeq1P4yNaNr9HgVKgMMZkeBeT5Qc2EnuQkuDGyuRa
         THTCXbJNj2Ee7nnIXLbazrf2aaWKp9xbdVIgU2Yy+H5ITrhevngVrki8+4GtzkTOtS9d
         WCTPqE2+UhElAeTKbc6iq5oCtmBH8Os9oq+PbQ8ZSZAIae+5wQkTCgbl8y3VplSTb3Qy
         6PfldEJDW9fbp5jPwQspO+SZ9szE5Oj5w41Xv2pXJ1ahLXD1YFROtuPm98f7IslGWGUJ
         BICa2yqqoGsCAyUfLVNhMV+jX/fdhVgM7xlR6brHhJLCdDcZZ5hmffg/MG1hTYZisWuH
         KxaA==
X-Gm-Message-State: AOAM531Eh307kiuAfzjgccQcA3iG1/vrRa3U1K2iZw7ByDb7LA5pzyYb
        VDuJdG6ThMCf94lLiF8zZSZsGE2wrQ==
X-Google-Smtp-Source: ABdhPJytoxNmBvblOQpX2IFcshYzh8s4J78tGM0KQSovKW3qVcPlQofuNB/4DhfHCAVDCI8+ecT0Ag==
X-Received: by 2002:a02:6983:: with SMTP id e125mr7654790jac.78.1598310301391;
        Mon, 24 Aug 2020 16:05:01 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e23sm7410122iot.28.2020.08.24.16.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
Received: (nullmailer pid 3498823 invoked by uid 1000);
        Mon, 24 Aug 2020 23:04:58 -0000
Date:   Mon, 24 Aug 2020 17:04:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200824230458.GA3489164@bogus>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> Document optional vcc-supply property that may be used as VCC source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 68951d56ebba..3248be31eceb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -79,6 +79,9 @@ properties:
>        The GPIO used to control the power down line of this device.
>      maxItems: 1
>  
> +  vcc-supply:
> +    maxItems: 1

Probably should be 'power-supply' to align with the 'simple' panels. 
That's also to signify there's only 1 supply. Using 'vcc' would 
encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll 
NAK because at that point it's not a simple bridge with no configuration 
(it's arguably already there).

Rob
