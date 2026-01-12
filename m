Return-Path: <linux-renesas-soc+bounces-26616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90887D14641
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 18:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E56030057FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 17:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1D637A482;
	Mon, 12 Jan 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhfGDDRd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2EB37998E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 17:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238561; cv=none; b=mV6S+rB5+cdLiUWdetYNiROyWDqFAxu1AtoFmv3J3WPf7QGcEthASTknDoPBskulLjeOOUzbsBq6TUqXWvw0Vbqr2K714MXFSXnvG/o/trstwWMNOslMqD1cjL511teTupapeOwbF5FQzlTwFtuPRp7OzbHY0xppVwXcfp1G71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238561; c=relaxed/simple;
	bh=fx7f5gmSSFswdPvJeifq7ynDjzUV9iVZu+1agK7gRrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz7YeJjXS/vVPH2Pm3lRU0Rv43tNqNjt4pbmawViU0B/EiV91a1ueUUN4EB8dQSsQ8qSc6BtIxz6bduV+6k84B13Pe957gHnborQ6pPDWY5NRTRvP2c15PSQZt/TcGLque2Dcf5R9M/rl5KOjWqOc0AAB6Y4HCgdeVkmFiME/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhfGDDRd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432dc56951eso1999977f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768238558; x=1768843358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoIbqIePTgpLSL+UJuksj1YbjxdBor7s2BPUSHPW4i8=;
        b=MhfGDDRd/LwYXErNq3CRw4v75O2GtYdikijcLCzjdnXQbye5MOWDKOLlzPAvrTxDsH
         HmgcdcKtqGjIb5Ttvub6lCaX7LNO0bFltrDZhCUNRD2o9pMpuBd06P/tjHsRcrwn43Hj
         dRlCNgbd/kmKpVgyVqBP3eDwevnILt6qyajGtm48P+yvzpJA3VG68gf7zePmFfhyG3IV
         3w2TUsthB66C6zrOLfJp8JDshrPUM0tB8SmE9lN1UnUYiur7bWPZ7iO0mz/VLaQndU1V
         atMIgh1ZbHksBEVGETmFkpFN8E5mM5r9AwgqKE/gypB5GQz13qiLhAp1boIf5/CiO1sa
         tGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238558; x=1768843358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XoIbqIePTgpLSL+UJuksj1YbjxdBor7s2BPUSHPW4i8=;
        b=CFy11HY+K/Ino0I1cxw7kjQndFszxoqMHAC3o50ShYFqtiMywsdunGJhIhJe41laqB
         LzS/JAqnQVaM8GhEXRY+L2Z0Jw0uTTkznuWgBL9jckZ8UbZneQKlrZeeT1O4cJAJgx0J
         puzqEv/W3w0vtWdqgfbaV0RDB5FQl0oxaWl13FmlOIiugCwevYKMf4wwMzPHxbPS290A
         ckHwBpboVkytJ0RRxzaE/ZbzBxEpSkISJKiFN5Uue5WGI8FRI/P0bvnOboUQZwu9/gRA
         G7nXsI6nbO4abmOjryHm8DtQfkLXjmq+ZyOx4ipjRnCNFar7U3ObkNcStyuO/5T/G5km
         Z3XA==
X-Forwarded-Encrypted: i=1; AJvYcCWMCRoMQDhH12d4bMT/0iAOOsqV6yjcf8g2OwW4zYWQ2xOwLTVQNgUfomP4HXK8x0+pYHcSW4mfIc5BXcJcruZzHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwegbDOz4QbEsCiuOiD7BXBBVNR+exQMD09ju0O7kJXpic3pvC0
	/zTwF4ZkmMwERwjHaAODbiEjxXS7qM6QSYLZ26onJmSoVhrcRqGwsdJx/h7X1KSzD1KVtFfoJpr
	VBn7Qgy2r/BktC6BivnDKJgYmtEWJz4s=
X-Gm-Gg: AY/fxX5eVE09jGcGpzq9bKJ2VTWrvg+wr+7PZmSWwOQOMxRmiMzqR0DV8lemEHU5Czv
	xy17GaqWdpZYCDDwyJGbhiysGgjt9ooiE7BQBUNwnDUvO/bMEl7KlznIwRDHrCHIaRb80qJA+hx
	0YDXfqEqvrrg/Fx+UiRRJx5auW9DnHR9H6BkbzaWQ8c8GbwxVEIyxkxUSgS8xedpFM09HwWdQai
	8F/8Lqc6UO7zGGiwtGroeDMtnmWJxOCylPmTeJ5r8BxAIIusNz4fNsN/FuRnqk6qETUR6XP58Io
	t+/zvz8x4XJOBWo6Zy4zQzhTJp3Vc5PKmXEAk052ctA8eDr5vPhn0kQ=
X-Google-Smtp-Source: AGHT+IG/ubWG6WT8UaNamVE9wwO9Y/Hw5RZXTRbAXjYODB9xkPQrnY+3FbRELxIqmo/4LwdPCkLYYFvvXzvI19vTsYQ=
X-Received: by 2002:a05:6000:2912:b0:433:2f55:7cab with SMTP id
 ffacd0b85a97d-4332f557ccdmr3324827f8f.37.1768238558343; Mon, 12 Jan 2026
 09:22:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260109125128.2474156-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260111-poetic-dark-butterfly-97993f@quoll> <CA+V-a8un48Gfqg-K6YToxUgnZawOcb-nQHsBcOfHdpAR7_Uu4Q@mail.gmail.com>
 <dd053cff-af8f-4378-9550-9f99f91cea20@kernel.org>
In-Reply-To: <dd053cff-af8f-4378-9550-9f99f91cea20@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 17:22:12 +0000
X-Gm-Features: AZwV_QheTCZD0kXACD-Cz1Ovwf3K6_ymWIYncKkzsX5Y79IsYicxyLq7YTcbuwA
Message-ID: <CA+V-a8tZAUoPxp7NanALW5HmVLMQAprcDXPME5povLT6nH6bTw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jan 12, 2026 at 4:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/01/2026 15:04, Lad, Prabhakar wrote:
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             # SoCs WITH resets but WITHOUT reset-names
> >             enum:
> >               - renesas,rcar-gen3-canfd
> >               - renesas,rcar-gen4-canfd
> >     then:
> >       required:
> >         - resets
> >       properties:
> >         reset-names: false
> >
>
> Yes, although now I wonder why do you have such case... There are no
> benefits in disallowing reset-names, even for single entries.
>
Ok, I will update the resets property in patch 1/4 as below. Would you
prefer reset-names as a required property for single resets?

  reset-names:
    minItems: 1
    maxItems: 2
    items:
      enum:
        - rstp_n
        - rstc_n

Cheers,
Prabhakar

