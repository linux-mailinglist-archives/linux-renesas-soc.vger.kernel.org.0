Return-Path: <linux-renesas-soc+bounces-32546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNH3BfHVA2ol/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9052BFCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4890330BE42A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 01:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F81381B0F;
	Wed, 13 May 2026 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ergcMtjc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C783812F2;
	Wed, 13 May 2026 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636157; cv=none; b=PXmpL9Yks0oroI9ceauOEIEImsEee0iyRLFocDEUtAcc88yxpKLX2slCDpusRvTic6yy26EiQf6Im4ihnBe8g4Mz5UjnsNqG23hj36gfhshpUqdrLPmXvRJGXVwPn9N26jd3SZ9TxW7zThbBPONp7qW9mnko9d5Z+qs55QY+bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636157; c=relaxed/simple;
	bh=mFBXjS20vdQaBzhZBFQm4B8Z54UcNTJYRpHCBgUVdFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLm0WL1In51nN55dhlzdUlQ55aw37l5Z+nKdl8MOb8amOT4Aa2XS1hJz2IBexeSskjZXBr1nyEXIkG7okic22srsyRcZeQW/9N0caZ17bYceaJwz2KmpmoXzdYxVOJnpgul/nf1J00Vj1lsbxh1SqAOQ847nGUnRVeoMBbMOBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ergcMtjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A55C2BCB0;
	Wed, 13 May 2026 01:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636156;
	bh=mFBXjS20vdQaBzhZBFQm4B8Z54UcNTJYRpHCBgUVdFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ergcMtjchmUVGcKY2zrut041AiNBRj37Qi0ERjWaDuVahq300OEN3oeRFCfMQVO0Q
	 Ev39cPsl7k9ezVEl9fIKx/y9MK05MkVzI7EZ5/y/PItQBki7ErePmSP3u0rjwMbZJK
	 cCoXlBSLb/p6kErrz+f1ikMjPijBzubF19DZ2qzH8b6A/fsROweLWf1M1VMQstzjQT
	 jzTPU/KyDXUVhn/Dyl8xDcGbmG7Hn8V+8fbtvXaSOn3JXcqCcXG7idR4msaFACRwmY
	 xGuhHPFADr1ewdgx/KBAUfaFOytNq7eMYuZFQHc8W91Zb2unFJY1iftws4i7TZYelD
	 4hZLefY8SsH3Q==
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
Subject: Re: [PATCH net-next v4 09/13] net: renesas: rswitch: update port HW init
Date: Tue, 12 May 2026 18:35:54 -0700
Message-ID: <20260513013554.1408426-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511-rswitch_add_vlans-v4-9-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-9-a5a225f8faae@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C9B9052BFCC
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
	TAGGED_FROM(0.00)[bounces-32546-lists,linux-renesas-soc=lfdr.de];
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
net: renesas: rswitch: update port HW init

Certain Ethernet and cpu port settings need to be updated to prepare
for vlan support.

> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 90c44dcfd1691..d00af333fcce5 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -737,8 +737,11 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
>  	if (err < 0)
>  		return err;
>  
> -	iowrite32(GWVCC_VEM_SC_TAG, priv->addr + GWVCC);
> -	iowrite32(0, priv->addr + GWTTFC);
> +	iowrite32(0, priv->addr + GWIRC);

Is it safe to completely remove the initialization of GWVCC here rather
than explicitly clearing it with iowrite32(0, priv->addr + GWVCC)?

If a bootloader, firmware, or a prior kernel (e.g., across a kexec warm
reboot) previously configured the switch to use Switch Control Tags,
this register might retain a stale VEM_SC_TAG value.

> +	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), priv->addr + GWRDQDC0);
> +	/* Drop frames with unknown tags */
> +	iowrite32(UT, priv->addr + GWTTFC);
> +
>  	iowrite32(lower_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC1);

[ ... ]

> @@ -1284,7 +1288,12 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
>  	if (err < 0)
>  		return err;
>  
> -	iowrite32(EAVCC_VEM_SC_TAG, etha->addr + EAVCC);
> +	iowrite32(0, etha->addr + EAIRC);

Similarly, should EAVCC be explicitly cleared to 0 here?

Other registers like EAIRC and GWIRC are being explicitly set to 0
in this patch, which suggests the driver cannot always rely on the hardware
reset state to zero out configurations.

If a stale value is retained in EAVCC, could it cause issues for subsequent
checks that might rely on reading EAVCC to determine if a default VLAN is
already set?

> +	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), etha->addr + EATDQDC0);
> +
> +	/* Drop frames with unknown tags */
> +	iowrite32(UT, etha->addr + EARTFC);
> +
>  	rswitch_rmac_setting(etha, mac);

