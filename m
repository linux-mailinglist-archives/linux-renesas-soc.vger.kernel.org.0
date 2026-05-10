Return-Path: <linux-renesas-soc+bounces-32325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLNpKf14AGpZJQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 14:24:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9FD503DEE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 14:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C77DC300360E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 12:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A02381AF9;
	Sun, 10 May 2026 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHGUZDpx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558F381AF7
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778415846; cv=none; b=D01S+HHsIFJwYcj8xD7QUo9mSGYtDUV4PlXOe7FWl2kXUwRjqntZAO6rYX+9ckVJEMGYLongQo3l3uf9+dblhnuZtGvU4bRJNCoGmsDxgomzkyZATvz7eXeydAme5IKodeqfMTo+OUI+BC0kFiLlfAeqc3eDsFuLT7kEmvt9RcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778415846; c=relaxed/simple;
	bh=kSP63f81+fpLOfU3CR4BLwEW21cq767ErVyxw8hoChg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bsXWpZI7aVuTezFTatF05Jb+XxZ2KoaKrioKSycf+QKX1OuiQtPu7jD7wUyYZwTjZ62myCD0xMYgpzSFwxW62omZUSozdRxiV+0DvvAe3IRTA/dVd5xT3OhXeDZxMjC17fqWUFymWkmDDoQSsI2j4w+nH+9Z4p+1VPYSYfBRIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHGUZDpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDC4C2BCB8;
	Sun, 10 May 2026 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415846;
	bh=kSP63f81+fpLOfU3CR4BLwEW21cq767ErVyxw8hoChg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iHGUZDpxoHiwLo9qbLnaoqHbhXVZCreGGfPVJy7jh/HvNTNoixLaYrg6kTJKvWkZE
	 cMJ2vKzI+8GVWB0/0gYjIgf1Aqw5URYjL7j8rUV/G5Oxcy7iXzsUo/ywJpzJI/g/GV
	 l1ufblUaoUk3HpupI2aglw5y31oKKIMRgryXXC6ekCmITj2r18eYcpn1jVlTgZ7KZO
	 GmpWBBZlSg9E0exgA4H9Sid0y7DU/SagpFuTIDAUqGjP3MNdRFAVvpX2ewhLq4nuqY
	 zNcfjfl1Mt1OHJsgoj0NUaHngXDh4DeFDnHFnybUm7jGlCm+jgzTAKli35SN4RI9Op
	 KOkbiwqMkCoTw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
References: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
Subject: Re: [PATCH] phy: renesas: rzg3e-usb3: Convert to FIELD_MODIFY()
Message-Id: <177841584439.420676.5357433848718730971.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:54:04 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 8B9FD503DEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32325-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 05 Mar 2026 11:15:28 +0100, Geert Uytterhoeven wrote:
> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> 
> 

Applied, thanks!

[1/1] phy: renesas: rzg3e-usb3: Convert to FIELD_MODIFY()
      commit: 5e2871746039e69657623b222b30c1c6f52159f0

Best regards,
-- 
~Vinod



