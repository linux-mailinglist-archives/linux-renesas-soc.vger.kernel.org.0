Return-Path: <linux-renesas-soc+bounces-32547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIpXLvfVA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB552BFDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8A3930C0A02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34E5385D9D;
	Wed, 13 May 2026 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luj0SoON"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B896382F0C;
	Wed, 13 May 2026 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636158; cv=none; b=EZNSdAjbuxkNUEPVSK9PjFlfIA9Jl6b2QzEkauYpx04W1TYdAY+Dv2SuySuSL7uC3TvS7hAUfLpqJLLOmXKIgTCEijhTuTzv6+bv5Qc+sraL/3GrWRQ+WBM0A4EpqRIZ1+MO9wsxhcOu/6pR9S6jF2HRWlzY3Hposnl9Zk+5ZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636158; c=relaxed/simple;
	bh=NKYkag2pwcy5E5yaWElHBHKRewYcer7qs3fVTdZ23aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTFb247Q8wArT9kmN/p8G2cEYQFix9mXXU3cSuMz37mPVDSfnhxrKQLymH0qD60tLS9hnZF8ssbox+z/Oc/89TopzP3kxJ0NKhNxnsjRA8L5aGBGuQcodsENog/qt0XzIXKqF9TBJwNwf6CwJpn6NePU/WItu2eJ0H4HZPBiEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luj0SoON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339E0C2BCB8;
	Wed, 13 May 2026 01:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636157;
	bh=NKYkag2pwcy5E5yaWElHBHKRewYcer7qs3fVTdZ23aQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=luj0SoONahdwQB+vY401/EVeApk9SBLv7ZmBoPJCov+a2++E3EA8lrHZUvZ2Vh40B
	 xCgqzIby7R86R2OOKzxBkmP14xsJem0hnB4fS120t63cFTvJhlrXGnE4TxzxOTplHQ
	 OT1FM2EfGVTmzzHsQso5kBO/mQm9db0Yp9Yu11ST3SXPND+Xy9KI6REUC71uoeH/y0
	 C6N9oX2Cy2RLBnhQAkT9YtoqogA0xIn9ftPTaJZT/4C4G23ON77HyocRUXpIuzmHOM
	 qx2iCSjBCN4igCJso/IzEERMsSmIjSWHao5d72OZXy2/uWaxWt3UbKt9iNDykizoBN
	 pcIwj12xLEZQA==
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
Subject: Re: [PATCH net-next v4 10/13] net: renesas: rswitch: clean up is_rdev rswitch_device checking
Date: Tue, 12 May 2026 18:35:56 -0700
Message-ID: <20260513013556.1408455-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-rswitch_add_vlans-v4-10-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-10-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 73BB552BFDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32547-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: clean up is_rdev rswitch_device checking

Add null pointer checking for ndev and remove unnecessay
rswitch_port_check() wrapper function.

> Add null pointer checking for ndev and remove unnecessay
> rswitch_port_check() wrapper function.

This isn't a bug, but there's a typo (unnecessay) in the commit message.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 3cc0ce8762f3c..dd8aecbcb2a8b 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
[ ... ]
> @@ -278,11 +273,11 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
>  		return -EOPNOTSUPP;

This wasn't introduced by this patch, but does returning -EOPNOTSUPP directly
here abort the global switchdev blocking notifier chain?

In a 32-bit signed integer representation, -EOPNOTSUPP (-95) has the 15th bit
set (0xFFFFFFA1), which inadvertently matches NOTIFY_STOP_MASK (0x8000).

Because this happens without verifying if the target device belongs to the
driver via is_rdev(ndev), it seems like this will silently break switchdev
object offloading (like VLANs, MDBs, MRP) for all other NICs system-wide as
long as this module is loaded.

Additionally, notifier_to_errno() strips the stop mask, transforming -95
to -32863. Since this is negative, it returns 0, which could trick the
switchdev core into thinking the event was unhandled rather than explicitly
unsupported.

Even though subsequent patches in this series (like "net: renesas: rswitch: add
vlan aware switching") refactor this block, they still return -EOPNOTSUPP for
non-VLAN objects by wrapping it in notifier_from_errno(-EOPNOTSUPP).

Because notifier_from_errno(-EOPNOTSUPP) produces NOTIFY_STOP_MASK | 96,
doesn't the system-wide chain breakage persist?

>  	case SWITCHDEV_PORT_ATTR_SET:
>  		ret = switchdev_handle_port_attr_set(ndev, ptr,
> -						     rswitch_port_check,
> +						     is_rdev,
>  						     rswitch_port_attr_set);
>  		break;
>  	default:
> -		if (!rswitch_port_check(ndev))
> +		if (!is_rdev(ndev))
>  			return NOTIFY_DONE;
>  		ret = -EOPNOTSUPP;
>  	}

