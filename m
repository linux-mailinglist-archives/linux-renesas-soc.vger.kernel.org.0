Return-Path: <linux-renesas-soc+bounces-10520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D619C87EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 11:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30A41F25AC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 10:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCB11F26CA;
	Thu, 14 Nov 2024 10:44:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1C374C4;
	Thu, 14 Nov 2024 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581088; cv=none; b=sV3dy7Im2LokOM68d7/8VIukXGxPapmYpcOsQtzcnlzFsNJPrPlkADo4ZC1sddOh1OoKOHco/WQDgyTErhimLUEUZuVfRIDT1f9htvH9CbSKl1nooz0gP4t186Spro9wzfA7dJY5iN7ZVOA+L4z2EewSWeOew7ydUs+o5pOrpqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581088; c=relaxed/simple;
	bh=ocFAlFGBK7allOqo3EyMAscvPOGoxVfZWq+nJ0GnbCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlJSLZhi03Q7viKnBWETPyr4GpoL0LlXIDv+VTUrVybNc12HEKbF6ddSmPN5tdw+JLGMY4dKrvk/eCETCVtpd/mbQBbpcGj/gU9zq2kOLA7fgYpKlqSEz0bYrLWHjlCYLvEbfxNN0J6WAy0qOzff2EQaiSPxcijuSGTd+YasYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e5a5a59094so4870587b3.3;
        Thu, 14 Nov 2024 02:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731581084; x=1732185884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y2oBLs1w9V7bkPV2bhlO0f0hRjlVXk9rjusoLR+ouY=;
        b=S/ODQaeIQcPhxAjvLr/3avv5B5FFvG+I6wMybvQfIZk5JkF6RhnRd+LO1d03oVXvZF
         /1TKguEJq/NYA1jSVx+zHAli0aCvPpxH2S15pYed8n9YII8dCu9wqKi9ZU0ndv3dWQSi
         RO9Z5AmSc6IOPLwyRC+GbqM/XqoZA3pDAaqZq7DNgPrq+0X+MJGM+P2OkiSE2GaIw3Pg
         ONq6YDBdNtGXJ4GKNIpIZSrHGMl0D7vK8sc5pQwWvRVHbT1QTbcacFhENXbBJaRt/1RH
         MzoK4CAJqvxyjr8YVbKoyzz6wCWRoMVX808jb5eJhlrlUinsC0DGIx/HVmSAcdzk/Y7t
         UVXA==
X-Forwarded-Encrypted: i=1; AJvYcCUnzEQ+Ojd34LbztRs94AaboKIaVEx3Y7QN4z5HS8YbxDSj8+uqmS4GyTpgoHs1hFvAYB8mbjvR@vger.kernel.org, AJvYcCW4fOCmyJvVypPg6ffOquubH0stcIhEYcGROkLhgkK854ldfpjkcjP5eXRXaR9OW9pAPB2ejULSnm9a@vger.kernel.org, AJvYcCWJtlBCeC+kVNEe4UlVsC9PU7LCJCHfTD1pHxkBLEaueg6tMKx+qYe/ZNP5pkKv2m34lL5f4Q6FT/o58HGWjbzbX9M=@vger.kernel.org, AJvYcCXbJRwuLdlo/Vg5jkPqt3Zsw56cnEw5vIb7bIki0l1gwo5MDpwPn4xDqaUauZoOR3dp4aotg988X7FWfWEL@vger.kernel.org
X-Gm-Message-State: AOJu0YweYVKtYX7ga0bF4mTpshGHNiNnESkKj1+eR2inTxZQOovbyUMX
	6BjmRJmt+LgLDJ2koA3qR8u6YZkFlQ1PZy7rTzmkkWboVwClZkP86NVySh+0
X-Google-Smtp-Source: AGHT+IHEuKEDECUIL5VMxn45fmF/ilf48Rmt96l/9JmIiIqc0YjfYGn/b8xu4iKsmcXGOkkk792MAA==
X-Received: by 2002:a05:690c:6410:b0:6dd:ce14:a245 with SMTP id 00721157ae682-6ee43375cb0mr16914507b3.6.1731581084615;
        Thu, 14 Nov 2024 02:44:44 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee440709dbsm1813527b3.54.2024.11.14.02.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 02:44:44 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ee4beee4d1so1101067b3.2;
        Thu, 14 Nov 2024 02:44:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFOjJRg9T8NibWYGSKJpITcZIbAs93FBFoxeLTcwWiSWu2II897EL2S55H4SKbWpWt6N2aHm01q4J5N13X@vger.kernel.org, AJvYcCV1olhH2A4FhLAHSCKKUsJOek1Ag/5X0ZUpnh9LrxhvmbPDLByRZ/U8SN1LwAdI0oEsVP3R02st@vger.kernel.org, AJvYcCWt0aPFQrHq/nTzLCQBbrjTnr8wzLCJd5mpLuZXjmqFvf/wdFDDsVkk2/GODt7l89kXPFirdYlGYYcg+mzp9biutD0=@vger.kernel.org, AJvYcCWwTcBEIOq+m6sETyihSN51AagMnD16thJwdSth5e39OA1oPqux8prvt/ROWf8pm3Ly/eO0U006UVoy@vger.kernel.org
X-Received: by 2002:a05:690c:3682:b0:6b1:1476:d3c5 with SMTP id
 00721157ae682-6ee433930b7mr13916017b3.12.1731581084074; Thu, 14 Nov 2024
 02:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113225742.1784723-2-robh@kernel.org>
In-Reply-To: <20241113225742.1784723-2-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 11:44:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpm0+Zr3QRkrecxpC4LTC8Svhods8hTLAbio10cB4i_w@mail.gmail.com>
Message-ID: <CAMuHMdWpm0+Zr3QRkrecxpC4LTC8Svhods8hTLAbio10cB4i_w@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,ether: Drop
 undocumented "micrel,led-mode"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Nov 13, 2024 at 11:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:
> "micrel,led-mode" is not yet documented by a schema. It's irrelevant to

Not anymore ;-)

https://lore.kernel.org/943cb31d01d0da3a63911326e24fbf9b328f7206.1731580776=
.git.geert+renesas@glider.be

> the example, so just drop it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Regardless
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

