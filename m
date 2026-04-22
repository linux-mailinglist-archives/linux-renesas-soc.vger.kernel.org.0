Return-Path: <linux-renesas-soc+bounces-31520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOQiOdqL6WkecwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 05:02:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 956FE44C6D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 05:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BB0B300D4F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 03:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5E13C7E18;
	Thu, 23 Apr 2026 03:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DPutjH9M";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FUIbgGXM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020E31F9AB;
	Thu, 23 Apr 2026 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913352; cv=none; b=aQAFFnrg7U7zbS6boLvT+4ecHDED2GcIO75gSOOR+XlJHONs6oTMyeFVolL4eos9F3h1s8Pyl8zLzEGIGOUCND+YbWSk6yD4ZWusdpRnjubX9U9CEDuKXI6z53vD7HxgbjloJ6EBCIhKKpUk1HFIvfPPkwj4o9PCVpVmdal9wWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913352; c=relaxed/simple;
	bh=FM9dP01dJCtr51VHVWMIkMtHea+N86+1H9ig79I7IJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieEu6SBzlpWJJxFmnleWwujRdooIeuSkMi0VmkruxaB8wX18wgfi1m3mOgL5TNMM2XD2a5+PPwBE/Emn+dy4NB0nZxJ+urf2iaeaelDckWII8Lk0TXtJd7wbOa5+eWipZimhp9EKKTlormbkmH6TM4e7FmM90xbpktRWtNncibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DPutjH9M; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FUIbgGXM; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1LVW4745z9tkP;
	Thu, 23 Apr 2026 05:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5nrVUEisrdFvdhbKV6CkO0NTyBn09hOKHVIHlVzjGE=;
	b=DPutjH9MQYYO5ATse/UEF28ucYfgakB2kWu4c9xRmx35gIPQnQLsJeZt/Cwky43mPUl5ve
	0y4dhQRLuvY0D4BcBFQbOuRbTyZv5oQnqkRzTKZxnDxXPPzLUA3bECh8qHQTLkO+72eZqF
	bkC2rlH/vYiDCiZfNXyE/cYB1X/FKiMF47BpkXss0v66JVIpX5fMU2ToX7dTpBhhiEfEML
	lshXWUGBLNGrJe9g4ULXtMK/YMCl8gQzX+rNLxvhKdJBd3bhzEW6Yrt3cQNYoIX9w2ybTh
	/virglpGrKZO56UmDZAgafy0M77NxAqMuuEGlxcvOGjKaBr34RTUygt4hcSDAw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FUIbgGXM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0f933506-c196-4503-844f-2a375e2cf690@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5nrVUEisrdFvdhbKV6CkO0NTyBn09hOKHVIHlVzjGE=;
	b=FUIbgGXMsv1sill9OPNXBYLB4NOUVzzMVBDSstCCOyKvP2wG7IxvSD/tIH1PcFfOiWMgO1
	pFXITu8yWV5lsIYqOuHAm7zVw8ZG55s1E0sqja+Hjdo4wYthVPQgKb2gk7mo78x9xo77z6
	11N0GZKAaQmHjjjKmKTy/pPw9R5v05XU0OpQfmD7sh+JxeWnvaAtAyMNzUsP70qa/+GD+l
	2QS4SO8nlvM+f7J0MDUr+IPPWPbzMgWTmqmAcWTCS5s9MfgRmZsH/zQrn7itA7jot11Nwi
	aXQcQJfcpvZvdCdEdGIMgIwLlK/yTgXIEliOEvUM+BUAV3g57WV5AHNiDj5YEw==
Date: Thu, 23 Apr 2026 01:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
 <20260421-cherubic-urban-beluga-49ee00@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260421-cherubic-urban-beluga-49ee00@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 54kwxq1tnha1mex66tf4qrwip4irbwrn
X-MBO-RS-ID: e40272b9ab78651b54b
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31520-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,baylibre.com:email,glider.be:email]
X-Rspamd-Queue-Id: 956FE44C6D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 10:02 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
>> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Add ztr/zt clock at the end of the list to match bindings
>> ---
>>   arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
> 
>>   include/dt-bindings/clock/r8a7740-clock.h | 2 ++
> 
> This goes to the binding patch.
> 
> Didn't you have also a checkpatch warning?
I only got this warning, but the docs 1/4 and includes 3/4 are a 
separate patch in this series:

"
WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst
"

