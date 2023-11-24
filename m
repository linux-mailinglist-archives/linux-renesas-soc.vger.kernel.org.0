Return-Path: <linux-renesas-soc+bounces-224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2727F6D97
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 09:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57D728119B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 08:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FBF8C13;
	Fri, 24 Nov 2023 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41878211D;
	Fri, 24 Nov 2023 00:02:44 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ce2ea3a944so1028766a34.1;
        Fri, 24 Nov 2023 00:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700812962; x=1701417762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR3HxZblBwQM3pX4LLf3vm2q4AcMLynH0EFs0zCK8dE=;
        b=gBauUqCc5CAxW5QFT5XnPz8lvpbZKQVKP8vbsxUEc6AQ2hI6v3omo7PtNUJC8qChBK
         t/wRX3izC6oWIRXw6NePKywen5bXc52klEA1Hof5XCPE3I9O2BPLMRLqT/hNJld2R2M/
         UenR6u4W5F1AN1dU1sTnFVz4eGzDB1AuvxwWRr5jDbb1EEAADe4KNRLexb3IYXSpv/j5
         Zmq+749/jqS2Wo0VC5mN7/kQfswn/qgKo6HE7cgVUTkEEPtkv24P83vz6sO8c/SKZLci
         z9e1giePcxP5o7gB4p+JDkZuLCarHlcFrreFTQlUgyoINy24jn6r/r1kt72SLFxFIBeG
         jNNQ==
X-Gm-Message-State: AOJu0YyWDQ28cURqj1SMvPcUDDdoUPjcruLvqC99aUcBtg4stLxuwt7z
	Y0Qyd3oU57+NOLLt6KV3ZKyHnwxnn399Dw==
X-Google-Smtp-Source: AGHT+IFzSXlJcbLotu2Ci0mkMiZUr5+raUEO3Jsk8tnpMV8Plcx3kUZR868LW6QwGxNfmnHDeI/sDg==
X-Received: by 2002:a05:6830:1be6:b0:6b9:cba0:93a9 with SMTP id k6-20020a0568301be600b006b9cba093a9mr2041504otb.31.1700812962390;
        Fri, 24 Nov 2023 00:02:42 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id j13-20020a9d7f0d000000b006ce28044207sm430350otq.58.2023.11.24.00.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 00:02:42 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f9e79c68ccso465870fac.1;
        Fri, 24 Nov 2023 00:02:42 -0800 (PST)
X-Received: by 2002:a05:6870:7999:b0:1e9:9c34:af67 with SMTP id
 he25-20020a056870799900b001e99c34af67mr2462636oab.18.1700812961780; Fri, 24
 Nov 2023 00:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20231123190612.2427668-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Nov 2023 09:02:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZd3z-Hd-TrFVsV10rcjXKAxwS4rKRG5Yb1D024fHpxA@mail.gmail.com>
Message-ID: <CAMuHMdVZd3z-Hd-TrFVsV10rcjXKAxwS4rKRG5Yb1D024fHpxA@mail.gmail.com>
Subject: Re: [RFC] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Nov 23, 2023 at 8:07=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/renesas-soc.yaml

s/arm/soc/

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/renesas-soc.yaml#

s/arm/soc/

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SoC compatibles naming convention
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>

+renesas?

> +
> +description: |
> +  Guidelines for new compatibles for SoC blocks/components.
> +  When adding new compatibles in new bindings, use the format::
> +    renesas,SoC-IP
> +
> +  For example::
> +   renesas,r8a77965-csi2
> +
> +  When adding new compatibles to existing bindings, use the format in th=
e
> +  existing binding, even if it contradicts the above.
> +
> +select:
> +  properties:
> +    compatible:
> +      pattern: "^renesas,.*$"
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      # Preferred naming style for compatibles of SoC components:
> +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> +      - pattern: "^renesas,r7s[0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,r8a[a-z0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,r9a[0-9]+g[0-9]+-[a-z0-9-]+$"

Missing renesas,rcar-* families.

> +      - pattern: "^renesas,rzn1-[a-z0-9-]+$"

Missing renesas,rzg2l-* (there may be more).

> +      - pattern: "^renesas,rzv2m-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh73a0-[a-z0-9-]+$"

We'll get more sh7* soon ;-)

> +
> +      # SoC agnostic compatibles - new compatibles are OK:
> +      - enum:
> +          - renesas,bsid
> +          - renesas,fcpf
> +          - renesas,fcpv
> +          - renesas,fdp1
> +          - renesas,prr
> +          - renesas,smp-sram

Missing renesas,tmu (there may be more).

> +          - renesas,vsp1
> +          - renesas,vsp2
> +
> +      # Legacy namings - variations of existing patterns/compatibles are=
 OK,
> +      # but do not add completely new entries to these:
> +      - pattern: "^renesas,du-[a-z0-9]+$"
> +      - pattern: "^renesas,ether-[a-z0-9]+$"
> +      - pattern: "^renesas,gether-[a-z0-9]+$"
> +      - pattern: "^renesas,ipmmu-[a-z0-9]+$"
> +      - pattern: "^renesas,pfc-[a-z0-9]+$"
> +      - pattern: "^renesas,sata-[a-z0-9]+$"
> +      - pattern: "^renesas,scif-[a-z0-9]+$"
> +      - pattern: "^renesas,sdhi-[a-z0-9]+$"
> +      - pattern: "^renesas,thermal-[a-z0-9]+$"
> +      - pattern: "^renesas,usb2-phy-[a-z0-9]+$"
> +      - pattern: "^renesas,vin-[a-z0-9]+$"

This list also looks incomplete, e.g. hscif and scif[ab] are missing.
I guess you created it based on the error output of "make dtbs_check",
which ignores all nodes that are disabled?  Although that can't explain
everything, as some boards use scifa for the console...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

