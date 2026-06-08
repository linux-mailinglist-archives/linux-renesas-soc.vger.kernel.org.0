Return-Path: <linux-renesas-soc+bounces-33690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDzrLn/rJmqenAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 18:19:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930F6589E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 18:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jPrY9FFQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5775C311FE62
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87963D3D00;
	Mon,  8 Jun 2026 15:38:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92DF3D6470;
	Mon,  8 Jun 2026 15:38:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933081; cv=none; b=WwSzA71lni6SyMFLevHbFOKVOwJFV0nhC1SIfxwmkK8tEVR32fnTZDw/1trg/dGehODXwwkI1+0kQhTK/MN6t7k1kmv9nfE2HKWoaMH36TMPyaoo6rJJRWQ6U1pFCkDJKJGZOOmIMR/BdAXPQ3cwx85k2hsTK6OHLEqLt0wK0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933081; c=relaxed/simple;
	bh=C7SuUEWQaeL4m2xGyeBZXl7e5MDFSYw6ltyy7OwszOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWdTVXktHa4if1l2Q+N/g0fN0JbeaL/J5rHORuFEDtSitPeEmrC5EiC9O+HXDgzUP1QXALT5yir/VP2wWwTAMjjmHpHo+wUbCbqw80fPt5m7Hl7x7Nt9zoDODL8qo7pxUrc0hnuYBLIKorv/RBUtkml7recapnq/+UcIGCuj1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPrY9FFQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9141F00893;
	Mon,  8 Jun 2026 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780933080;
	bh=08S2aTd0jdKvtqZ3MAK8kIbIKA+BvzVtDPiX/U5yXNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPrY9FFQEb39kfIInwYZaseN+PPqYxlyzVIqVpT94IJexyTF82ZbUWx2NxnpZVVxF
	 54niFLRxIvooe1PTCQk+0vleMZzOYkdjVGXYwISq7IaMqEz1NOiZpL0VMYOFCbFP0Z
	 relg5lhreMRkj0EKIZqyG01mSE4Vey7pYcu3NtIh0CSVh9jQzYaIy03EyC+g9ctLjB
	 DDF9nZ7eLNhNWR9f/X4cyH6x2hBccUYt5EqZjqRhMBm9dYe9E4TuWCwR+wLgHly6zj
	 iD/GbkPBV8Yck9m2ggMUZ+5aAA+Wzrm9r/zBmKhLYIldvbEsHcx1xn6YX6pIVt8CDr
	 MLR6owHJQtAAw==
Date: Mon, 8 Jun 2026 17:37:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: chris.brandt@renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: fix refcount leak in riic_i2c_resume_noirq()
Message-ID: <aibhmDQPlT89IdxK@zenone.zhora.eu>
References: <20260608071123.128964-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608071123.128964-1-vulab@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:chris.brandt@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33690-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5930F6589E3

Hi Wentao,

On Mon, Jun 08, 2026 at 07:11:23AM +0000, Wentao Liang wrote:
> When riic_i2c_resume_noirq() is called, it deasserts the reset
> using reset_control_deassert(), which for shared resets increments
> a reference count. If pm_runtime_force_resume() then fails, the
> function returns without calling reset_control_assert() to
> decrement the count. This leaves the reset deasserted and the
> reference count unbalanced, which can prevent other users of the
> shared reset from properly asserting it later.
> 
> Fix the leak by calling reset_control_assert() on the error
> handling path for a failed pm_runtime_force_resume().
> 
> Cc: stable@vger.kernel.org
> Fixes: e383f0961422 ("i2c: riic: Move suspend handling to NOIRQ phase")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

