Return-Path: <linux-renesas-soc+bounces-33106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG09MPm0FGpbPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:45:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B645CEB9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A6F23016814
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6793A7F5E;
	Mon, 25 May 2026 20:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIkf2hmg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6E3A6B8A;
	Mon, 25 May 2026 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741680; cv=none; b=X30cc0hYNio2Fz1wm4jPbIPXurGwzqjA/OwyfLfMuFqjdw0gHoVv0iZ+i4CxdZZ4/aV23VHrKOhasF21L80mGFmAl2CjntFmIIQ+UoLh6fQmDPW07I/37iDG5e03+ao/CSZB4ump+UdfX3NA6dtnnbnUfu4OoBOTPuxBgibUKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741680; c=relaxed/simple;
	bh=6qgEXuS1gZYECLijY8f2vSc/xzSA10clnPqXowIkuYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdSGzeeE8wlwpysqsGaXKEr/YPpqxFySzDtVoBSrYaHO0PuGkOMoACSN1FXqek735nTGpENUaP5t0EVf+FWROmiSo2locBu6lukPNSDGwidrdgyFFFsbEKeqEZPq1bvvQX9JGQ67An0DO2N6R94rA00di/K6WaDfpf2K5k8DcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIkf2hmg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596801F00A3A;
	Mon, 25 May 2026 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741678;
	bh=osL/citGlx5mNCZ25EUm+aoK+SXx6IlRYS6mG8BZtqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nIkf2hmg/S9YR+p7Uq6pomNX7CHwVegmtToyvSrhycuTDSKOH0WETbpcycRgIE0eK
	 t+VQj9s3mFdOhmK+0MQrIVA1VN19Sw1SZUcVHYoMxWK+bEN+SwMm+Ct0O+V+vlS4Jb
	 92iI//JJRNtkQmtZHtSWBU3bqKI4CcSJf+bfnG8ns9q5b20aMyahLNtV/BHIU68DBE
	 s5/+2NJqKAq/VhJp4swd34h4QUqrl081dEs4pvx7xoi7B5hUK9qQwUd4cVzmjyPD21
	 plKXR/Hj01s34SN2lJXxkDGy/pVT/O7S2I1Kmsh+cXyJt3QNtUFTBltf+goEuWFDyC
	 9MM+ocomlmjqA==
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
	richardcochran@gmail.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 11/14] net: renesas: rswitch: clean up is_rdev rswitch_device checking
Date: Mon, 25 May 2026 13:41:17 -0700
Message-ID: <20260525204117.2471455-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522-rswitch_add_vlans-v5-11-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-11-53589d944a9f@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33106-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C4B645CEB9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: renesas: rswitch: clean up is_rdev rswitch_device checking

This commit cleans up the rswitch_device checking by replacing the
rswitch_port_check wrapper with direct calls to is_rdev. It also adds
a null pointer check for the net_device pointer in is_rdev.

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 3cc0ce8762f3c..c76fc8121ef05 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c

[ ... ]

> @@ -278,13 +273,13 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
>  		return -EOPNOTSUPP;

[Severity: High]
This is a pre-existing issue, but does this unconditionally intercept
and reject port object addition and deletion events for all devices
in the system?

Returning -EOPNOTSUPP directly without checking if the device belongs to
the rswitch driver stops the global notification chain prematurely
because raw negative values have the NOTIFY_STOP_MASK bit set. Could
this break switchdev object offloading (such as VLAN configurations)
for all other unrelated network interfaces in the system?

I note this is fixed later in the series by commit 17583b9d88b1b
("net: renesas: rswitch: add vlan aware switching").

>  	case SWITCHDEV_PORT_ATTR_SET:
>  		ret = switchdev_handle_port_attr_set(ndev, ptr,
> -						     rswitch_port_check,
> +						     is_rdev,
>  						     rswitch_port_attr_set);
>  		break;
>  	default:
> -		if (!rswitch_port_check(ndev))
> -			return NOTIFY_DONE;
> -		ret = -EOPNOTSUPP;
> +		if (is_rdev(ndev))
> +			return -EOPNOTSUPP;

[Severity: High]
Does returning a raw negative error code directly from the notifier
callback cause the kernel to misinterpret the failure as a success
and abruptly halt the notifier chain?

By returning -EOPNOTSUPP directly instead of assigning it to ret and
relying on notifier_from_errno() at the end of the function, this
returns a negative integer. The binary representation has the
NOTIFY_STOP_MASK bit set, which incorrectly halts the entire notifier
chain.

Furthermore, when the switchdev core decodes this value using
notifier_to_errno(), the stripped integer evaluates to 0 (success).
Could this cause the kernel to silently assume unsupported operations
on rswitch devices succeeded?

I see this was also fixed later in the series in commit 17583b9d88b1b
("net: renesas: rswitch: add vlan aware switching").

> +		return NOTIFY_DONE;
>  	}
>  
>  	return notifier_from_errno(ret);

