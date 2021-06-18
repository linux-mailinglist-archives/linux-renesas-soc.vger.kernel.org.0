Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E607B3AC575
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 09:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhFRH6A convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 03:58:00 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:43773 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhFRH57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 03:57:59 -0400
Received: by mail-vk1-f173.google.com with SMTP id d13so1946440vkl.10;
        Fri, 18 Jun 2021 00:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NE8Py0Gf3v4b0MqJSvb9EF4dYm1+tpkvdTqN3nc3VVM=;
        b=Fk2ptkofVtU9iIBJfGBCyZAo/i2L39jXEe2Q/mH/B25RPs8/AIanKPEMfXXiqnpO+f
         XDnhhQLUnp0GF6BVGTPcBnpNMqQi6Z1ivEy/+40gdtCCotP6vHLMbutpuCzIawpr73qM
         OPTBteBvm8Sc83x3yNCADRT8KrghGXxAdJMl+3U3ClzgDySlpyTzjWFF2mGUNVb4bPgZ
         8/T+tvzMJlgiYnwgjjjFW0zqaYaQlMp2Se4s8z7S4NNoTXRT3+9Eic9jxhTtKMFxoy+O
         CJ5Q4jNWD6dwsI3S0W94aBxhj7K8j6mMNA/rnb6zdQHKbUZGIRub2u8JU0b1E91JeutD
         PkyQ==
X-Gm-Message-State: AOAM533ViptLS6ujv8OREJgOXHtBuAQyCU9kguWfIuIwuKKBUHPYGKfh
        UO7BgJK/Y3/nrLqC0C9kYpby5gcuMLjy8YqYqRE=
X-Google-Smtp-Source: ABdhPJx43PZctNreiC7SzE2DHQBZ8qTyJ51SFteog7CwZpiL6AnPx2FDnjUiL41vWOQrxlnWS6EEV3MRDQmKfhEGNY0=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr4848233vkd.6.1624002949944;
 Fri, 18 Jun 2021 00:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210615131333.2272473-1-ricardo.canuelo@collabora.com> <20210615131333.2272473-4-ricardo.canuelo@collabora.com>
In-Reply-To: <20210615131333.2272473-4-ricardo.canuelo@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 09:55:38 +0200
Message-ID: <CAMuHMdU8ZC3LrhVLnZgOc_ZtNNcHbAHjEgP_5QpF8UEsbatGgA@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 3/3] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        alexandre.torgue@foss.st.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ricardo,

On Tue, Jun 15, 2021 at 3:15 PM Ricardo Cañuelo
<ricardo.canuelo@collabora.com> wrote:
> Convert the ADV7511/11w/13/33/35 DT bindings to json-schema. The
> original binding has been split into two files: adi,adv7511.yaml for
> ADV7511/11W/13 and adi,adv7533.yaml for ADV7533/35.
>
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch, which is now commit cfe34bb7a770c5d8
("dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml")
in robh/for-next.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml

> +required:
> +  - compatible
> +  - reg
> +  - ports
> +  - adi,input-depth
> +  - adi,input-colorspace
> +  - adi,input-clock
> +  - avdd-supply
> +  - dvdd-supply
> +  - pvdd-supply
> +  - dvdd-3v-supply
> +  - bgvdd-supply

This causes lots of failures like:

    arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dt.yaml: hdmi@39:
'avdd-supply' is a required property

Should all supplies be required?
Looking at the driver, missing supplies are automatically replaced by
dummy regulators by the regulator framework.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
