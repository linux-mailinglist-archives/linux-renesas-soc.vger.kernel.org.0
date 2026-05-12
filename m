Return-Path: <linux-renesas-soc+bounces-32490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOiaIApBA2ro2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:02:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A95232D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EEF030EDE47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 14:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D123BB680;
	Tue, 12 May 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2U2krh5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562213BB669
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596902; cv=none; b=VaWU/ingTEkeVXcC+54duU9J+N717U3kiafaQxJCwuU5a20E8prbXDJGHEUCKqxzTrvXYfb82Vw9Q8cpZoCIlZr1H407TGx1f9uJqK+aHc+wJ7rPrNGbfPe/eWu2YuUWtbDE8vtowOgyamwd9uJ3zBYD/XvGUxVsLCtl+cDJP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596902; c=relaxed/simple;
	bh=z47JWqFftcX1RYznDaw2fH3SlQhw/xMXQT4fkCyVtIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyGyAt921WQxL0nbQRXw7JxXq8HSzhpGEsVmB97Ceidu+9qpR+PqB+H0CiT2lylZK53JArnGYVUuUpFm+mwkpvDHkGHbUSpLunJcA4NRnyPcf6xWmAa4YjmWzTYB8FZM+5cgZklP07Eoq0BEMh/h0ETE2S/Hfrzu/av52QEdKyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2U2krh5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3348060f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596899; x=1779201699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZnXaO2XR/XSxB1WPtMHUkL50ezRh+7N6eUtxXGLRy8=;
        b=f2U2krh5d/VxrA1sGxo3RRTLvytCuV8Kcf4u9ThMl8A4lDI5breez5jKh05hFjqRD+
         TWgGkaQIMSQT3BHKCzYZ295O8fnGCFUmaSUWQcuDCcEw+SH04FEm1CfXrRb6lQ9P4DAX
         miiP7HTwgE76ecFyp4LHdT7aMN0uQj9QTuktWIB/SqF1Q2p6FdzCrl/DnAErS/kk6rMr
         IT9Zp3roYHfs2nLhoxS7rQAOOtBNJsx2X6B40pIZCE7U8tD/LT8UCcvhgOrTppJMbGcr
         foB3bT3EiBXvvwjzzCifSFkKpk+i+t/r7XP91baJvcnrO6f1NQdAV5vZMDzqJZNy6UzZ
         q8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596899; x=1779201699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZnXaO2XR/XSxB1WPtMHUkL50ezRh+7N6eUtxXGLRy8=;
        b=C7+/xSHUELT/sB+eILkfirDA1X1gJtw/aiMb0XE3E1lsPKDHX3UjvGF6u2l+5XNv2n
         gTN77mZUJy8g+xwUDfAD0Pwm7GpqOKU40+piddC0guJt7h339gnVuVFixgzpvJ5JecpT
         wejuWPi+Nu4yzZEB4Q4EPMEHcWUqTR6BvWoQOwlDnYzuohxVwWQIIdEOE+RnA50p8E+a
         FoHDI1nHNvNZ/VS3WuD8bd95ESY5HBG6/qKJ5fbxpDWGTr/tMKElpvrKe1KMH8Aqn26y
         A4zFUqwu3kDJjFnkWe8BtQRWqF930s0Yqr852XeCUMGNbB/3d1umTro+m9GaHOU4HQfF
         k7sg==
X-Forwarded-Encrypted: i=1; AFNElJ/QagL8bsiXzZUXZI9HO7c+zgvZlOCoAs6ZdY0Z1Ift/OqSzj7ceoCYmmezelAW62ymRh7NnciBiwdG/9LKeSpFWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+HkJtZk+lyi85iSK67Xug9B9u8Hqp0luWl0Gwc1Glolvf2ka
	HYlCUk8OuoTnjzyWWCzFuWXLDQOw5T2WrRryEsaqCXbwcVnnumuO4opB
X-Gm-Gg: Acq92OHMXEP9DOwx8Lk7LRsRo8dKDonQsLgrK5OTOUxgR3nIZBl/kOLd34YDo+N8zSx
	1By3WoKDeh8pwTX5x/r8e+a2omgFghfdCAlQsVpw7mYfJWeED4BJ6h3sbZ5zhMT8ViRBowedOHU
	RuqzRLm62ZujMoFAA5ej70ukLLK9PXkwGviXiBdCBUPyhKelwbi1/BP/7jCvHrY0qin5Hs00R0g
	7WLosPkPL62an+VWOt91seK7Ui1i819L0TZow3dmkYTY2WxHu9zfFajTHgGi7mZS45SD6hutBoe
	d7dKtALLZJZbsc0h2bG0xKoUL8hGYgPyIQ4JcPTltPsmkmpv5Sc2xl3y64ioSlFSmOtUDnj/Aqs
	CeqUxQc/Kcc8ZkGlQxIaAcwpJB6r56raVI7zz3hmWkV35L6Ay0typdeJB/t2asJrsejjZp/DzBd
	KzuVds8qAUdz7wm9erDzSsYFznzQDACs1nrJQqN/Cz4/6TR23MMeoaD6Z7tiOk7NeSPH7qM3W55
	v+4+O1WQW2vnzHbXcRoU/AdiNGmHJaCpec=
X-Received: by 2002:a5d:588c:0:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-4568a2785a4mr21502140f8f.11.1778596898639;
        Tue, 12 May 2026 07:41:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:38 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 12 May 2026 15:40:59 +0100
Message-ID: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B82A95232D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32490-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[0.0.0.1:query timed out,renesas.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,0.0.0.1:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Display Unit (DU) on the RZ/T2H
and RZ/N2H (R9A09G087) SoCs. The DU on these platforms is
functionally similar to the RZ/G2UL DU but includes some SoC
specific differences such as a single output port and explicit
DPI output enable control. The series includes the following
changes:
1. Add device tree bindings for the RZ/T2H and RZ/N2H DU variants,
   including a new compatible string.
2. Make the DU reset control optional to allow probing on RZ/T2H
   where the DU does not have a reset line.
3. Move pixel clock validation logic to per-SoC constraints in
   rzg2l_du_device_info to accommodate different clock limits
   across SoCs.
4. Implement support for the RZ/T2H DU variant in the driver,
   including handling of the DPI output enable signal.

Patches are rebased on next-20260508 and apply on drm-next.

v2->v3:
- Rebased on latest next-20260508.
- Included Tommaso's patch to refuse port@1 for RZ/G2UL, which was
  previously in a separate series.
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.
- Updated commit message for patch#4

v1->v2:
- Dropped the "port" property in favor of "ports" with a single port@0
  child, to align with the existing RZ/G2L bindings and simplify the
  device tree structure.
- Updated the commit message to reflect the change from "port" to "ports".
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not
  needed.
- Add Reviewed-by tags from Laurent for patches 2-4.
- Rebase on latest next-20260507.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
  drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
  drm: renesas: rz-du: Move mode_valid logic to per-output clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

Tommaso Merciai (1):
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL

 .../bindings/display/renesas,rzg2l-du.yaml    | 21 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 ++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 18 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 +++++-
 5 files changed, 63 insertions(+), 5 deletions(-)

-- 
2.54.0


