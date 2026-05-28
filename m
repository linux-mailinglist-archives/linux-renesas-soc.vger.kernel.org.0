Return-Path: <linux-renesas-soc+bounces-33305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEJhDr91GGpSkQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 19:05:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4295F5628
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 19:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59C55313DE35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 16:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED8D3F8890;
	Thu, 28 May 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBWo0zRY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5F3F23C4;
	Thu, 28 May 2026 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987484; cv=none; b=CRLyDFaF9ZWAlIizpQQ1zKiGgRLcS6929RzxESaNFpf/gGk9VrjRqx07zuOLJmpG/VRfQIH7eew6bTEojmLtfKkffXonQ82vRTORo8pTlCyVMIU+FuuycQcXKHipFZoE+Rlb+cX/5ft08LuH0QZ6hdW3D9cM4QKMOWSoIaarLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987484; c=relaxed/simple;
	bh=yWNIU/hhmPn8ZIFrHSRxosfz2L080Hxv40eQznvjKIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uguGbonqHChVhaIqgZa6kLnMoZd2674LGiEkYCcSpxgiELuARAzN8n91tUnf/lCSOI1w5IDj/nuebcNV/vbiPtXav1oWSP4263YgiqjMlaimmqNC2Oao/px48Hjx0m+tZoO4I8OaC/OkJE9lL8kd8ymh/rJpxhNAcTgkCIj3PkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBWo0zRY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10841F000E9;
	Thu, 28 May 2026 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779987483;
	bh=mqHHdoj9vjNwfVpSJsgTn6gGe4QSnDtlofWFNRNEaRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jBWo0zRYKO0YB6u894QKuBbRLksmljcQgFBDIlaAD3l7/gMPP34LHccK796Ne/DED
	 HLgZnJ5LqQvJoKGq1Ccwi/Q+gIgfxSkB9DtP7uY25XOZq5TmuervV9mX6dmtwaUdfd
	 G28Pi6MwjMcb08X5fdmoSY6d0V97wWY8ObMgouVCXXMzrvfZ3H347EugYshvPh76z/
	 C9QH9bKn+5nymLh0OI//KWIEYZ5joTzD7NOZeVI7VDFXiM4b2oEIseWdGeeEqDSFr1
	 9Bi5WNw1mmARY+LNAjXO8klQvlcYnlDProxxI9baYIfHf6rC4+W64r5jRyqUnBBifP
	 4+90wiyfQ3n5Q==
Message-ID: <88d1db83-1127-462f-9b1a-7c18a7087960@kernel.org>
Date: Thu, 28 May 2026 19:57:59 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] i2c: riic: Abort the transfer on completion timeout
To: Wolfram Sang <wsa@sang-engineering.com>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
 claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-2-claudiu.beznea@kernel.org>
 <ahhJtz7QG3IxQA0G@shikoro>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahhJtz7QG3IxQA0G@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33305-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5B4295F5628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Wolfram,

On 5/28/26 16:57, Wolfram Sang wrote:
> On Wed, May 20, 2026 at 04:12:03PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> riic_xfer() configures a transfer and waits for the interrupt handler to
>> signal its completion. If the completion times out, the device may be
>> powered off through runtime PM. However, the transfer interrupt may still
>> fire after the timeout.
>>
>> To avoid cases where riic_xfer() powers off the device (via runtime PM)
>> while the interrupt handler is still running, disable and synchronize the
>> interrupts after the completion times out.
>>
>> Fixes: 310c18a41450 ("i2c: riic: add driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> How did you test this?

I haven't managed to reproduce it on i2c. I reproduced a similar behavior while 
working on renesas-i3c driver and decided to implement this on this i2c driver 
as well.

-- 
Thank you,
Claudiu


