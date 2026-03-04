Return-Path: <linux-renesas-soc+bounces-28764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP4nNxgmqGlhowAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 13:31:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED241FFB5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 13:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E16233013ED0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 12:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FAE1632C8;
	Wed,  4 Mar 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="khbYymk0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47F13D891
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772627477; cv=none; b=hvhn/OEB7ehOvEvicU/OU2GKmvgh7c283bTXZ33nUUFjf5sUvFEL/+7DACNRZvdoR/Vh4/yfNVPGeA+R3p2wPW6Iqk28/pSL6SOl2CYCdm37xc88SyTIU203dLLYH04nIDVC1PQ1TwvFkLIXW0tRFydpxVLY3RZ8GvRuOcc4JOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772627477; c=relaxed/simple;
	bh=2tmX/10/Ya0RSL6g9TTxFd/61Asih9+Ls1Rmbrn+oXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhdn0zbiiyKyffhE++YNeZwN6nIgzgLD4Wd0d/hkjuKZiwwFLnpDHVqAyGPoj57wcKsmV4fcE3Zakz0jlPJngNX2+TRn8d2PwXKjHD97z3ID2zuPvZF1YuZKo+wbKGId6bLd0M1kLksR8920ms2NXwuycdOFdNTnqjWjouK7aKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=khbYymk0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Kt9Y
	4eTW3GNK5rnnv1fLAY69rSQ2cl2KSLwn89f3c7U=; b=khbYymk0rGp9DTpDDXD2
	OC6FzmLvPQWdbaKi4ISIT5WpmS5Ohf+LSeo9fVmLVd+t4BJBv9U3u+rCAmH7Vg1Y
	OJ43WC/VDZw8sCEV+831ozGRGazIeKt4H3jZV6cKf4g1ccQYm2y6EfzavpUStAw9
	JY1x/RM08WHeUmCO5Dwxhg96fFIgSaVuJe+0gwbQZ8JStXlJ5MEWddPuOW/YZgLa
	uc3R+GEoPTFJObXdxdQ15YHfpDv5lLHqRLBlCbC53wTK5lg4CSClT1X12YWzv7Bn
	AyUgY1dzxE2AgzjsTd3OpNPHeaHZoJwnITdYrmRlSJb0XTeNUU2RxgCxy7XrL6ZE
	lw==
Received: (qmail 733935 invoked from network); 4 Mar 2026 13:31:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2026 13:31:10 +0100
X-UD-Smtp-Session: l3s3148p1@EiOv/jFM8m5tKXG7
Date: Wed, 4 Mar 2026 13:31:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Lack of review from Renesas
Message-ID: <aagmDTa3KM3EYx0N@shikoro>
References: <a3f0cb6c-cff7-419f-839b-13bb1ff4960a@kernel.org>
 <aZW0GL8ufBgZlUbU@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZW0GL8ufBgZlUbU@shikoro>
X-Rspamd-Queue-Id: 5ED241FFB5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-28764-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,bp.renesas.com,gmail.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Krzysztof,

> I told you more than once that it is perfectly fine for us if you skip
> reviews until peolpe you trust (e.g. Geert or me) have reviewed them.

Can we agree on this now or do we need further discussion?

Happy hacking,

   Wolfram


