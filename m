Return-Path: <linux-renesas-soc+bounces-28205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMApBF3Kj2ntTgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Feb 2026 02:05:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA413A630
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Feb 2026 02:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C592F3079A7F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Feb 2026 01:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FB91F4168;
	Sat, 14 Feb 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIxhxb90"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF93EBF2C;
	Sat, 14 Feb 2026 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031047; cv=none; b=YsK2RTpX87BkUgyTcKPMq0MdeUL9sFU7ELR3H8xThHs+/7aRIUVmvdApFfkbL0IoJ4i/6Aa5BfpBb52OCloUfvcMEte+1R+RY2z2TgibqgptsbpzvmykQeXVUliDdovDw7hawoZi2QxUtRT07ld2hchcbmnS/wRD9BCx7/K751Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031047; c=relaxed/simple;
	bh=KR/FHgN7nG2Nb9nRMckFi7HQe+G37MuwiCnYErJmsiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo7M/opWto7N7ihxvvO2wadxfvE9sG56POKFuE6HMAi11TXqmQ4b6VU4PnTAoEjIPDGXo46qxlHeP0mzDzZjzODEF3bUkyxHunofrXwz89IKoVjsSljhrEa3/OvK7tAlspqUi/t2f+mdIkrXEqwfCVNKNS0Zwajpn2rumwcb2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIxhxb90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FBDC19423;
	Sat, 14 Feb 2026 01:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031047;
	bh=KR/FHgN7nG2Nb9nRMckFi7HQe+G37MuwiCnYErJmsiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uIxhxb90F4MW+drqRPM8F/d5gLFeivD3Xsuk2k4Ksh1rHOufgYhRYO7LBq0sbgs8V
	 TIk2z8np6SDvq3MQcYbW4lDvqhUI5Yhy7/HSX+/uHztgIuQqLI57VZt/RkLrPTwLKa
	 b9MirqSRtLpZ7NuEQT5xy51SGJ1GMFYJ33/DV5NUsDtaTOqxPW5X9sh+heZLHcMFed
	 ChkK6Qurj069oV77l0WEXYiKmoXnprEhElhNYnFKNt4PjGrIq3r6hUV2BL4syz0EwK
	 lmZEcUq6RhN/cMJmkbrzCFN5GM8m64UdpIHoeUBYZMZF97qg3+uZnwebiovrtBGElR
	 TQ8MA99erMeiw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sasha Levin <sashal@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
Date: Fri, 13 Feb 2026 19:58:37 -0500
Message-ID: <20260214010245.3671907-37-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28205-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,msgid.link:url,dimonoff.com:email]
X-Rspamd-Queue-Id: 96DA413A630
X-Rspamd-Action: no action

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

[ Upstream commit 64aa8b3a60a825134f7d866adf05c024bbe0c24c ]

Since commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
we may get the following kernel panic, for some panels, when rebooting:

  systemd-shutdown[1]: Rebooting.
  Call trace:
   ...
   do_serror+0x28/0x68
   el1h_64_error_handler+0x34/0x50
   el1h_64_error+0x6c/0x70
   rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
   mipi_dsi_device_transfer+0x44/0x58
   mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
   ili9881c_unprepare+0x38/0x88
   drm_panel_unprepare+0xbc/0x108

This happens for panels that need to send MIPI-DSI commands in their
unprepare() callback. Since the MIPI-DSI interface is stopped at that
point, rzg2l_mipi_dsi_host_transfer() triggers the kernel panic.

Fix by moving rzg2l_mipi_dsi_stop() to new callback function
rzg2l_mipi_dsi_atomic_post_disable().

With this change we now have the correct power-down/stop sequence:

  systemd-shutdown[1]: Rebooting.
  rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable(): entry
  ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry
  rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_post_disable(): entry
  reboot: Restarting system

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Link: https://patch.msgid.link/20260112154333.655352-1-hugo@hugovil.com
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

This is important context: The MSTOP commit (56de5e305d4b) that causes
the regression is only in v6.18+. However, looking at the commit message
more carefully — the issue is about the **ordering** of DSI stop vs
panel unprepare. The MSTOP commit may have just made the issue more
visible (by making the clock gating more aggressive), but the
fundamental ordering bug (stopping DSI before the panel can send its
shutdown commands) could potentially affect earlier kernels too, even if
it manifests differently.

That said, for stable trees before 6.18, the triggering commit doesn't
exist, so this specific panic may not manifest. For 6.18.y stable, this
would be very relevant.

### Summary

- **What it fixes**: Kernel panic on reboot for systems using Renesas
  RZ/G2L MIPI-DSI with panels that send commands during `unprepare()`
- **Severity**: High — kernel panic prevents clean reboot
- **Fix quality**: Small, surgical, follows standard DRM bridge
  patterns, tested by maintainer
- **Risk**: Very low — same operations in correct order, limited to one
  driver
- **Scope**: Single file, ~15 lines changed
- **Dependencies**: Driver exists in v6.12+; the specific regression
  trigger (MSTOP) is only in v6.18+, but the fix is still correct
  ordering regardless

This is a clear, well-tested fix for a kernel panic. It's small,
surgical, obviously correct (using `atomic_post_disable` is the standard
pattern for this), and has been tested by the subsystem maintainer. It
meets all stable kernel criteria.

**YES**

 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e0..b164e3a62cc2f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -646,6 +646,13 @@ static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
 
 	rzg2l_mipi_dsi_stop_video(dsi);
 	rzg2l_mipi_dsi_stop_hs_clock(dsi);
+}
+
+static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,
+					       struct drm_atomic_state *state)
+{
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+
 	rzg2l_mipi_dsi_stop(dsi);
 }
 
@@ -681,6 +688,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
 	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
+	.atomic_post_disable = rzg2l_mipi_dsi_atomic_post_disable,
 	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,
 };
 
-- 
2.51.0


