Return-Path: <linux-renesas-soc+bounces-33306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMIgL052GGo8kQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 19:07:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145B5F5678
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 19:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A60F3192BAD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 17:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6973F99ED;
	Thu, 28 May 2026 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfzZkMaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36813F8ED8;
	Thu, 28 May 2026 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987604; cv=none; b=DuiBfMSk2tMlzYEc4calfcnHho6nrOePs3Zs0U9ya7lLIaKGFNCjdhDV5iDuI2ljuHLByFEQHqVH9qG+moGbeJQM57z7CJneCQCvRsZmjRGVmTIrgy6L5k3YWI293RIQzw/EbJZU6cwoPK4BYcK9OkEyMbpE+wOkFMp3alHeiVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987604; c=relaxed/simple;
	bh=c0j6BKXmo8TidFtpaFIR/Q/SbV/r1l/J8fhHmvMq0Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQWfxaGdOY3qbwpVmCHEM8pGmSsZwml4HizrE6NsKsea9hnnPAISpfvVqjPj/thk9OmRZziLn68dIYFFx1b6msj5TbCfPBOayrudbrKiObGodOo3CvWfgtDvEPR3gZbZtHcEuOJ6TucG0T0YuMPX96ZNL2FU5JO5XOBh2ximAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfzZkMaW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57EA1F000E9;
	Thu, 28 May 2026 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779987603;
	bh=f6mPVRRqxQKhd1skZQP3XxgkaOHlgDfBB9jknp+5Vv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lfzZkMaWbYyl6bL9AEcOLjL5GxcKGRbTNqdcz+VYXH51cEOX1PUygdUyibGBvC1Ft
	 44NVDyCdtypFaj7T12UIky0qPt6Wehl3vDnsZ8P2g95CbL05daYY4gY2edxewgWZdc
	 MNrGOzXrs4R8aJNfFvlF8TAjfe/MwuOJxh+wobD/hH8IUqZX8JGzvmmogyToV36MsV
	 C+XTDPZcK7gOpzLYz21nIwBxVfcPB4Kcy/rOaOs+W/m3NLq7xrP1lyQbGLVCoYXVOU
	 2NWcWXK92GCI7FNv1O28QUhbujhhSmstBpQn9cTReVrN/yfM9zhJ3Z6MLPIowIEBXj
	 FumPR0Vi/3viA==
Message-ID: <5d322a10-12ee-4157-872f-c549762b0f7d@kernel.org>
Date: Thu, 28 May 2026 20:00:00 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] i2c: riic: Drop the space in front of the "out" goto
 label
To: Wolfram Sang <wsa@sang-engineering.com>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org,
 claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-4-claudiu.beznea@kernel.org>
 <ahhMX0hdr43K9eLa@shikoro>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahhMX0hdr43K9eLa@shikoro>
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
	TAGGED_FROM(0.00)[bounces-33306-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 4145B5F5678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/28/26 17:08, Wolfram Sang wrote:
> On Wed, May 20, 2026 at 04:12:05PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Drop the space in front of the "out" goto label from riic_xfer() to follow
>> the pattern used in tree.
> 
> Time for this quote again :)
> 
>>> "> It is generally accepted to indent labels with a single space. This
>>>   > avoids breaking the -p option of diff."

OK, I wasn't aware of this. Should we align the other goto label to this, for 
consistency?

> 
> And yeah, I have been bitten by that.
> 

-- 
Thank you,
Claudiu


