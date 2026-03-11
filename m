Return-Path: <linux-renesas-soc+bounces-29221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGyDKpaKsWnkDAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:30:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9E266915
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B95223105F70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 15:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0DB3E025E;
	Wed, 11 Mar 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BF4Er0Mt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E193DF011
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242613; cv=none; b=ti7nYzYteVZokPoDOuInvnHFc5XOejMswETnUW4mbwkpp0qGdjqisW1kRAkDnYdGLevP3Reyl4KlbnFo6usMTkHyQqHYVhkCEzEpQ7zHb+7pwXksWInw39e2War4OMS0ksICu1ItaMoaNYslnVDOk6kF7yHAueyi9ETC4w06fJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242613; c=relaxed/simple;
	bh=0k/rXyYOtlEMBBzf5uBtjj/zIzjRJkUsoOAFKy6wqYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLY4A2nnX/JJGHTk2BIO7SDKlgoo+8EocFxslyBPJVjnN72ymGTfk5xHHxoFdhTPHi14/45DT4sKTC8pKRFPiOkVL0T5h4bZTwCZHcRIZFUxv4nyLFcbUWXZrYKmzkDmzdyR6tWwjP/viCpTqKI/OY4+rOdLM7Ad1W49k8f+Jaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BF4Er0Mt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2J3Q
	X9QvAn/3GL6JClSvGzAVr7s88UXGSibUv2h/1rk=; b=BF4Er0MtPNlpDXlDqUvR
	r2Q6lUeGfADOzNZc7dQSjG5xH4nj/VIHTpxavmaJDIFTgMPmx260d8uVmuJe0/SO
	zKbRpFd2l6c4oyqXOR9yIpgj12CxZCGK2/ry7BDu25OQxNniVB9Q2tpmWzYwA+1a
	IVv1574J/6n+dgJ6Df3tn8yQFD7hYV+qMeKYXciR4Qomdy0EgFKfSPUkOlH1iSZi
	3REayAg8GjdQyv6pCQMmhwJQGzSpvjJ4hinoucx7R0DduAfwAwdCpmGI+87qjS1V
	Mdk/UBj8cYyVp5CgLEwZuRKxawDDUIlV3n+iDwBNC+VR/JdJ7TAbnm/ZDKcSDdYp
	vg==
Received: (qmail 3705871 invoked from network); 11 Mar 2026 16:23:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 16:23:27 +0100
X-UD-Smtp-Session: l3s3148p1@GqqtN8FMbfpUvUmE
Date: Wed, 11 Mar 2026 16:23:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
Message-ID: <abGI7kp9ugtFSDbG@shikoro>
References: <20260305221939.32643-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVFsxsJW46Xb6BSXztAAvXqBgbD6N7A7jL_Xc-FEBCnVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVFsxsJW46Xb6BSXztAAvXqBgbD6N7A7jL_Xc-FEBCnVQ@mail.gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29221-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,glider.be,gmail.com,kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 45A9E266915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

> > +       pins_gpio2: pins-gpio2 {
> 
> Please move this below, to preserve sort order (alphabetical,
> and ignoring underscores that will be removed soon).

Will do.

> 
> > +               pinmux = <RZN1_PINMUX(147, RZN1_FUNC_GPIO)>,
> > +                        <RZN1_PINMUX(149, RZN1_FUNC_GPIO)>;
> > +               drive-strength = <6>;
> > +               bias-disable;
> 
> Shouldn't this be bias-pull-up, given the pull-up resistors R20 and
> R78 on the interrupt lines are marked "not assembled" in the schematics?

Ups, yes, "not assembled". Will update and test on HW tomorrow.

> The rest LGTM, so with the above clarified:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

   Wolfram


