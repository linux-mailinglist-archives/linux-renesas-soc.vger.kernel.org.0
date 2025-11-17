Return-Path: <linux-renesas-soc+bounces-24692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF7C63836
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E7E9E21567
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE22233704;
	Mon, 17 Nov 2025 10:23:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26243315D21
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375007; cv=none; b=KTubsmaRcAYIWBoDIhDjT/YRczpzrpf4BzGpzroBzWIGRn7NohGFEGmHT92hGft2T9npKv+vHPa5262QTFKlnIj00g+AATcqU54WCgQ1thnxCgBQ421Xv4yRytoCYYbYZ0NBoxdG+96a+p6HM/RJLrlChzHpi/zYiGgO+UbYgLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375007; c=relaxed/simple;
	bh=n15cu3Mk2Iw5I6HmXd8Koi8cJPUg9+h7y6kGWShPX9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZvk857+MtqKzsBD0L0QIQwR6jqfQ7dWgcb2VqRRRhj0lXIKHUUaimCc7dElC/17hoAzjXy0WoHZ4HUT/B04fZBvrYHtk9CaMRozCli3cAmgJWLugNc+Gc0ZS5Ekw3Hxm03gTjAS+GpgykDWwGUi7a3d5304MvfkWYxWfTF03lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1921C4CEFB;
	Mon, 17 Nov 2025 10:23:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.18-rc6
Date: Mon, 17 Nov 2025 11:23:21 +0100
Message-ID: <b21a89cc6d17ace3d71dda68199fd0880d71405e.1763374913.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Re-enable Cryptographic API support (no longer auto-enabled since
    commit 324be6dcbf09133a ('Revert "SUNRPC: Make RPCSEC_GSS_KRB5
    select CRYPTO instead of depending on it"')).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 11d117438270793f..622ee0136fc7a51c 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -204,6 +204,7 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_CRYPTO=y
 CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
-- 
2.43.0


