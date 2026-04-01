Return-Path: <linux-renesas-soc+bounces-30678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWyIIPgzGm0XAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:08:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39796377464
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2089130D3636
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308F32C3251;
	Wed,  1 Apr 2026 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hDOrUGUu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54B3CAE97;
	Wed,  1 Apr 2026 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034142; cv=none; b=iL9gxmPL5GwC7jy4f9Om5iBswM7ftXbuYJxCKpweK/pTGNDS4h95bZTrLdegcwB4kriZxNviVyZUYdznVO+I9DkFXl/UoVbWZyAUzE4e2c7ySLX5THHAOEqRbqa0GbztVV6yLJipZkuX5iIX1do+ugNMV4i48z6qWI/oRPSnJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034142; c=relaxed/simple;
	bh=Nv1tyXdxUtYtJcdXLQEiG6kmoUSuQqWiLrIF7eSvS3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EJDoe+mEb1LCnWLJmddOkE0GU2GQDYFoL+6++Y0PNuvn847AM4sVT3tsGhQvqiMEubxLMdmqfD8NP5n+C63Qx2s5XpvRtSZD5i89Xhdyogt7yezkZpkOTTgk3TPTTHoc1Qi8imqMVzRVXo/po6M2HMpJIueedYnKkbcbjb/Kyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hDOrUGUu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12509C5996A;
	Wed,  1 Apr 2026 09:02:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B0F3602BF;
	Wed,  1 Apr 2026 09:02:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1207A104502B1;
	Wed,  1 Apr 2026 11:02:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775034127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wYh5/DOXlK3Zu21yc+XZNP6692NE6CVxLYbVNhxF1NU=;
	b=hDOrUGUulrBEOgQGL3u/cF4Li6GmbbcvLmsd73TmBA3GQz4swD+P4B6IZue+v8BDpjeYF/
	YefBd51oKWW+lvzdM+fftMk8fM05xzK7BqvzHqMkmm3eH0UgP9C1oD9i8odO8y4uH33zkA
	48SP9bRmYpn6YRBYjbMt+xVH+PhCEXrhMQ30AlL8rJKeb4XDtZBQyyc66LJoIMdh12WNNX
	z9Jiqss1cxFGmJAxsZUNmCippmFwcq5s+nbmTbbCtZ9t3Zic8U5/6oj17kB59cAXC21BMg
	HPxOIMNIyCNJaVIOtbvZEoyzEegLWwoQ2kp9qbNcN0lrV3SaZQC3kax7cfRGlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Olivia Mackall <olivia@selenic.com>,  Herbert
 Xu <herbert@gondor.apana.org.au>,  Jayesh Choudhary <j-choudhary@ti.com>,
  "David S. Miller" <davem@davemloft.net>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Antoine Tenart <atenart@kernel.org>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,  Herve
 Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 00/16] Add support for Inside-Secure EIP-150 crypto block
In-Reply-To: <CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 30 Mar 2026 15:33:30 +0200")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<CAMuHMdX23LQYFFzs9STykFVECb4uv1u3DmEMCh453GBK=4XbYQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 01 Apr 2026 11:02:01 +0200
Message-ID: <87h5pv6ol2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30678-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 39796377464
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On 30/03/2026 at 15:33:30 +02, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:

> Hi Miquel,
>
> On Fri, 27 Mar 2026 at 21:10, Miquel Raynal (Schneider Electric)
> <miquel.raynal@bootlin.com> wrote:
>> This is a series adding support for the EIP-150, which is a crypto block
>> containing:
>> - a public key accelerator
>> - a random number generator
>> - an interrupt controller
>
> Thanks for your series!
>
>>       irqchip/eip201-aic: Add support for Safexcel EIP-201 AIC
> [...]
>>       crypto: eip28: Add support for SafeXcel EIP-28 Public Key Accelera=
tor
>
> My OCD tells me to ask for using "SafeXcel" consistently,  ;-)

Ah, yeah :) I initially wrote "Safexcel" everywhere, and at some point I
realized the marketing department had put a capital letter in the middle
of the word. My anti kamel-case heart fought back, but not enough, ending
up with a mix of both.

> drivers/crypto/inside-secure/eip28.c: .name =3D "Safexcel EIP28 PKA",
> drivers/irqchip/Kconfig:        tristate "Safexcel EIP201 AIC"
> drivers/irqchip/Kconfig:   inside Safexcel EIP150 IPs, gathering
> Public Key Accelerator

I'll address these.

Thanks,
Miqu=C3=A8l

