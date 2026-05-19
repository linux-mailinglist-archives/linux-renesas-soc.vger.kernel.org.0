Return-Path: <linux-renesas-soc+bounces-32827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMRbAM2ODGpCjAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:24:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1EB5823E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D45030E5C71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1AE4048BD;
	Tue, 19 May 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZMnAx/w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0124B3DE439
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206929; cv=none; b=lkZrLZn2FWt8A02cDi4Th1eY0URDAZV3uAAT0KRyo1yVcj5Mqa05Var8VwhqhltcDNdZU9tG0aRTbhPujkXa3E41yyCAIt9vbtZsia+18Bhl6/wI2VvVMcC7qGHHMxSuiK4/fYHq675xsE7ipMtWwIK7uLajHwC2ztI52XybmPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206929; c=relaxed/simple;
	bh=155f46ZmKlirGJDv2UVaH/FHiX+7jQU1GCNVcAjB60c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwQKNomNb2uqMehpRmwWAtlfao4QEUJSYPqlasp7gY0d1wiJlKQFgJFHkfrLocxRWP0mnIKM6GqshN7YmU+Nsb5Fy36sSSaRZpJ0+MgKoqyVOacKjUf6rU9Z7rIOyiSNgiDSjuVXjUvij9OAeK78h8O2gVRHOVivdlc1i5q9cBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZMnAx/w; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41912525e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206926; x=1779811726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMZ95nXwBRqiNSLY0nFJjbkMYuK5JBNAh4WxIUQ9mYo=;
        b=LZMnAx/wdme9BdJvLxzYRAnuG1S3qBPwKPqCrd+QxdG7iDfsMJG+OIyvNtmicx1otL
         jOFTHSoo+l2LtVmxvL5N3MogFWmCB/cML0Hr2ju8rBm11brZHRyqe4c3ixt0IEtp/LtY
         NkMZSCQBHIlds18vuFveRKMFdw0I3JUYi7bNr2IwtJixvDarikGW2JLG4S/eCNXxpMQ2
         mq566WAYkB4t93btV0tsX349Gul42ki3T0hAf7zAQR42FHdC58Cgn472NBmqA/SHRyWi
         e5V+gH51s4Oa7V83Ns0Gv4fSmQirdZcRKTMHbn9XMSrh6AknZFL1dDGYzDllSvZu0AMz
         0acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206926; x=1779811726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hMZ95nXwBRqiNSLY0nFJjbkMYuK5JBNAh4WxIUQ9mYo=;
        b=aLBXF4fgDwqaJmuyA0AVs3jFUn7MzEg4K2hM2V0yC9fC3O1nWU6Du6u0XUW/naJzhw
         0AsxLRM8qeiJRYXMXTfm9spp6TDT6HXJhIpfDIDqScQ9Dmuo4+W4x9J00CM+/w1mWgtS
         eX6DspTc6YYXVyR9QOcJmwNwKN9+/BgXOnXD+P8PNbjYnFTSdCdg0CloffAWyoMjx1nb
         6J/jb6HX/wQBbIoStn3bbtTDtnn59VzJz1hXWmtsGZLJ4aIaV7O8ezSN4qRnTqE0N0la
         SBWrvyNv2HYZDKIWPQDoMTtAZxrVCCAb98SLYCFsJC6OyeTtg/Ss8e8yvqJUJCGKLqy0
         RbIg==
X-Forwarded-Encrypted: i=1; AFNElJ9HJLVccGsDvzQZD1lh3lYXa4WGGJ0TmVzqppGS3vvF0H6lADCfRRmF+1xxJ0uhDZKNNLkWmA/e7xmHaqOrcaKbBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySwy0FZhfufz8dkWYqIKoDxATcq3S5kFjFvqWaPtkABjwV0zzV
	V21kXulLWziHhk5obyk4ru1agISraa3RUGpNlLIOX10VJA7MCwJnNm9f
X-Gm-Gg: Acq92OHyWF+25EgCal9ggpGkE2URht1gj5NIXjnwCOpXmEDqOK2mVjrGRH791TjakB8
	TbhjISD8G7ghV5Od153by8ex3zZ/22KACqoHN1kGd6bAYIa7IhBG176xAbLMEt7lYYTykYgRHBc
	CTtn5EV4aOuEYgaMWdFJQVM6f/UBhIDA0T1YDjw82PBlrCp7LW31egIWyOR2GYPyWgTKSn4SW6m
	R3pdOZFmYlO9WO5jMFsN1tT6ihBsQAz+xyaQ91hDKbyJ9iir/w9Rfd6XjbB63IlIeZM4Ko4lBvQ
	jig7CEFKD4hqRhnX4NCZxL7hBfXmHrzX7GhxW433rDWbSzFDAVWve0W7p/YkR4wtMaPFBPO591U
	5iomnqiUq6dSNe4zSjYouKIBhWjnNJ/hGfhfvPgGOkanN4v2blvtgvvvXcxJf5w2X8f7KJubC35
	nu65Ttzyca4Klj7WM567R2EefLKDu261vvdRHkzVn3w3tPP49DNH8+L2cO+h+VAzcRGvxfzCq1y
	miX9sfEFnqtW6YJIDlbs9pd/vQs7n4tlwYk3g==
X-Received: by 2002:a05:600c:848c:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48fe60ecc19mr314605635e9.10.1779206926241;
        Tue, 19 May 2026 09:08:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/5] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Tue, 19 May 2026 17:08:23 +0100
Message-ID: <20260519160825.4082566-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32827-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Queue-Id: 0B1EB5823E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v4:
- No change

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 26b95153ce88..48065f4952a3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	struct drm_plane *primary;
 	int ret;
 
-	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
 		return PTR_ERR(rcrtc->rstc);
-- 
2.54.0


