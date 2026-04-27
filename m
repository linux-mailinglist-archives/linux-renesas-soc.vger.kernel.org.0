Return-Path: <linux-renesas-soc+bounces-31663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJiqBBu47mmMxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 03:12:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11646BD63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 03:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0F48300145C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7479923C8A0;
	Mon, 27 Apr 2026 01:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rJqb2EOV";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eqb8BHgg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927851917F0;
	Mon, 27 Apr 2026 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252375; cv=none; b=Svd4U4QK/Nz3kcXPY5YB4c5Dmr+mB/TfLaamMMG0m411I5b4mvPzdPIXbqLVGkm0x/hYbd3NwtnaGc+WxhJWWlWDe8Jwz0Viad8J900O1NCqTQby5FBJxQCpuBiF7e7VEzttDccGK8eunUUQfioQKx0eavU+RtkWewZPojx/tIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252375; c=relaxed/simple;
	bh=voPRn9jezyFPizf/WKNRYjidyxo5ge6q1b7zHR9UuzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VD93k3aPIB1ZvSySgqYAq/42lx+m7W/4FCsp5SM5j49n+Qnh7ZQcfGf9I0y5fWpj4f3qjmlmdAupNfbP53GJ+0ULsVT5KptX2vHl55c2nJhMqvhkY9gK1QCUhB1ffze+58G0iJhcBGSffYtbaNaFDaS/lMWr7ndkWcnhbr1AkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rJqb2EOV; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eqb8BHgg; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g3lt53xPVz9tHp;
	Mon, 27 Apr 2026 03:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777252365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/vau+b8Z6KXPKxb16NGp/J2UsKe/YefmAdKbBEzfzI=;
	b=rJqb2EOVxm7zLUY4fPO9GnFcM3dw6TF/pgQAlMOJhi2HY+fHRGEb1V48IERordu2LOJ5lq
	Jxb4ogzTB0a0eUvKtKYsqBZcGMRiJ61MESefVbChA7FQz7NRRDVaiyAsVw+fL6tHcfclG0
	AbrMRWgE3PSbC5KNJtOpK/8iRbf+YAxV1lcAsi5yI9KUrR5+4yJMa+eJEdUf+/lDm9JL7D
	xM+FJUCRkcMf2Un0PrOdIxl9sc1QrniOuN+o8wIMU4IzgY4dK4jP09vcKdQteIgE/HHN+G
	1iLcLVjb4NZprCXHP/sYLBl0LFyqZVJKStAD7l1TQbH1QQJL+9IXLlnK7eigtg==
Message-ID: <b3a8bf69-bdd2-4122-93c4-4c4d94240da4@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777252363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/vau+b8Z6KXPKxb16NGp/J2UsKe/YefmAdKbBEzfzI=;
	b=eqb8BHggIKW7Id+ffGHthTGnuw06a9FekWbi8S/mMrzYYyEQ4HfPpWFfsMsnX78BOi5Wqv
	vE5G8hpZEJxNQU5Xbm6EuVsyOn9ydMp3Hi6qpPsuGo18Rv3RCQNJp4HBXCW9JCu4SKTgGe
	nFS+Sx6/hsowqquk/9Jpx2gm79TwA3PB3uTh+6LdN2uTVhtuRUco5YEiU27TsQ40hxYIdP
	HABJEi2s0HaC9Fw9eiq1erxE2rwIqtfN1ERyhe69VNXsj1miaTqZ2jZllZ/g+/W03v9ZLd
	tfRXGTn6z+58/prjLiT3VgG+tN21g3LZH6Tbjbsxdfpi6GMgDz/QKr6JP8Xaew==
Date: Mon, 27 Apr 2026 02:32:16 +0200
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
 <0f933506-c196-4503-844f-2a375e2cf690@mailbox.org>
 <161eb29f-2d07-455a-bd74-4f22061b5dfb@kernel.org>
 <c9ef9d73-6f1b-42ea-b5f0-09fcf904c78e@mailbox.org>
 <d246edd2-5f9d-4e95-850d-abff175088a6@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d246edd2-5f9d-4e95-850d-abff175088a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jxpzoosb6bbjrefbcyhnhqa7tzzogyhw
X-MBO-RS-ID: e708615267761e85859
X-Rspamd-Queue-Id: 9A11646BD63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31663-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:mid]

On 4/23/26 4:00 PM, Krzysztof Kozlowski wrote:

Hello Krzysztof,

>>>> "
>>>> WARNING: DT binding docs and includes should be a separate patch. See:
>>>> Documentation/devicetree/bindings/submitting-patches.rst
>>>
>>> So you did not implement it... Include goes with the binding. Always.
>>> Look at other commits.
>> The warning says the exact opposite thing , does it not ?
>>
>> Maybe the warning text needs to be updated ?
> 
> The warning is shown for patches mixing stuff, like DTSI+header, so for
> this context the AND means binding doc plus header are separate FROM
> this patch. Not separate from each other.

Oh, thank you for the clarification.

> To me it is clear, so I don't feel like finding different text. If you
> find it unclear or confusing, you should propose something better.

How about this:

"
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0d18771f1b013..715a98ccc69f7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2957,7 +2957,7 @@ sub process {
                                 if (($last_binding_patch != -1) &&
                                     ($last_binding_patch ^ 
$is_binding_patch)) {
                                         WARN("DT_SPLIT_BINDING_PATCH",
-                                            "DT binding docs and 
includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst\n");
+                                            "DT binding docs and 
includes should be a single patch, but separate from this patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst\n");
                                 }
                         }
"

