Return-Path: <linux-renesas-soc+bounces-23074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C896BDF163
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 097AF4EC191
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9528B22DF99;
	Wed, 15 Oct 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gSbTisff";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bkfUdpQb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE63F281370;
	Wed, 15 Oct 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538807; cv=none; b=CTNbTeh6JbU8EvZxKxGmw6u4D6oRX2lgnDk3/M1GViFVGA88HhhCcT4MexyiRQ/bTRobO+5KMO0y/aZQI1XbqcneTYxpzbzLl/AJ148Bpb1EFg+XeUf190zoSmLbyWRbSlVzxxkoyADfutWTQrlxCmtH6BxQF3bffpaVKGUmrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538807; c=relaxed/simple;
	bh=+vp5sri10TGhuj656wA8xcvDQtkuNozRmcv9Xd1WRWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKV2CAvG2fQc9gH1RDFb5Qk8fB3FNwQ9YTbabPLEYzxTvVguUt4XWUwASlRC9IOyzc4Xm5+wElfHQskdUK7luan1s167ooS/L3YihBfjYUOLaZoYesaEXzruPp6ga4xfZbj1OmF7aVt3tW5DXW+fVtH6SfWalSiUCAgRJPPCZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gSbTisff; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bkfUdpQb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmtqR6vYPz9tg2;
	Wed, 15 Oct 2025 16:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqcM2fuSyGmihOUlIvHn6eDwEbaGALrPcHvMpNvePW0=;
	b=gSbTisffBTBodmXUTEpBpnASa2bklfA01Ggp64mx73tdFWIhl+uQYcLo6T1RpZGsti3HlG
	TNEVXZrKCIi6pzPTJixjp6LQn5XsdAUTUCcCTQbgmaNTLxeLc9DJton/QGbb2b4e5fiV/l
	GQi/g930yV77dthWQ/QXJNGmVgzTB0Zw5AJIO1+YLox1g8i4uKCQMQsvMINm5DBx7hW6kU
	3PwB8UP+biv8tIJpBPXO9EuLPpqPNlwBDlbH//R0suc5DLKrjIC31m9/MwYPDRC66qI8Fg
	J4ZcQ9VJXiGKFYcO3I4qmNF/G9Apunuc5awpLFSnpLXc14Y8EbNgGQ2SsZ/2Bg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bkfUdpQb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <466d0863-be4c-4b07-ab25-bc7eae4dfc5d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqcM2fuSyGmihOUlIvHn6eDwEbaGALrPcHvMpNvePW0=;
	b=bkfUdpQb+Q+4rQ/guMgsF8VHhi187cBk+4/9A6hwbjCbhHFVuu9znMR7DM9HJ2+mI7BIX5
	maEueacKc6z4+MK4R3mx6uQOM48VnwWFhDbLr7TZs7XoxVZ0elsiULZu6DrQa1jDdmm0gj
	adMdHiEw8x4M+bPanBQMlKCPtznxWKxXQ/Rfd0GXOFjTwQjEbTqWeqt0Zna043TvswwudS
	8Jwi9nQTlN0Pt+hoTwejgTK1pf8rq+c6vO2fqEjcCtyockUPRmUfNtW0kWXNnbs0rSzB9a
	r9AZjTJrTaqAij/n4ZezO9FOpftp6YEYh8951bI7mHpwGHTWIeUDD8+dVhq8QA==
Date: Wed, 15 Oct 2025 16:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
 <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: bc539553b35cbbb23c8
X-MBO-RS-META: d439tudnh4prct6azxm19y1htthu4j9z
X-Rspamd-Queue-Id: 4cmtqR6vYPz9tg2

On 10/15/25 11:10 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> I can turn the first entry into renesas,r8a7796-gpu to be consistent
>> with the legacy 7796 name for 77960.
>>
>> Geert ?
> 
> Please use "renesas,r8a7796-gpu" for R-Car M3-W, and
> "renesas,r8a77961-gpu" for R-Car M3-W+.

Will do.

[...]

-- 
Best regards,
Marek Vasut

