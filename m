Return-Path: <linux-renesas-soc+bounces-22503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8FBAFC13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 11:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F7C3A97F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ABC2D876F;
	Wed,  1 Oct 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTGJLANn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FF279782
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309348; cv=none; b=HzRPMqA0s8ytQ6h4xWFcfCXwsPixhJmIR2A9i3JuoRvmMRogHu/fFpkcj60bnRWJ9YAqi6VFiF9SoyuWXt2MpFLOyhYHBBLtEV3tjT4nMAdFDdodyTPA18jDmw6QO4Y5vZFViNPG1u47cTYrAghXrR85tIhv7GWA4U8XlYGjdTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309348; c=relaxed/simple;
	bh=AB0tcHMBNfASxNHiAjh5DUVuVU4/Ypfbq5ad5gewaFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHabg+2/Tj5VzsLtJ1mo7hAj3dGKdZsha0NXr2UPb2k98W5sJV800SAzJGKqMGLG6DU3cwezUM2ljIFkbCwLo4oky9VsWyS/e2Wx5ov4wqPginkdy21HKYuZ/fadIkBmZAWE6d7vOIWBGRaNH8KoQK/YBbIu5I/Xj2WmeIcQv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTGJLANn; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so5381923a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309346; x=1759914146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95VNAivb4KtoR4t1T1BdFRDUAGxRsoT1vqmM4i3dGG8=;
        b=fTGJLANnEZHaxF/PnzsAxtx+bnVVgh2YnRIk4W/9MakUj3vzIuDyrY7YsMpdsrQrHG
         kJ0nppkgXDxAsDjqqrhYDSl2p3GExnNxo+3z0+KN7j0LzeLOKkbDKiu9ze2aLorI0RYU
         JUmWbdatbTzyKT4RVNK4em1adYdoP0sf8Pxn6GfsUCMMXCVqTOvQt0dc/2gsjjkhok+q
         z6FgZAYtSxu4Sq4ZxEKBJZWfT4WFwvQJyDRrAWxorHgM/IjFBJy5Sua0v2pMPVQT0kWY
         8SvkTxmKUca2oCKCvbVu4sp6AA5zLXB4hmCNTFH3doKKkAvf6gF8sK8F4cRzZ+n7VYNz
         yCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309346; x=1759914146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95VNAivb4KtoR4t1T1BdFRDUAGxRsoT1vqmM4i3dGG8=;
        b=kf0Fu02ZaK8Fz/nKcVf1k93zJwRYREq8UT2WzGyA+YDl8VDi+f0u8X1e5bihtUop/V
         5vwPOtFVyB3oVlUjGgaZ9p1DD8NMnkysJi+0IUnAxsvA0o7DcJlE5RbFyiqIigKiPfqt
         1ZNXa4PzkiwovshC+iX8+l0wL76jwlaY42yfxIbLuiYdeIWnNlAH/cK757fX/EpjAK2F
         mm0oQ707Iv0u7Zo7oaF1eMPEuj2wW70V2AiyR8koZuxy9Ovsas5ij4UpaYX0/UVADROr
         N8EmuLlcfbSPVV+ODAAY6t0vcHEWUd34W/wG3K5NBzdrw35zGetbt7dJzPwsuzrsnaqw
         Hssg==
X-Forwarded-Encrypted: i=1; AJvYcCWVyg/W94RcS8BXDEolafDeXhoMs0d2QHfWpMxzQshXLOwU9SL1JYwo4Wn7gPiuZTMpo9Sw23NoEa3pTUdwMWtsYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgH7nbHejA9Fi9joXz3+doO2XYvOUtP6sc/2izNE/Ro75ySIm7
	K0K3FJcmUmL1imOa+5a59iglmfg3k0PKFuMPdN+9cJ/vtGviNG2PLTUyu3TBS90yY6C26WgZALo
	eGu9BHqgv9xjERKRQGLXi9JXQp68yPuA=
X-Gm-Gg: ASbGncu43ki46pvlgIpgeHayJhT4QC0hnRL05VEeDH9zoqD/USznagBqD4ig5A4R9Hx
	Zu6bKvx+ucUCPAnDP7jbv3NJ9xRo0uN6EgDq6xwZuT5kk5WoLj12mSvp7rx9GCvGug0hrxPUFAJ
	VFIe5HI5bsArpwAWclwUMrbZolRf0FVZRpvzHjukH72Yk/8NLkm+mN/+Vooy2YXytBp33r5DDk4
	jhJig6KUJvDrtjIPfAS5/Kz+c1MA9J2Uhfi00o96oq/QoDxY4TJrtsLwmQzkiAtjDAo5LUCJgNW
X-Google-Smtp-Source: AGHT+IHpOHSWXjAvp/DRP8YSuqG/pR1Zv2Roxkvp40cPVFhkS4OWrC/GHFGw2hOP/qUB4JZY3u3JjNI3aeVWwTwkhfo=
X-Received: by 2002:a17:90b:3850:b0:32e:3f93:69e2 with SMTP id
 98e67ed59e1d1-339a6e9d356mr2831075a91.13.1759309346075; Wed, 01 Oct 2025
 02:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
 <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com> <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
In-Reply-To: <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 1 Oct 2025 17:02:14 +0800
X-Gm-Features: AS18NWARSidOHUaRxCTj9BQiJJMS4I5tkjVU1GYlGC0PywCxUaMgQ66iwX6WNYQ
Message-ID: <CABh9gBedqTb--Q27o11qCZ1cr0xrsGiYNDqRDwvG3Ho=+uPRQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 10:54=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Wed, 2025-09-24 at 20:28 +0800, Kevin Tung wrote:
> > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > based on the AST2600 BMC.
> >
> > The Yosemite5 platform provides monitoring of voltages, power,
> > temperatures, and other critical parameters across the motherboard,
> > CXL board, E1.S expansion board, and NIC components. The BMC also
> > logs relevant events and performs appropriate system actions in
> > response to abnormal conditions.
> >
> > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> > ---
> >  .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1068 ++++++++++++=
++++++++
> >  1 file changed, 1068 insertions(+)
>
> This misses adding the devicetree to the dtb target in
> arch/arm/boot/dts/aspeed/Makefile. Consequently I don't expect this was
> tested with `make DTBS_CHECK=3Dy ...`. Fixing the make target and
> checking the DTB yields the following among the usual concerns:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: ethernet@1e67=
0000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('ncsi-pa=
ckage' was unexpected)
>         from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac=
100.yaml#
>
> Can you please address that? You may need to update or introduce a
> binding document as part of doing so if it's not a matter of removing
> the property from the devicetree.
>
> Andrew

Thanks for pointing out the mistake.
I have submitted v3 to add the missing devicetree to the DTB target
and to fix the error caused by unevaluated properties that are not
allowed.

Kevin

