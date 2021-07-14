Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD143C92EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 23:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhGNVTY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 17:19:24 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:34639 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbhGNVTY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:19:24 -0400
Received: by mail-io1-f43.google.com with SMTP id g22so3901755iom.1;
        Wed, 14 Jul 2021 14:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IEjn0OfDAJIq+9wfXJN7FAtDLBe1LyH8ifymM6IbXT8=;
        b=K6shyiW3ERN2gmDPBrArIm4+5hI/89lEBcq5cW0S9rfklTk7HUlVCHIWlmPqpNB8P8
         t6aZdcOvd5TrDlqfYOEV7eaWFKOH4FHxU0ub76azYhV6abDT+8/MMrX/x3QzEhzx6r45
         0DGlB7MXjPmtfwbSlnpU84xCU4MnmgCOLTmqlKi2QrGPyxmxYGS/eh/lb59X0W3wV2QK
         /t4p3MJ1nOYNCcpF36kyBDRrKlylSh61d/2zcfSLtiaU+CUob+vposn0SVRUQjqqlkRc
         PtycrQvVCEQzPlgrc4oHkJn5agBGUXR09xNmS/swCg7bUrTTcKp26CDD1TlGvWuO+1Ca
         E3tA==
X-Gm-Message-State: AOAM5339jYguWOw+g3RbWf55nHdYgSM8l5eu+7rE62I+ccRyZE2OjP+i
        a21ijJ27MhfQiPOGCXB0GJtb5g4Z0Qf9
X-Google-Smtp-Source: ABdhPJz2hnp43dgVcKDRY+nePqJNpxL8F4PbHK8Xcv3XyFRhfdkvMIW1K9oAcDBCvRGIfCtImnt+FA==
X-Received: by 2002:a05:6638:204c:: with SMTP id t12mr199322jaj.129.1626297390192;
        Wed, 14 Jul 2021 14:16:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b2sm1955743iln.5.2021.07.14.14.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:16:27 -0700 (PDT)
Received: (nullmailer pid 3539423 invoked by uid 1000);
        Wed, 14 Jul 2021 21:16:24 -0000
Date:   Wed, 14 Jul 2021 15:16:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: usb: generic-ehci: Document
 dr_mode property
Message-ID: <20210714211624.GA3539394@robh.at.kernel.org>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630073013.22415-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Jun 2021 08:30:04 +0100, Biju Das wrote:
> Document the optional property dr_mode present on both RZ/G2 and
> R-Car Gen3 SoCs.
> 
> It fixes dtbs_check warning,
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
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
