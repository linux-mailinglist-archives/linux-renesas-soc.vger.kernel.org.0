Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0EC1A8E25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 00:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407797AbgDNWAH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 18:00:07 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42362 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407798AbgDNWAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 18:00:04 -0400
Received: by mail-ot1-f67.google.com with SMTP id l21so1337048otd.9;
        Tue, 14 Apr 2020 15:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L1I6J+GVjnlwCVqQEMnud8REAvNZ6BVdyLiYBiiCNQU=;
        b=N7i6k355Ng4kZ6mSrfCr2Q8LUaYClagIr0Wb8SCxhZeqg2m9t0Tth7epthYSiCziFy
         lEwpOt7uo0qLCQCuQGhtK1Nm7IQOr27+KuXegf63P+mnrAd68JVqI/eeLzL0G3UGMobu
         86a+CDTI4WCeS2Oect10rmgaomXDfxdABE/EApUBoi4TzCfcW/tlMqAu2+tnk3MgZ/JC
         VsFTS7EA4yqdt7FOxX8YX5j/yhyU55x3rvWjh/TKTsNKoIfiNC49xLTC3Gtf8cg1ZEgK
         uoK/FfhFLY+Ng7YdImJoB6HT1lM3QNbTQN5Qrsds50A2xiBQ4bOqQw8+i3qZhCEwUmDf
         W5hQ==
X-Gm-Message-State: AGi0PuYLOvRd2u/JBzQR/6jhwRwtB8meEpFerMb0wFi02ug2D5MI+IA2
        HgyvhF5MeOpFwkav9aoJ4g==
X-Google-Smtp-Source: APiQypJbdgOqQtDbAuA0ml+fwiQ0T0JQ1mWT/DZowS+twshAN8exXxrEeN2/uqlQ6qDxjO/f1OGnFQ==
X-Received: by 2002:a05:6830:1d2:: with SMTP id r18mr20268515ota.327.1586901602102;
        Tue, 14 Apr 2020 15:00:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r65sm5924724oig.0.2020.04.14.15.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:00:01 -0700 (PDT)
Received: (nullmailer pid 4140 invoked by uid 1000);
        Tue, 14 Apr 2020 22:00:00 -0000
Date:   Tue, 14 Apr 2020 17:00:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] dt-bindings: display: bridge: Convert simple-bridge
 bindings to YAML
Message-ID: <20200414220000.GA31265@bogus>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 06, 2020 at 02:23:16AM +0300, Laurent Pinchart wrote:
> The simple-bridge driver supports multiple simple or dumb bridges,
> covered by different compatible strings but otherwise identical DT
> bindings. Some of those bridges have undocumented bindings, while others
> are documented in text form in separate files. Group them all in a
> single binding and convert it to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> deleted file mode 100644
> index a6b2b2b8f3d9..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Analog Device ADV7123 Video DAC
> --------------------------------
> -
> -The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
> -parallel video input.
> -
> -Required properties:
> -
> -- compatible: Should be "adi,adv7123"
> -
> -Optional properties:
> -
> -- psave-gpios: Power save control GPIO

Not documented in the new schema. Did you intend to change to 
'enable-gpios'?

Rob
