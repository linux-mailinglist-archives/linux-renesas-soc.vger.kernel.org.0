Return-Path: <linux-renesas-soc+bounces-30630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HK/NLmHy2kuIwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:37:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF836641C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA7A8309CF28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9A3DDDDA;
	Tue, 31 Mar 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2B15g5H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED6175A71;
	Tue, 31 Mar 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945876; cv=none; b=nbM+vPKaK1llRj8qj2doXIzv6I/h9rYUtCtfIk4nVNhnej7CWGlg2Jm0HPsgX3bkszbIfg/SIuoGBDALo43hkOFssXBThgBwhc2ACVwGrW0M+0Chj1xNec2etMsoGX9iAWUcXepK5OhLM3lNGd7wkE4WdgEB5V4Yq3BrnHLprPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945876; c=relaxed/simple;
	bh=vKwb0AFSi9KABRTysc3sQJ1mDtXKCNCnZ7RsDe1H17s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL5sc1bncN0iKxd4Zx936GRY2J3Szg6QEcvS8bCMs9mrEYWNaiu0vkc5U/j8ObRrYYbChZQxUMyAgnukef8qkCOwwaPrze9fWAkreUE1GJAYI7b5aMimqPC/bm673mNLm5Pz1AEAe6s5stMgHso62YcVHKKL9rFymPhPv9eaJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2B15g5H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7133AC19423;
	Tue, 31 Mar 2026 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945876;
	bh=vKwb0AFSi9KABRTysc3sQJ1mDtXKCNCnZ7RsDe1H17s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2B15g5HX06tkNIlEqP0yuBNdmOpC9kW6q8Ai7sbwOk3BY+sveOJZeeWhJG6grnIl
	 1OFE3zWoobF0AXKPzI1b3vIOhFE8XwQnzV92JOl9E/cuccdvCFdCEKBUzCzo2EUqp7
	 GLYikNWMxnswrqMzGwi5jn2trwfPa2kZJ5KVAUYMkauFwaBRvhFv10JyrppWZGAXfu
	 KUVWcUKdbV7yAGexLydwBSXkCEwnx98Dh5buMtXVtXl2rdyec9wviXK2MjJZzf8Q6/
	 ntR9M7jMA0eXCl+vfqITFGECNyu9/S6PBU5T/mnQKHlQ3es2F/jIujAbiSyophaXpO
	 nOgOUGNAnzTQA==
Date: Tue, 31 Mar 2026 10:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathan.cameron@huawei.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 2/7] cache: andes_llcache: refactor initialization and
 cache operations
Message-ID: <20260331-pragmatic-observant-toucan-d89d74@quoll>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-3-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-3-minachou@andestech.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30630-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CBF836641C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 06:27:19PM +0800, Hui Min Mina Chou wrote:
>  	return 0;
> @@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] = {
>  static int __init andes_cache_init(void)
>  {
>  	struct resource res;
> -	int ret;
> +	int ret = 0;
>  
>  	struct device_node *np __free(device_node) =
>  		of_find_matching_node(NULL, andes_cache_ids);
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> +	if (!of_device_is_available(np)) {
> +		ret = -ENODEV;
> +		goto err_ret;
> +	}

You just made antipattern. Conor mentioned briefly that he does not see
commit as doing right, but let's clarify: this is absolutely wrong.

It is explicitly discouraged by cleanup.h, but even without that remarks
one simple 'return' in one line is converted to three lines with goto
and you call it "simpler"?

No way this is simpler. You made code worse.

Best regards,
Krzysztof


