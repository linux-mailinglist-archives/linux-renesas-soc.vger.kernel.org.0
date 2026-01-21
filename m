Return-Path: <linux-renesas-soc+bounces-27219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCMZHpEUcWmodQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:01:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E285C5AEF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F87C8AEA4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631DB481225;
	Wed, 21 Jan 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ENgvT9z3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD36480DFC;
	Wed, 21 Jan 2026 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015042; cv=none; b=D5anoyeg0/pfShAhvr51ojpxChqyfq6O9unuRjShltS0edxfMR0nMhby7buCD7LyRruv//9QqzK5FcW3yu0r0knpnM/tdBuvJ5lcw+hSTB4HZYCyNZTt+AQCGugdQZz1X7Tidm18dsEdGJl7SkOrLstWVAYtbvVbJjLprkVh0L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015042; c=relaxed/simple;
	bh=uVPtoxCumeeYqYkiQcml1OFDu2XyFyHGSzL6HgbEqYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W5OQGdLzj2IGZ7gxTKVgB9GtEw0E817acy95bfS1rpVcDy0Q82t13aHEgWjlDdvAtyz/wmKLrTnSK0pfZ7Lv0JONiF2H/QNZ1bFCDNPwqx8mnx8QOEekHVufiy7b1o32O7SVeTg01rr0fTXU/PBhCWHe/GBsJ0y91h73IkJQ8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ENgvT9z3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9C54C21A8F;
	Wed, 21 Jan 2026 17:03:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0940D6070A;
	Wed, 21 Jan 2026 17:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36645119B16F6;
	Wed, 21 Jan 2026 18:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RbGv7Tf7IyIu0ui54nbpobNOcET5Uxrpyk5GkIi5FUE=;
	b=ENgvT9z3MwsxbjOTvC5TilFZen9Qv4wpNd7ooqOuU+tT+6MKbrA2ee9JXw7LQczNKiWLh3
	7jeNnd7/O8VbB7E0w4nVlA8W0EGMs1+bH8kB8SY/Fsj9x7Fh8h1+6/e8uYjQxuESOiixxL
	N05tta877lhAitsa5bMxlb/PFn0JJoTkzn9JKvp1aB4VALGapzMouZC/DKS1uz9HfUTjnX
	RkhWd6u0ZUVZxjLfizzQ0vzYuqHFcthbhsnwumrNB4DKr2LvjJZm61KZkvJLaYtPgIYzT5
	d4Ft4lKSf51jlnwzHy8JZCP2BWgRHvgamLTHElP5697xwJtORQUqOztUipBDGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  Vaishnav Achath
 <vaishnav.a@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Pascal Eberhard <pascal.eberhard@se.com>,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 13/13] ARM: dts: r9a06g032: Describe the QSPI controller
In-Reply-To: <CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 15 Jan 2026 14:00:49 +0100")
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
	<20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
	<CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 21 Jan 2026 18:03:51 +0100
Message-ID: <87zf66q4nc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27219-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[2.98.109.136:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: E285C5AEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On 15/01/2026 at 14:00:49 +01, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:

> Hi Miquel,
>
> On Thu, 15 Jan 2026 at 10:25, Miquel Raynal (Schneider Electric)
> <miquel.raynal@bootlin.com> wrote:
>> Add a node describing the QSPI controller.
>> There are 2 clocks feeding this controller:
>> - one for the reference clock
>> - one that feeds both the ahb and the apb interfaces
>> As the binding expect either the ref clock, or all three (ref, ahb and
>> apb) clocks, it makes sense to provide the same clock twice.
>>
>> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin=
.com>
>
> Thanks for your patch!
>
>> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
>> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
>> @@ -66,6 +66,20 @@ soc {
>>                 #size-cells =3D <1>;
>>                 ranges;
>>
>> +               qspi0: spi@40005000 {
>> +                       compatible =3D "renesas,r9a06g032-qspi", "renesa=
s,rzn1-qspi", "cdns,qspi-nor";
>> +                       reg =3D <0x40005000 0x1000>, <0x10000000 0x10000=
000>;
>> +                       interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&sysctrl R9A06G032_CLK_QSPI0>, <&sys=
ctrl R9A06G032_HCLK_QSPI0>,
>> +                                <&sysctrl R9A06G032_HCLK_QSPI0>;
>> +                       clock-names =3D "ref", "ahb", "apb";
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +                       cdns,fifo-width =3D <4>;
>
> <4> is the default, right?
>
>> +                       cdns,trigger-address =3D <0>;
>
> Where in the RZ/N1 docs can I find if these two properties are
> correct?

Actually, fifo-width, fifo-depth and trigger-address have no meaning for
the RZ/N1 IP, as they are only useful for indirect accesses, which are
not supported. For the field that has a register for dynamic discovery,
it is marked reserved and returns nothing useful. So I will just adapt
the bindings according to these limitations and simply drop these
properties from the DTSI.

Thanks,
Miqu=C3=A8l

