Return-Path: <linux-renesas-soc+bounces-27282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJzJ6s/cmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:18:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDE68920
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47A14925E7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 14:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C533625A357;
	Thu, 22 Jan 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e9yOhMb/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E133A03A;
	Thu, 22 Jan 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092553; cv=none; b=s249IQfDB6zSvSXF8OwlWByAb4J9FPV1MCw/kmxrhqJLjwfYKj4BYTLRM5iwKKmCYWI3ru/4wKm5ZwMC9NnzFXGs/fo2qXJ64yl8W6GzPn+3GXVeqjWIXonVeRl+Ku1weBg/CiQg6Kg4xHX6IZtR5by8/+8cWPiyPfcBUK1WWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092553; c=relaxed/simple;
	bh=6JKagdpu1NW0MWhde9QrcjagRAxxNS3tGFdkj/BcMwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KjhU8AVwsyMbSD/jj4hXeD4lCzyRBjgHuj6UMSO9hq7SSyXwo8ob9o9EZSl/atPjBG8qylgcOw9BTWDsVBb8q4dBFFvb0NacoJf37eKG3Zc1NNwatL6sWshW9evDsoTozE3RN5b1BzNL44PmGzFiiszU8Ott16zncNcO/6nw7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e9yOhMb/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05F304E421F0;
	Thu, 22 Jan 2026 14:35:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2DE0606B6;
	Thu, 22 Jan 2026 14:35:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B05FA119B828C;
	Thu, 22 Jan 2026 15:35:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769092548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMQ6v9PWs/W6+3N3+tONMG1XpsHmPJ52wzgsGbqmIs4=;
	b=e9yOhMb/V7CMe2+OK/aVHvBNkZ19aKgRlCFCK3B8oYkqO89HRlqzo3Bbw2X58ds2W4eCeP
	N6AXTv1lsHrNgv+yWnlw0Jg3oJVE5yhSMjZE9en5+iGDzTxQ8ILeMzhqezmdrf6ZQoOrPJ
	iXcCXmULKYoVhNBU+mJ9ZKb2e46Ol7GSYaMyemA3u5IC3oKimT81X3gFh16lBJn9biLF5u
	HDKHQu8d2bynyWD/P7JJT38btHyIsLDAIc0bHDSXdD8LMY9xd0RK2qdO7iva3I+0M/3uFu
	pE3UVdhSaaV4x1J0ElDa7GvRfl4cIrIDYZjZ8oNEFoIRVtibS3RaHvWimJqjVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Vaishnav Achath <vaishnav.a@ti.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Pascal Eberhard <pascal.eberhard@se.com>,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/17] spi: dt-bindings: cdns,qspi-nor: Add examples
 for testing the specific cases
In-Reply-To: <20260121230759.GA223990-robh@kernel.org> (Rob Herring's message
	of "Wed, 21 Jan 2026 17:07:59 -0600")
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
	<20260121-schneider-6-19-rc1-qspi-v3-3-43e70fab4444@bootlin.com>
	<20260121230759.GA223990-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 22 Jan 2026 15:35:44 +0100
Message-ID: <874iodpven.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-27282-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.198.132.80:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,0.0.9.96:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 0FEDE68920
X-Rspamd-Action: no action

Hi Rob,

On 21/01/2026 at 17:07:59 -06, Rob Herring <robh@kernel.org> wrote:

> On Wed, Jan 21, 2026 at 06:04:59PM +0100, Miquel Raynal (Schneider Electr=
ic) wrote:
>> It is very painful to modify this file because the core IP described is
>> so common, it has been implemented in many SoCs from different
>> architectures. Both `dtbs_check` and `dt_binding_check` are rather long
>> commands, even when restricted to a single schema files, and letting
>> this file evolve without risking to break other DTSs is painful, because
>> there are arm, arm64 and riscv platforms impacted and no way to check
>> all of them at the same time.
>
> OTOH, examples aren't meant to be exhaustive test cases of all=20
> possibilities. If it was me, I'd actually just get rid of all the=20
> examples. They are generally just a copy from some .dts we already
> have.

I will align with this idea the day `make dtbs_check` (or something
similarly simple) is exhaustive and cross platform :-)

Maybe cdns,qspi-nor is an exception, but it impacts different
architectures, which means the output of `make dtbs_check` is
meaningless because it only covers a subset of the possible cases. Hence
my attempt to gather all specific cases in the bindings, so I could run
all the meaningful checks I wanted more easily.

I think this patch has its usefulness, but I don't mind dropping it.

>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
>> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
>> +    spi@13010000 {
>> +        compatible =3D "starfive,jh7110-qspi", "cdns,qspi-nor";
>> +        reg =3D <0x13010000 0x10000>, <0x21000000 0x400000>;
>> +        interrupts =3D <25>;
>> +        clocks =3D <&syscrg JH7110_SYSCLK_QSPI_REF>, <&syscrg JH7110_SY=
SCLK_QSPI_AHB>,
>> +                 <&syscrg JH7110_SYSCLK_QSPI_APB>;
>> +        clock-names =3D "ref", "ahb", "apb";
>> +        resets =3D <&syscrg JH7110_SYSRST_QSPI_APB>, <&syscrg JH7110_SY=
SRST_QSPI_AHB>,
>> +                 <&syscrg JH7110_SYSRST_QSPI_REF>;
>> +        reset-names =3D "qspi", "qspi-ocp", "rstc_ref";
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        cdns,fifo-depth =3D <256>;
>> +        cdns,fifo-width =3D <4>;
>> +        cdns,trigger-address =3D <0x0>;
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    spi@2400 {
>> +        compatible =3D "amd,pensando-elba-qspi", "cdns,qspi-nor";
>> +        reg =3D <0x2400 0x400>, <0x7fff0000 0x1000>;
>> +        interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks =3D <&flash_clk>;
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <0>;
>> +        cdns,fifo-depth =3D <1024>;
>> +        cdns,fifo-width =3D <4>;
>> +        cdns,trigger-address =3D <0x7fff0000>;
>
> This one really just looks like a subset of the others.

The fifo-depth possibilities are extended just for this
compatible. Basically I captured in the examples every specific case
covered with an 'if' schema.

Miqu=C3=A8l

