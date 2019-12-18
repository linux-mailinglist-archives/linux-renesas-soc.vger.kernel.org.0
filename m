Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2439B124625
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 12:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLRLwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 06:52:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36369 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfLRLwn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 06:52:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so1985736wru.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2019 03:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5sSTGpDRxabuDJDannTFooEyUXU6ZKWxoHoTsTv/oaU=;
        b=SVPozPJ/7+rA1vYBHo8uvcPC9yn2yOXGJGPuX3Iy25un1mtda/z89Phf/yWyL8tQdb
         XA8NcoAeaYjxIXXFxavdNdfFR2MhAfYRRQn1SqApmnURbbv5jzNpqAFlq+051MQ5peWT
         S9CTDWFrFOBc+bSwdC5TSQ88jabqrcpojBMRmONO3C+8HEEw3At9dy2Mj2UlbY5KqRZh
         9jjuyhigKv/T9/0K31FwaOfJmXliD5Yj/qERbq066c+BkqoSQAal6MHp3az/BV6v2hqv
         2g/+A2P5yAk8Xni4952hXGXpIYkbjAALZrmGzjNnR7Pg0ZYZROFI/ZonkiWEz4DHPXWJ
         oIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5sSTGpDRxabuDJDannTFooEyUXU6ZKWxoHoTsTv/oaU=;
        b=Q8y86NFWduwG9VPkx8DEm32XaP+bRvbDprW4xmJunZsX3WmwVmEgcSIK406oNwIoPi
         ifPMlcIT8iFn61nkbfGfDpPLLdw/CoykfpjEFzrpUL/vUam7HJoMacGPUVsb7Wih6cR+
         F6B33twYPjI3atVyoQGAdwPWffFlb0PrPRqmQwQIlp4bBCNQTkM3tDz+TQpAlW7azRgY
         uMl20Oc/K2R1seTd1fQtECkCcfOM29vjfp5uoVPcBSOdobgRvwYbYMLv/+E32Gmq8tne
         H/mMJ5IHAwsa2tq624+NzhG5/0EbCXuHIRu9Z/ukV2wCV26XpmK/7Pplg5k2bLLEm0oK
         41Ew==
X-Gm-Message-State: APjAAAVc+qmBd89aHEjtaG2N7kd54obZCmaq0afIBkE+HlCAim7f96T3
        t43BTt4Yyfca3dqQhSGJG2wCyg==
X-Google-Smtp-Source: APXvYqwYxtGAULoL10jec/7gdKWvAFjc/YfFz5SiPChvlUszG83X83VpXN/pZOdAzJXl9+Rc2YG4wQ==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr2469070wru.122.1576669960557;
        Wed, 18 Dec 2019 03:52:40 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id f12sm2174489wmf.28.2019.12.18.03.52.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 03:52:39 -0800 (PST)
Subject: Re: [PATCH v4 00/13] Add LCD panel support to iwg20d
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <41b59b13-1c8d-a407-8fd8-f2d8cfadd43d@baylibre.com>
Date:   Wed, 18 Dec 2019 12:52:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 13/11/2019 16:51, Fabrizio Castro wrote:
> The iW-RainboW-G20D-Qseven RZ/G1M,G1N Qseven Development Platform
> comes with a 7" capacitive display kit from Emerging Display
> Technologies Corporation (EDT). This series adds all that's
> necessary for supporting it.
> 
> Thanks,
> Fab
> 
> v3->v4:
> * Reworked according to Laurent's and Jacopo's comments
> v2->v3:
> * Split the dt-schema patch in two patches as per Rob's comment
> * Made fixes to the dt-schema according to Rob's comment
> * Made fixes to the lvds-codec driver according to Jacopo's comments
> * Added two new patches:
>   * drm: Define DRM_MODE_CONNECTOR_PARALLEL
>   * drm/panel: panel-simple: Add connector type for etm0700g0dh6
> v1->v2:
> * Convert dt-bindings to dt-schema
> 
> Fabrizio Castro (13):
>   dt-bindings: display: bridge: Convert lvds-transmitter binding to
>     json-schema
>   dt-bindings: display: bridge: lvds-transmitter: Document
>     powerdown-gpios
>   dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
>   dt-bindings: display: bridge: lvds-transmitter: Document
>     "ti,sn75lvds83"
>   drm/bridge: Repurpose lvds-encoder.c
>   drm/bridge: lvds-codec: Add "lvds-decoder" support
>   drm/bridge: lvds-codec: Simplify panel DT node localisation
>   dt-bindings: display: bridge: Repurpose lvds-encoder
>   dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
>   ARM: dts: iwg20d-q7-common: Add LCD support
>   ARM: shmobile_defconfig: Enable support for panels from EDT
>   [HACK] drm/bridge: lvds-codec: Enforce device specific compatible
>     strings
>   [HACK] dt-bindings: display: bridge: lvds-codec: Absorb
>     thine,thc63lvdm83d.txt
> 
>  .../bindings/display/bridge/lvds-codec.yaml        | 131 +++++++++++++++
>  .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------
>  .../bindings/display/bridge/thine,thc63lvdm83d.txt |  50 ------
>  .../bindings/display/bridge/ti,ds90c185.txt        |  55 -------
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi            |  85 ++++++++++
>  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi           |   1 -
>  arch/arm/configs/shmobile_defconfig                |   3 +
>  drivers/gpu/drm/bridge/Kconfig                     |   8 +-
>  drivers/gpu/drm/bridge/Makefile                    |   2 +-
>  .../drm/bridge/{lvds-encoder.c => lvds-codec.c}    | 179 +++++++++++++--------
>  10 files changed, 333 insertions(+), 247 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
>  rename drivers/gpu/drm/bridge/{lvds-encoder.c => lvds-codec.c} (25%)
> 

Applying patches 1->9 and 13 to drm-misc-next with correct SoB.

Also applied change on patch 8 while applying.

And checked the diff is the same as laurent's PR.

Neil
