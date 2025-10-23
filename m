Return-Path: <linux-renesas-soc+bounces-23521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E95B6C019B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6288F1A66A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D3A31A050;
	Thu, 23 Oct 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j4ynUv4c";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g+S6XF76"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE63164B0;
	Thu, 23 Oct 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228033; cv=none; b=esdAG+bh83Dlpg1er6pMOm1bvjhTiTEtYalBtcp7eB4EXwcEe0JJ/g/NNOC6xUG+ZbfAAX3dtTgIFxLG748D/ZVFxJBjMiFDxVZO8Uhiy8qxU9UkB2g7BqXoaKIe70tWQRhqUX/XpKu9A9OQGmRjMFZqJLvCuV1cfj0Y30jBq9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228033; c=relaxed/simple;
	bh=g0rv/Wl54UIN84iFZird78P17+22MiP7FBTVamkdA6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixdL0ZXdW08n41yLn9pWunUdylD5NyGmyX6bx910jDKjOdtZVrq0w8edxy2yi66mI9nHw5aFPjZgNm/Lub0gdcqg7yrK8JHt1ddFZZN2/uEVLhwywm9pONLFcj5CQkAFObvHMjZumu8aYDncgMhhlN2Vqz5Gl/paiytBzeAVWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j4ynUv4c; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g+S6XF76; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csnjn6y8Lz9sWh;
	Thu, 23 Oct 2025 16:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761228030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+ZZiNFpfo795JzyW1U+Amyk/9XvcQWSem6gcToDr+s=;
	b=j4ynUv4c+hkeEzlSosmR194vZWb0Fdr0vD8ariJEQuViaQ2jbcsfyGrruvx2A9TijA6PYb
	ZHDDAXA/ahvyEMf3UDaaHPQErvSvycVz3OV2oQ6D2TbnR9+7ANj6b1MPDHSBzbs8e4bpTg
	4SYq/NQypjJLK385LZysbRcyTDQ6Uquu9i9c4AJxqrTRK6LF7FruskUxudUq8ZeAfUHGI+
	6CW97s0HexEQMx1dWO4d3Ca2JN5pTh5JMSdmtq6H5/6BScpftK1GNRzPcfklW+8nRRQkHk
	pJviiO9qcGpHxl34oJK5tUK6QI3ln8U/ljegOIv4Ag/w3OsKyTQX/0gX23HMHA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=g+S6XF76;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761228028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+ZZiNFpfo795JzyW1U+Amyk/9XvcQWSem6gcToDr+s=;
	b=g+S6XF76RadfsTIRYoIuugAO45PbkGlYNXpuEd7ASeoTlGOBKBhay0nf37U/4TVEiOa8r+
	rZOoibxEn7k26j2OfE8/3znmepCmeZojymvyyNVEXPrPM/4bHdInrDbY4eaWqUr6I6lKr2
	DcJO1NeZv4qLsvPt4JisM7w+gmacYqySTdcp6vNkKyl2XoLguWTXiN5bHUleRpdmJ/Mlw0
	gDw/V/LvZ3FbLRZ5q3iVpZ3E4L1A2k+CS3E45LTEv+HK6z0PloZoMsaEdqC6a506TfGUBn
	4qnXfHrgCk/5RGoxdacf525cyI3iVFkZH4NeBbqOaeP8Y9ln4xnGrjKfLvPo7g==
Date: Thu, 23 Oct 2025 16:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Cristian Marussi <cristian.marussi@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aPoxfH_TLrsMxMVQ@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jp916jjbwe3rtwcy3pk4agiykqi564ug
X-MBO-RS-ID: eaba31ded376d5d287d
X-Rspamd-Queue-Id: 4csnjn6y8Lz9sWh

On 10/23/25 3:45 PM, Cristian Marussi wrote:

Hello Cristian,

> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
>> Document new property arm,poll-transport, which sets all SCMI operation into
>> poll mode. This is meant to work around uncooperative SCP implementations,
>> which do not generate completion interrupts. This applies primarily on mbox
>> based implementations, but does also cover SMC and VirtIO ones.
> 
> Hi,
> 
> ..indeed I was thinking a while ago about exposing the existing force-polling
> switch but in my case it was purely a testing-scenario configuration, so a
> no-no for the DT, things are different if you have to describe an HW that has
> no completion IRQ also on the a2p channel...

Correct, at least until the SCP on this hardware is updated.

> ...having said that, though, usually polling-mode is reserved to a few
> selected commands in a few chosen scenarios (as you may have seen),
> 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> inefficient and heavy...is it really a viable solution ? or these
> systems use such a low rate of SCMI messages that polling after each and
> every message is negligible ?
> 
> ..just to understand the context...

These systems are early in development and it is likely that the SCP 
will be updated to generate interrupts properly. Currently, this is not 
the case, hence the carpet-polling, until this is resolved.

-- 
Best regards,
Marek Vasut

