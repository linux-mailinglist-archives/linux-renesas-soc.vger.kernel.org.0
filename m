Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039503C92E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 23:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhGNVTJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 17:19:09 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:38499 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbhGNVTG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:19:06 -0400
Received: by mail-io1-f51.google.com with SMTP id k11so3884179ioa.5;
        Wed, 14 Jul 2021 14:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K26yCSETh54rX7kd1+zlaFH8P9Xcv8M8/5lFHARyPJU=;
        b=FB6Q37UoPcIaRfx5is2cda4TLgvfMedfqVwwFThX/DiQmTMQpBxQoOcc/xK+FrFPWz
         5TLJhoNUH7pS48wIp+NZrlYnAFbonD0RG8K4rA8FC0TB5vsxU6f4a4hQe8EddiYt4bvX
         2OEVSyVYt5ZvdflojISKwUEaSdT/R/7a5pKOu9A/8bmNYKo8ek3X6PYyoPkbRLS9C+eY
         rcNXYSouEw/yqICxktxdF6bSW2sOgD6mMqHN2PCziaW8cbgXfAovtVLZV06h7Xxxza74
         HdE90ZS3bd+t9TGQe368kCkJty1rHuLlSO9I1qngZ9bBYGnSilDmAYF7aOdu7+yIqsiQ
         qKTQ==
X-Gm-Message-State: AOAM530EdYn1RznBI3dGR5TtgN7lZBXjy79uPnLwgvdHE6xDik5GAEfS
        Qe5+eFAJjtLR2Gn42wwvFy0cAFOz7gUU
X-Google-Smtp-Source: ABdhPJzr+4CnkSMjmC+hlHuq2CHCzQcEAs5aOhSbBF1JrGtk/gwoZ9si+/GYAhI6AfgUK/MrHbrpAw==
X-Received: by 2002:a6b:4412:: with SMTP id r18mr98061ioa.120.1626297374033;
        Wed, 14 Jul 2021 14:16:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18sm1825748ilp.68.2021.07.14.14.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:16:12 -0700 (PDT)
Received: (nullmailer pid 3538862 invoked by uid 1000);
        Wed, 14 Jul 2021 21:16:06 -0000
Date:   Wed, 14 Jul 2021 15:16:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: usb: generic-ohci: Document
 dr_mode property
Message-ID: <20210714211606.GA3538828@robh.at.kernel.org>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630073013.22415-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Jun 2021 08:30:03 +0100, Biju Das wrote:
> Document the optional property dr_mode present on both RZ/G2 and
> R-Car Gen3 SoCs.
> 
> It fixes the dtbs_check warning,
> 'dr_mode' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>   * Dropped RZ/G2L SoC and USBPHY control IP is modelled as reset binding.
> v2:
>   * New patch
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
