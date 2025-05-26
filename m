Return-Path: <linux-renesas-soc+bounces-17482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284DAAC3AB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09EC71733AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4CA1B0420;
	Mon, 26 May 2025 07:33:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375CF258A;
	Mon, 26 May 2025 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244826; cv=none; b=bzAC6GhNxqfKWeyR4JSuLjOCd6Uw9jO4vRpucWvNVQXXYEku7emtloSeQcKFsFWbHQ4iSoX9neQNlRPXaWPWVpr0eyRUlXMA+o5Lucg/tQEfu3KFI7jMgngM47o5U7+t3MDHJCK39iuZD55JprPtoGjrmrrvNbWDHgYKf/VTbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244826; c=relaxed/simple;
	bh=ICCe66OUmPnjP4obmcEuusVn6AjbIvICqWX9MnKMeDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8G6HtOejG8P++vE7H0GHUsaeEGxWLoncUgN3oIMNMyHZdFQV1dXXqix9T9KfM0TnBdmy/SmWAK05WxRxO4+WLg/Tnq1KE1FuxgWGkJ2J5LyvkxldiL5Lvpw5oxnFzb4Ar+QE7JvhvoyZAEEU0+ZmHTSxR8VdsB8hYDHoegBwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4dfa0f6127dso513089137.1;
        Mon, 26 May 2025 00:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748244822; x=1748849622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buDjsHUOrU1N61z2NjEKXi8mfrqkbTQ+ONutH5nLRvQ=;
        b=L5715JDmP6UWwi5vGtO1dsTVSttqe6WPZ+j/KiCuaOiJ+xtySpaxlzw81qcivv/nso
         XDilfIkfRZyeZa3IL4bR/GN+vO95M0ZPK76itJhbhtnF7uALweRsti/QTreKOu36+3mE
         Y+TacbOlj5/WqlcDHhFVirivGzNkaLb1G0TpMy+oyGav+aI0vjg92I7ASSwMiiRmp5uP
         QV54qI1zKL4ridt2b/32Ub/IrvkVPRcHYZAF5+AHkqZRdBRJGUyRzH63uKqw2Ol96cGP
         MNZN2ZmVhLz4lF4mW5TtUOFyyndNsYBWQSV9BH5D1tsLXcriE2/wcVV3EIqggOLHS2Ib
         RE6A==
X-Forwarded-Encrypted: i=1; AJvYcCV9ld6Zu07oYE6cradR527RT0ktOiOoUoMCQe7BEjw/iJ7wMD771ASdMUpqHa8o0LJ0moAi20P3ni3yXj+o@vger.kernel.org, AJvYcCVcKGF7NVI31Lcav9zdRa8DKaow0bNw3f8h4qYgNCIovttTwC28ORFjC9FgiqLUPrKy2agETogBt3Oe@vger.kernel.org, AJvYcCXrLtASsmOvLABFjxLZNx3Vr/NOg4OzswpdxaObqJIe1M+pOCWtE2Y0lIVkKZj8zfIOodndh5PSdKnJyLkt9kWoa+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyswsjKLVmLG6DxOUlAkc9mSoUcBOhDxPzAC5PhsKP7Dw7vPRgu
	U8NuDOkVETetdfDXOxt5oB9ILGa+tI4CMJ/8BfxgCrL/K1rvuxWyVO04yHlFCCHJ
X-Gm-Gg: ASbGncs21RoW2hgTOuhjPIxOyOoIIvydqbNk+UHRam7JyRWYBA/lYelcKdZLOENAUDW
	/gRhMn2T9UWYyNOrQ/5S6Yee/BAkXbb08546/Kbbii41w5KKlWQlMZJ0FlvghlNWCSsP5OlmnRP
	y9pP6/7l7K60zD0ZEZYKDojK8tA8KujwMDkwLkFMJ1WPJcY2sDbSbgZCgCATbY5LuRk3x/l5Pic
	t39YyG0GlAiEB27qxRxngeXw1J3LWSQOWAUAXhipZkuncN5wSDgBIxEyj2p7Bz4zdROpKbLCbPr
	Hwl41bpqVLHrzYnPzsuEGnUeveZARPrG7kx1D360n+3AEM5Zu/TyXmzes0TloDqpGafpfGY+juu
	2UuBeHetzqeZjCpQ85QukdfdM
X-Google-Smtp-Source: AGHT+IFr0h9JWKk29CdNy6Qf1NGdDZs4gr7+Eve3RtZoFpVsGUnfpbkljhh66KWtbG+NgocYfZtogQ==
X-Received: by 2002:a05:6102:4b19:b0:4e2:bacd:9ee9 with SMTP id ada2fe7eead31-4e42416bbe0mr6284189137.17.1748244822609;
        Mon, 26 May 2025 00:33:42 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa66ed7desm16297456137.14.2025.05.26.00.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:33:42 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e45d07d66fso85298137.3;
        Mon, 26 May 2025 00:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU++GCEOfkKONtq77D3JNL4S6/3MUe9DVrF2p1WWpp+MHP5sGMuoYSWZOOH+cxCK01B0XxpLTxTvLDNu4jXhNLTIi0=@vger.kernel.org, AJvYcCUMg0mPlFyn7L98Vxis1Ei+z2zuKaLQeGNgdBFdho0B9/rRCZ3xSHG8FhH6occwmtPu4FOHrwMRJ4tsL0+c@vger.kernel.org, AJvYcCUg7zRCMKXhTuMOznFcLXKw/3mNN9zTE9mefEiML5SGgcZocTunhxC0gOd2PEHUR2yd5D4k1L1KK1Hp@vger.kernel.org
X-Received: by 2002:a05:6102:c4e:b0:4e2:aafe:1bb7 with SMTP id
 ada2fe7eead31-4e4240e70a3mr5279874137.15.1748244822251; Mon, 26 May 2025
 00:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250525160336.82960-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 09:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMyaUgct_iUed3LO5Brmb4vGJ2=Pgwqtoa0eLvWf4frg@mail.gmail.com>
X-Gm-Features: AX0GCFstOU72XTrRPlHMMlrcLXZJoTUFgukeaL2XLu42JRLwExEXTH8GUTjbES4
Message-ID: <CAMuHMdUMyaUgct_iUed3LO5Brmb4vGJ2=Pgwqtoa0eLvWf4frg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Sort DT on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 25 May 2025 at 18:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort DT alphabetically. Fix up the placement of &rcar_sound {} .
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

My bad, I moved some nodes while applying to fix sort order,
but still made a mistake...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

