Return-Path: <linux-renesas-soc+bounces-32281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IeG2KPLJ/Wm2jAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:33:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1C4F5CDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7C0F300A8EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 11:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E717393DF3;
	Fri,  8 May 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoQW5PU/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A99239448B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239075; cv=none; b=HLYt9WWcb8eyFyTdnLzzGdV0zRoWP5RLFH6Igf08tyIgd3xaFxLNRLRta6zve65YgE0qAX+l+IsiQOfd5VGGta3JQhNIbUhV/zO7fsbD3StVgpytgqJeRinaAImVHAx0MXULo7NJ/hcjJDps320AbOWnConHxhctmjj948uReMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239075; c=relaxed/simple;
	bh=cih7KlGPpFgUEiNss2zxTKa0s7P9pJ/t9FSqGyajF5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thPccbrXptqjkS02oyLHEb0S6Ynsmy0FNGniCZn3UTR6in+CacYCCJiHtnx9OHjltx3Ai/aHixp9gich1D2fOn+2ohtCIUl2YD+9BeXdY+OM5Kc9QYw7vguO07828rQRUoXytCbx/DEQSRC3Pff/B+PH76jLrebsGNEFiN9LgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoQW5PU/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a74032ff8so1408087f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239069; x=1778843869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a++Qkbe0N+QcN8OOW7PnS6Fd5+vAfw/HCIN0DGOehPI=;
        b=qoQW5PU/ocOIDWH4Y4s1oi2scwRHbI8lKD7J12PTQ0ZI/1EbMKUbd0vmPDxKRnzcGH
         CptoQxgBX8jNYjliO8zdQqt9xei8gixbQsEICZjIwOTFnqSXZ5vcMaVmzDWQ1vWmI7m+
         p4EGjSVPGkK5p71KlZpfTwaOEZOrNI44RyNtdSdcdwshkg+Yu5VYejBRtnfLexKYTHgm
         J3Zm4vywuGXGxVg7Hia8pYvG/4XL7l3WsXDMFH2KpUMVHq+Q1nsik/1sLr4EPxBblpWW
         1weuKoY4+8YhSWwkiisXfPP+892r+Mq5ihScQKOTpexCFizXhu4xSqHeKtMH88Z7lfZb
         40fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239069; x=1778843869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a++Qkbe0N+QcN8OOW7PnS6Fd5+vAfw/HCIN0DGOehPI=;
        b=mn4TlDu4/9YKBoFFXPpv2i3gXWBwZ2a+V1qscGcHN7Xb+dYSuwbRk5Fe/iBFYUq+YV
         ywG7FYCWR7YEE1P2nrlYYsvK0QXtDgAtc1dIeDONKgHxY2CazC+DFgV82cJhlIsewYlT
         Wm5s9AfXqGcqkvA/iv9j62JafdDBriq0NInEas2BhmLSEgXjt3ojuQsEHAPBujaI9Ijc
         r7BAh1WN/dgBYZ9mVWApsSbXs4PPpkQ/w7b3X2QopS+bhfT2MTXIWBDsCdCJnNV6ZLxZ
         771jefdAl4Z+xRjSnad2UqnhsjVHTTDEXtOU7o+2Ce7cqblxc2w74dQQdx70KUvnuaqZ
         7xYA==
X-Forwarded-Encrypted: i=1; AFNElJ9h4ADb8ObfZX3UQ3oct+XhV7D/4fMlm/87VDXH0ROLIB9fleuSZV/0bIcCzw31Yb3f4ZLkUwMk494O5/NROXu3Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVqG2Bl+5+nrl68MnA7TeBWh7Iy7uC4vgUhhx1dx2p3VWtwiyz
	2jKzpgDB3aawuELPOg0xOTr4lgiUO8LqTkmAbMNzDwPv14jQ7HDlP1m7
X-Gm-Gg: Acq92OHtcKUpXhXRUeAPFBD9DtsYkIX+76r1kk7Ww4TZedaWM26bgdJ7MlU5ciLTAT0
	/zjYyGUTu1AxdALGdDFuZ71ajF8YwpkkcPg/bD/myEwjp9i+15p8QrvfLy8lSzbIHCTIkdtNTmb
	IGBotZ+p/V/ocRil1i7wHxw3NDX5pvAh2SP6r4a9xqADeyjkGJdlp4mxXZZ3bJotNizkDmch+Po
	51iD2UFgX6FJfdCVmHojoNE1PiUG2YfnUTfl2svTFLRMDQP79+soFGe9xeDepYlqsAFKkfSCH+D
	h04vVDPhJ7kn+mtExu7YDmbyleTmBXCBo+zrAQY6GOc3YcbyAEJY0EzgOyWwX5duF0U/IxfKkbR
	mt7lUHS82sMnE2F17bT5s0/aW/berZ3pUrBGNL4prN8FhxzWqQoKhA+jmueoAcp15u8xqpSw7bn
	nRmpDxRW980Y19tKAQXGnd6NFvHJKZus1gne7cWVpruqHTIDmPBRmGXc1pOBsvKi8u2ijNUN/6O
	O3+NSfqpncenwp8Gxl2ExBlKsnzJmcKGIY3f6WijSfjDADA
X-Received: by 2002:a05:6000:288f:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-4515ce1c8damr20978761f8f.27.1778239068762;
        Fri, 08 May 2026 04:17:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:48 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Fri,  8 May 2026 12:17:40 +0100
Message-ID: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2FB1C4F5CDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32281-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.595];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,0.0.0.0:email]
X-Rspamd-Action: add header
X-Spam: Yes

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

Patches are rebased on next-20260507 and apply on drm-next.

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
  drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

 .../bindings/display/renesas,rzg2l-du.yaml    | 20 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 +++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 16 +++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 +++++-
 5 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.54.0


