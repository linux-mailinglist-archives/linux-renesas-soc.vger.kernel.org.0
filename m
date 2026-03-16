Return-Path: <linux-renesas-soc+bounces-29512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJuVOfknuGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:55:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670529CD32
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13CB83004DE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73713B6BE3;
	Mon, 16 Mar 2026 15:55:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0B03AE1A4;
	Mon, 16 Mar 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676535; cv=none; b=AStifAU0MWqb5OvU0uVkAL/ZQN1N/kBECncsybY8xgXg/zIcWv2dN03D8pJtInOf76f5uzGDndxhC+pLAlU6syrIDxxOfJrJX1oQ3qtM07oQZCdMjXvyfR+f1GM9s3Ak/Xxze5r2J9gozD0tnq7AtQbB62FBzpZAZw0DCz7FZQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676535; c=relaxed/simple;
	bh=IKgHntMPZOD67qALA6xcCjRWRPp1ZRXVfx/Qy0ZdoUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrJTKWIwv6zqDNgxKTwwWU+QzeVzfJ3Qg7ymhQXUL65zMf/v9w2UsKMFhNyu5VMgkB0tFj0GJpiPNObXuCIKmO0cm9HMDVGhzhQaZVDVZHB2lFWk14qiz/8IMm6Y0aNSDq1AhAnF0bEC+m7ZiQGsatXwPpPCqQMHbxRTetgvq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AF114BF;
	Mon, 16 Mar 2026 08:55:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65FE23F778;
	Mon, 16 Mar 2026 08:55:30 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:55:27 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code
 snippets
Message-ID: <abgn70W3kYZcZpg_@pluto>
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29512-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.820];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9670529CD32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
> Each SCMI firmware quirk contains a code snippet, which handles the
> quirk, and has full access to the surrounding context.  When this
> context is (part of) a loop body, the code snippet may want to use loop
> control statements like "break" and "continue".  Unfortunately the
> SCMI_QUIRK() macro implementation contains a dummy loop, taking
> precedence over any outer loops.  Hence quirk code cannot use loop
> control statements, but has to resort to polluting the surrounding
> context with a label, and use goto.

Hi Geert,

I was just now writing the quirk for the Renesas issue and realized
this limitation :P

Do you want me to pick this up with the quirk template for Renesas issue
that I am writing and post all in V3, or you have already the quirk too ?

Thanks,
Cristian

