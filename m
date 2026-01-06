Return-Path: <linux-renesas-soc+bounces-26338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574ECFB2B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 22:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3868530164E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 21:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E742D660E;
	Tue,  6 Jan 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw3oeS3m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DF2C11FE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736440; cv=none; b=qycR5hr5MH6+67rw7cgfOnGiV37h/fpp9k1YXK3HSkPYHM1AC3b+AMsQapHcX7gkqKi173SSm0Vy9h0AuG7E2GtTxSA7KVy5tqRM+sfuD/9A7Ngp5RFJGiuJcMOHe087kAp4GNXSH/clDg7qPCeexQqPGT7ym1m1kSBNpsXSgdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736440; c=relaxed/simple;
	bh=d4rGAO0U0TxZ9w2H/WEEN6FL/LfJ8AB9BuS6CwpoOYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvQaXfx3KgRdQOtRl3tdup0V6b4oq1709ONUGJOHTFJpYXrf/IbNkOXUMYcUycv0Q69ZA70hbc690vryP+liN0TwfVJDA1c/30hR3v+EX987otPtyMveFWxFw0tAVGGNd2VAVf2N+D/m6pfSFQh8ofXtOnbd4+MxkkIR3L1J7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw3oeS3m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so8857105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jan 2026 13:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767736437; x=1768341237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xyVxIYmy3wtOuQL/m2GM7dhtWyBgchh4pfGSSU0ZDI=;
        b=kw3oeS3mJqcazWm7SyAXLOOvJaSZ3tX0DZDrKzDrPeZsSXXhtoC5Td/mvBfj775JN9
         l0hAXbXF5LALQAbzCrdtR+fRQDOmUBQ6ovqIZssc3n7/Bb26ojdyNi6l6nH4w9eBIDje
         bhGmpIkBq5SjRhEcw/F+BLo836kMXY4gz8VPrdCtpzJX2OahmtZ54QBnhRw51jlCDmKv
         Nw84Del/xHzoY69uLPp4FDAG9yU3CoX4MMkh2Z2CYi1fIfKx+Ls3E7BMPPBKw56yyxqP
         lU7nVW9g26FcDNUQNhNyyzHi537jS1+ajxaaNj1IIk9NBSWZdJ99nvs+iEX8PKB2l0wd
         OYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767736437; x=1768341237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xyVxIYmy3wtOuQL/m2GM7dhtWyBgchh4pfGSSU0ZDI=;
        b=gP8N8dGMEgYzKZ3OdgXhuYit7kjkenZqEoDVL1ePXIaeViQswE9GyyGuVLZBHq24JM
         dZL/jlH+/iSCuCHdeOOvFdx/rrmwvgze4hsp09sahbf1VNRhv1d+RQfr67LU3OxkSO2A
         sypxQmoTwOSYLn+b5447VHIl/Snq+gG2A+npFR3ECagHkajgrDHRQfA6dhETe4BCDqZC
         h7Glsqm0yCalRGciXX2PJnbvnPDDdSIf/7SGTVM8hmPPrdskzzVRdEARM7EY3JJ+1giy
         h2Lvsyb7PUBMNmy9KT4VJyzmZrd7mrbkqBAwB9Mt3rfpL4VClktl2Qy0M8lDemGwDboS
         P+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXozL8nvFOZO07emY6QcUdAEjR35W2E3W2jSGgjPST5plvjFdj/XOmckE2fx33yhqZkFBxH9m20E/PtBlY/lyN6+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzurXYD5Li3lPmC9H2WRs+7u/tuxgC9ILA0ectwjkr7QTQhmhQP
	X9jJYKtQQrDCy9ShlJO7HZLfZC61fQ1BBzQZERrCj1Sol9QzkA3O8Rxj58odr1kQsfBWj5NeIAM
	xGKohSIxRrC20awLKxBBY5O1/NAY8u5k=
