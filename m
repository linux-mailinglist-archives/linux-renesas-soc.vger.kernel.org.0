Return-Path: <linux-renesas-soc+bounces-16690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086BAA96E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 17:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55CB57A4DFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 15:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBE925A2C6;
	Mon,  5 May 2025 15:04:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF5B24E4AA;
	Mon,  5 May 2025 15:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457489; cv=none; b=ukmW3IU6PefcG8/YDl7Hj5TNPmJr8Ucayx7Mr4TQZ6rU5GWGEdDz2rQi0EsuSpTNPCW61r0NA6FPaKne+DyUtugOnpdhWK0yHFf4W+ht5521clTSu4qiPtwlNNkS3fROXUZNj3WaTQbulN9GsKbSh5JlAS3bVlOb50iNBBrbEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457489; c=relaxed/simple;
	bh=oyirWERup5Uc8jmwpcQClnWtJH12UWehY4h+S+AUxC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgcwXflyUghuSj9Mm17f2z2EVpbZ3i65+5rZB/1NnA3ElSxtC1u4LZYC0ZU34VO9yrTiKbm+VS30uQKcUvsE7KueSK3bzAq0kSBGp+4DqgTpONv6k3gVpYP+xooqB/1KdpKusbgdb5veZ9SuCe7x+vNdhgRMgwrDZHLv1yng3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5f720c717so651362585a.0;
        Mon, 05 May 2025 08:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457484; x=1747062284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQ9jug1fRN1yvNW6wnb1QXO89WpVeOCqzDCpI6ZRvAQ=;
        b=XBUHlZStkUuYr3AUh5RhpOpNh0TMvC+f4a7HYVXRufZ9WLsGL6HNs6bP+KYJZl72FO
         PuEN7CT76cw/ozAANWLjH6kIR1gMC5l53DFDwPIVvSgluiUVHqCsE+Wo7+cP5aILpLeg
         vKNTv1cZ4Gyom4PGU3wznzqornduMcevR2ojaiyxl5QE3YB6KsE4n5A5W6k7AoJZOTQe
         uUPO0FM4hkt0UNSiYGbxTozUxIeyPsHfMLagdHmcWj/LA2f4lgK4VcX+qLGK0Eh7t6Qf
         4FoQeTR9hMBeOMAaOPthG8J06sB1vXhZ1qgXHAMLVTMCxlWFM5HxEUHbzv54FlVlrnF8
         MZyA==
X-Forwarded-Encrypted: i=1; AJvYcCUSM7XTzkWCxpRvrIABWTYktourk7/oP8O+l2SFXO7JjZ6SlXffFmcf80M/jbrixh0Ru2ulpCp3UkW0@vger.kernel.org, AJvYcCUyC50syJ18UxFkhsPEsnikeGZUXG/E1HQTngCmw5VEyl2NLGEnYohy/ClcjTVCNCzBUzyTSSrjbNCn8TwYQU0PHgg=@vger.kernel.org, AJvYcCX0oewpqGzcHqfkNQi6aU+FBhp1cQMvm7aW/jvHH1EHNr1JfJNbAQngTQhE8EiZcrKyfpnQzqrRaC181eeh@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJJfJ8I6BMnGYazBXprHJy24zjk7xshyrUsJYUXqQ4XwWHze8
	H2jo436o1szpZh6Egt1qDO5yKQf72dKKaXqXWxXc4ieTHQmVgtLS+6A3T3hR
X-Gm-Gg: ASbGnctDxtp73AxLyu7hPGfO441SG5VTJ5YEghyGV8CfV2JEiEF4YjnA1xnqcdCBZ2f
	yf/fkYbCHMLSz2/MSvOz7HwyiP8qjYQqYuntI+qkJERN5zj35Yeow1tPdqzQfpwFvf7OsNVNxdm
	Izp2RVVnKz6auIel9hwWKovVA6xNPKCXVFA2QeVKYAonXCO+NwOVcvwZB6hIU62MNAve0hRzD+c
	UC0qEifSATAv4E5Eh5eXDwtrGn2feSf8qE0oXegkwCuKgOaOkFvNS3qDj57zaQW+KEmZYT1Ig+j
	NJZ7lmNqEvx7ZOO7E6E4Kqe/O/GqJeQsn4FK7lQSBbUZn5vClF0TjLYWopmFe2uR4uTBVDu11gE
	MWYj94V1WiOr5dd3Vjg==
X-Google-Smtp-Source: AGHT+IGAAEdmoEmIYBqMAB1fz7fUTMk1BATQhNKWfpcVLLRVM+vYOc7+QgiI8ZU1xT/gC9Bezbt1Jg==
X-Received: by 2002:a05:620a:2551:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7cace7d458amr2627208985a.0.1746457484579;
        Mon, 05 May 2025 08:04:44 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b5f7fsm580788685a.8.2025.05.05.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:04:43 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c922734cc2so514548185a.1;
        Mon, 05 May 2025 08:04:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoOBDJ9htFPkrgr5HeLV+T9t02GjZRG3zfUttae3IyBF0wq9GShaFqdSAuYAwxJJYa135y3f8Bhhf6TnDm@vger.kernel.org, AJvYcCVG2vbjBPwQ0p7Ns4btkSwWY+IpZWyhRey+A+J8Dp64H0mgJvwG8SwpRYtuEF4u2fS09VsBzAcXCnKp+3HLHo9l/h4=@vger.kernel.org, AJvYcCXSADXyj/zaS8KjD2Qe6eIIIO9K/SCGWacdan56OgPceVBf2Si+0JxutpIHCvT8cpg6P0KsUDmgT/PX@vger.kernel.org
X-Received: by 2002:a05:620a:1aa4:b0:7c5:93bd:fbf2 with SMTP id
 af79cd13be357-7cacea249abmr2184067585a.19.1746457483117; Mon, 05 May 2025
 08:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 17:04:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaUQL5SpHn3LhOAXjekcSny4dqVRpOsoH55+LpCZbc1g@mail.gmail.com>
X-Gm-Features: ATxdqUEOtG3XXxLqmzQMjTNb2y4P8FgtJLglgkF0XPtmWs1pQXZT1INZTTkHBh8
Message-ID: <CAMuHMdXaUQL5SpHn3LhOAXjekcSny4dqVRpOsoH55+LpCZbc1g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 18:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a compatible string for the Renesas RZ/V2N SoC variants that include a
> Mali-G31 GPU. These variants share the same restrictions on interrupts,
> clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
> validation accordingly.
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

