Return-Path: <linux-renesas-soc+bounces-21461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3314B453F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F28DA60F4B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC01828031D;
	Fri,  5 Sep 2025 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFxi6xLM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AABD3FF1;
	Fri,  5 Sep 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066496; cv=none; b=bvmeQrOi7ufd73WxvSjQ6NNqHBtFLcJUOL0VLQjyFEUBp1W2GXDBbKXlTDuiW35IRxzFabitEpQmb0L/zGF2RMHPT+fm8WzP29YSLh6DlMAIpVyK7a8sPQ6HSjPRcHv3QCaVa5BP9/TUHaQ6acTT6A0Pk1LrblgQ3NBxLfsbR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066496; c=relaxed/simple;
	bh=MI++7xSl6D0d/tvMOVR8S7KiVropv9tJ4R/VEjlTswc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8kIqibjSEcTNTkqgvkZpGI6TMTGzhR8swqqL5jb23J/PICYcWkJAqQ45VT+o6rPmVTryKtQemK3Yju5AZmyVUiGjBbMoPl7O4e6f9U3Xqn/ac/dCKex9eDRsbFKIO9eWk9faKMoKA/ZdMkW4Oi6J3Le2wdho9CTAbehNYcphvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFxi6xLM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3df35a67434so1097434f8f.3;
        Fri, 05 Sep 2025 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757066493; x=1757671293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEQHjjB0tYa1N8cGqzOlMz/FwpV1lIEE+NTIQ2azOHo=;
        b=MFxi6xLMluKxY3AWeLBVWv/03CFKPLqZ73AE5riExwYq5+9AdrBJ1nBPWd2pMCs21h
         71OoMpqEfCmTNXI7z64LZsapHeqYl9CJ0v2YXAk+QjIpwtilDYd2A57etV2WhJGkZW9J
         KwfU0aT28Yuo0e6yiSztEGyKGAjrunvllFQ3ewYnH2Fko34CpC/VqG82CDw7aaBEoS0h
         P7tz5c0XTBJ88X4dxJf9PSOICnLuywlTMeU0bZBslqmzRBiZ00bURJltrFkmKcNlDn6T
         B6Wnd9F/lZro477fffcSEOiBd8dqr2HByBLGnOgO1WE+aNPRANEPwwd0pv2X+4yXjjDh
         usNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066493; x=1757671293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEQHjjB0tYa1N8cGqzOlMz/FwpV1lIEE+NTIQ2azOHo=;
        b=pJbgciep+1SAxmSQygJLZv3YDPcI5dHm2sS77Jpn0E37c/+fKbY2AwXHdg5fggLheY
         zdzT9wR88dJh2IjGY1ogYGOsRWJMofo1uC14N8LsEYXShx5lO9S2bst154IotxPMlC4i
         xEiPBsBRbP5ZrxNJUPKDnKwgZiKSLL6n325ctH1EGwmsZn4k8tPpv59OoTygleL+aMPn
         dt7WP08aOQme+9KL44Z9WMPFxe+T7wTrmlcIVjUhD9vfDMBeJojokdYadHKvniRtsIVt
         pFrW8pu4/y7RRUw0dhJ8IelihV3KVkGR8snoww3qYvsaA2npLIV7pXvlKv5CC94D0U5e
         l7kg==
X-Forwarded-Encrypted: i=1; AJvYcCUITINBq1fW5O5ZrgLGCiY/NnsaQ2ksT1Jq1fBKjE2zFHJmCc2buvYqU2lI7fHIyBxB1aHLekgR@vger.kernel.org, AJvYcCUPP1Yph9Yr+0TWs9qAT9GmYi8u+vx9rcfHIvr/wsArU+CPpPjZFmH5uBMJR07HYd+hzyFNWW6dhaMC03ci@vger.kernel.org, AJvYcCURvPxZyF8LmeNWr4B1kkQb+pkAOv/PsR84ls51B3yHx5admBEEq6N0Vx3EronXlkvjaid5ndIE6xsi@vger.kernel.org, AJvYcCXDelpUeUog4cy7Lfk3gu0v13WaFh2HFLYvh4UyiOewxa/cLIpXR7ubI/cTJH/MGCIgdsyEN8hbxsSrUq5B1jmhQOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNZxzMKfVnvhHpHbl0GSLvng4KHNBV6Bko9pHrzUhmwppGJNK
	jLI9evPCAmXZ9TqyNmcjTd3QvuMnBrA8K7hxwqsMlwdH3t9yyJJkyMIJZ+XZCll5EtC5HsWcF+J
	+ofr+iL9DddGRdIxMfMj92W4k7SubZtc=
