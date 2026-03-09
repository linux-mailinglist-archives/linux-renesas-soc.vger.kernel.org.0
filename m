Return-Path: <linux-renesas-soc+bounces-29048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNhsJBKArmlfFQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 09:08:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 282672354F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 09:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F6DF30634DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 08:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D12D36B066;
	Mon,  9 Mar 2026 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUPzHRxq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497FB36212B;
	Mon,  9 Mar 2026 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043435; cv=none; b=msGQVCdLjzB1axdy6g+XNa3QJ+ZGQgUURl/uOCdXqTFm+K0hXc/RtUusStSQNm2BBG3SwvXJE+3suvNVRZ77UL7XR0wPh5wxhF1ggnx10RZ5mDjYgRWRc5oSH1vjplABrBEVjAvCg/lPkTUVPmgPaqMSmbQXkUG1fabtp41lT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043435; c=relaxed/simple;
	bh=HdTeyECHTLJwsjf0F/ekdzRRdPdXu42X8eRpOnWO+gQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=r7Emwoz2i9OIbJ521w1lI9b+iZxWGFp0I3Lj0beBj1K+/qK7f/wK7dvQWtPmSfK3Z65yv7hsnIOpqtFRp7JRbfZ9Zsg4G2U/KNRKcgpjMoyUiYV+6zeD2ipZ9k2V0aaUXBWKbtDt2M/Go88/x1tOqI0w7u4O7lvJiuYfZzvVGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUPzHRxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E1FC4CEF7;
	Mon,  9 Mar 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773043434;
	bh=HdTeyECHTLJwsjf0F/ekdzRRdPdXu42X8eRpOnWO+gQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=UUPzHRxqwj7s0/hEoVtu8yTq9P1gqWAahF3V1tIvKc7hfQfGemuAeNd6H50hfZRFO
	 Ta/Fpnd9r86MOUiUFgh42kxpqfNwt38OsIOPZ0jTjXws89ineCTOsa0lJZXo8uUNv9
	 PsmRydGnOuCLFouiVmPM3Cl42wmLN0p6CYPdIi1QTND9EmBJrNVhQ93TfbW6jN0Sy6
	 lfGX5xSsANyvLZu1DvlgzNyXIHAWaS8HNJ63gqFcJjy0wZD+IUQPAB1hVG0MBsTbMM
	 zxrh7BJ/FWcevaMO0xTD3l1iGlNCEOZny/+//6GsSO8bphcTEU0rQBa2C52MACaR5N
	 VXOC7X7zZ+UQw==
Message-ID: <909f1667aedfecedb6da752a57043e57@kernel.org>
Date: Mon, 09 Mar 2026 08:03:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
In-Reply-To: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
References: <20260305205840.95978-1-marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 282672354F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,glider.be,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	TAGGED_FROM(0.00)[bounces-29048-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 21:58:15 +0100, Marek Vasut wrote:
> Update drm_of_get_data_lanes_count_ep() return value documentation
> to match the drm_of_get_data_lanes_count() return value documentation.
> The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> drm_of_get_data_lanes_count() and therefore returns the same error
> codes.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

