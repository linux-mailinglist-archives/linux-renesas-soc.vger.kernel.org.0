Return-Path: <linux-renesas-soc+bounces-31904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMzCGvuC92kwigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 19:16:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2A4B6C05
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 19:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E592D30010C1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 17:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB50A370D5D;
	Sun,  3 May 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE/0ghVU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834022F74A;
	Sun,  3 May 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777828600; cv=none; b=n21+nYYXyo7X/dyneMvxm5KxvfnkGQU1AYMQAbCer/m4d2v+MXKyNVzp+nTZjxpmGi1sOJHJRuvF+dhhhZhq6y15NPtOYznn9F+/jP9mcN09/iF6F8qL+609Qz//FJROnzBj8/LglQFlgWwF1pAqrNWMmKgvdrmMGwR4dUDdCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777828600; c=relaxed/simple;
	bh=mjHavlq5Av5EHGcoJ96sYh1yLWpKFPLJJdlt2cys7IM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h23WGMbishNBxdLwJN8viexzP2yxv9oJf9M11L5Hx7t1dv3bWrVuJQUZd3s+U0hx1zPuWJrZDmFeoiTGYYouWpbuT/4SeTDTFKeARJNOOQgs+UouDa6rc4xQdiOz3EwqvYYLVDbI7TSZegbpemleFKW2g0Y5IcztLG6X7B2HB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE/0ghVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704C7C2BCF4;
	Sun,  3 May 2026 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777828600;
	bh=mjHavlq5Av5EHGcoJ96sYh1yLWpKFPLJJdlt2cys7IM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZE/0ghVUy/hyK0ad6ZBCr1T296xGEeCwzl8w5wl2tkh3DYk/Gxu3Sg6DXD54mBYEQ
	 nbBb67tqxjMN5eh0DClk3IYXU4gMtddxpi794J7K3wgghJYRAB2bwHUeOZ4MFzf5lk
	 CpBvxS2hv6AcjWQtL3C/1jsxtlux9YhpurseRA40GqAKF0gmy63iTNIkA4PMwK1VMV
	 ZPlKIY8uWHZ2RGIf8ZNXpnu8ZAIv2RyEn2wEyNr/jy3vcrhKdvlifL1iGeYSxtAUaz
	 k0mhLbckrI2JWIlJmPFClhGdBUeHHre6nUxEnN/rcAwZJGISJCclNQVFRTILYCbXJ5
	 YBxhQRT6+KJ5g==
From: Vinod Koul <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Pavel Machek <pavel@nabladev.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS
 detection logic
Message-Id: <177782859600.133776.6484709083557122280.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:46:36 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 0DF2A4B6C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31904-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,linaro.org,glider.be,gmail.com,nabladev.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]


On Wed, 25 Mar 2026 11:20:39 +0000, Prabhakar wrote:
> Read USB2_ADPCTRL once in rcar_gen3_check_id() instead of issuing
> multiple MMIO reads, and derive both IDDIG and VBUSVALID from the same
> value.
> 
> Drop the redundant !! operator, as assigning a masked u32 value to a
> bool already performs the required normalization. Simplify the logic by
> comparing the ID and VBUS status directly, which is equivalent to the
> previous conditional but easier to follow.
> 
> [...]

Applied, thanks!

[1/1] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
      commit: f67ab4706ab72af29c331b21f431c463b00d447a

Best regards,
-- 
~Vinod



