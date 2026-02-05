Return-Path: <linux-renesas-soc+bounces-27958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGMxK0jAhGnG4wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 17:07:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D43F4F7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 17:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 003E13009992
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 16:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74DF42EECE;
	Thu,  5 Feb 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMYr34hu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33AB36403D;
	Thu,  5 Feb 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307642; cv=none; b=Pn0rs/XarLyRZFcvQEY0Up9q2E9YJ+cTDVwQvaHio58hRSRKyoX1igYdoDlIW4G6fNA1HEeB8C7p1mkrZdBaZZElZHN9CPCJy3fb/L6fM3y9J7NgI0b8xB06QKMyDRriP4OlirVbfD4rNRoUu4PqfoQhNOYJwjoS3S7FgRGqnIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307642; c=relaxed/simple;
	bh=GXk+GzpG5GSnwfsf0UKSPYlVGU+6DX3r9ClEXhUTjts=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XI72R3hk71eseV+XEZ+y51GBYYXe4rVyT22Zrij+WIvmzgG/TRiizH/yLouH6xh0RYvJ67IYAVdKWX9CYgoz9gSMpy2BGQXiKfSC42zyHokD3tOgshJbwA80N5FRVfAgq4bIhlhQnJuTpFAQZQBlqHc0G0/+O/ILr1Hoq1K7UNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMYr34hu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF1CC4CEF7;
	Thu,  5 Feb 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770307642;
	bh=GXk+GzpG5GSnwfsf0UKSPYlVGU+6DX3r9ClEXhUTjts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HMYr34huf+UgYUqaxT6/MP74d67CCdlMMq+SY47udR3Zqi5TZuAgUmsfd1SNSMdXz
	 eizscw0BCSIlkrzGiTYFU3ZGDSiqMmcY2dxFpJKjBcqnF21XPTZ80K4ZyaFD4+jPWD
	 qzO5S1ZzhmACywclQJdSHzG9ic98x1nwrKgDF452i+bQ5xO6yhpfbBDLskk3Kl+y6R
	 IKRs1nSS6unzFt5O8RUUcjfnYuBofpXrPfrrk5hD+LsupG7jOdxyVRyB+Nq6e+kjEU
	 s5D5X5QDF05QC9H+yZf/f5wS8hFQnWB5HmmwYJpRVEb9yU6hoRPgIO7KWBM8clca8k
	 6Vw+YdgewvGsw==
Date: Thu, 5 Feb 2026 08:07:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: renesas: rswitch: fix forwarding offload
 statemachine
Message-ID: <20260205080720.7d59ef82@kernel.org>
In-Reply-To: <20260205-fix-offloading-statemachine-v2-1-fafcf0c6eb1d@renesas.com>
References: <20260205-fix-offloading-statemachine-v2-1-fafcf0c6eb1d@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27958-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42D43F4F7C
X-Rspamd-Action: no action

On Thu, 05 Feb 2026 14:35:21 +0100 Michael Dege wrote:
> A change of the port state of one port, caused the state of another
> port to change. This behvior was unintended.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> ---
> A change of the port state of one port, caused the state of another
> port to change. This behvior was unintended.
> 
> Fixes: b7502b1043de86967ff341819d05e09a8dbe8b2b ("net: renesas: rswitch: add offloading for L2 switching")

Please wait 24h before posting a next version of a patch per:

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr

The Fixes tag is not in the right place here, it should be above your
SoB and the hash is too long (consult the Documentation/ for exact
format)
-- 
pw-bot: cr

