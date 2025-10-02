Return-Path: <linux-renesas-soc+bounces-22560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41CFBB2790
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 06:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F05119C4340
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 04:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E7238166;
	Thu,  2 Oct 2025 04:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDg9C2M9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1314A0BC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 04:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759379041; cv=none; b=f+U08yve85SxquCiDDAbuh7iy8ckELiSnXRR4RGhjbbc7sfV6Z+oc+e+XCV+O7QoamiiXq0a17alaWWIjtrxnG+Z48/2V9Cmnz29gqrF8YezRHgIBCylJsqjuGaf5TG9ksrUD8CmKBfK+guAtQQ1SM4WAbYzFKLlabCntcdjO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759379041; c=relaxed/simple;
	bh=ehu8376cUl/DJNnvCX5i0mJoP3uDOVuPTyuu4WOuiDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juKJw57eqWhUzz0jWFBbfKXpzWdGzz8P7WJovLO0Nlk0dc5YBEZ6058NQpxsbLIZ9yMPEl551niDjBHHGPmUUnx0NTpKGq35LFPrzNn4nAfaUl9G9K2ztBfX0DSJIgNwcyEujXMBuRJM6zE6Dtk30r+qIyspMxwO2ULEp30JptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDg9C2M9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28832ad6f64so6327925ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 21:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759379039; x=1759983839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2QRGst729/DWiP4I9nqZ3Qxmv8ECUfQin2YGfwodis=;
        b=ZDg9C2M9Uf+/XEzOaIAIqAKsFjYHGWSFsWmW/t7xD2L7GGT3WSCcguAQsCyJ5vYzYd
         Tm7B3LvbT7ZwwxwJzWG+Q2AAWXY2y8DlY0TxhFj4Ha/TEWJHUL6FMjnVG0cHZ7DW/p7Z
         te+kgOR3JiTBiz5F6VkmXZJFfE+ZLOs3rnp7daTICR4XkeUPu/4VLncQGHgL2Us7PwQ6
         pgW4quJsmCuApTWyP9L7qI95vG4rYFP1qXIUyErOBpoakJDOdNYXGqFyvWc5S3itljxV
         YZtUpaeoOEUgfGkffQAiiRBcVbIyxengJZOdYAq4qQCixGGXehL9+xYmGeOhb8cfDYY9
         6XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759379039; x=1759983839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2QRGst729/DWiP4I9nqZ3Qxmv8ECUfQin2YGfwodis=;
        b=RmS9X6GAWNHPl/j4xbNVjydukK/g4u2U1lus6I/d75nsc7BZgBBz7adi/QJPy008N1
         wT3xippmArYikF3M3ZaTI7qsIlXz1hZLPmSq+Fbs/s/3w4oBxis3tC6HpOhtkgeIllNX
         ytVoYWmtEGvH33pFM997RYZR5RFp2umCLIvFMVAuf82d6txpml9e84CJonQKnvCOy4Wo
         MS4k/HRJS5KpeLsRSWmNNH4Quw3ABNhjhV4FxO8wETNsciXhnc2EiwlZebHVI6pe3v3D
         HWRYziWBR4imfSte2EZfsMKtP5dSAS7cYqrpckq1HfdL/C8H8+zUy+n69njq4k4tHc6n
         6uFA==
X-Forwarded-Encrypted: i=1; AJvYcCWryBp9jqzV1O09F/42mbuZ9lokiu+vjhaYWsB/Q8pRazoc4pBxKXdZJaXpo3pwJHv77+jJeAQizlwUkGaoAWzZKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fJwJ06yftpdV/51Wz73+Jm8ziYcAcmEQOUufxEduM7noqRVy
	r9u8Y4f84wbId6vIEi/FskW4R/nZMKbOzLXma0Re8qHH4EdmWDghDbQNvhEyqKn87BdDZ/T2m7C
	Mt85i1XFTF6DyB9oakxpqbIcyCekSGTk=
X-Gm-Gg: ASbGncsJthfWfyDlrJ8KniTZjxVjBMPKdZ6+pol66ApTGrTgEpS9P6uDae4ktn/Fc9l
	vFtExmBMO1jNmeXU0IcNs8xOcBnfdZBqaSeO1S2Cjo0LVQq8ufRxRFiEaWHhhIFeu0PUM9v+6Rl
	pHBlut3+IlSAjj8qDikxNuOBwxcznk3RdVSvfcFfAmaQB2MRSAYB1F/RYTk66KQ7h9mOqvlBXdj
	7UDJrbV32u8b3jJkhMOdvMZrMtexjcY
X-Google-Smtp-Source: AGHT+IHgkuju9CUwpPT0WwGqt9+xSzAjEsWxHRza/bmAnljDvo45aLWn/1dVAmMuO1OQzeCs6YLRY6uoy1Dxbms4f2k=
X-Received: by 2002:a17:903:3c2d:b0:269:8072:5bda with SMTP id
 d9443c01a7336-28e7f45aa2cmr81883465ad.54.1759379038825; Wed, 01 Oct 2025
 21:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com> <20251001-bonding-surging-af8cd0d09e07@spud>
In-Reply-To: <20251001-bonding-surging-af8cd0d09e07@spud>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 2 Oct 2025 12:23:47 +0800
X-Gm-Features: AS18NWCewZBOJ3_bvPqMIiAefrcZiLRdaKPOQ3p104CWc2zI58_oYaZj_KaxEko
Message-ID: <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 2:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> > Document the new compatibles used on Meta Yosemite5.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
>
> You've repeatedly ignored my ack, so I assume you don't want it.
> Maybe you want a nak instead?
>

Apologies for ignoring your ack repeatedly, that was not intentional.
I truly value your review and will make sure to include it. Would you
suggest that I send a v4 to pick it up, or is it fine to carry it
forward in the next revision?
Thank you again for taking the time to review my patches.

Kevin
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e1=
09a78d931dffdfe28 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -89,6 +89,7 @@ properties:
> >                - facebook,minerva-cmc
> >                - facebook,santabarbara-bmc
> >                - facebook,yosemite4-bmc
> > +              - facebook,yosemite5-bmc
> >                - ibm,blueridge-bmc
> >                - ibm,everest-bmc
> >                - ibm,fuji-bmc
> >
> > --
> > 2.51.0
> >

