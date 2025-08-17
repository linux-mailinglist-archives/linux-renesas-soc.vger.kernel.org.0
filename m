Return-Path: <linux-renesas-soc+bounces-20598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1E8B29599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 00:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5A3317E8B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 22:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B19F1CAA79;
	Sun, 17 Aug 2025 22:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gFL58qJF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eEAXlhav"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BFD204F8C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Aug 2025 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755470833; cv=none; b=sOsUuIbNnWP6YaZeFMsoQkTuYC4ksnLTO2AgjxqH3GRBtiu5z+kBbQGnVC5QZLdtk//Ek6L7b/0H5aKJGWDVVFLkeOwHNSLekE0TXKOHRK8HxokK1BoYeAGNmG3OfCv3lyRXmzgkRny65LDPRjFLI+l1aD0jalymSydXdrfskVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755470833; c=relaxed/simple;
	bh=7O6whrewYS/LJrnXauPPmMFPc/ue2i34LBjUGO2PnXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfjTPi7X/ER1m5wwMvmC+gowWvez66HWyVO2yjrlpxRMK3gRjnlsON76wg9EWlL4hhQNI1f9l/tFBQQEI6eVy52d3PGnCCUXx+1FcrJPSv93s5TzzE3eetYIlnKMnaL/OvNVCSpm5obNtycufys8/A5RR3wLLFckxjkplxSQK3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gFL58qJF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eEAXlhav; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c4rZH06LBz9sRx;
	Mon, 18 Aug 2025 00:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755470823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXM3JOBSvMpLWiOb66RuuaMLyQO+nbCnSS42LhiFUvA=;
	b=gFL58qJF6kZ1PUgekqS4R0KrCT/cBjbrvIHb368ps5OEp7IAfVYHe8rfLPnr8BQEoId/bg
	gM+HHF4xziTSrwO//uxzmdZxM9t923PkRUDAx4rIV+nHPU5ucseXWOtW3fGNvuWYBqaOim
	/nUCES1JHRejvEfoSa0x+WsHcbRlH1xHs8pMIynmjd0KTurGxpuvzDEXzDtLhvAJ+o1x9V
	VWj93sXtM04snsLx1qneMNFkSu/Y0qAW/19ATlB+uaOkHcLX1fkJKLGtIaPx/xL91dbBQb
	MmQ8xsXIjG0IZuykueOAEbKr5XTsMnGnVb80ZGM9zvqwLSqFuP2uaeET5eSSYw==
Message-ID: <1b126e79-5f4e-458a-b7a7-633656876dff@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755470820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXM3JOBSvMpLWiOb66RuuaMLyQO+nbCnSS42LhiFUvA=;
	b=eEAXlhavp28/L8XDGhCrAkK100Jovi3xxkqZriB/+Fze2uj/J4yfyULAMBPJu6Mf/3RhST
	HGv7TYAF/wdN3i9QdZmQiv/pt8cx+nbelLrTdLzLfQp1rQPm/1HqnZ0F1v00+HLrRGRQlX
	kw7qPB4XS7fxtR838vIIOSTZXYXoPtwu/5Plp+mVIgD73wzi4Le9NrRLcbVi5nCq4kUDSh
	dDxC9wcHFS05j+yK7YqbFHhpiGxYVlyUPo/yu8/YAZ3Frvx8eJm0H4YMZIkXGFUXSoPXI6
	bBPCmrN83oLA1h0oMHMA+yrgIADJ5qLS0BypUkEp8fI5Dh19mhNa2zx5BtlwoQ==
Date: Mon, 18 Aug 2025 00:46:56 +0200
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
 <1ae735be-3d07-4520-8013-c4b7a1b1c26a@mailbox.org>
 <c83317d5-53f1-440e-b854-c75d283ed746@ideasonboard.com>
 <58109767-145b-414f-a20e-aee651e9e4d5@mailbox.org>
 <7c92c10b-bfe0-4782-9fbf-272c9616f5ca@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7c92c10b-bfe0-4782-9fbf-272c9616f5ca@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: beat51cen8pu8fhe749ahuyrzs7n65rf
X-MBO-RS-ID: 1d95000b4aca0fa1cdf

On 8/14/25 7:39 AM, Tomi Valkeinen wrote:

Hello Tomi,

>> The 1/2/3 lane mode was already implemented in the driver, except it was
>> broken.
> 
> If it never worked, was it broken or not implemented? How much code the
> original driver must have for the feature to have the feature
> "implemented, just broken"?

I believe the code was all there, and the lane count could be 
configured, it simply never worked. That's why I think the lane count 
was implemented, but broken.

> If it reads the num lanes from the DT, and
> allows the driver to probe with 1-4 lanes, is it then "implemented, but
> broken"? Or does the driver have to have a clear intent on having the
> feature (even if it doesn't work) for it to be implemented?

If it was not implemented, then the lane count from DT should have been 
checked and if it was != 4, such configuration should have been rejected.

> I'm not trying to be annoying here, and I'm fine with the new patch you
> sent. I bring this topic up as I just had a similar discussion in a
> thread for another patch series, and the answer is not clear to me.
> 
> stable-kernel-rules.rst doesn't really cover this case, so, afaics,
> someone could argue that this (well, the new one you sent) is not valid
> stable patch: it doesn't fix a crash/hang/etc, it adds support for more
> lane setups.
> 
> In this particular case I'm fine calling this a fix, and backporting to
> stable, as the patch is such a small one and "obviously correct" (as
> stable-kernel-rules.rst says) because with the only working lane setup,
> 4-lanes, we can easily see that the values written to registers are
> identical to default/old values.
> 
> Still, if someone has feedback on how to approach this question, I
> wouldn't mind hearing the thoughts =).

See above why I think this is a fix, maybe it helps.

>>> You say they "fix", but they're not quite fixes either. The
>>> patch 3 could be considered a fix, but at the moment it just writes the
>>> default value to the register, so no point in marking it as a fix to be
>>> backported.
>>
>> 3/4 does write the DSI lane count into TXSETR , not the default value.
> 
> I meant that as only the 4-lane mode works, I must assume all the users
> use 4-lane mode.

Yes, that is currently the case.

> Thus with patch 3, a value identical to the default
> value gets written, as everyone uses 4 lanes. So, if it's backported to
> kernels where everyone uses 4 lanes, it won't change anything.
Correct.

