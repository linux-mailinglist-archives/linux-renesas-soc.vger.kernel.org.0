Return-Path: <linux-renesas-soc+bounces-29946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIWvJUMrvGn4twIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:58:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F022CF3FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283913316E80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57592E541F;
	Thu, 19 Mar 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbMvglSI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0E34F255
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938928; cv=none; b=YBgb3lwAGNrDxu70f+NbgVPNFQUnEZtfMhF+fwE2ZU1BwGGFfFvz1A8+BT9zmpo7/WHJ7WhBUo93un+PFwY+X1c0W767v1Lx+lkcJlXJ1uwv3lI3z5V7aItny/Se4jt6xgSoEYRUL5RqVtPDRK3Yk/Ja23eFXmyjEU3B6uPZ9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938928; c=relaxed/simple;
	bh=nkLAM0jYneFvgblemuHPCxzulla/HTvZwrV6G1SRgpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLphnC0ZDk0TbpyiGRcPbiiwTApohEPRMFEed9SJGZNF1W5+fSY/hkUCqSJA534jaidpd9L+nOlv62xKkpMEDNEshk3rvm0i78V5ta143dQ2vemsJg4+ec9/pB09oo4mSLS3T9Btbt0DctUbr86NpdWtIrWhPQ/nhQGqdLNjs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbMvglSI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so8983995e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938918; x=1774543718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ko0JSoqc92if9jLRax/3q0IGpdS1ahpKtbD0W9dlNH0=;
        b=nbMvglSIxHRVrz0xjMpQN53dP+k65cUw2jfjd0FtjdpzocSM5Pna+bXHWNfwlgEqyk
         LgNGxsIR88N3DokdheYXPtRDtPvI5F8yqT6UiTMVcD/rcO5oHwYUCIAApMBs23tMDWRt
         m0CXx5dYA+FIPR9/9wFIV5Bg06YzZXcnh+SpgZcVvASzTstwxrEnPh35f0yUC6EoA/Dn
         rOIAbNrc3TqqNrnfSiYHpz1GDqxneEwooL34/UmVyqvjwkmo83quPSr61CSSdXH9WvVm
         YMHEhgJG6X6G++mmFGz6VcMk+B0M17M0XGLE2l6TeGjq0Bfizm1Bz+bW/ZD7gvo5vva8
         ZsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938918; x=1774543718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ko0JSoqc92if9jLRax/3q0IGpdS1ahpKtbD0W9dlNH0=;
        b=tFrG83K/8ryEUOnBRysW96wmbtZjzU+X4wt0chfHxcJuPT3UYUDuGt5HCfgSZjG4AF
         DgN3++GJi/FjdSdXLcb/D00bX0be1knGaCk2QMjgkicPQqrFe1He1/nhuJy4QfiYLU40
         JiHbX0qonZAvgV9LbxEvgXsIsfFlbUJMrNwOTZikimc4yGSlWfZCL6KVK/Gbff3RgZXQ
         ObuP/958aASdTdyJwrchSkfdRfAt415UinbNwnvsdTzk1ewVorFOhz3wAjqVBPxgNhAb
         71TE64Qc8+dxc79ny94l7rrtX2psqbfvvTfFLPmHfrOauZnpQQFO6OCtHop0bK7NJkd9
         DhAw==
X-Forwarded-Encrypted: i=1; AJvYcCXNbwyFaarnKLaac3Zr39NpOLy2SpjbTILBQIl0cx0hd3Q3zT6nMR4VYlunzTPqbuMZKPdIN7VhYeKiRPoEypHrfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylu4qCJCC6t1JenW4fnsCqMPlXTGE4ECG3ZHqsW/UUjNCF68sL
	O/j6SzX2u233jP7z2J33+54v8CJmZH0GDbIwseNPUuc0TEQhiJGR4paf
X-Gm-Gg: ATEYQzw1TTim6drq9/HEkvK/okjy6Nx14BmHRf6soms3FdwPFFPbMEb3mIyGgmXiK6H
	HklEmiq14cSsc/oHSaqRlToyaz/iWaYb8AZG+LmewZLQnGV/UtWvN1LpnAxaDplhQElSe2XJdoe
	OIncFPINhFKtzBkbNvf0c108lkOZyqfrkr9w2q2KeBwtnPLxv7io+9LNMMZm817TXWjo6X6gw2a
	4fQDox5rmJ2HjUaq4NR7ABZ4vOAEdwkRlS7H6kZ29fdQnKzCKV++ZFO59cPy6XcvHxJmxIXlCoc
	7udYzOyE3UUWfaRFTTgOU7OwVEtRPHDt08M2EiD1otWTVrKYPXh1Tnewne0jXafXnGGF/Qj/atr
	qtV5cBqgy1oWhIPtSoKjBumeDYx4UudMe8YVT6kB/HkwH/m/A7hrdUt2Q4TgwvZbu338EXb6yge
	7IbsTcBElY+S7NHFCEKo5cOBCjX6JnKDg=
X-Received: by 2002:a05:600c:1d10:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-486f4421c4cmr140167715e9.3.1773938918105;
        Thu, 19 Mar 2026 09:48:38 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm5238505e9.0.2026.03.19.09.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:48:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/4] drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay to 1 msec
Date: Thu, 19 Mar 2026 16:48:28 +0000
Message-ID: <20260319164833.409126-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29946-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[renesas.com,hugovil.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.854];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2F022CF3FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
requires waiting more than 1 msec after deasserting the CMN_RSTB signal
before the DSI-Tx module is ready. Increase the delay from 1 usec to
1 msec by replacing udelay(1) with fsleep(1000).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5020be0f72ac..715872130780 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -807,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		udelay(1);
+		fsleep(1000);
 	}
 
 	return 0;
-- 
2.43.0


