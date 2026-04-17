Return-Path: <linux-renesas-soc+bounces-31367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAzUKxx14mnh6AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 19:59:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AFE41DC18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 19:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8CC03146566
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 17:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8A4383C9C;
	Fri, 17 Apr 2026 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn/F8pMN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2A35AC10
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448366; cv=none; b=EyE8GIb1CcWwR9Z3gwMv09HTg/eQ8QOT92ODMa24Fr8tdVIhZCuy8+aHFY8Sqs2tXoZ2Omkk/6cx0/CamfmdL87FIc+Pd8PkIiEgJ+iGR8g8RXRRCBc+CXqamXYcrSYxfCena37PZfTFyEQflMI+GfA+xmzZ1zSW3l24DKuocFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448366; c=relaxed/simple;
	bh=YpOTPUvd7+Ix6fxPIg06TIb4qRZNZIUThtvV8RtBuU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxDbL6oW6W5qibTb6+DqK59tTOi6McWPvaTeJa5kNUQINTGFpiue9ZCHqBuffrQwhaVd5hkCeddZ2YJaqeiqmzddMlhClkDz92tYjes4Arj1QzHoPva5sm/AgHZub1S3fBwl4OPatY7ch7Xhut1Y9qdgzPGboNEpCvamSseFkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn/F8pMN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so12496195e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776448358; x=1777053158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9WLAo+FIpFIL/Tg50QaIjrY8GmsgmdfX6tOY1c2ldc=;
        b=Mn/F8pMNVp5aFI0BNyZkcQ9VhbZogux7o+NIkiDH+EP/NzurTmBexARF/F8S4XFH6w
         2jr9o0nIxQGu0qEdg9VIaD//kzvBLQmgQoEe0GVWUlek4MDaFzKzClsQLyWgqVTC58kq
         p+G68+uPDwdSpxeMqEe/JYTXbW/BQFj8mdQPVC3J+v08sSq3dCBtsERZ9C5VTW16TFmp
         Ed98JQ0a8p3LVMbCBndbOi98GWeMjYXf9BJCImsUG0wt4vlhQUNxE1o0JdAegJy1aqOs
         jNlHJagiRHRqBLbQMjNu0msSVikg/2LsjW7Z94GxDNGWXGzwbAtN4KnMrYZ1w95FV+ms
         JT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776448358; x=1777053158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9WLAo+FIpFIL/Tg50QaIjrY8GmsgmdfX6tOY1c2ldc=;
        b=TkM6+4/vQS9UCsi9yqwszVxAwPDWNiIOjmUGPtPfDWg9vXZarTDrX04TdrUx5wnktl
         aK54/q22BNT5VSN856jFyFb86R6/Zz70Q5yEfohpXL1TBy2Hwt37HH0kKJ/qk0TD54JO
         cP5OLzrl6KSHOqrITcv/WIYNavVXRlJgxuh0AS1G8J5276igA2oO0JUDQlUCwwalO1Q5
         zdEYzKhMWAcVhPbESDHqhlQ9yxUJBtp6REKfLiy4E9f0L3VtQ7SbvE/ZUJUho3ZeIEpC
         PsgpRSQ1zdI80C7asFdryVJbly9ai6+5/4xtRlejPYCnx46JdmcimRyzCsy5yDfm4VzJ
         jF6g==
X-Forwarded-Encrypted: i=1; AFNElJ/J6key0/HkJ1tByTCCowmcB3HP34DScTgP+D6Ukl5/9PTGh/MX7m/KXMa9Z66lLKjBdNRjHAPj71NMxgZNshyxJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygmwCBBbIEjTpIsVlFbCk75MvdI7oy/dzg6vyMh1iIQSRF+DuJ
	43eKKfjJhLvqdfuEijoTvkR5ztUGvMgkLYWOXSKdko/Ox53soepmx1Y7
X-Gm-Gg: AeBDietRRcQMwniXUPn7Ntn8pn++zAw7ufvsTI3sZdK7Ktf05tohruXhYqJTB6vMVB3
	qRN/OE+jSAKRHvO7ig2EPbh8/b23H4028fiTOFd0po3G+3w1hTscT0sT8oL6DPiZzhsQqvC4PPG
	7n5NQMw42alxl9tdmIXxnX+5O/hGmpIjq0ttzEkJ9o5tGyIfitCdpvidOj2ezEpowuSVx+dkOm9
	wimYRTPuolf7rJCvfy4GbJLlcm9PU+v07U7W0s1kPW9NcFHyF9c33VNJybwIWVD03C6a1smdeoI
	/+ocTQbBhRuU7mZeKWebUepcPRIP7Z/aycqWNUGEuHNnb+GSWQw4KHVrPWVhk8hJJ2ienI9jyL0
	5mDRwwglS8OCszqMdPczcOabMfkCAlTA3CnTe2LNqfgD96vsLGiAU1DnlKe2pnr4bB8jlSIsJrP
	wjNSU2X3A7m1eZs4vqy0yZrPh7iOhTY30tSOof7QVY
X-Received: by 2002:a05:600c:8183:b0:488:b187:d898 with SMTP id 5b1f17b1804b1-488fb771445mr53526905e9.14.1776448358089;
        Fri, 17 Apr 2026 10:52:38 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:528c:590:5bef:9bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm56166535e9.12.2026.04.17.10.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:52:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
Date: Fri, 17 Apr 2026 18:52:28 +0100
Message-ID: <20260417175235.224809-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31367-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47AFE41DC18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3{E,L} SoCs have an LVDS Common (LVDS_CMN) region which is common
to all LVDS channels. The RZ/G3L has single-link, but the RZ/G3E has both
single and dual-link.

Use the syscon interface to access these registers for scalability.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..9c81010d5a74 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -221,6 +221,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - renesas,r9a08g046-lvds-cmn
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
-- 
2.43.0


