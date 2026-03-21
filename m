Return-Path: <linux-renesas-soc+bounces-30043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ydg5F0UFvmlWFgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 03:41:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D72E2F01
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 03:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96B5C302F433
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 02:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E148629B200;
	Sat, 21 Mar 2026 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qqCq9bGt";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v5bKdqCU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFF40DFAC;
	Sat, 21 Mar 2026 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774060859; cv=none; b=pMBDPh/+8O3RhNvVmig5irOcbcOBbdRg/fqDi1AJ9tSnIbdRe2iA7v4dgapTTj1JE/KrfXP0KwIfeXTq+OPGM7Nz6yeCCVQWe4DJuzjoxyMkXrN2KYy8ut+1GVqnWPRlM0rHqslzQymKxnVXcOGJQYXvEMrpe/OZuGUpP0eBEWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774060859; c=relaxed/simple;
	bh=lCQbNzG2VHRktmTt6VT0DyL3PU8+dP+CoVTHAmze7vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbbw1L4QwkvbHJE0MpS2+W1C8cMbh/MBmV16/yNkABMczK5uiEgNfppyZ+sptNr4pw285qf1gpbBm7Udvvj6cfb7HWdE9FDiFVuxalHU8+UZILseFAuFLe2EQ9h/YhegCCzRVypO+TfXNJflmG9BSMI8pbPVqyoe2CKU6K8AjyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qqCq9bGt; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v5bKdqCU; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fd3Zn5cx2z9tTQ;
	Sat, 21 Mar 2026 03:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774060849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdDMfSVLCo9/lUaNBs87JmokhaKfEhUQFJxxCwYHSgA=;
	b=qqCq9bGtY+jjjqOX9fhPlyVXgM/Nf4bzMFT5DCXZ66EXnfe5B9DuUBW0fvWgzmk/KqGZRR
	7beLE+cuUz8uaj1q8s3O8sNkk8V3dPeYoj6CsNum+y/UnPccJpY3BaFhfeG2DMpfaGDQtJ
	ZXvFE+XilO/E43fQkEYoRozYvjg2oRNyKNlTghd5aG7F3VaeJe5UOPy+Ok1LB/7oXh/k/5
	BPK5lHpZSi/spm4ciXyg/7Zw/bFD/YIB4Hmrv/WKSJZxMQudu7VbOoaTiLFZnC61IDem/t
	XIn9+dtaCi5ok3wcYyollfIl/yWR/V5YycWeUJ0Oq0Uy/SDsFopvx7siXIXQTQ==
Message-ID: <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774060848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdDMfSVLCo9/lUaNBs87JmokhaKfEhUQFJxxCwYHSgA=;
	b=v5bKdqCU7/3pUMtBJqYDKxL+MheAAKV7YRCwXdVzW8lKw4quA0UBpQvIjuJIGYUKGvJ2Gz
	9m1Er2wqt49uT41z4BMvNoOEkbNkNTMzhxnwkdk1Qqvui+MFqWkqZGzXL0EqkJ3GA5OHBY
	xqh0qNfT43pDWF/J1u8L9oLp9bZd8dSMYDWnX5dgW1pkKvxPbRt08exjALgxvfCPxtRFxC
	zrJp8qdonG+/VK51ya0DzOJP02hMiwVWp49O9/E8NmM9D2nBxhu7NXNdDcICuo0ckETbNi
	p2q4MK/o/KLFHfeD6E+QRBvNQ4eYsuC9t9gXyxIS4SkX3yayeQdSkRKDv7bBcg==
Date: Sat, 21 Mar 2026 02:36:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 46d1dfa294102950559
X-MBO-RS-META: mmfk7m44gt9tqixefhmkh5fax4ngkft1
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30043-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D67D72E2F01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:22 AM, Geert Uytterhoeven wrote:
> CC Marek (for Sparrow Hawk)

The upstream supplies to which the USB controller on SH would attach are 
not described in SH DT yet, and they are always on, so I don't think we 
need to describe the controller in SH DT yet, do we ?

> On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>> which connects over PCIe and requires specific power supplies to
>> start up.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

