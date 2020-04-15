Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026631AA917
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 15:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391640AbgDONv1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 09:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732815AbgDONvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 09:51:22 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07BE920775;
        Wed, 15 Apr 2020 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586958682;
        bh=tgRWJgcQnzKnLeznzhvqULTc+zIFVRd3kVZ1uDyLL4w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xyi7WTFF1Ivk4AODkFjXnSTYive/d79InJiM153usRGt4/wRuN866slUW6VebcJFa
         6ykBjbm0i7Q02mno8mWmn+Xw9XUFojyv3RWQU1hwipMpKTX/BZRAwbfDHhl+qDVpJS
         ujrLqag7FiRoHeztpZ2PnxWADR/hHDmM3272wLWM=
Received: by mail-qk1-f176.google.com with SMTP id b62so17211447qkf.6;
        Wed, 15 Apr 2020 06:51:21 -0700 (PDT)
X-Gm-Message-State: AGi0PubvsPXQrO1kNShZ6/mR76MIcA+wPpiCpaURl2EdmO1kV4uQh1rz
        UBh7X0yW/yVB5uLO5ZS9HYwZ8TXVNlkJpeWmRg==
X-Google-Smtp-Source: APiQypJ3111GBMYlDRbfn4eXTDJL7JtT27pCtIPZGQwiYB10ssWlg+vntVXMHZ59a9Y9Ehae3ReAQAzk3dJAf4jH+1E=
X-Received: by 2002:a37:cc1:: with SMTP id 184mr23450327qkm.254.1586958681147;
 Wed, 15 Apr 2020 06:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200415005427.GY19819@pendragon.ideasonboard.com> <20200415005909.18650-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200415005909.18650-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 15 Apr 2020 08:51:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTMJgbW5uJ4LcetUXcNGWacWMvB6RN-1s_S8+C9QZ_Lw@mail.gmail.com>
Message-ID: <CAL_JsqJTMJgbW5uJ4LcetUXcNGWacWMvB6RN-1s_S8+C9QZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v1.1 2/4] dt-bindings: display: bridge: Convert
 simple-bridge bindings to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 14, 2020 at 7:59 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The simple-bridge driver supports multiple simple or dumb bridges,
> covered by different compatible strings but otherwise identical DT
> bindings. Some of those bridges have undocumented bindings, while others
> are documented in text form in separate files. Group them all in a
> single binding and convert it to YAML.
>
> The psave-gpios property of the adi,adv7123 is dropped, as it isn't
> supported by the driver and isn't specified in any DT file upstream.
> Support for power saving is available through the enable-gpios property
> that should cover all the needs of the ADV7123 (as the device only has a
> /PSAVE pin and no enable pin).
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes since v1:
>
> - Mention dropping psave-gpios in the commit message.
> ---
>  .../bindings/display/bridge/adi,adv7123.txt   | 50 ----------
>  .../bindings/display/bridge/dumb-vga-dac.txt  | 50 ----------
>  .../display/bridge/simple-bridge.yaml         | 99 +++++++++++++++++++
>  .../bindings/display/bridge/ti,ths813x.txt    | 51 ----------
>  4 files changed, 99 insertions(+), 151 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt

Reviewed-by: Rob Herring <robh@kernel.org>
