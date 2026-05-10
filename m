Return-Path: <linux-renesas-soc+bounces-32327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ7FKRx8AGrJJQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 14:37:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0A503FB9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 14:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 275EA30216CA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 12:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F91381AF9;
	Sun, 10 May 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBrlfkj7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C6263F44;
	Sun, 10 May 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416335; cv=none; b=jc1SrvoQebkMJOPNc4TC6HDatUnZ4fLfTd0QdK0UmLtY/eRNGg9vjyvc8MMf1Syu/b8jl2PJAD5lUyIyB78ddDZ3cQw5VUlEhAa/C+BGrOejmvJHN0Ajriva84N6oenn5F6ERoln31ZyxmMbxdMUTVeH1FqYQtKuGE/Qi3Hb4as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416335; c=relaxed/simple;
	bh=UuUOreEIGCslVe+CKSmlu63U/njoms5UEfXyNQelGxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cfcRXSV6VisGe/chawZ+My8t4MVD805EeOQwO9Nki80ggpBNfMXeWgWFOgAAnTHlT4K5FLSj1LPYWvTHGsxRFEKBZ4fPGeg9bb79V0KkYM9XITrwzjP1Y0GfaedfoRRBuHh0y3gxXnaUF/pOZBS+yqI5GXJ5lVhFyGO0wbY5e5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBrlfkj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF274C2BCB8;
	Sun, 10 May 2026 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416335;
	bh=UuUOreEIGCslVe+CKSmlu63U/njoms5UEfXyNQelGxg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kBrlfkj7ccdBBzpK8sQ/a/PMk8Ss2CMrKGG+1Rtx7sN3bwVMR8rRiqXnes+9Y2BTJ
	 aNLfkwcxaKYePpvB8AobctmUMh8DeDyfhXaUdZZF7GwqQX7hJ0j1CRjN9vL9kQ+3BF
	 RLZkJDE8IfiVL9KiqfNFa4ozhs3WhzqzaqkPtsoDlQg7GSB1UBs+lXWzz9szD4cw88
	 bUAOpuYQ59MR35AWt8uTtZ07pA6EDho6v3WiZyTBDc9AloX9E8E7PT5dzmSD422GiX
	 HO+eFcnvoF7gwuag2tWtKpQrqHObpHZS2c6aOo6zziGGgCRxAcYpuudX9223qDArUG
	 MpXc2LL0fnDjg==
From: Vinod Koul <vkoul@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@nabladev.com>
In-Reply-To: <20260319063211.5056-1-biju.das.jz@bp.renesas.com>
References: <20260319063211.5056-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Fix malformed
 MODULE_AUTHOR string
Message-Id: <177841633229.434434.9116344944235165418.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:12 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: B1E0A503FB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32327-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 19 Mar 2026 06:32:07 +0000, Biju wrote:
> Fix a malformed MODULE_AUTHOR macro in the RZ/G3E USB3.0 PHY driver where
> the author's name and opening angle bracket were missing, leaving only the
> email address with a stray closing >. Correct it to the standard Name
> <email> format.
> 
> 

Applied, thanks!

[1/1] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR string
      commit: 53f60930e3d20883364fc01fd46b6099acb8127a

Best regards,
-- 
~Vinod



