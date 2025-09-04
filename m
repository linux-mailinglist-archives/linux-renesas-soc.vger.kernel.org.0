Return-Path: <linux-renesas-soc+bounces-21317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320EB4365D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 10:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE421B2586E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8402F2D1F7B;
	Thu,  4 Sep 2025 08:58:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7AF2D1925;
	Thu,  4 Sep 2025 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976281; cv=none; b=P7q9aKP+uhi51dFPCzpcca8EQgBvyhBXJKBtYQelsk4Eh9SzA3VgK5LeV57LxFKewV+eFilMXyEvHKeC9sgVHv8KZZIOr5RutFst7fyhq8suHKCi2+WdnUws5/78XRSeR5aHsKHqoyCfdPJy99vxJHyyOTL42nZXnqgBqadxGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976281; c=relaxed/simple;
	bh=uJlZsSoTRN+PNDEIO2cmsHo1sMd7N9tzGTzQXDvoozE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P15i1PN5htB1U/Y3yMs1UGnzJ2eRsQIsq9PbVWMVYRGdN6eI3mjPa2Ru1nylpeBAeW03MSp6GtP07V8zCn6a77e6ugViauKqixkezR3O30eq00mK7IzvzOlJsYXs5g8aV4NU7nNpSaDgpIbkq3eDZIaWDVR9E9KwqEQyR7RCAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-544a59e1e87so214182e0c.1;
        Thu, 04 Sep 2025 01:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976278; x=1757581078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ38eglfsyJ+jBD6L5ZChIcNKuaetDWRgesngh0HUwc=;
        b=X9N4wMVFL4I0GQR+K4vuowYQspsZjysdcKwuvyYuBFPnUxHIU+ZtKb6+Zr+AQ1hF/y
         8kUEzldF/gv9TMCeklESBt5gbn0Wcj8g75MgNPyl2XYzcidYJ5tEt25FnuoUXDZ+7Cx8
         zWranRiw73rKPFn3zuM2nBvM7QSuxch6eV6M9ugltWHS6aI7TbVWLDrggDRpE4WhoKSD
         63YxXIk34Fr1w82QH2UNOu3Ma7o9jXfJmP6vLq4SzTKlkqRzhoeVW4R8MsPI3jnGJSQD
         Y0E3gdjE/nwaXlkgpX1EO9p0cbEDf6JG8UzUwfnzHZL34jpf6+fORVDbHoE8PRAfHaVb
         /gfg==
X-Forwarded-Encrypted: i=1; AJvYcCU1J25dDGVs5X8R+BL3y0rkz1UN4ED5qo07s2hesCAgdaf76i6jWsnYCTlzcSIG6Itmbv3M0pI9C0qcUePf7FgyHnw=@vger.kernel.org, AJvYcCVsqYMZHHR7rHDAqSEOP2CASrDVj7CwKzOmEGVjBQ5imxPdfWo8a+yXOMVuW/mOC3Ink40eE3YfRpc4@vger.kernel.org, AJvYcCVwEINbV3EOoXnqZm7DIQcmxe0TDmr0J5Co1qi9NdNqaIG4vC3CzLwhT8XvUy3JOm609f+f8/QqyCfBG/HW@vger.kernel.org, AJvYcCXPBYVANiLUDf4EWcXQFnpzq3OUjHeY3KWwNDmJex6CcQ3VV8t0/FmtgsR9K4EzqHSKBeRxMTX6PsVw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9VePloPPVkvU3ZF2r1Cp59vmHUB8e3DBvJe3+AWdhrlGhFU6
	ibJYQWK9q06VdmkEIK6nuBsAfpTTLcoTUlLPMwXOSuUSbEcMDHGzFcyRig/zNG/7
X-Gm-Gg: ASbGnctXg1hkACo+zEyaYO4k+eq6fSZwZS4f7XlkTNpFdDpDYHrC2V7ELct3tbMeIWL
	KXmJOEJ3MNw7xcz4x/YpaCHC8RnWBM3mqEwJQuXxB73+GBBAlSEdY1YcOjX5lKLibb+bBe09e06
	DIX/OtWngY+ClA1ajPfu/xC4JQie4f1vPjXCxrmxOa1KYWpwoZq/8snHMBU/cvhNbErUavE01qv
	d+T+UG47qEtcsH7uozj/cQQk6zsN7nK5VoS3/Dft0Y3ZLffSnNBZMePP5HEcl0w4v6cwCfqUqhp
	lKvFtVz48/IuvSEPrdJ5NrwXphloiR8G1nRIqZh7yHrTqY/y1rgpReuU/Kwzd1XJ+gRPxn8wz0S
	jt6xOnKUdkotryPVh13TiNjSmp/BgsSPH8AqtZF+jTTQJjaXI4WwUBn2qiO8F
X-Google-Smtp-Source: AGHT+IFqbfAerr3f6r1NVOFBMacaqG0X113OY/AhMDqYKY04wK9+OevlJ6iLmBFvS7i2q3WtvLx59w==
X-Received: by 2002:a05:6122:90b:b0:53f:7828:16c7 with SMTP id 71dfb90a1353d-544a02f4ce9mr6346952e0c.15.1756976278394;
        Thu, 04 Sep 2025 01:57:58 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544ad6f8047sm5350156e0c.25.2025.09.04.01.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 01:57:58 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-50f8af3517eso263862137.2;
        Thu, 04 Sep 2025 01:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHjOr/sHVaoaYwIAl33Xk8nrcmueZ2PrgNjO5eBmGnkAc1rZCem/oP0GyfX6WOb4YBwmcAAl2e+K6T@vger.kernel.org, AJvYcCUbEqZ1YFq9XC25RH1MLrjfbODBOOtYYjwMYqmF5OpgeRe94meq30NDVYxPV2vIy2kmid6Ii//UjHvZBZ5EVHol0Ko=@vger.kernel.org, AJvYcCVgML8qrmQQ9CwmNMWoxIUtoM/h+tRkL3QtPV7OXoqziIuCp5VanzqoTxtajX9FmNQUOeqws/7Sfa5+@vger.kernel.org, AJvYcCWKzvdl5e1U7CAmSynF+AqIk1G/63nnGWzwDbpeWFFOQYs+LEKskURQ0BlQXwWzZR8Elr8FnXqyhOiQaGOw@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:529:1815:ae9b with SMTP id
 ada2fe7eead31-52b1c33cc1bmr6200990137.32.1756976277976; Thu, 04 Sep 2025
 01:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904071954.3176806-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250904071954.3176806-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Sep 2025 10:57:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTXVJyhJ1p5Juef9j3P=oiyCo1NLuu9YZ8DC+x+JhPbQ@mail.gmail.com>
X-Gm-Features: Ac12FXxiM14ATP9BOkVKnNyTpukPFDdmwRYmPo57DaHlMkCwtQIc-5weKTBKTh0
Message-ID: <CAMuHMdUTXVJyhJ1p5Juef9j3P=oiyCo1NLuu9YZ8DC+x+JhPbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 Ethernet clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Sept 2025 at 09:20, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock definitions for Ethernet (ETCLK A-E) to both R9A09G077 and
> R9A09G087 SoCs. These definitions are required for describing Ethernet
> devices in DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2->v3:
> - Dropped R9A09G077_GMAC* clock definitions.
> - Updated commit message to reflect changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk for v6.18 and DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

