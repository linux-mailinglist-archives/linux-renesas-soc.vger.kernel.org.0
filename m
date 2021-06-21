Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872F63AF222
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 19:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhFURmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 13:42:33 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40625 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhFURmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:32 -0400
Received: by mail-ot1-f45.google.com with SMTP id v11-20020a9d340b0000b0290455f7b8b1dcso5607689otb.7;
        Mon, 21 Jun 2021 10:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ycr2MVX2QStXzBDnJmHYFgyl6vWy5atj59T2tUN3oGs=;
        b=TPqQyDvWNFkvu7BIzaJV0FbNND4W3adG6YKG8ypGaO/LxCU54hhDH62Q2os3DW9BTt
         wgv3V7iUBQaYRvT+fg+XHl/U5rEyuDu8+1AL+NnHt/tMSaCLljH1Nu3JraFple+jjqmb
         8Geo2vWcHslE3epvfMsBXrY8uz3Gq8D09vcA00rooaHnU4BI+B8P11qkFQ9QCuWY1XhB
         Ngl7NDCqCJ7sj75XczFYqfwTzmIt0sKc2FWT1K955FM6HLpclQMR/JjzF/NV0/gx6rep
         o67o/14OGf6m27NuWkZAw2sZPRwaQvX/RX0CgzJJIoUNqm6hAXGeRl+8ewoHXCUvI6dG
         tzig==
X-Gm-Message-State: AOAM531+0LIcUo9UWsS8JE3wN60z5RZJyQQLg06DMvh2tnQZ5kYjHNw5
        wBV6zjnaYTcKOzmfa5q4HA==
X-Google-Smtp-Source: ABdhPJwEdEOTURr205hHEkYgMTtaTA+IHNYydHc+eoQXCKth8FENQNTTuXPq7nCfQSdbabasrp1onA==
X-Received: by 2002:a9d:1c9f:: with SMTP id l31mr21456301ota.244.1624297217906;
        Mon, 21 Jun 2021 10:40:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d20sm4078210otq.62.2021.06.21.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:17 -0700 (PDT)
Received: (nullmailer pid 1161641 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org
In-Reply-To: <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com> <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L SoC bindings
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.383434.1161640.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Jun 2021 10:39:38 +0100, Biju Das wrote:
> Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need to
> turn on both these phy modules before accessing host registers.
> 
> Apart from this, document the optional property dr_mode present on both
> RZ/G2 and R-Car Gen3 SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/generic-ohci.yaml:14:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494981

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

