Return-Path: <linux-renesas-soc+bounces-27171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL/JD8E8cGmgXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:41:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC414FEF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8C2ECA2CF09
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6C032E124;
	Wed, 21 Jan 2026 02:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3yHlX6G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA5329385;
	Wed, 21 Jan 2026 02:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768963204; cv=none; b=NGVbz/85+BP3fbsjD2j58vdtmJgwsNCgzm3cxYFg1Obr72qXF4D3Iuf8MJArLQbx5kLGLzgEgzf1dtCs3MtkmGnwJaV8NzLAxR+KDRBUBy8N34TaK8r1M8bX1Cefk+7CzxBvDn05czC122WwKAIFE5YXtOYvsf1x4qLWv5CTGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768963204; c=relaxed/simple;
	bh=+kYehEeL0rHC2CLtfdhajEXhmnfOr//n+Q/64DRdOXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kS+t6zHI6LFReS6QVOCNr1YMuLD59aqS6te+mrAx0OHt63Px3viWpxo5yoid5qhF38F4m1o1TFQkI+lkMxW8NGDf0jBxLp0p76VFGNLvujtQvrOVtMEEgDMqCIEqj6hm0/AklYa+FXCsBlMKMNA2MQCI4eCJCfdvK4pCRlGLy+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3yHlX6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDA1C16AAE;
	Wed, 21 Jan 2026 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963203;
	bh=+kYehEeL0rHC2CLtfdhajEXhmnfOr//n+Q/64DRdOXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3yHlX6GldOjZe0vr0DQP/Bo9VeeugQY0W2qB2WKa3FZ2juQ8Eh34BHHFwLa/LzVf
	 wJzVWOSbIlBq7cJwzj2sMygGhCSFWXJFi6Dc1nF1c5h1O0iOfmOc/vWTj5oiMzO6Ub
	 DCmO1QaiM4CNyPnrHXWv4kDBsBzWAEONBjoXjmEiaaW8oJnQZbXI//HLCPbycQQT5H
	 Wmh4MgTCVCOeeJUTxOol89pTYoI48I6AgZVkSEFWxWTlDHMBPmaGdd5GW0y96bqM7v
	 VwTxvxzXc/e5dMmfuOB4cDJp55oiqP61dXc0OXINn0tmGqTXVHhEOCxQu8gM9doSwY
	 bCadwb1P/jKmA==
Date: Tue, 20 Jan 2026 20:40:02 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
Message-ID: <20260121024002.GA1845406-robh@kernel.org>
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
 <20260115-schneider-6-19-rc1-qspi-v2-1-7e6a06e1e17b@bootlin.com>
 <CAMuHMdW5hwNu-07-7xvyWdcGKUZy+pCX0=W=JNgd4h7m72wQFg@mail.gmail.com>
 <87qzrpucae.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzrpucae.fsf@bootlin.com>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27171-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-m68k.org,kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2AC414FEF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 10:39:21AM +0100, Miquel Raynal wrote:
> Hello Geert,
> 
> >> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> >> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> >> @@ -80,6 +80,10 @@ properties:
> >>            # controllers are meant to be used with flashes of all kinds,
> >>            # ie. also NAND flashes, not only NOR flashes.
> >>            - const: cdns,qspi-nor
> >> +      - items:
> >> +          - const: renesas,r9a06g032-qspi
> >> +          - const: renesas,rzn1-qspi
> >> +          - const: cdns,qspi-nor
> >
> > Doesn't the need for (at least) the CQSPI_NO_INDIRECT_MODE flag mean
> > that this device is not compatible with cdns,qspi-nor, and thus the
> > cdns,qspi-nor fallback must not be used?
> 
> I understand the question. It is true that I use driver data to limit
> the number of features the IP can use and this data is associated to the
> Renesas compatible, but I believe all other flavours of this IP would
> also not work without driver data attached to their front
> compatible. None of the SoCs with the Cadence QSPI IP actually would run
> without their own driver data. For me the fallback compatible is
> relevant because it describes the hardware as "this is a derivative of
> the Cadence controller" (and it is clearly the case, and this is also
> mentioned in the reference manual), even though I agree using
> cdns,qspi-nor would definitely not work alone. But again, none of the
> other flavours would anyway.

Fallbacks should be usable on their own. We've generally moved away from 
having these generic licensed IP compatibles because they always have 
per platform changes.

Rob

