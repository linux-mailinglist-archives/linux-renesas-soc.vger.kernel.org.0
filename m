Return-Path: <linux-renesas-soc+bounces-32545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MUlOsTVA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DB52BFA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C6F7300939B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9791C366DCF;
	Wed, 13 May 2026 01:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXiIasIK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39B256C61;
	Wed, 13 May 2026 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636155; cv=none; b=kaXvgHlhpJVzth6+amUnrr+o/GXEKlu+lzAJPzfkdM4vehZlIbWY1PPwLw9KZx26mGBFbIK0pCQOKWg5SS40PbU8I6htIbMrD6yHm1njIkNW8v7Rb217x5RKYiZtT2MWZ1mcGcLix0UdkaoEshfXt5xkoHJeSN50RqJ2RqOwmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636155; c=relaxed/simple;
	bh=IsOIPRKozguXync1BG4XWcLwCIlKHrrvdhRxCgp+too=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIVFg/jQPYoHK0qz4D1vUfcklvwhioSuZo3P3VmvCJ3Og84A8LdNYpkbTkg1j0YSIE0YK9Ku1eC886MVZSDbujWQX2+7YKV8Dd8vAUyBYBY+mlAdQr4yBQiEv1xCRj8rBpgRc1L+mVLXoLeV3nbsctJtCKPitsLcNAwtfn4HG2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXiIasIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E6DC2BCB0;
	Wed, 13 May 2026 01:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636154;
	bh=IsOIPRKozguXync1BG4XWcLwCIlKHrrvdhRxCgp+too=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UXiIasIKw8kKkTS7s1Tls2Ebr/nJkH1pcCgC0jE0WnB34K2/5ytz3P3h2iVf26MPT
	 ML5Ev4WPTJRndfHzfw3WxZ595tgE/FNHgk6Ak00SovwaAZ8F7MbRzKX7QZUSqcq69m
	 5q+rKqrnNWTjTvSnLB0pkb8rl2qDbUGAbk12GpfQ82OBiq8SjRXrbRGurQwoUisyDO
	 6JO/AeyqVAsEtafjtQ/TQWsHM3tsPEWTHbnHIpoM76dCd3di/1w34fxuPS5tKhIoU9
	 fMU7nNcXE0tyOSIqruSUwlhYqiSQkK+ixcAgZ9f5TuAmTd7gG5ojsiEpejul9C/M1i
	 omJbYDjI+wiAA==
From: Jakub Kicinski <kuba@kernel.org>
To: michael.dege@renesas.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	yoshihiro.shimoda.uh@renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	niklas.soderlund@ragnatech.se,
	paul@pbarker.dev,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 07/13] net: renesas: rswitch: make helper functions available to whole driver
Date: Tue, 12 May 2026 18:35:53 -0700
Message-ID: <20260513013553.1408408-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-rswitch_add_vlans-v4-7-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-7-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E67DB52BFA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32545-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: make helper functions available to whole driver

This commit removes the static declaration from several helper functions and
adds their prototypes to rswitch.h. This makes the functions available for
upcoming L2 and VLAN handling features.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
[ ... ]
>  /* Gateway CPU agent block (GWCA) */
> -static int rswitch_gwca_change_mode(struct rswitch_private *priv,
> -				    enum rswitch_gwca_mode mode)
> +int rswitch_gwca_change_mode(struct rswitch_private *priv,
> +			     enum rswitch_gwca_mode mode)
>  {
>  	int ret;
[ ... ]
>  /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC) */
> -static int rswitch_etha_change_mode(struct rswitch_etha *etha,
> -				    enum rswitch_etha_mode mode)
> +int rswitch_etha_change_mode(struct rswitch_etha *etha,
> +			     enum rswitch_etha_mode mode)
>  {
>  	int ret;

Does exporting these functions expose unprotected read-modify-write
operations on shared hardware clock registers to concurrent execution?

These functions modify the shared RCEC and RCDC clock registers via
rswitch_agent_clock_ctrl(). Since all switch ports (ETHAs) and the GWCA
share the exact same coma_addr space, could concurrent invocations for
different ports cause a race condition?

For example, if multiple ports are configured concurrently via netlink,
or if parallel PHY adjust_link worker threads call these functions:

Thread 1 (Port A)
rswitch_etha_change_mode()
    rswitch_agent_clock_ctrl() reads RCEC

Thread 2 (Port B)
rswitch_etha_change_mode()
    rswitch_agent_clock_ctrl() reads RCEC
    rswitch_agent_clock_ctrl() writes RCEC

Thread 1 (Port A)
    rswitch_agent_clock_ctrl() writes stale RCEC

If RCEC and RCDC are Set/Clear command registers, reading the current state
and writing it back with a new bit could accidentally re-apply stale state,
reverting concurrent clock disable commands on other ports.

If they are standard configuration registers, could this result in classic
lost updates?

Can this lead to unpredictable port lockups or MAC failures by corrupting
hardware clocks for unrelated ports?

