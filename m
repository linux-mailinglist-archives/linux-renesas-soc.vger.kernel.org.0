Return-Path: <linux-renesas-soc+bounces-742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCB805967
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 17:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81BB1281E7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 16:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F35F60BAC;
	Tue,  5 Dec 2023 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kg6KBv8A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940D5120
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 08:04:25 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1cee2c1620so58438566b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2023 08:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701792264; x=1702397064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueB6I2UkSgD9Goo0ueWdFF2OUn4YP4cOmqEsc/9hoFc=;
        b=kg6KBv8AVXxZxVbWjAk2vHx4PWKjxVLllMcbHGzXCOJoTT3lgVMCuxYOIf6sj9AW/0
         /a14UFynMT0G6ENCbk1ifgm+8EufgRDWEmnhfSSh3vhF1BkPqhz+I4xJT6IyDQKuorRu
         Y8N3QwIsJMqP0KafY+7tj053G0kRWB6CeASAjopcwMNxG5CzdibmaECD5NyqaHI3xB72
         CBUgIOlE3l7vFw7ik51+WCFu3Zhyp+PIQnJEG0Z1A1CjmRIpsvymExJa42hHH3G6KuVt
         HxmkO1VnXUF4tBYugFMq1va8wtcg/iP1TTWlO742e0fQxb49LCbkcFjVjf/kAbPXqrlb
         gpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701792264; x=1702397064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueB6I2UkSgD9Goo0ueWdFF2OUn4YP4cOmqEsc/9hoFc=;
        b=r+iCS9iBb+1W69zfu0Q7sszzqwY84XCr8+zCxQYQ4YI4K7wkWfSQvplo3GWFG/6bU4
         +ajysuPcM7zBZEH574WHob78fCTMKodL5Qk+9vBvF6OQbhATxv4q7WqVI3IKT1cebM0Y
         3wBuMZgj03YrC63J0+cLGdzskiM+RT5MCUsb+e7Uf4yfB+eWNzsfpaDltrHVGk4f4i12
         +HFS5jT7di0j8GTjQVoPizL56CnYWzvEQiuc0q8BTwDoHQr7wCZo8tYlzxt48VrMwVXR
         53bDOAmpwWJD+QCrrJpqOV6bprlaXO8yJIfCJy7T3PJBSQlFKKKiaRpXLJx2bqxZmB1/
         EHNA==
X-Gm-Message-State: AOJu0Yxi+Wk36VWpyQotjdwVc4Xyr4B33eHqJK9lDIdSFFtjVkS7W8F0
	BgmSGVqqpMS+Bt14ezaK5qtmrg==
X-Google-Smtp-Source: AGHT+IHbq53ZFp4bfxBK3FtQxIJHrdlvm3xVH/Yxjog4NGTK90zRrrwXqW53LMiUSrecuMtupwD1jw==
X-Received: by 2002:a17:906:1:b0:a19:d40a:d1e4 with SMTP id 1-20020a170906000100b00a19d40ad1e4mr2040169eja.176.1701792263900;
        Tue, 05 Dec 2023 08:04:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906565300b00a19644675aasm6184442ejr.23.2023.12.05.08.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 08:04:23 -0800 (PST)
Message-ID: <bca9f847-1ec8-46c5-bbee-1379e74eb081@linaro.org>
Date: Tue, 5 Dec 2023 17:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE v5 17/37] dt-bindings: interrupt-controller:
 renesas,sh7751-intc: Add json-schema
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, David Rientjes <rientjes@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Guo Ren <guoren@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Tom Rix <trix@redhat.com>,
 Herve Codina <herve.codina@bootlin.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <1fafcf1c70ee4e38847bac1379bcb4555a237505.1701768028.git.ysato@users.sourceforge.jp>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1fafcf1c70ee4e38847bac1379bcb4555a237505.1701768028.git.ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2023 10:45, Yoshinori Sato wrote:
> Renesas SH7751 INTC json-schema.
> 

This should not be a separate commit from the header bindings. I already
gave such feedback before. Binding headers and bindings documentation
for the same block come together.

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-intc.yaml                  | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
> new file mode 100644
> index 000000000000..9d05c10f5c32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7751 Interrupt Controller
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,sh7751-intc
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: ICR
> +      - const: INTPRI00

Both lowercase

> +
> +  renesas,icr-irlm:
> +    type: boolean
> +    description: If true ICR.IRLM=1

Unfortunately neither description nor property name tells me anything.
Description basically copies property name, so it's not useful.

> +
> +  renesas,ipr-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      IRQ to IPR mapping definition.
> +      1st - INTEVT
> +      2nd - Register
> +      3rd - bit index
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +  - reg
> +  - reg-names
> +  - renesas,ipr-map
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/sh_intc.h>
> +    shintc: interrupt-controller@ffd00000 {
> +            compatible = "renesas,sh7751-intc";
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +            reg = <0xffd00000 14>, <0xfe080000 128>;
> +            reg-names = "ICR", "INTPRI00";

reg should be the second property, reg-names should follow.

Best regards,
Krzysztof


