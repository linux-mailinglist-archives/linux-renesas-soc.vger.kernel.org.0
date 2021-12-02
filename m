Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2955F466475
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Dec 2021 14:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346701AbhLBNZt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Dec 2021 08:25:49 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:44776 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346690AbhLBNZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 08:25:49 -0500
Received: by mail-vk1-f170.google.com with SMTP id u68so18396843vke.11;
        Thu, 02 Dec 2021 05:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAJ3PyU44ARyLbRf7PANv6H6d7q5kQeyFexxbBVhBYA=;
        b=md07rwan5EKX2Q/gTRMti8Lamn54A5/2t9GOWOvveTrESFuO9+BRSgNS7GB7aBWIEJ
         PRzw2Qw7Vqpae+tu8+t15QKSXA7qUJvgEZ7XYYgi87SFmd2tNKg8FsZwPsfQqmwAJwx7
         6aTzduTe4nYlJMjdLYJLYHc3Lu5Tvb4iJTSu5AMcDYwNjMpuZepuL3y8D2b6mG3Y+g/l
         RGrDwwYdm4kgHHOPOKFTgTa8eOL3fPSWkrflJKA/MWOwVQL+KM5SQkYIC7/FjE7N4l77
         MiBugTI9NvLabn2UA53ozoBiILw8DNT+l/mb4OZJNyte8S664mhyC67Rtay4g718SjtD
         VTxg==
X-Gm-Message-State: AOAM532tLxXnhIIMsubW+XzLXHHWZ5QlUBkMIulU3rsVAarwrwtDciYX
        iP/RzkjmYycnpmByaA7JpoNAU60LJak0tA==
X-Google-Smtp-Source: ABdhPJytuU/Eq/1TbQY79WGIapapscpzHzIZRr2RbloUhiDXRXr+a9c3YOWWGraoAleSRQ/WOY0Tlg==
X-Received: by 2002:a05:6122:886:: with SMTP id 6mr16317201vkf.7.1638451345956;
        Thu, 02 Dec 2021 05:22:25 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 6sm823514vkq.23.2021.12.02.05.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 05:22:25 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id j14so55609281uan.10;
        Thu, 02 Dec 2021 05:22:25 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr14279049vst.5.1638451345328;
 Thu, 02 Dec 2021 05:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20211130100049.129418-1-julien.massot@iot.bzh> <20211130100049.129418-2-julien.massot@iot.bzh>
In-Reply-To: <20211130100049.129418-2-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Dec 2021 14:22:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoKvgvRcQwq4fuP4WHr5me5cXKG8w0fotVO3Eqrne-2A@mail.gmail.com>
Message-ID: <CAMuHMdUoKvgvRcQwq4fuP4WHr5me5cXKG8w0fotVO3Eqrne-2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add Renesas R-Car
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

Thanks for your patch!

On Tue, Nov 30, 2021 at 11:01 AM Julien Massot <julien.massot@iot.bzh> wrote:
> Renesas R-Car SoCs may contains a Realtime processor.

contain

> This patch adds binding for this remote processor.

bindings

>
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1
> - dropped 'status = "okay";' in the sample
> - Add Rob's Reviewed-by tag
>
> ---
>  .../remoteproc/renesas,rcar-rproc.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> new file mode 100644
> index 000000000000..3fe8d49051e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas R-Car remote processor controller bindings
> +
> +maintainers:
> +  - Julien Massot <julien.massot@iot.bzh>
> +
> +description: |
> +  This document defines the binding for the remoteproc component that loads and

bindings

> +  boots firmwares on the Renesas R-Car family chipset.
> +  R-Car gen3 family may have a realtime processor, this processor share peripheral

shares

> +  and RAM with the host processor with the same address map.
> +
> +properties:
> +  compatible:
> +    const: renesas,rcar-cr7
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  memory-region:
> +    description:
> +      List of phandles to the reserved memory regions associated with the
> +      remoteproc device. This is variable and describes the memories shared with
> +      the remote processor (e.g. remoteproc firmware and carveouts, rpmsg

carve-out

> +      vrings, ...).
> +      (see ../reserved-memory/reserved-memory.yaml)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
