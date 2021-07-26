Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515083D697C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 00:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhGZVpx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 17:45:53 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:43737 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbhGZVpw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 17:45:52 -0400
Received: by mail-io1-f44.google.com with SMTP id 185so13775820iou.10;
        Mon, 26 Jul 2021 15:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hge//IXuNMjdxxjAqE1+obzDVk4ILLiLorj7vmAym54=;
        b=RiMrpE3QzmJTlrIrR7lTEwoxtFPBjjDTtXGWxC0x7Wwvr0t87JrflPTEzYr5/uMabA
         OTA2jUqjGUeozbZ61IRj73TAmy3881qmpwJKTKhMied9K2CQw/neHEKBhk6ixvPhS0pH
         T3PIQhs2H3dO7N297/QYGzQ2hofoTtBBysaEKUxiOnsnIZ0zAqCiH/gTSA5/os8rtcrt
         FLsCeKMMH3Xm4ZH5x/QOvIH8WqYkttZXH2KoYEdJT4C9LFfYIyXwHsvZguO4W2JEcygn
         A3eBHvz8Ahoz0zs2fguK7yaW5Pccp3PeBNIUkkSJpfMtSTRZITElD9iQWSOSP27u4sZc
         qn6w==
X-Gm-Message-State: AOAM532SMTqFIkQ9DNQJM2lF9EUBvCOckMLGZwNsvIygqtZLDj/uHgun
        96G/aCY3AMT8qu+v/r8j7IvjxL66+w==
X-Google-Smtp-Source: ABdhPJz56Vu+RkBx1RZX/r777r2dypfAr5QO3XolVQkYWmZoyFynFt3A56NOoNqTyKErFd2fIVRXNg==
X-Received: by 2002:a02:c906:: with SMTP id t6mr18735439jao.117.1627338379523;
        Mon, 26 Jul 2021 15:26:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m26sm709566ioo.23.2021.07.26.15.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:26:18 -0700 (PDT)
Received: (nullmailer pid 984588 invoked by uid 1000);
        Mon, 26 Jul 2021 22:26:16 -0000
Date:   Mon, 26 Jul 2021 16:26:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Message-ID: <20210726222616.GA981051@robh.at.kernel.org>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 19, 2021 at 01:19:31PM +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USBPHY Control Device.
> It mainly controls reset and power down of the USB/PHY.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v3->v4:
>   * Dropped reset reference.
>   * Added Rb-tag from Rob.
>  v3:
>   * New patch.
>   * Modelled USBPHY control from phy bindings to reset bindings, since the
>     IP mainly contols the reset of USB PHY.     
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
