Return-Path: <linux-renesas-soc+bounces-31881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKOUEr9Y9mn2UAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 22:04:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC44B3590
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 22:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6B77300CBF1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 20:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDB22F28FF;
	Sat,  2 May 2026 20:04:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5C1B86C7;
	Sat,  2 May 2026 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777752252; cv=none; b=Ms97QnThs8Xv/w+SlUaz2TgcauT3bL9JhXKXFV11DirXzW3pNqNcc7S3FSUdLZeiW40CPUb6pKA2iia82ZeJsLAjOOKfuirW0CotVbxFZ9MCXvrmS9MGN8ixAttI1D58lZu2uohRR6++xvuVFhc0Yp5tddvefarTELXiP2Sq28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777752252; c=relaxed/simple;
	bh=njiTbaYBJWD4TScC5VxuJpCX5iQXZO+WyPz1hKjg0do=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dx39rZA2sPXULo4eqFcputT33hTu0xpwk2VD6O0KCylhjtGfpSC1Kk+fv/46QHhOftMI0VKb9IS9xquYiH+++XpCmFKmWXIj1eXBQbLhqWbPQdLrCqs8vybwPOQ4EN59c0I0Bbgq3uEg19DexfBUGgHJI4NT/9jp4gw3GxCrQpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 8893412067E;
	Sat,  2 May 2026 20:04:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 98BD76000C;
	Sat,  2 May 2026 20:04:00 +0000 (UTC)
Message-ID: <bb99f0086fc62bc09af132a41fdc8e874ed05a14.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Update DT bindings should be a separate
 patch text
From: Joe Perches <joe@perches.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>,  Lukas Bulwahn <lukas.bulwahn@gmail.com>, Rob
 Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
Date: Sat, 02 May 2026 13:03:59 -0700
In-Reply-To: <20260502191052.94729-1-marek.vasut+renesas@mailbox.org>
References: <20260502191052.94729-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: bqxisyd3wtodaah3ei8zhcyq4wbbcmfw
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+NDFVyfY93kZALWt58SgUxZGM2LP9b2qM=
X-HE-Tag: 1777752240-81456
X-HE-Meta: U2FsdGVkX1+ql/My6nSfKJG5/7sfOoZtLW/eqyiMSQf1cNt+SFfPQMA+wjERmJPGPr5fTOcCW7poMuWjG7s10b9oJwHd4ITkkfyS0wdTO8Y+9V77wxcoOKBee75/dQjc7mcSSJoM+8cQrMmu0cQC17qzpOOC78G+QYqGeyF/dWicLsnTgRzcO3QOMshmMtzLNPS7TpkFLHeAT/IgQc6VX2o4Q1ZlvF+NdkzdenvERmhLXnz1Uo5V95v4fvoP3K969wLZf8OlFzPVMF3GfiMNfteXVmy+QWeD6NaGBCRkMfGZ1b5OPbgmDChnr05e15Lc
X-Rspamd-Queue-Id: A2CC44B3590
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31881-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_NA(0.00)[perches.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.921];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, 2026-05-02 at 21:10 +0200, Marek Vasut wrote:
> The current message can be slightly misleading, because it triggers
> on a patchset which contains the following sequence of patches, even
> if the bindings and headers are clearly a separate patch:

I agree with Krzysztof, I don't find the existing text unclear.

If you really think something needs to be more verbose, add --verbose
to the checkpatch command line and update the documentation file

Documentation/dev-tools/checkpatch.rst

