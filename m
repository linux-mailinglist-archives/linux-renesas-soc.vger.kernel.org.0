Return-Path: <linux-renesas-soc+bounces-2652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B86851DFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 20:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780561F21B5C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 19:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C6146B83;
	Mon, 12 Feb 2024 19:36:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108864596E;
	Mon, 12 Feb 2024 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707766590; cv=none; b=tpemCI4aLOEzL0OGJj9ajD1ECcvGzv9nGXNpispKAz0lpyUzsxa9cAbIpiX1O4n+/DK45BLW78hyNqCUr5bd8gr8hgQLjYunYgoi4EGQ1fgIpO49+0eFGqg7zTZbOKLxrsIlFrw7rAdDJ1atDuhv1SYUe6I8XdpBqssrtUCXxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707766590; c=relaxed/simple;
	bh=MOOgzf4Y7qv2sC/nhPq7u4XY7HwhYErQ2/TDYSFQXlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOfhbnYLWzuzNwpiLdt7vd6jfrGce754pt2MHnMRvXEd+XX3UjvwNCbXL1FlBN+9KIp2kfnmwbLH0/VWLtarG96EN1Wjl8Tv2CVNC/8ZtEeLtAUFHd4G5UJGYmiOPQgt/wkBE/TiBFHBU7B/u1K4zmeK3B50s1miu5Q0gF1GMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6077a1d441eso4236237b3.1;
        Mon, 12 Feb 2024 11:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707766587; x=1708371387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnYnsGGg4lon5Zm4HMkwsmj4AeAbvyhWhQ7hOsWi91Y=;
        b=WLyWymLHxYPZiRMXOjQeNO8R/qSh9/MpWeikUFM/v+2AcY1ifcuOBCe3gj5erX9xwE
         ErXy9xPAEufwu9C5FLPY0EckQNQExx0zdsfv65RLQVpYSaan3M6oIAQjzDkjPX4OO6dv
         zXteL9tiyxquMpIn56RY+0m6ZJcvIKGftoscLuFAEQy+dNdnG4jVs7G19WfWKhtBtBRp
         6ZDtV6C2GsbJxWRVEM13lCmPa87Xhl/EHki2vl/HXcPalBoIMhHwhchxR7xkMgNuRI/h
         HaXdElKnJiJdP+XhyzLgrWSYjxvMmgRTlBp8X4uZrg/MO9KOIYcGO/dSC5UBgsFmL2n2
         abrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBkZJcQuqaGlSXpMhfeEvoQajnDcBVpC0Cq8iwv9bLnOlxMHUv2QTcT51i0P1H+AVfoflfOcZlfmEblVAsOwrGmfhjIb2jPeGfueHvg1+o95lm7qi9lB9z05SuamvqTyIirC7NC8oXjzBEZYV
X-Gm-Message-State: AOJu0Yyvh44RjODZnIaA9IhYUBM5mz0Bax3fe4Bzv5vDzNAdcrTHUjXK
	uX1FURM+Q8I59lRQ5qFy4lQXGkUNMPk9o4XRjIhFyjfcXNB4Jq0OAJl9QROs4lY=
X-Google-Smtp-Source: AGHT+IHuTg6sg9jmuVBdw23D4mbioYW5UJdXfu5Yoz6pmioCK4oiaEOojsxWPF54efbm/LDxt6GxMA==
X-Received: by 2002:a81:6c41:0:b0:604:a081:c198 with SMTP id h62-20020a816c41000000b00604a081c198mr4627755ywc.42.1707766585203;
        Mon, 12 Feb 2024 11:36:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBfYRGGWsjUKrSQ1UUD4+5G9aL4K8lxvI3sDRkGXptHM0M2AHyZO1NVg1sGTmKG/5ubLWManhw6BjhQD+usKGjZI9u+fv9DF8kNtdWW5CxEEFTpN7ec89B5l7BY8qQcU1nKYX67o6eXRuaOp9S
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id t4-20020a0dd104000000b00604863dc35csm1309663ywd.111.2024.02.12.11.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 11:36:24 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60779014458so5212717b3.0;
        Mon, 12 Feb 2024 11:36:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+sMBTK9dZb6c6yEh2KeXXrjWd2KS7+D2W+bOYv45H6LaEjTx5Q4/0PyzdUkJUmd6WPlitDpk+lTgAjrW4TtuMiQC/jHScPSCOXoT/ijqxJCOgzk23sMiB1KkCvev3LHUywH6NpwytVV86epx8
X-Received: by 2002:a05:6902:1b93:b0:dc6:bcd5:9503 with SMTP id
 ei19-20020a0569021b9300b00dc6bcd59503mr5175877ybb.48.1707766584469; Mon, 12
 Feb 2024 11:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 20:36:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJ0U9qnxtdJmVUJQqRhbmu0rmOxpyDZ8Lp=+hv=Oe4Og@mail.gmail.com>
Message-ID: <CAMuHMdUJ0U9qnxtdJmVUJQqRhbmu0rmOxpyDZ8Lp=+hv=Oe4Og@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Jan 27, 2024 at 1:20=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Split the "SoC agnostic compatibles" section into two to make it's
>   intent clearer.
> - Improved the documentation for each group of compatibles.
> - Reduced the number of regexp to create a larger target area. As
>   suggested by Krzysztof the goal is not to validate each SoC name but
>   check for the correct order of SoC-IP.

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SoC compatibles naming convention
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> +
> +description: |
> +  Guidelines for new compatibles for SoC blocks/components.
> +  When adding new compatibles in new bindings, use the format::
> +    renesas,SoC-IP

or renesas,Family-IP?

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
> +      pattern: "^renesas,.*-.*$"
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      # Preferred naming style for compatibles of SoC components
> +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> +      - pattern: "^renesas,r(7s|8a|9a)[a-z0-9]+-[a-z0-9-]+$"
> +      - pattern: "^renesas,rcar-[a-z0-9-]+$"
> +      - pattern: "^renesas,rz[a-z0-9]*-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh-[a-z0-9-]+$"
> +      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"

I guess it's not worth adding rmobile and shmobile prefixes?

> +      # Fixed legacy compatibles
> +      #
> +      # List cannot grow with new bindings.
> +      - enum:
> +          - renesas,bsc-r8a73a4
> +          - renesas,bsc-sh73a0
> +          - renesas,dbsc-r8a73a4
> +          - renesas,dbsc3-r8a7740
> +          - renesas,em-gio
> +          - renesas,em-sti
> +          - renesas,em-uart

Perhaps combine these three: "renesas,em-(gpio|sti|usrt)"?

> +          - renesas,fsi2-r8a7740
> +          - renesas,fsi2-sh73a0

Likewise

> +          - renesas,hspi-r8a7778
> +          - renesas,hspi-r8a7779

Etc. ;-)

Now, how do I trigger violations?

I added the following to a binding file:

          - enum:
              - renesas,bogus-r8a7778
              - renesas,bogus-r8a7779
          - const: renesas,bogus

but nothing happened with "make dt_binding_check".

I added the following to a DTS file:

        compatible =3D "renesas,bogus-r8a7778", "renesas,bogus";

again, nothing happened with "make dtbs_check".

What am I missing?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

