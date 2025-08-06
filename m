Return-Path: <linux-renesas-soc+bounces-20051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74CB1C859
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F4D7B2A03
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBE529AAF7;
	Wed,  6 Aug 2025 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aCcgdxbc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF428F926;
	Wed,  6 Aug 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492766; cv=none; b=mvJUPo76v/9dM052Wn0LwZ9vULBEV6QSW1Dh1dMCQeq+Irz+vN3+TkN96Qf7zv9woaiyM/fMLhLyGhhe5IyEuAOBK9Nu2eFM3Mr540UUW1lLTo+MwtcjVK69y7PUWc0fWCgdTIlzrXttIneEHEryZJR/Z88vxztA7oTahqP340g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492766; c=relaxed/simple;
	bh=e9RmKI6pCuKSBYt6jP/wtPgiUQ92cK3/QNbBr6egQ0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drLQxLxryp5Sw8q4nvoLgmUBFZwwZ9MthPJ2P/4VCwB+zGCVVuejv57DO03iBSGxN4BJlq1VSdT2Eu9YAyiqMPKgvsQJoGVy1nC1OXt0k6IogWcaaXFNY65tYA4iqiKCirBuUp44mpFWk3B6d3SzTmgs/nLDFTAPQqkT4BS0/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aCcgdxbc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxtsN6dXtz9tHh;
	Wed,  6 Aug 2025 17:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQO6ySpnmliEHDNrL7orpCcA+2eSbb2tYIf1yBgwkbs=;
	b=aCcgdxbcq4FXFPqjUr2V78k98ujSvMq9KFrv8E854HxYoiGBQslUtmf0h36Sa957UhWP5Z
	6Kl7f5E7Pt81GS4nUyrbcVQbBTC0k9x4lM0wm4tob6AlnMsGKQt6P3MEZAipk5hKzmh7eM
	hLvZZYff3i5yJyBXa5gYQWpTv2GuUFWFIElnClzXPcOLO6wIvjPVjnVTdSERQgPBkpM5Dt
	np3aD8ONW6gGPn5M+UrSxMG2ZLhXzx6M0hl4Fo8kVd9ff/tTDPYkq/487I5cZ3ACIIFeYD
	ZV+v71pgLgl4i+hcKqVHJhfSSnd1HsaIdQqF4+5CWx/IBqLFGocddMBjOesowg==
Message-ID: <99ffa8fd-d2b5-402f-8a59-59d60ab49afd@mailbox.org>
Date: Wed, 6 Aug 2025 17:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: renesas: Add boot phase tags marking to Renesas
 RZ/A1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250629220502.935717-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVUscsQEOiVUdwszM8LsiSx4FScHC+MY8hH7B_xtQHcUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: aa2979c094764a98d83
X-MBO-RS-META: me3a4r7yx991w8qs44b7t17kbe3z99yx

On 8/6/25 11:11 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

>> @@ -639,6 +643,7 @@ ostm0: timer@fcfec000 {
>>                          interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>>                          clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
>>                          power-domains = <&cpg_clocks>;
>> +                       bootph-all;
> 
> Please move this to the board-specific .dts files, where this node
> is enabled.
Shouldn't we rather enable OSTM0 by default , it is enabled in all RZA1 
upstream board DTs it seems.

