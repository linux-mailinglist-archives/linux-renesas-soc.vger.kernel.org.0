Return-Path: <linux-renesas-soc+bounces-31884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNwqM/Fp9mlPUwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 23:17:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E04B37C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 23:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 699B23007CA4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 21:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12BF306D3F;
	Sat,  2 May 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LCK7vt8y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A61D7E41;
	Sat,  2 May 2026 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777756653; cv=none; b=qihOHtgjnEbUwehIu2W1WK12fD/96tEsvJfARk8Ss7O4rW8X3OWyfBAcrEJgJW1ArXvGVoN3OmPxeG8alh0NM/gwvC1UPIB2rQm5gvaukH4u2kiLIMP5nHrElcCNDHdo2R3ZXcg9NSGi+fvRNdf4EOouytRd/R7Izm5z2l2gE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777756653; c=relaxed/simple;
	bh=B8fqhJVPuKUMZq7ZfEIZ4M5o0DHOK9ZiM9hwPUsNW+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e01Kr9ipjiW6GVIUBJvWL89TQI/g6AvdHpY/l2sBNkedkc1yw1L4vGPsra27+HbVlp/UBJvdlVmI3VBfA4jzAJkMqJflSShgyGwYM/goofF/8LBjn9iA5W0P+PuPWpzUfq3FA/LjvVlqCjlY/UCLZyfT8ctVL0Mag1uOJa5TFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LCK7vt8y; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7LMr6WTvz9tFH;
	Sat,  2 May 2026 23:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777756648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7RqPKh7sZHF+28JeEz6CG7pr0J0NFZKqUhuzHW8CkS4=;
	b=LCK7vt8ywGFsDdethYein7AVOvM26O4jQ9Sj3DG5Xxm30lSzd6GGRhCm4zndiMUjtJzpgG
	TW2jcM9fV0MxczPq4R400BQkm7zzIZharv3QvcfJrQ9R9qR70pymuDUGFVDGo2W7aF6BSe
	jgQNpRpZOJPyzmtfJqdK2rEfFnA1BC8iXcy5vv6uYNYoCW3k7snTwkShxwZux5gEVd6ArP
	BBVMt09eySjv4oNKWeX9E+3sUhNHhpnzxlZLDAyCI8W7Pk5k5AN/v0qMi+bML9iObdk6+B
	K1ObvvGcSLG+5SIFWwGg+Y3kfTGvTSUQ08eypdez+00C56a6acb39N1HDNnueg==
Message-ID: <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
Date: Sat, 2 May 2026 23:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 39hpsyab6hn1upgtg1dgny8ski4mntmu
X-MBO-RS-ID: 22ba611169e36e18812
X-Rspamd-Queue-Id: 257E04B37C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31884-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/29/26 11:57 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 19 Apr 2026 at 21:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Extend the Renesas DU display bindings to support the Renesas R-Car
>> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
>> except the HDMI port@1 is not present.
> 
> "and DU1 is unused." (whatever that may mean...)

Fixed in V2.

>> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
>> @@ -42,6 +42,7 @@ properties:
>>         - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>>         - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>>         - renesas,du-r8a779h0 # for R-Car V4M compatible DU
>> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU
> 
> I am not sure you need a new compatible value: is the DU really
> different than on R-Car M3-N, or does it just lack some wiring? ...
It seems the DU is identical to the M3N one, so I will add another entry 
to R8A77965 DU to handle the M3Le one, just like R8A774B1 and R8A774E1 
DUs . I hope that is acceptable, and also addresses the feedback on this 
patch ?

I dumped the VSP and FCP versions on M3N and M3Le and compared them, and 
I also wrote and read-back the CMM registers to confirm CMM IPs are all 
present on both M3N and M3Le:

FCP is identical on M3N and M3Le:
fe950000.fcp FCP_VCR=0x106
fe96f000.fcp FCP_VCR=0x106
fe9af000.fcp FCP_VCR=0x106
fea27000.fcp FCP_VCR=0x106
fea2f000.fcp FCP_VCR=0x106

VSP is identical on M3N and M3Le:
fe960000.vsp IP_VERSION=0x01011504
fe9a0000.vsp IP_VERSION=0x01011404
fea20000.vsp IP_VERSION=0x01011904
fea28000.vsp IP_VERSION=0x01011704

CMMs are present on M3N and M3Le, tested with write of bits 28 and 24 
into CM2_CLU_CTRL and then readback:
fea40000.cmm CM2_CLU_CTRL readback 0x11000000
fea50000.cmm CM2_CLU_CTRL readback 0x11000000
fea70000.cmm CM2_CLU_CTRL readback 0x11000000

And it does indeed look like we do have DOTCLKIN1 .