X-Gm-Gg: AY/fxX6iFuk0pUxTg26SZm+cbfunm6cmSyItimtzOQ7lg4hvWQTTBOb236UXgCVTNUN
	B26JeejyudBKkQf5LdDBGZfevfxXDUoaMewFstGoE5q0Jy314m51Zd0MQpPg0OaXJ0dGpcBlgfI
	YzCqIxiPu9zPntmb38WVbSErCORclA5lPTpjAvn04xnTLHhGYmZt6BCLkxRx9wNHGeYhPhO89hm
	JfdJFSPTkBOl+Q+ierHKwGi59WIqoC8AcynVU9LHugLktkjsYI/E8FTK3hQA/zBy3YqWcXVFMas
	jWBnQC2PCVW9Qv4yuJ0ixUWriPsJfegbQbrtQMN1s8vrTkWb5dO432BHJYfQa33pd4QRZJqPHAI
	n3w/xF/DwMis7
X-Google-Smtp-Source: AGHT+IHJYyf174/QsrKA4yj9izst/o67M12RhUcvLu8ST8wy8rthqncq05WjMVIhUNkdstK9csgrrZnrP63a4Kf6rMM=
X-Received: by 2002:a05:600c:c491:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-47d84b5b5d4mr3073085e9.29.1767736436903; Tue, 06 Jan 2026
 13:53:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260102-quirky-hornet-of-downpour-ddda69@quoll> <CA+V-a8sY0QneUWQ4A0XCKUGPL8VYkU5NQE2h_cOK=06JG_1c2g@mail.gmail.com>
 <20260106173936.GA2345468-robh@kernel.org>
In-Reply-To: <20260106173936.GA2345468-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Jan 2026 21:53:30 +0000
X-Gm-Features: AQt7F2p1qSg94FMvdzlxCyc7AxN9JH-ov8zGg9NHMiITr64SSrfzG_NiapklzBU
Message-ID: <CA+V-a8tOTrjzTvko7hg14pBmHMbxg7r2jWc-EkQFPtHbwXnaUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob.

On Tue, Jan 6, 2026 at 5:39=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 05:17:17PM +0000, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > Thank you for the review.
> >
> > On Fri, Jan 2, 2026 at 11:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On Tue, Dec 30, 2025 at 11:58:11AM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Specify the expected reset-names for the Renesas CAN-FD controller =
on
> > > > RZ/G2L and RZ/G3E SoCs.
> > >
> > > You should explain here from where you got the actual names.
> > >
> > > Otherwise you got following review:
> > >
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2:
> > > > - Moved reset-names to top-level properties.
> > > > ---
> > > >  .../bindings/net/can/renesas,rcar-canfd.yaml  | 33 +++++++++++----=
----
> > > >  1 file changed, 19 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar=
-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.=
yaml
> > > > index e129bdceef84..9bfd4f44e4d4 100644
> > > > --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.=
yaml
> > > > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.=
yaml
> > > > @@ -122,6 +122,11 @@ properties:
> > > >
> > > >    resets: true
> > > >
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: rstp_n
> > > > +      - const: rstc_n
> > >
> > > rst seems redundant. _n as well. Are these names from datasheet? How =
are
> > > they called in this device (not the soc) datasheet exactly? Because i=
t
> > > feels you use pin or SoC names which is not useful.
> > >
> > rstp_n/rstc_n are coming from the SoC HW manual and is already used by
> > the driver (since commit 76e9353a80e9 "can: rcar_canfd: Add support
> > for RZ/G2L family"). The reset-names existed previously but were
> > dropped as of commit 466c8ef7b66b "dt-bindings: can:
> > renesas,rcar-canfd: Simplify the conditional schema". Let me know if
> > you want me to rename them but the driver will have to maintain the
> > backward compatibility or do you want me to drop this patch.
>
> The names are fine. The above is useful information that should be in
> the commit msg. Please help us if we've already reviewed something.
>
Sure, I'll add the above info in the commit message and re-spin the series.

Cheers,
Prabhakar

