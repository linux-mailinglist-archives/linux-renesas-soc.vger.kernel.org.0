Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CE73DE11A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 22:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhHBU4A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 16:56:00 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:40792 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhHBUz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 16:55:59 -0400
Received: by mail-io1-f48.google.com with SMTP id m13so21837333iol.7;
        Mon, 02 Aug 2021 13:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gg1BvQRuyVDkBMaHEC+x+cCkCoIuykzg2HO8zEzWVkU=;
        b=kJIET3xMMvJA/dESkOA5xygAzsouA4OGLd81cTym43DU1GQQCfgc/37vD5bnfvvZhs
         2oe3hq7GMZjBdc1KwdMGsttBatrPUzKkixeXyNRi0ZsZDPuz485NM5fdNbEmWQMWZc/8
         yw2AHWiLL/nhKpmXMdyrU4LhjsddY6rt2bJ+fQajdvCZCnvlpT/zk1g+pXQTw19b7+LB
         iqs5vOIHTSzIqtd+DkFDfn9Wg3GjqtTo322WUpTcA5YDX/lvpKpGJ+IH1Gkuw3BMRwsE
         POG8nJJpKMzWSWNno3+FcjEelpBIQBWQr2BmChB6HHqmptjv9W7oW6JroiJi9v/+EG+0
         CP3A==
X-Gm-Message-State: AOAM533fYtzrx0jKcxEXu9gtwj/vWSrwO9KG/GCtBfAqhWdwuU/5jAKt
        iqYMLC8ySKJmOWDwXQehwQ==
X-Google-Smtp-Source: ABdhPJxyfELgaOHxtqFMAFc4cSJAkj0asz918/5SVNfc7XxjOCOUwylMbjXvVZyv5bDwIGqVg6tCHQ==
X-Received: by 2002:a5e:8d03:: with SMTP id m3mr2402340ioj.200.1627937748437;
        Mon, 02 Aug 2021 13:55:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t26sm7810751iob.19.2021.08.02.13.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:55:47 -0700 (PDT)
Received: (nullmailer pid 1594532 invoked by uid 1000);
        Mon, 02 Aug 2021 20:55:45 -0000
Date:   Mon, 2 Aug 2021 14:55:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Message-ID: <YQhb0Ygfod+K9Xf6@robh.at.kernel.org>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 27 Jul 2021 19:55:23 +0100, Biju Das wrote:
> Document USB phy bindings for RZ/G2L SoC.
> 
> RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It uses
> a different OTG-BC interrupt bit for device recognition. Apart from this,
> the PHY reset is controlled by USBPHY control IP and Document reset is a
> required property.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
>  * Removed 'properties' and just used 'required' for RZ/G2L SoC.
> v3->v4:
>  * Removed second reset
>  * Added family specific compatible string.
> v2->v3
>  * Created a new compatible for RZ/G2L as per Geert's suggestion.
>  * Added resets required properties for RZ/G2L SoC.
> ---
>  .../devicetree/bindings/phy/renesas,usb2-phy.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
