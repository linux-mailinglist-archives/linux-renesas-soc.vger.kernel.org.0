Return-Path: <linux-renesas-soc+bounces-6529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3039100AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E241C21C39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B091A4F10;
	Thu, 20 Jun 2024 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVVd7BUM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C45199EBA;
	Thu, 20 Jun 2024 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876668; cv=none; b=YQbnhumgfbckfKksuYOPxvI5OKT6e9qwDvJe9ZncLpdYVbEkicqSvTkFVXFjLCJ/3VfitLylR9CfdoYHoKqjcz6MQtlY2yRgqSjuHJsQZB9ZpOMpM/nBy6SBPhh6QIqPSo1Cy9BNY9s4kvrUCrSb2a2+a0pWqjFmwQU2mNAaAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876668; c=relaxed/simple;
	bh=okOqLw7c0senVhgw+ra23kw900+h4DE+0U7XOxfhL+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFPUUP3pnjXUlyJ/L1YTSCma00t6J2zWoO+Nd/QHGmQdDLoxmgmqjF7i6DhylSiE3X7QctuEZJwt69nSuY3WObzFqpPxXHbVeg3fF9OdoinQD/cfE5DVNULkUHfiwO0M45I5ZlfAi8E/Ow/AcHexayfrxdlI0oV/yuVnnjclO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVVd7BUM; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ed0b3c6a76so194904e0c.1;
        Thu, 20 Jun 2024 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876665; x=1719481465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okOqLw7c0senVhgw+ra23kw900+h4DE+0U7XOxfhL+M=;
        b=EVVd7BUMJDTxZU+uZYDb8PzR3uHaGQ9E02m9AWRhamrbRw2GZ1XFOUHBFzELeSMHeE
         ccAqUVkuI2/ifnTNlRNXP+5w3QM+cnqbSNoCEK+GhiLrO73dY96zAHrR3e/ZPDJGFREC
         eBLZaaDljEmQnVX8a0rg/T8p9ohrV6YTX2hffLJ3LbCZxMnLFRO7i/3a2lotKmyG2jXT
         jEWJFH13mh9kHqTmwBPXfN72qIXPB4gz9d1/AQoNp7QQE4MqccU4InySQBRgsQrXfSea
         eMkNJyfQwvoJyF+8r1YI5PrUmE/Y9AWkkcgrBKqnIzkQqKM4GeYZikkbxLb2WJ9ilxMn
         0pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876665; x=1719481465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okOqLw7c0senVhgw+ra23kw900+h4DE+0U7XOxfhL+M=;
        b=mjxJxDhW3hQp/t3pEYWA7r96Qilwty3wLJO29GKRRy5bwaLKA7x0rRPuYua/tXXNiL
         IjfytxwIiHmKCLo6swhikwwTtEFFP9/HhQ/0jtkYWO/2g76rNS11YiU2I87zTxQxhmiE
         o+QzS+5a1QOIkLV52gpl2/PoAm9UguxYdQYoh7smuHm81ojNMgRcEqN8z4DNd3Tnre+4
         ujWR1oH7yIXtOlO4o9rnFSLxflFVJljV3QkwBqVzzUGrmTebzOoQNuyWKmpVvB/jm68r
         2xbYsJ5WdTsuQWgjdNACXdDOe7va7lW69JnQOjTVCRUoa2vY8vf22HCF0uidORm3i6me
         O9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGfyfL4pwqV1pvKAItWVL0mqP0YaAzs/UJIouWxyu2OmQMMjDxSuVR9PtJmoIRtwV/+ZFldLl/ggKyrFVkAGH/x7t0Qd0mYMJEnOZgtC70jvZtfEDBl0jL2x+R4eVuU/gl+1dVFNR+jNRIKnZs+JD4uCkgxko7wEmDsAoToBZr4u24ZRRMz28KGNexRvlGwr1k/4WcGSvkXcnZ+eS1amI/SO3bFMD
X-Gm-Message-State: AOJu0YwARpuctroM0CUrGmjmD204RGhSwf+DmxKVqsQ8JueTjpGhmMSe
	9LeWyzz3hfkIM1yFBMPG0Tc9U8sFGLv9mwwPINCOB6sut/HPx17BTz/2Fb3widPWzVNRzXlZJP+
	6sPOq50f4Iq1Pi7lG0OXt9RPa6N4=
X-Google-Smtp-Source: AGHT+IFBepYei96IK6SgPeYNf/E1cKcoErQgdiXocUItGkoIcqYFiufUIo+8G4N0O6SofR+puEeWV6rivz9Db7RDCkc=
X-Received: by 2002:a05:6122:3124:b0:4eb:1a82:2037 with SMTP id
 71dfb90a1353d-4ef277b59f3mr5563871e0c.14.1718876663767; Thu, 20 Jun 2024
 02:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3> <TY3PR01MB113467E6EF1CFC24154AF73E986C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467E6EF1CFC24154AF73E986C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 10:43:41 +0100
Message-ID: <CA+V-a8s-fCtQ8GKVh_REkPO81v0oCKPGiLJ5aiJOVdVUbvbCzA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jun 20, 2024 at 10:30=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Wolfram, Prabhakar,
>
> > -----Original Message-----
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: Thursday, June 20, 2024 8:40 AM
> > Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V=
2H(P) SoC
> >
> > Hi Prabhakar,
> >
> > > I did give it a try with platform_driver_probe() and failed.
> >
> > Ok, thanks for trying nonetheless!
> >
> > > - Firstly I had to move the regulator node outside the SDHI node for
> > > platform_driver_probe() to succeed or else it failed with -ENODEV (at
> > > https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.=
c
> > > #L953)
> >
> > This makes sense to me because it is just a "regular" regulator.
> >
> > > - In Renesas SoCs we have multiple instances of SDHI, the problem
> > > being for each instance we are calling platform_driver_probe(). Which
> > > causes a problem as the regulator node will use the first device.
> >
> > I see... we would need a reg property to differentiate between the inte=
rnal regulators but that is
> > already used by the parent SDHI node.
> >
> > Okay, so let's scrap that idea. However, we need to ensure that we can =
still have an external
> > regulator. Seeing the bindings, it looks like you enable the internal r=
egulator with the "vqmmc-
> > r9a09g057-regulator"
> > property? I wonder now if we can simplify this to an "use-internal-regu=
lator" property because we
> > have 'compatible' already to differentiate? Needs advice from DT mainta=
iners, probably.
>
> Why this cannot be modelled as a regular "regulator" as a child device of=
 SDHI device?
>
The current implementation does implement the regulator as a child
device of the sdhi node [0] itself.

Wolfram was suggesting to have the regulator outside and use
platform_driver_probe(), which caused an issue as mentioned above.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024061309=
1721.525266-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

