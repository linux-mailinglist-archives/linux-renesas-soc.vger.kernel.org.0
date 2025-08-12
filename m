Return-Path: <linux-renesas-soc+bounces-20417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C741B2390F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 21:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DFA9587A0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 19:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5BB27D780;
	Tue, 12 Aug 2025 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rtBraLiU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HoQrJVxX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71E2D0C86
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Aug 2025 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755027351; cv=none; b=Y+wHtboUEtEJGkLw9R4/XwMVE11IPbsR36ak6A1NoMGjXL0sBabFHjtzmJbSleH3tEOSMpT1zk6NUdIkiY5+ECETrWrHl50nHrNOhsGjvMiCAbHBWOOgtHS9B4J1e4s8HuTIkepbhBFYaWH3ya8qhv0ZdMMdT/Mw6ucjnuoRWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755027351; c=relaxed/simple;
	bh=SPKRlv5pYgwDk1dd0gKMMyijxYzSz3vlyKpDLfBRSnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvHFQz3vy+H96mf3nmNvdevrwlab8qkT0gwhHL7Ny/FrejrEyjsgXJt7oY6wRT2fwvZtyGIdXa8rTqmT7K2Fhz4v3eXemWJj9IE6XBSXemad7V/uqXaiP+equQIb1GCii/XfMMDfFgP0krnIdthqkAayESwvMFtATcdxGHXoEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rtBraLiU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HoQrJVxX; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c1hYn40dRz9sZK;
	Tue, 12 Aug 2025 21:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755027341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEO4of1tDk5pyESbxLhghGpcN4wW9jV8MI6Qe8anx2U=;
	b=rtBraLiU9UPcJGAMfKhpOoEGj9XTsjTJtB2nrxANJJaaTOCDnGafJqPDaOMAP4G7LUcGxg
	jz689Uj3Ahh66s3DXwfmc5H6aYGUMHr+cP+1oo7ZWnHlyHtLEQZgJdHj2Oec1I1pLtHr8x
	xtttfmds1uE+3+CzU/uyNSNlUB4HeGZR67iCxyo+Ncov0QMDz3y6zAhY67IZQ25loXE7Zm
	1kYYt2R2Sj0+FXnhYW7psvi1XVpkdtInlxt/vaVYH1sH9zQfy4PgKWfrOHTXzRRaAszY2j
	NfxihXqezR+Z8fzFGSXYODLKYq09y8Y7KhAFXmJugcUMG51/VM4O+Hu1IohFkQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HoQrJVxX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <1ae735be-3d07-4520-8013-c4b7a1b1c26a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755027339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEO4of1tDk5pyESbxLhghGpcN4wW9jV8MI6Qe8anx2U=;
	b=HoQrJVxXU0kGqI2fNtwdWcE3VHts9InPlYRCZxZJ/Ly5JhQ2NxGI1AlQROzCDDcPX8fdzk
	0vHME8Ati2+F082o74xx2cEqHKG75FR8EcICBY5odnd5Lm0RS/B7Ptz5xj0QGY5hoErV15
	PyI6A49Eb+GFx94Rzf3md0EElKgOjMD9za9kxm0s7QNziyIwegzvNmVt2SKOQUqEDnmcoU
	o6j/5rNhW9ErE3AoljkRGsLZmkaG/kA7s9OFzIVSmypfEdhHc3hmvlAf4V5yKNyyPsn4TN
	qKu9IjIM5E3aAkiMEb4m/Uf+U00RtGwXyPPvGBw2k5xK5W6/uOQ1pllkNLe+sA==
Date: Tue, 12 Aug 2025 21:35:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
 <64b49da6-15ae-45e1-a4af-c1f08f80cf3a@ideasonboard.com>
 <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87cc32a7-fe1d-4d8d-b793-e3bb7e12fb7d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7daa446b7a83f7697af
X-MBO-RS-META: wudcw1kwc87tbfy16g5yq7id47pfsahx
X-Rspamd-Queue-Id: 4c1hYn40dRz9sZK

On 8/12/25 3:30 PM, Tomi Valkeinen wrote:

Hi,

>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> index b3e57217ae63..cefa7e92b5b8 100644
>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
>>> @@ -80,10 +80,7 @@
>>>    * PHY-Protocol Interface (PPI) Registers
>>>    */
>>>   #define PPISETR				0x700
>>> -#define PPISETR_DLEN_0			(0x1 << 0)
>>> -#define PPISETR_DLEN_1			(0x3 << 0)
>>> -#define PPISETR_DLEN_2			(0x7 << 0)
>>> -#define PPISETR_DLEN_3			(0xf << 0)
>>> +#define PPISETR_DLEN_MASK		(0xf << 0)
>>>   #define PPISETR_CLEN			BIT(8)
>>
>> Looks fine, but do you know what the TXSETR register does? It also has
>> LANECNT, but I don't see the driver touching that register at all.
>> TXSETR:LANECNT default value is 3 (4 lanes), which matches with the old
>> hardcoded behavior for PPISETR... So I wonder if that register should
>> also be set?
> 
> Ah, never mind, I now saw the patch 3 =). But should it be before patch
> 2? Hmm, I guess that ordering is no better. Should they be combined into
> "support 1,2,3 datalanes" patch?
I think each patch fixes slighly different issue, even if the issues are 
related. I tried to keep the issue description in each patch commit 
message for posterity. I can squash them if you think that's better, I 
don't mind either way.

