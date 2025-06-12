Return-Path: <linux-renesas-soc+bounces-18204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF61AD74D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15BA31652B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885FC268696;
	Thu, 12 Jun 2025 14:57:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623942048;
	Thu, 12 Jun 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740264; cv=none; b=mGaTqRFaklZdiUf8BwbKcZVWe8Xv4XaibJMxmTcB2ogl4m/V289TyHWn5It7fleBKbDORfNJH+UZv52bnwEFsBa5J6XOiLA1Jn0QTi4gquQ7WlZX+MvjW5dpSfnJ++6k9/E/QkaaSHPKMuugh9dUjoFN8IgiMkXyuMJefGIu6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740264; c=relaxed/simple;
	bh=+cbCVAyRkTlLDE5xDEGDYf7+61Wv6HnIqo6YW/Y+8F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXST5feuOb+2iGDBQYWjCHkNGKbUC3BZZ/0axbOYMF7SXv1ZiNLM/FpTU16l8+xbp6RXKzqS8KuabsU20UZ1W/MwPlJN20xBjI0vHFgHQ/iKOsYtzOzGu7VggD9d5DBIT+ysChBkf7xEJq/2yJnGpiuamNOO+MWHT5uAkJPD6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53119fe46d8so305994e0c.1;
        Thu, 12 Jun 2025 07:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740261; x=1750345061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLGpxLsJSw4q7Wykq729C6wwN0Wlwd+qKs8+s0wgaMA=;
        b=hBI5BU039sE2lQ8ePhya3U6Z5vEmhZ28jfAXj5OzL7E42aU1pKCfwq/ICnC4niG+Qv
         5G3U33pAKjfAHKay+MgeCBn6IuGQWr5FureEkA7/JvEGRUs7xh3zqTq7uwqdE60Vd8VU
         T8uBuWbZbDSXuimeywdNjj6zRrrBl0tfBgdCOtZ4vVaqMDlYpjcgM78reVKuQhFb3Zb3
         E2s7JW5vpgV0z29Z+l4RbVjc9S4HZakrKAeAFkXNXDkk1tNY6SJKqquWiIXwQGuRHF3/
         QFDNWEP4Wvp6XwadgOiLLKdohOW3jSFjuyk+Z6LlP8xoX9b+UKPd5T3mZB5rL7mAP9Zn
         cwHw==
X-Forwarded-Encrypted: i=1; AJvYcCUKeo4aLThjvlk+ULoDwFYCw1WiEyoByhpOOr0+hmMJYcaeBFIMnwMebcRLHBEKekE0xDqCtAH6KhgdKgjlb63Txas=@vger.kernel.org, AJvYcCUYwaAUYIiSzN24NWOi2001h1yZY4R/eruphd3gkJevbAatgFNOvS7d7FAS2vkbkU9fPl16p1kDyGM2@vger.kernel.org, AJvYcCXaPQW+7sLhM9DBIy7jGGO6g3lpSFXXb1sdrlP4TsfZz+7s7jwiteoQogK49SlC7lK7SrWfGcbBz1zaLVvC@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoiWdr8X4fGPJBtOLRrqk0WfE04dsLgLNPV2loDWUidQY2Qhc
	EsFgiS2qEXWoME5w+UnyH1zvYdTyi5rkIQN2CSQ1qHxpxG2/gftho3CASrLJ3231
X-Gm-Gg: ASbGncuRyOfXLVuAbScdRsKIhEpIHOF8K+xTe5pJpM/shcrqAL6JGa4d30CwPLJ1kAR
	rwYPRdEd7TgVTOpLtaYZDYz2ogAJqfKVEVjvXM3ot8R9XzetTA0SxeUClwLchUkrWEiiL7hsjcB
	k63L7HVCj/I7sFPwDpP0CfgB9WOhvfRzpzIcuiC1vJsMcluCIY7535Frlg3xwmBEb+Q9g1ANY91
	CR0L4jtX6u3sCfXIrc1roRIjJwsEImpfIOmx/wHZ3XpkRaTwKJ6U/xTEJcmQFOXIgwGVvThAq0I
	YI//lCBdEKckhA0AlkaWZA6xcX5fVvdDBbnsh3Z8/xRZiSZ0TZwAqNf7Ieqh8dqhGHoZHIInC9N
	6DSaAW0/xiHFwIskDCa2TczfGWMj3
X-Google-Smtp-Source: AGHT+IHb33sw6kWqJ6xGIZ2J+jdzACEGqTBpzf0gi9GIuhmgVfywRtjUkNS1kEGHSY07QZbbvEYoFQ==
X-Received: by 2002:a05:6122:470b:b0:530:65f0:7fcf with SMTP id 71dfb90a1353d-53122224b27mr7025646e0c.1.1749740260682;
        Thu, 12 Jun 2025 07:57:40 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f4f74a1sm330263e0c.18.2025.06.12.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:57:40 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52eec54acf4so278261e0c.0;
        Thu, 12 Jun 2025 07:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPur0ds5MnzF0Az2egt+Jm9VdnrN/M0vbl/eq8g7FNspD1+Jg6vMTxdVqdHMIAwo6P35/w6WReqVfr5Cg9@vger.kernel.org, AJvYcCVB1JCXYWnoc/nR5Q+j/3eG6FJtarWet10mGC9LSKYLq/AoiE/tJsZh9GzHO50r4yFFVdugPIbkP7pCis8dFXRLjUc=@vger.kernel.org, AJvYcCVxZuJaIlkCdMb3gbSqAkLwUUdNGbUwMayCvnlUtVny0iXhfX0yj3Aq0Q65h8pTdbHe1938imcNa9vX@vger.kernel.org
X-Received: by 2002:a05:6122:d8c:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-531223a9d6emr7462655e0c.9.1749740259843; Thu, 12 Jun 2025
 07:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:57:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpP2g_XVgV-Lo-iDonioykPxOdj5u66yacGBBKwCFiVQ@mail.gmail.com>
X-Gm-Features: AX0GCFs6fvXldOJS-VLbdO_0YPI2sLemmxiH0HgmfiLcqEebgyfY3165_oOXBxo
Message-ID: <CAMuHMdVpP2g_XVgV-Lo-iDonioykPxOdj5u66yacGBBKwCFiVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 01:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
> The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> driver changes are needed. The existing `renesas,r9a09g057-du` compatible
> will be used as a fallback for the RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