X-Gm-Gg: ASbGncvpeThzhS5hU8jSGnq6b4oK2pk5TPR4Keic1JkUYOb2ZrVKP3WMOFYRZuzairv
	zFTOmSBzmAjjMh92MA0nVwIkvr2BPPsAyCNIcdCAdUYASiQV0oGgiw06Ggnksk5onZdxWg6CZma
	AwmPFLGYu6ndvasTkfoVbIXzXQuZU+H8kHGN+RPPWqhjRMUsFaP75hMX5IYsQI4ONFlakpPFaFc
	Yns44YvkDnEgZc1EPQbIisrZt6zTg==
X-Google-Smtp-Source: AGHT+IENwDNnaA7LX8QdpGvHVZvc2cHkW8LLzE7YEDl4gIph1nAnHPcvvqrHhi6z/bmYC4D7PBM8OEiEwUc40Anwygw=
X-Received: by 2002:a05:6000:2383:b0:3e2:6d96:b4da with SMTP id
 ffacd0b85a97d-3e26d96bc68mr3684568f8f.38.1757066493047; Fri, 05 Sep 2025
 03:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch> <CAMuHMdVnhjA0xi+wojMc40Zmv_JBZpOm04GO_ewBSzFndbtegQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVnhjA0xi+wojMc40Zmv_JBZpOm04GO_ewBSzFndbtegQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 11:01:06 +0100
X-Gm-Features: Ac12FXxIWUyvkEfUz4q5orurH6BJWRXeslXNcn11rYAmFLfl-aoQgiX5uzP0Hng
Message-ID: <CA+V-a8unTSqBottT7uDGkSxDYpRAYnpZvRC2RKsm9M0rw09iFQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 6/9] net: pcs: rzn1-miic: Make switch mode
 mask SoC-specific
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 5, 2025 at 8:02=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Andrew,
>
> On Thu, 4 Sept 2025 at 22:37, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Thu, Sep 04, 2025 at 12:42:00PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Move the hardcoded switch mode mask definition into the SoC-specific
> > > miic_of_data structure. This allows each SoC to define its own mask
> > > value rather than relying on a single fixed constant. For RZ/N1 the
> > > mask remains GENMASK(4, 0).
> > >
> > > This is in preparation for adding support for RZ/T2H, where the
> > > switch mode mask is GENMASK(2, 0).
> >
> > > -#define MIIC_MODCTRL_SW_MODE         GENMASK(4, 0)
> >
> > >       miic_reg_writel(miic, MIIC_MODCTRL,
> > > -                     FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
> > > +                     ((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_ma=
sk));
> >
> > _ffs() should return 0 for both GENMASK(2,0) and GENMASK(4, 0). So
> > this __ffs() is pointless.
> >
> > You might however want to add a comment that this assumption is being
> > made.
>
> I guess Prabhakar did it this way to make it easier to find
> candidates for a future conversion to field_prep(), if this ever becomes
> available[1].
>
> [1] "[PATCH v3 0/4] Non-const bitfield helpers"
>     https://lore.kernel.org/all/cover.1739540679.git.geert+renesas@glider=
.be
>
Ah thanks, I wanted to explore this and add a new macro but I thought
it might delay this series so I dropped it. Hopefully your series will
get in soon.

Cheers,
Prabhakar

