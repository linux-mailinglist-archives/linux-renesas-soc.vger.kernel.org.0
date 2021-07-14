Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAB23C931C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 23:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235894AbhGNVai (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 17:30:38 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:38408 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbhGNVah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:30:37 -0400
Received: by mail-io1-f51.google.com with SMTP id k11so3921197ioa.5;
        Wed, 14 Jul 2021 14:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J/ReVbiTk2Pp+7qp5lYTj2UHDsQO4CZkglKvjFpt50o=;
        b=MNe+jSxqEZhywvMGAQqAmbTbZbMGB1fO2ppZZSnxrgPbOkxBq9mWxNlg2V7lujV0L2
         ACdeDLQ4duopE/xmQDvFPzk4UC6aT/ZJ5sIF6Q2HlscsLlO+t2ZHMBAc9R3KwG20oyIo
         WPd4B6KiwCVIh9jRcyHk2GGdCJyCdgkkQ8zKhLlzNzmOsqe26aEg7d42z0dbMF9t2ztq
         H54KuxNhDG3ACYCCosAPCkEYUqJLHhvY848DV9UBJH80GBHUJ48UQl3UuGniu1pVZ5Eh
         CEbV5loegs0ew99dlGU64puN5HlTnIW4CGRDDq5b+aqJdc2PWq+y3jAAzxUUbwl+/+uJ
         3EdA==
X-Gm-Message-State: AOAM530bUfK6GgRueKZI0PqJCuI2rdf2hEKxQapN6tmLP/zcE4Fmjaic
        YC9+Y4Qta6LIzjRP8bxLPw==
X-Google-Smtp-Source: ABdhPJzF+WXVwhM3PBPCWb1ruVeuC7MbiUffW4p41YL3Rst7bjcEaPbzrlpMxyeJh4/X3UxCDF8X2A==
X-Received: by 2002:a05:6602:1492:: with SMTP id a18mr123594iow.200.1626298064635;
        Wed, 14 Jul 2021 14:27:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m13sm1887107ila.80.2021.07.14.14.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:27:43 -0700 (PDT)
Received: (nullmailer pid 3556885 invoked by uid 1000);
        Wed, 14 Jul 2021 21:27:41 -0000
Date:   Wed, 14 Jul 2021 15:27:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-usb@vger.kernel.org, aford@beaconembedded.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Support external
 ref clock
Message-ID: <20210714212741.GA3554282@robh.at.kernel.org>
References: <20210630173042.186394-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630173042.186394-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 30, 2021 at 12:30:40PM -0500, Adam Ford wrote:
> The usbhs driver expects a fixed external reference clock, but it
> could be sourced from a programmable clock instead of a fixed clock.
> Add support for an optional 4th reference clock.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> index e67223d90bb7..2372d8c42979 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -53,11 +53,12 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4

You won't need this in v5.14-rc1. These are implied by 'items' length if 
not specified.

>      items:
>        - description: USB 2.0 host
>        - description: USB 2.0 peripheral
>        - description: USB 2.0 clock selector
> +      - description: Optional external reference clock
>  
>    interrupts:
>      maxItems: 1
> -- 
> 2.25.1
> 
> 
