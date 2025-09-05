Return-Path: <linux-renesas-soc+bounces-21474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91EB456CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97EB01686AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2A343D6E;
	Fri,  5 Sep 2025 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McN8/iSM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9472615;
	Fri,  5 Sep 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072948; cv=none; b=j1ClL2QvMLBpldOxQoDfVzi5cWSam323ga4bKSFYvqxHpqQE1VHjVvYEMCiCELKl/ZJmZgPbyo+wvPYgr6g3cDEmQYaGH6STBOcIcSxBHvtXJdgo40HEezZuhwFN2UvGnLpT6v8Ilz0US5wfpWFzxDXlfgKxpICuzfIp4wRiX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072948; c=relaxed/simple;
	bh=Df20U8eLXlwJoFINrMRZTXja8QnLE3DWLst3QAqSPAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKWilacpWN2+Z4FsS7wAqVWSaHyJsGf4N6DvX+n4kdFTLDuWDsu3xuWylW3s2Jj3PxBpJoYDq65lh3L3ZRvbuqt1Yv53XvWftboYQ1Vwu04qiuSO5WZxv2cq0o6JP1KV9a37nqR643A2lvqGV71xC+MZn+qNYQFbgUXTs3uXvw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McN8/iSM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so14765025e9.1;
        Fri, 05 Sep 2025 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757072945; x=1757677745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df20U8eLXlwJoFINrMRZTXja8QnLE3DWLst3QAqSPAw=;
        b=McN8/iSMdlOR4XRQ2B9MEBwnkZ5WBOnRryVvIZHzBv+nywnrUoJTjXDVQssX+QT4Z4
         X/SKSw16rtOFvAyJIW65P9wLHG69/HAqe27W+wfDD5LjSkuJk+EhB9qcrm5+WF6mcnKz
         3YF2+MwHZrH66syLGMXrX83chTSDkBGM6DmdDsTOjjDRIXLlzZxrhcJXqr8hwFmUiw3y
         j4ZmKyIA0dgrgaNZNbxkWw0uJAIfHI2xrwLKnUaqKWVHIl0yxWiTyMJwy6DRrKcC1yNs
         k3lJptMG9SXt4FiefhFQG+YYpnCggDYFUoRg37yEX3qvvlTsRxfweR8iL4mvnW1kudBb
         eSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072945; x=1757677745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df20U8eLXlwJoFINrMRZTXja8QnLE3DWLst3QAqSPAw=;
        b=D7hTAISWn5uryQeHqxawlyeS5bpx55ToghtavECclI9VbavBnf+CduzfUOkpYv18TO
         srnUbaNKEdwlLmXsq5xSLArDQBdGDRUrp48eFxyVlRUWygyVgGE8ccIVIA2NEE3bYQeS
         p70mm4foHbKtxYnf+EeTMypAG+4zRlMeFY+P8swml3UUATC3qxG2YOn88W+Cyxt9u84F
         qUGm51/6PvTf3eaXA/vfiTCzsBBHfELFFrOB0c/fWc5cLQfdjSD1UTQO08ghdmmy6dYs
         YMXpe0E91n2kZSbqMs3ZzZW+pWQNoluGrRO8cEYRBiMAIPLlnaS3SfKfA7PNWR4n80HG
         HEiw==
X-Forwarded-Encrypted: i=1; AJvYcCWKrjWYFeGOBawBB6cnV9q06ZHLbii1Rbi0RIRmDp8FokGd7gFnFH5W+VTMMuAANR8omEpjNRCxFOa6JEKED2YG2ME=@vger.kernel.org, AJvYcCWeR3z+hgmUDU5XYnSjUuqIV9Lj6asrfdBFPNYpJupr9r6xn4qUsg7zSuN1TGIPZxAv9jYkfo+NKvE1@vger.kernel.org, AJvYcCWkIzAUrLWXU8B3hT7y1X3iMWW2s4q/8H0y4cL8uVozwcMML5MzuU+GfaJ00Zo/J7TgFEw4oMfGYxWLcFJ6@vger.kernel.org, AJvYcCXZKvzDnv250vfoWCEKKkvR5gmtle3w2r1AaRvzzhvF2FiEBhnLGK4D7iwRt3ShHO1kBh9isv4T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4AwtB+Q1icbh3evC4VBYqplba8+4wCJ3i+V7obOC3SfpRIwr/
	1lw6BklPQDdBkAis3uKvsHkrBrDU+HGUYRHtLZjjw3FlWoIK1nqgKUAqWPdWIkgUoQpgDTFHq6s
	x81Ke2bUp8Mje9ia/5BTREwGx350dghM=
X-Gm-Gg: ASbGnctOKGGJjP+idua9fWNgEsZODBKIpB8NJsfQO91q10OCOt1bzaEK5m6jGVDHyeP
	TQBsP/dM7IdyTgVZ6vOZSyV4FQOe4fF5Hc1ZL40wlV/eb5+Fhqerm2b+oGpsC/+F/LG71cfgLOx
	uQFs8SaNqUDzsMmj1+2ng9dW00pOnAX7wRUAfy66WEXgdSWN2Kkc+uOVUkiKcqkga6aOalQPP7Q
	WPs0FCXDjMoAVDxDkfTnYP7T8Bn1JRUWUWVsFnd
X-Google-Smtp-Source: AGHT+IF5J/PcStKYjOtqRY282bXKtlrfXrUZeJo8APJ8Hek9CEJ63pB//wmxrjL6Rhnna5oOANPbzyFTicW+juKh65Y=
X-Received: by 2002:a05:600c:3145:b0:45b:64bc:56ea with SMTP id
 5b1f17b1804b1-45b8557055dmr196616325e9.23.1757072944367; Fri, 05 Sep 2025
 04:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <fc103af7-0558-46bf-a668-d4d815ae704e@lunn.ch>
In-Reply-To: <fc103af7-0558-46bf-a668-d4d815ae704e@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 12:48:37 +0100
X-Gm-Features: Ac12FXypVFHVBLxkEzgMpaSiPzoRNtJcax8RRCNYnh1mWDmNLrR0ebAOwWEKVeM
Message-ID: <CA+V-a8sP1HBmBr_mbJTwVRAu-ZxKiT7b9KW3o97HOhu8DAUavg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 8/9] net: pcs: rzn1-miic: Add per-SoC control
 for MIIC register unlock/lock
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
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

Hi Andrew,

Thank you for the review.

On Thu, Sep 4, 2025 at 9:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > -static void miic_reg_writel(struct miic *miic, int offset, u32 value)
> > +static inline void miic_unlock_regs(struct miic *miic)
> > +{
>
> Please don't use inline in C files. The compiler should decide.
>
Ok, I will drop this in the next version.

Cheers,
Prabhakar

