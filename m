Return-Path: <linux-renesas-soc+bounces-21248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0CB419C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A3B07A15A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001B72F0C58;
	Wed,  3 Sep 2025 09:18:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16602AE66;
	Wed,  3 Sep 2025 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891111; cv=none; b=A83EhFosGQ19S1AHNTHygWySJFyHVLlgIF7s4LrMtqbQ0yPk2Wy7nCMa0Tl8OjpM6Kowz5IrnXzCkEaXIy6W0Fktfm+bilxOw1nCuQbZEeBKfAycuoVFVYS8ogT7xL+0nWMgzgrp+XcMbyIFHYgBU1EI0tccJOhDzI1qz4m1IVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891111; c=relaxed/simple;
	bh=N/LpDLV06ixKhS5RPgvN8UHXyNSWgLwd8Swnz4pmv0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU1ijvE2JwgDol3dC36LEdwm0h+SGtGVq/29wQsO1ZqzQ1m8M5uIZphCNKJd6Z9BrIdTFQx1Xe1dBSgieIz6EmkACWVndOgdJ24GuhtJl9nxeeD+08k3jERF7mhFCxUmTEOeR20t7jgqKc/tMw4eQ9Ic1lb0cjuOva1VpbITBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8960a00e85bso1893432241.1;
        Wed, 03 Sep 2025 02:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891108; x=1757495908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xww/iHCRl4Br2j+u3kaOpXoF0IPDaTQthPF3CkkfnBg=;
        b=HA6v2NXcNLjE/RG7FiTSjvMReHxDjDYcOfENIhJFF9ILWMoUW7wS71BI6OKnEtz+jK
         yOK7cmm3PKmtb45arUB8YY+3/9IKbJvfRGoi4a73BpxdzO/326RRGpk/vkaNzz5LzJ0c
         LfER1hzQfLAMhyqct46ypthhSGGbmqt0ZU3XieFsq4OvNArlRubMncY8OUj0iOE23soZ
         aCOmnYO5bd4hyXhVQLGYPGpubuZmYL2Kb35S35VHjtYGgvS0cM1lb6FQQOtxlcmBZffy
         8TlPktlArHNr1asdcT6jWKRnmzkJjac5NXlybH4wEMmohE9CVDgihXjhnQBkzslPtEcF
         EhUA==
X-Forwarded-Encrypted: i=1; AJvYcCWAL6BmdE8DiC85GXcrv6S+COAST+/SiRDdPKaw1lUeyJ0o5h/DStwBBRz11YOYh0Ww58+MJUyvmUsZ@vger.kernel.org, AJvYcCWQkzAi5u6qHrFmlw96p1QvOYnxEfXgI42VqDDHcp/faT19VaLWCiK9YOKCj+8jTQkDTbgptowL@vger.kernel.org, AJvYcCWufhjgaXwe2lb22DqCSIhaYrzl7wA/wlrBkovUbClmBkg3bLtrLUjftC+ljfY0LgZEO2zZNjritFso2rCDTkDflzM=@vger.kernel.org, AJvYcCX9rnJcI3PBrfibY5yK57bmkASTs9JXP6c1Ht6ZcirPOMByzbcXuPa/IOiJA8DrQ+vG+vomnkA+bhqkCWtp@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXyXsbA80G0oUw79Ujz5Nlj6k31cSsX5sEJbbZ1PTekqm5NdS
	n383fLxPiOvR8fbRsycerWM4wCILRpwA6xpFAkvrGKV/G5hASwTcV0wJrzjQzj/x
X-Gm-Gg: ASbGncuhENVcyAhRRcqXtfzgjSpOYKKNaiB1pXR588d7XW6qA3XXl8/yUq7gVQETl3P
	+HRjzAqqRaZUy47+UVxKOfcduId4pWq8TSOhIZl/YDVH6iwqQR/1XtvymwWKxe45FmaEoNWN0jd
	l99bOQxFwSl0mg2aVYOMSW0KTtu3L4DDQAfPa87d63FygUdhet58TKDOyEPdI5GPmP0+EQXRUm9
	H3m4Czf9Ge34rNltvBWMjlfQ2oFzeCHaoFNSoZUM6gfyGRpTnbWOhOg3G7rLVjDfHWgqOpzjvvK
	25/iLAXbJkncwcO+HKUKMJitsds+a3VB8Y863VMNC31sd5VgPBm9P8lHNzhNsKyOv9Xc7fTKwZL
	geywVzI3ms8jkWvcFoUsWzOR1B13ATdUrc78wcXxWSRo0b713Gza+UiXJoXIBlV1R2q78LDk=
X-Google-Smtp-Source: AGHT+IHW7UjfczYEUQmrG30HMBstbR7yJ7q6HDx8fJbq8ejTrG03wKVQx2R5ClNWQGDmX8VzG7bUPg==
X-Received: by 2002:a05:6102:3581:b0:521:412d:94ea with SMTP id ada2fe7eead31-52b1c144e1cmr5494354137.34.1756891108496;
        Wed, 03 Sep 2025 02:18:28 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89607330273sm3306462241.18.2025.09.03.02.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:18:27 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso2861504241.3;
        Wed, 03 Sep 2025 02:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXLktEbO1zdshSMyd0AmpkUzrS6G90iM12365+azkrnabzwsB5mNKVgy8x0QwXLMkJKeM32SNG3+lB0oWv@vger.kernel.org, AJvYcCV+mcK62MBcsnCZYo29amGIkBE2tvgFlqVCBLMLtE7J8N9NY6nkphzL3lX42EUycgxNTa3Mnn70@vger.kernel.org, AJvYcCWLq01t9VEba774uWGq4snI0YvzwvE7MyKxAlVcS+wTJTORMsMv4QeFJWV1y5UUKp7VWCcL/CNl6ouT@vger.kernel.org, AJvYcCXMX2aUpVJ4tuqLuU1Z0qawKC/O73gvsYfakN07sR6NH17NQr7IVPRaUd/8dsdZUeQzEJ2zYARJSk5cNF7kC+jksuA=@vger.kernel.org
X-Received: by 2002:a05:6102:54a4:b0:522:1013:cace with SMTP id
 ada2fe7eead31-52b19a5277emr5076476137.10.1756891107431; Wed, 03 Sep 2025
 02:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org> <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:18:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
X-Gm-Features: Ac12FXy7CQvB1AiVQKpvJM9u_WFe4oPUM6ax2MBP4KMifXDrnlzAsDa3ZqgU8bU
Message-ID: <CAMuHMdXT35qvPNyjegzhCysA7kRY3fTWSWy4GZ=TZ7FG1JpKQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 17:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

