Return-Path: <linux-renesas-soc+bounces-254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B877F9046
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Nov 2023 00:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3192811C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Nov 2023 23:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E82831595;
	Sat, 25 Nov 2023 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="1ts85+fB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDEA133
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2023 15:15:39 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507962561adso4687878e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Nov 2023 15:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700954138; x=1701558938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGFaf+ETqCnHk8JiD8A042rYvg2H80ZFMxgBvI539vI=;
        b=1ts85+fBJb/nO86KK9TJjMM9hIa0WTN05ggJX4DIO66fVN7CRoOJZEuqkJyjy56DuL
         r4VS1DH/RFKe2F+bF8g7Ynyo6aJr/aWpFp/G4RH7+kdS1IrWkNAlO2aW0XKEtEEBBU6O
         lAsezuOp7W0lVvO0ntVfAAUmDEXROqDQTs14P0RW9WAtPpFKNg7kEHs+aXCyPV6eGAFZ
         j7PRR1Vygc9WahEU728EvxT1i4rjMlu13OcG5pt88FrWAGDm9yY/tWCYqzPB6PSbhmuy
         Ewco0hrXpKtFpA6q9qTX6rKCJmETT1gnS6jpyOTBH9EIGIh3Dw8ll+1k7c+wsG026bV2
         6rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700954138; x=1701558938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGFaf+ETqCnHk8JiD8A042rYvg2H80ZFMxgBvI539vI=;
        b=UlEMK//0rzP30i8M2sUjO/WmZwuZS7nyd5KJw3mUGexowgS2v4Afr8hBdqML+jfRjL
         0ZrKM+YH+KJFg55MzVx/qoSa7xf6p3QRyW3pUmhN6EEU+Y+wle4VF46Mq+fJyii5s0bV
         y7rR5i6/TsBTCmThVDnICcunirz8bi7oRBz8mVUHMz9xGlmZJLaSCbN2arT/t1XZO1FN
         AG5NyOWuhjYi9qyzEkuRrnuFNw4Z9xIJeZmogVORuVfNrymT8obmkLh9ZdOoxZpXIAAt
         fLFVH1l5vea/ASyaD8HtPURN8cRagg57zMnMfYC5OBqAUokMtg5nKYHs7WC9DQEtgguA
         C83w==
X-Gm-Message-State: AOJu0YxmF9HD/Jwv/wtXqzuThrmXSgFbeA3zcVGDq+sPEqUpfPgz7wHl
	/GlgHl/CRvScYGOyDttzLx1yqg==
X-Google-Smtp-Source: AGHT+IFn0ukWHweVX6SvLZ3CgpGPTTMcGnllaCZzjQJXuMflkfWq0S962RziUK6GNpzbJl/YpX9h8Q==
X-Received: by 2002:a05:6512:50f:b0:50b:ad20:b119 with SMTP id o15-20020a056512050f00b0050bad20b119mr433263lfb.68.1700954137166;
        Sat, 25 Nov 2023 15:15:37 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id x8-20020a19f608000000b004fe36bae2d6sm974633lfe.81.2023.11.25.15.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 15:15:36 -0800 (PST)
Date: Sun, 26 Nov 2023 00:15:34 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC] dt-bindings: renesas: Document preferred compatible naming
Message-ID: <ZWKAFirL8lHFYi6v@oden.dyn.berto.se>
References: <20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVZd3z-Hd-TrFVsV10rcjXKAxwS4rKRG5Yb1D024fHpxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVZd3z-Hd-TrFVsV10rcjXKAxwS4rKRG5Yb1D024fHpxA@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2023-11-24 09:02:28 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, Nov 23, 2023 at 8:07 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Compatibles can come in two formats. Either "vendor,ip-soc" or
> > "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> > policy and enforcing it for all new compatibles, except few existing
> > patterns.
> >
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/renesas-soc.yaml
> 
> s/arm/soc/

I opted to put this in soc/renesas/renesas-soc.yaml.

> 
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/renesas-soc.yaml#
> 
> s/arm/soc/
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas SoC compatibles naming convention
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> 
> +renesas?

Nope, I don't record the +renesas part in files. I fear the day Gmail
drops support for the feature or I need to switch mail provider.

> 
> > +
> > +description: |
> > +  Guidelines for new compatibles for SoC blocks/components.
> > +  When adding new compatibles in new bindings, use the format::
> > +    renesas,SoC-IP
> > +
> > +  For example::
> > +   renesas,r8a77965-csi2
> > +
> > +  When adding new compatibles to existing bindings, use the format in the
> > +  existing binding, even if it contradicts the above.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      pattern: "^renesas,.*$"
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      # Preferred naming style for compatibles of SoC components:
> > +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r7s[0-9]+-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r8a[a-z0-9]+-[a-z0-9-]+$"
> > +      - pattern: "^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$"
> 
> Missing renesas,rcar-* families.
> 
> > +      - pattern: "^renesas,rzn1-[a-z0-9-]+$"
> 
> Missing renesas,rzg2l-* (there may be more).

There where a few more, added.

> 
> > +      - pattern: "^renesas,rzv2m-[a-z0-9-]+$"
> > +      - pattern: "^renesas,sh73a0-[a-z0-9-]+$"
> 
> We'll get more sh7* soon ;-)

I adapted the regexp to prepare for this.


> 
> > +
> > +      # SoC agnostic compatibles - new compatibles are OK:
> > +      - enum:
> > +          - renesas,bsid
> > +          - renesas,fcpf
> > +          - renesas,fcpv
> > +          - renesas,fdp1
> > +          - renesas,prr
> > +          - renesas,smp-sram
> 
> Missing renesas,tmu (there may be more).

As discussed offline I will change the pattern in the initial select to 
only match on .*-.* so most of these will be gone.

> 
> > +          - renesas,vsp1
> > +          - renesas,vsp2
> > +
> > +      # Legacy namings - variations of existing patterns/compatibles are OK,
> > +      # but do not add completely new entries to these:
> > +      - pattern: "^renesas,du-[a-z0-9]+$"
> > +      - pattern: "^renesas,ether-[a-z0-9]+$"
> > +      - pattern: "^renesas,gether-[a-z0-9]+$"
> > +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
> > +      - pattern: "^renesas,pfc-[a-z0-9]+$"
> > +      - pattern: "^renesas,sata-[a-z0-9]+$"
> > +      - pattern: "^renesas,scif-[a-z0-9]+$"
> > +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
> > +      - pattern: "^renesas,thermal-[a-z0-9]+$"
> > +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
> > +      - pattern: "^renesas,vin-[a-z0-9]+$"
> 
> This list also looks incomplete, e.g. hscif and scif[ab] are missing.
> I guess you created it based on the error output of "make dtbs_check",
> which ignores all nodes that are disabled?  Although that can't explain
> everything, as some boards use scifa for the console...

Not sure how my tests missed so much. For next version I have extracted 
all compatible variables and created a test dts file with every 
available value. There where quiet a lot missing in this RFC.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

